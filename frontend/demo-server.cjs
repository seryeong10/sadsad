const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');
const os = require('node:os');
const root = path.join(__dirname, 'build', 'web');
const types = { '.html': 'text/html; charset=utf-8', '.js': 'application/javascript',
  '.json': 'application/json', '.wasm': 'application/wasm', '.png': 'image/png',
  '.jpg': 'image/jpeg', '.svg': 'image/svg+xml', '.woff2': 'font/woff2',
  '.ttf': 'font/ttf', '.css': 'text/css' };
if (!fs.existsSync(path.join(root, 'index.html'))) {
  console.error('Build first: flutter build web --dart-define=MOCK_DEMO_MODE=true');
  process.exit(1);
}
http.createServer((req, res) => {
  let requested;
  try { requested = decodeURIComponent(new URL(req.url, 'http://localhost').pathname); }
  catch { res.writeHead(400); res.end(); return; }
  const target = path.resolve(root, '.' + (requested === '/' ? '/index.html' : requested));
  if (!target.startsWith(root + path.sep)) { res.writeHead(403); res.end(); return; }
  fs.stat(target, (error, stat) => {
    if (error || !stat.isFile()) { res.writeHead(404); res.end(); return; }
    res.writeHead(200, { 'Content-Type': types[path.extname(target)] || 'application/octet-stream',
      'Cache-Control': 'no-store' });
    fs.createReadStream(target).on('error', () => res.destroy()).pipe(res);
  });
}).listen(8080, '0.0.0.0', () => {
  console.log('A-VATA DEMO: http://localhost:8080');
  for (const entries of Object.values(os.networkInterfaces())) {
    for (const address of entries || []) {
      if (address.family === 'IPv4' && !address.internal) {
        console.log('iPad (same Wi-Fi): http://' + address.address + ':8080');
      }
    }
  }
  console.log('Keep this window open. Ctrl+C to stop.');
}).on('error', error => { console.error(error.message); process.exitCode = 1; });
