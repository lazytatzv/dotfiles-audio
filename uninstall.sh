#!/usr/bin/env bash
# ==============================================================================
# dotfiles-audio: Uninstaller
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Removing linked Presets & HRIRs..."

EE_LOCAL_IRS="${HOME}/.local/share/easyeffects/irs"
EE_LOCAL_OUTPUT="${HOME}/.local/share/easyeffects/output"

if [ -d "${EE_LOCAL_OUTPUT}" ]; then
    for file in "${SCRIPT_DIR}/easyeffects/output"/*.json; do
        [ -f "${file}" ] || continue
        fname="$(basename "${file}")"
        rm -f "${EE_LOCAL_OUTPUT}/${fname}"
    done
fi

if [ -d "${EE_LOCAL_IRS}" ]; then
    for file in "${SCRIPT_DIR}/easyeffects/irs"/*.wav; do
        [ -f "${file}" ] || continue
        fname="$(basename "${file}")"
        base="${fname%.wav}"
        rm -f "${EE_LOCAL_IRS}/${fname}" "${EE_LOCAL_IRS}/${base}.irs"
    done
fi

echo "==> Uninstallation complete."
