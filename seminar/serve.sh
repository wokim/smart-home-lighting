#!/usr/bin/env bash
# Dev/presentation server with caching disabled so edits show on plain reload.
cd "$(dirname "$0")/.." && exec python3 -c "
import http.server, functools
class H(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-store')
        super().end_headers()
http.server.test(HandlerClass=H, port=int('${1:-8080}'))
"
