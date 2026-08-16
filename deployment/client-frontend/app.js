(function () {
  'use strict';

  var state = { brand: {}, prizes: [], faq: [], history: [], retry: null };
  var form = document.getElementById('draw-form');
  var spinButton = document.getElementById('spin-button');
  var homeAudio = document.getElementById('home-audio');

  document.addEventListener('contextmenu', function (event) {
    event.preventDefault();
  });

  document.addEventListener('keydown', function (event) {
    var key = String(event.key || '').toUpperCase();
    var blocked = key === 'F12' ||
      (event.ctrlKey && key === 'U') ||
      (event.ctrlKey && event.shiftKey && ['I', 'J', 'C'].indexOf(key) !== -1);

    if (blocked) {
      event.preventDefault();
      event.stopPropagation();
    }
  }, true);

  function escapeHtml(value) {
    return String(value || '').replace(/[&<>'"]/g, function (character) {
      return {'&':'&amp;','<':'&lt;','>':'&gt;',"'":'&#039;','"':'&quot;'}[character];
    });
  }

  async function api(path, options) {
    var response = await fetch('/api/client/' + path, Object.assign({
      headers: {'Accept':'application/json','Content-Type':'application/json'}
    }, options || {}));
    var payload = await response.json().catch(function () { return {}; });
    if (!response.ok) throw new Error(payload.message || 'Layanan sedang bermasalah.');
    return payload.data;
  }

  function applyBrand() {
    document.title = state.brand.name || 'Spin Berkat';
    document.getElementById('favicon').href = state.brand.favicon;
    document.body.style.backgroundImage = 'url("' + state.brand.background + '")';
    document.getElementById('logo-mobile').src = state.brand.logo;
    document.getElementById('logo-pc').src = state.brand.logo;
    homeAudio.src = state.brand.music;
  }

  function renderHistory() {
    document.getElementById('history-container').innerHTML = state.history.map(function (item, index) {
      return '<tr><td class="p-2 text-center">' + (index + 1) + '</td><td class="p-2">' +
        escapeHtml(item.nama) + '</td><td class="p-2 text-center">' + escapeHtml(item.prize) + '</td></tr>';
    }).join('');
  }

  function loadWheelScript() {
    return new Promise(function (resolve, reject) {
      var script = document.createElement('script');
      script.src = '/assets/wheel/js/script.js?version=3';
      script.onload = resolve;
      script.onerror = reject;
      document.body.appendChild(script);
    });
  }

  async function initialize() {
    try {
      var data = await api('bootstrap');
      state.brand = data.brand;
      state.prizes = data.prizes;
      state.faq = data.faq;
      state.history = data.history;
      applyBrand();
      renderHistory();

      window.url_wheel = state.brand.wheel;
      window.url_outwheel = state.brand.outwheel;
      window.music = state.brand.music_spin;
      window.prizes = state.prizes;

      await loadWheelScript();
      introRotation(data.intro_rotation);
      document.getElementById('loading').style.display = 'none';
      document.getElementById('wheel-controls').style.display = 'block';

      Swal.fire({
        title: 'Selamat Datang di ' + escapeHtml(state.brand.name) + '!',
        text: 'Masukkan kode tiket untuk memulai peruntungan Anda.',
        confirmButtonText: 'Mulai',
        confirmButtonColor: 'goldenrod'
      }).then(function () { homeAudio.play().catch(function () {}); });
    } catch (error) {
      document.getElementById('loading').style.display = 'none';
      var errorBox = document.getElementById('app-error');
      errorBox.textContent = error.message;
      errorBox.style.display = 'block';
    }
  }

  async function submitDraw(nama, code) {
    spinButton.disabled = true;
    try {
      var result = await api('draw', {
        method: 'POST',
        body: JSON.stringify({nama:nama, code:code})
      });
      state.retry = result.retry;
      homeAudio.pause();
      spin(function () { showResult(result); }, result.rotation);
    } catch (error) {
      Swal.fire({icon:'error', title:'Gagal', text:error.message});
      spinButton.disabled = false;
    }
  }

  async function refreshHistory() {
    try {
      state.history = await api('history');
      renderHistory();
    } catch (error) {}
  }

  function showResult(data) {
    var result = data.result;
    var sound = new Audio(result.winner ? state.brand.music_win : state.brand.music_lose);
    sound.loop = true;
    sound.play().catch(function () {});
    if (result.winner && typeof confetti !== 'undefined') confetti.start();

    var options = result.winner ? {
      icon:'success', title:'Congratulations!', html:'Anda mendapatkan <strong>' + escapeHtml(result.label) + '</strong>', confirmButtonText:'Kembali'
    } : result.try_again ? {
      icon:'info', title:'Free Spin!', text:'Anda mendapatkan kesempatan spin sekali lagi.', confirmButtonText:'Spin lagi', showCancelButton:true
    } : {
      icon:'info', title:'Better luck next time!', html:'Hasil: <strong>' + escapeHtml(result.label) + '</strong>', confirmButtonText:'Kembali'
    };

    Swal.fire(options).then(function (choice) {
      sound.pause();
      if (typeof confetti !== 'undefined') confetti.stop();
      spinButton.disabled = false;
      refreshHistory();
      if (result.try_again && choice.isConfirmed) {
        submitDraw(state.retry.nama, state.retry.code);
      } else {
        window.location.reload();
      }
    });
  }

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitDraw(document.getElementById('nama').value.trim(), document.getElementById('code').value.trim());
  });

  document.getElementById('history-button').addEventListener('click', function () {
    document.getElementById('history-popup').style.display = 'block';
  });
  document.getElementById('history-close').addEventListener('click', function () {
    document.getElementById('history-popup').style.display = 'none';
  });
  document.getElementById('terms-button').addEventListener('click', function () {
    var terms = state.faq.map(function (item) { return '<li class="text-left">' + escapeHtml(item) + '</li>'; }).join('');
    var prizesList = state.prizes.map(function (item) { return '<li class="text-left">' + escapeHtml(item.label) + '</li>'; }).join('');
    Swal.fire({title:state.brand.name, html:'<h6>Syarat dan ketentuan</h6><ol>' + terms + '</ol><h6>Daftar hadiah</h6><ul>' + prizesList + '</ul>'});
  });

  initialize();
}());
