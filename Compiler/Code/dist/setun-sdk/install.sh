#!/usr/bin/env bash
set -e
echo 'Installing Setun-70 Toolchain to /usr/local/bin...'
sudo cp $(dirname "$0")/bin/setunc /usr/local/bin/
echo '[SUCCESS] Setun-70 Compiler installed! Run: setunc test'
