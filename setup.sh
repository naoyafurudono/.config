#!/bin/bash

set -eu -o pipefail
which git

cp -rf dotfiles "$HOME/.config"

# branch by the os
case "$(uname)" in
Darwin)
  # Install Homebrew
  # https://brew.sh/
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  brew install fish nvim fzf
  ;;
Linux)
  set +e
  apt-get update && apt-get install -y sudo
  set -e
  sudo apt-get update
  sudo apt-get install -y fish neovim fzf curl
  ;;
*)
  echo "Unknown OS" >&2
  exit 1
  ;;
esac

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# shellcheck disable=SC1091
source "$HOME/.cargo/env"
cargo install exa bat fd-find ripgrep zoxide

# Install asdf
# https://asdf-vm.com/guide/getting-started.html
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
touch tool-versions
ln tool-versions "${HOME}/.tool-versions"
