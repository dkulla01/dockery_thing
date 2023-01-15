#!/usr/bin/env bash

if ! command -v cross  &> /dev/null; then
  cargo install cross
fi

cross build --release --target aarch64-unknown-linux-gnu

# at this point, I have a executable binary in target/aarch64-unknown-linux-gnu/release/dockery_thing
# I can scp this to my raspberry pi and run it without issues
