#!/usr/bin/env bash
# Dev/presentation server: no caching, HTTP Range support (video seeking).
cd "$(dirname "$0")/.." && exec python3 -c "
import http.server, os, re
class H(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-store'); self.send_header('Accept-Ranges', 'bytes'); super().end_headers()
    def send_head(self):
        rng = self.headers.get('Range')
        path = self.translate_path(self.path)
        if not rng or not os.path.isfile(path): return super().send_head()
        m = re.match(r'bytes=(\d*)-(\d*)', rng)
        size = os.path.getsize(path)
        start = int(m.group(1)) if m.group(1) else max(0, size-int(m.group(2)))
        end = int(m.group(2)) if m.group(1) and m.group(2) else size-1
        end = min(end, size-1)
        if start > end or start >= size:
            self.send_response(416); self.send_header('Content-Range', f'bytes */{size}'); self.end_headers(); return None
        f = open(path, 'rb'); f.seek(start)
        self.send_response(206)
        self.send_header('Content-Type', self.guess_type(path))
        self.send_header('Content-Range', f'bytes {start}-{end}/{size}')
        self.send_header('Content-Length', str(end-start+1))
        self.end_headers()
        self._range_left = end-start+1
        return f
    def copyfile(self, src, dst):
        n = getattr(self, '_range_left', None)
        if n is None: return super().copyfile(src, dst)
        while n > 0:
            chunk = src.read(min(65536, n))
            if not chunk: break
            dst.write(chunk); n -= len(chunk)
http.server.test(HandlerClass=H, port=int('${1:-8080}'))
"
