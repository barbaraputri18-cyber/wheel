#!/usr/bin/env bash

set -euo pipefail

db_secret_file=/root/.spinberkat-db.env
test_code=CODEX_API_INTEGRATION_TEST
result_file=/tmp/spinberkat-api-integration-result.json

# shellcheck disable=SC1090
source "$db_secret_file"
export MYSQL_PWD="$DB_PASSWORD"

cleanup_database() {
    mysql --no-defaults -h 127.0.0.1 -u "$DB_USERNAME" "$DB_DATABASE" -e \
        "DELETE FROM history_draw WHERE code='${test_code}'; DELETE FROM draw WHERE code='${test_code}'; DELETE FROM code WHERE code='${test_code}';" >/dev/null
}

cleanup() {
    cleanup_database
    rm -f "$result_file"
    unset MYSQL_PWD DB_PASSWORD
}
trap cleanup EXIT

cleanup_database
prize_id=$(mysql --no-defaults -h 127.0.0.1 -u "$DB_USERNAME" -Nse \
    "SELECT id FROM prize WHERE try_again=0 ORDER BY winner ASC, id ASC LIMIT 1" "$DB_DATABASE")

mysql --no-defaults -h 127.0.0.1 -u "$DB_USERNAME" "$DB_DATABASE" -e \
    "INSERT INTO code (code,used,created_at,updated_at) VALUES ('${test_code}',0,NOW(),NOW()); INSERT INTO draw (nama,code,sent,rotation,date,prize_id,retry_used,created_at,updated_at) VALUES ('API Integration Test','${test_code}',0,NULL,CURDATE(),${prize_id},0,NOW(),NOW());"

status=$(curl -sS --max-time 30 -o "$result_file" -w '%{http_code}' \
    -H 'Accept: application/json' -H 'Content-Type: application/json' \
    --data "{\"nama\":\"API Integration Test\",\"code\":\"${test_code}\"}" \
    https://spinberkat.com/api/client/draw)

if [[ "$status" != "200" ]]; then
    echo "API integration test failed with HTTP $status" >&2
    exit 1
fi

/usr/local/lsws/lsphp74/bin/php -r '
$response = json_decode(file_get_contents($argv[1]), true);
if (!isset($response["data"]["rotation"], $response["data"]["result"]["label"])) {
    fwrite(STDERR, "API integration response is incomplete\n");
    exit(1);
}
echo "API integration draw succeeded\n";
' "$result_file"
