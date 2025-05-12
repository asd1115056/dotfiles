#!/usr/bin/env bash

set -euo pipefail

# Colorized output functions
info()    { echo -e "\033[0;36m[i]\033[0m $*"; }
warn()    { echo -e "\033[1;33m[!]\033[0m $*"; }
success() { echo -e "\033[0;32m[✔]\033[0m $*"; }
error()   { echo -e "\033[0;31m[✘]\033[0m $*" >&2; }

# Check if chezmoi is already installed
if ! command -v chezmoi &>/dev/null; then
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"

  # Check if curl or wget is available for downloading
  if command -v curl &>/dev/null; then
    info "Installing chezmoi using curl..."
    sh -c "$(curl -fsLS https://git.io/chezmoi)" -- -b "$bin_dir"
  elif command -v wget &>/dev/null; then
    info "Installing chezmoi using wget..."
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    error "To install chezmoi, you must have either curl or wget installed."
    exit 1
  fi
else
  info "chezmoi is already installed."
  chezmoi=chezmoi
fi

# Get script's directory using POSIX method
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# Replace the current process with chezmoi init
info "Initializing chezmoi..."
exec "$chezmoi" init --apply "--source=$script_dir"