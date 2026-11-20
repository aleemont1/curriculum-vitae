(function () {
  var r = document.documentElement, b = document.querySelector('.theme-toggle');
  function cur() { return r.dataset.theme || (matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'); }
  if (b) b.addEventListener('click', function () {
    var n = cur() === 'dark' ? 'light' : 'dark';
    r.dataset.theme = n;
    try { localStorage.setItem('theme', n); } catch (e) {}
  });
})();
