#!/bin/sh

# platforms="x86_64-pc-windows-msvc x86_64-apple-darwin"

# compile() {
#     deno compile --output "jbfc-$1" --target $1 _build/default/main.bc.js
# }

if type "deno" > /dev/null; then
    chmod +x ./build.sh
    ./build.sh
    yes | cp -rf _build/default/main.bc.js jbfc.js
    (echo '#!/usr/bin/env node' && cat jbfc.js) > jbfc1.js && yes | mv jbfc1.js jbfc.js
    rm -rf jbfc1.js
else
    echo "Error: deno is not installed in this system" >&2
    exit 1
fi
