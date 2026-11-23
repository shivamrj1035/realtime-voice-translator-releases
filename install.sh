#!/bin/bash
# Realtime Voice Translator: macOS installer.
#   curl -fsSL https://raw.githubusercontent.com/shivamrj1035/realtime-voice-translator-releases/main/install.sh | bash
# Downloads the latest release for this Mac (Apple chip or Intel), verifies its SHA-256 checksum
# against the published SHA256SUMS.txt, and copies the app into /Applications.
set -euo pipefail

REPO="shivamrj1035/realtime-voice-translator-releases"
APP="Realtime Voice Translator.app"

say() { printf '\033[1m%s\033[0m\n' "$*"; }
fail() { printf '\033[31mError: %s\033[0m\n' "$*" >&2; exit 1; }

[ "$(uname -s)" = "Darwin" ] || fail "this installer is for macOS. On Windows use install.ps1 (see the README)."
case "$(uname -m)" in
  arm64) ARCH=arm64 ;;
  x86_64)
    # An Intel shell on an Apple-chip Mac (Rosetta) still gets the native build.
    if [ "$(sysctl -in hw.optional.arm64 2>/dev/null)" = "1" ]; then ARCH=arm64; else ARCH=x64; fi ;;
  *) fail "unsupported CPU $(uname -m)" ;;
esac

say "→ Finding the latest version…"
TAG=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p' | head -1)
[ -n "$TAG" ] || fail "could not reach GitHub. Check your internet connection."
VERSION="${TAG#v}"
FILE="RealtimeVoiceTranslator-mac-$ARCH.dmg"
BASE="https://github.com/$REPO/releases/download/$TAG"

TMP=$(mktemp -d)
MNT="$TMP/mnt"
cleanup() { hdiutil detach "$MNT" -quiet 2>/dev/null || true; rm -rf "$TMP"; }
trap cleanup EXIT

say "→ Downloading $FILE ($ARCH)…"
curl -fL --progress-bar -o "$TMP/$FILE" "$BASE/$FILE"
curl -fsSL -o "$TMP/SHA256SUMS.txt" "$BASE/SHA256SUMS.txt"

say "→ Verifying checksum…"
EXPECTED=$(grep " $FILE\$" "$TMP/SHA256SUMS.txt" | awk '{print $1}')
ACTUAL=$(shasum -a 256 "$TMP/$FILE" | awk '{print $1}')
[ -n "$EXPECTED" ] && [ "$EXPECTED" = "$ACTUAL" ] || fail "checksum mismatch. The download may be corrupted; please try again."

say "→ Installing…"
mkdir -p "$MNT"
hdiutil attach "$TMP/$FILE" -nobrowse -readonly -quiet -mountpoint "$MNT"
DEST="/Applications"
[ -w "$DEST" ] || { DEST="$HOME/Applications"; mkdir -p "$DEST"; }
osascript -e 'quit app "Realtime Voice Translator"' >/dev/null 2>&1 || true
sleep 1
rm -rf "$DEST/$APP"
ditto "$MNT/$APP" "$DEST/$APP"
# Downloaded with curl, so it carries no quarantine flag; clear it anyway in case it was set.
xattr -dr com.apple.quarantine "$DEST/$APP" 2>/dev/null || true

say "✓ Installed Realtime Voice Translator $VERSION in $DEST"
say "  Opening it now. The setup guide will walk you through the rest."
open "$DEST/$APP"
