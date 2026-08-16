<?php

namespace App\Http\Controllers;

use App\Code;
use App\Draw;
use App\Faq;
use App\History_Draw;
use App\Prize;
use Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ClientApiController extends Controller
{
    public function bootstrap()
    {
        $prizes = Prize::orderBy('sorter', 'asc')->get();
        $total = $prizes->count();

        return response()->json([
            'data' => [
                'brand' => $this->brandData(),
                'prizes' => $prizes->map(function ($prize) use ($total) {
                    return [
                        'id' => (int) $prize->id,
                        'label' => (string) $prize->label,
                        'sorter' => (int) $prize->sorter,
                        'total' => $total,
                    ];
                })->values(),
                'faq' => Faq::orderBy('id', 'asc')->pluck('content')->values(),
                'history' => $this->historyData(),
                'intro_rotation' => $total > 0 ? Helper::rumus_rotasi_start() : 0,
            ],
        ]);
    }

    public function history()
    {
        return response()->json(['data' => $this->historyData()]);
    }

    public function draw(Request $request)
    {
        $validated = $request->validate([
            'code' => 'required|string|max:100',
            'nama' => 'required|string|max:255',
        ]);

        $result = DB::transaction(function () use ($validated) {
            $code = Code::where('code', $validated['code'])->lockForUpdate()->first();
            $draw = Draw::where('code', $validated['code'])->lockForUpdate()->first();

            if (!$code || !$draw) {
                return ['error' => 'code tidak ditemukan'];
            }

            if ((int) $code->used !== 0 || !((int) $draw->sent === 0 || (int) $draw->retry_used === 1)) {
                return ['error' => 'code expired atau sudah digunakan'];
            }

            $prize = Prize::where('id', $draw->prize_id)->first();
            if (!$prize) {
                return ['error' => 'hadiah untuk code tidak ditemukan'];
            }

            $rotation = Helper::wheel_rotation($prize->id);
            History_Draw::saveData([
                'draw_id' => $draw->id,
                'code' => $validated['code'],
                'nama' => $validated['nama'],
                'rotation' => $rotation,
                'date' => date('Y-m-d'),
                'prize_id' => $prize->id,
            ]);

            Draw::updateData($prize->id, $validated['code'], $rotation);

            return [
                'rotation' => $rotation,
                'result' => [
                    'label' => (string) $prize->label,
                    'winner' => (bool) $prize->winner,
                    'try_again' => (bool) $prize->try_again,
                ],
                'retry' => [
                    'nama' => $validated['nama'],
                    'code' => $validated['code'],
                ],
            ];
        }, 3);

        if (isset($result['error'])) {
            return response()->json(['message' => $result['error']], 422);
        }

        return response()->json(['data' => $result]);
    }

    private function historyData()
    {
        return collect(History_Draw::getData())->map(function ($history) {
            return [
                'nama' => Helper::replace_last_character((string) $history['nama']),
                'prize' => (string) $history['prize'],
            ];
        })->values();
    }

    private function brandData()
    {
        $brand = Helper::content();

        foreach ($brand as $key => $value) {
            if ($key === 'name' || !is_string($value)) {
                continue;
            }

            $host = parse_url($value, PHP_URL_HOST);
            $path = parse_url($value, PHP_URL_PATH);
            if ($host && strcasecmp($host, 'undianspin.com') !== 0) {
                continue;
            }

            if (is_string($path) && strpos($path, '/spinberkat/') === 0) {
                $path = substr($path, strlen('/spinberkat'));
            }

            if (is_string($path) && $path !== '') {
                $brand[$key] = $path[0] === '/' ? $path : '/' . $path;
            }
        }

        return $brand;
    }
}
