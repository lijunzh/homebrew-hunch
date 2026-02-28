#!/usr/bin/env bash
# update-formula.sh — Fetch SHA256 hashes from a GitHub release and update the formula.
#
# Usage: ./update-formula.sh [VERSION]
#   VERSION defaults to the version in Formula/hunch.rb

set -euo pipefail

REPO="lijunzh/hunch"
FORMULA="Formula/hunch.rb"

# Resolve version
VERSION="${1:-$(grep 'version "' "$FORMULA" | head -1 | sed 's/.*"\(.*\)".*/\1/')}"
TAG="v${VERSION}"

echo "==> Updating formula for hunch ${TAG}"

TARGETS=(
  "aarch64-apple-darwin"
  "x86_64-apple-darwin"
  "aarch64-unknown-linux-gnu"
  "x86_64-unknown-linux-gnu"
)

PLACEHOLDERS=(
  "PLACEHOLDER_SHA256_ARM64_MACOS"
  "PLACEHOLDER_SHA256_X86_64_MACOS"
  "PLACEHOLDER_SHA256_ARM64_LINUX"
  "PLACEHOLDER_SHA256_X86_64_LINUX"
)

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

for i in "${!TARGETS[@]}"; do
  target="${TARGETS[$i]}"
  placeholder="${PLACEHOLDERS[$i]}"
  url="https://github.com/${REPO}/releases/download/${TAG}/hunch-${target}.tar.gz"

  echo "  Downloading hunch-${target}.tar.gz ..."
  if ! curl -fsSL -o "${TMPDIR}/${target}.tar.gz" "$url"; then
    echo "  ⚠️  Failed to download ${url} — skipping (placeholder kept)"
    continue
  fi

  sha=$(shasum -a 256 "${TMPDIR}/${target}.tar.gz" | awk '{print $1}')
  echo "  SHA256: ${sha}"

  sed -i.bak "s/${placeholder}/${sha}/" "$FORMULA"
done

# Update version in formula if it changed
sed -i.bak "s/version \".*\"/version \"${VERSION}\"/" "$FORMULA"
rm -f "${FORMULA}.bak"

echo ""
echo "==> Done! Formula updated for ${TAG}."
echo "    Review: ${FORMULA}"
echo "    Then: git add . && git commit -m 'hunch ${TAG}' && git push"
