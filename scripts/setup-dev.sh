#!/usr/bin/env bash
# Set up a reproducible development environment for Kestrel.
# Creates a virtualenv, installs the pinned dependencies, and installs pre-commit hooks.
set -euo pipefail

cd "$(dirname "$0")/.."

PYTHON="${PYTHON:-python3.11}"

if ! command -v "$PYTHON" >/dev/null 2>&1; then
    echo "error: $PYTHON not found; install Python 3.11 first" >&2
    exit 1
fi

if [ ! -d .venv ]; then
    "$PYTHON" -m venv .venv
fi

# shellcheck disable=SC1091
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements-dev.txt
pre-commit install

echo "Dev environment ready. Activate with: source .venv/bin/activate"