#!/bin/bash
pgrep -f "bore local" >/dev/null && exit 0
if ! command -v bore >/dev/null; then
  curl -L https://github.com/ekzhang/bore/releases/download/v0.5.1/bore-v0.5.1-x86_64-unknown-linux-musl.tar.gz | tar xz && mv bore /usr/local/bin/
fi
nohup bash -c 'while true; do bore local 3389 --local-host 172.30.0.2 --to bore.pub --port 47831; sleep 10; done' > /tmp/bore.log 2>&1 &
