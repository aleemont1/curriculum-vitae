#!/usr/bin/env bash
# Encrypts a signature scan so it can be committed safely.
#
#   scripts/encrypt-signature.sh path/to/signature.png
#
# Writes signature.png.gpg (AES-256, symmetric) in the repo root.
# Use the same passphrase as the SIGNATURE_PASSPHRASE repository secret.
# Tip: a ~600 px wide PNG with a transparent background prints well and
# is low resolution enough to discourage reuse.
set -euo pipefail

src="${1:?usage: $0 path/to/signature.png}"
root="$(cd "$(dirname "$0")/.." && pwd)"

gpg --symmetric --cipher-algo AES256 --output "$root/signature.png.gpg" --yes "$src"
echo "Wrote $root/signature.png.gpg. Commit it; never commit the PNG itself."
