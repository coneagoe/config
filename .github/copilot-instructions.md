# Copilot instructions for this repository

## Build, test, and lint

This repository does not define a centralized build, test, or lint entrypoint such as a `Makefile`, `package.json`, or test suite. The main executable entrypoints are setup scripts that are run directly from the repository root:

- `./init_config.sh` — top-level bootstrap for the workstation config
- `./init_tmux.sh` — installs tmux, clones the upstream tmux config, and copies `.tmux.conf.local`
- `./init_z.sh` — clones `z.lua` and appends its init snippet to `~/.zshrc_local`
- `./init_zsh.sh` — installs zsh prerequisites, runs Oh My Zsh install, and symlinks `.zshrc`
- `./vim_config.sh` — installs vim, downloads `vim-plug`, symlinks `.vimrc`, and runs `vim +PlugInstall +qa`
- `./install_docker.sh` — Docker install path for CentOS/YUM environments
- `./ss_config.sh` — interactive Docker-based Shadowsocks setup

When validating changes, use file-level checks instead of looking for a missing repo-wide test runner:

- Shell syntax check for one script: `bash -n init_config.sh`
- Shell syntax check for all setup scripts: `bash -n *.sh`
- Python syntax check for the helper: `python3 -m py_compile format_dts.py`

## High-level architecture

This is a personal environment/bootstrap repository, not an application. The important structure is the relationship between orchestration scripts, shared install helpers, and dotfiles:

- `init_config.sh` is the top-level orchestrator. It sources `common.sh`, clones an external `scripts` repository into `$HOME/scripts`, then calls component installers such as `init_z.sh` and `init_tmux.sh`. Several optional steps are intentionally commented out there (`init_zsh.sh`, `vim_config.sh`, `install_docker.sh`, `ss_config.sh`).
- `common.sh` is the shared package-install helper. Most shell installers depend on its `is_installed` and `installer` functions.
- The dotfiles in the repo are the source of truth for the installed environment. Scripts generally symlink repo-managed files into `$HOME` (`.zshrc`, `.gitconfig`, `.gdbinit`, `.vimrc`) or copy them when the upstream tool expects a local working file (`.tmux.conf.local`).
- `install_docker.sh` is an exception to the `common.sh` path: it uses YUM/CentOS commands directly instead of the APT-based helper.
- `ss_config.sh` is a standalone interactive provisioning script that manages Dockerized Shadowsocks server/client setup plus related systemd/unit helper files.
- `format_dts.py` is unrelated to the workstation bootstrap flow. It is a standalone Mercurial-oriented helper that finds staged `.dts` files via `hg status -man` and rewrites indentation by converting leading spaces into tabs while leaving `#...` and `&...` lines untouched.

## Key conventions

- Run the setup scripts from the repository root. Several scripts use `$(pwd)` when sourcing `common.sh`, locating repo files, or writing symlinks, so changing the working directory semantics will break them.
- Preserve the current split between orchestration and source-of-truth dotfiles: shell scripts install/link/copy; the actual behavior lives in files such as `.zshrc`, `.vimrc`, `.tmux.conf.local`, and `.gitconfig`.
- Most installer scripts start with `set -o nounset` and `source` the shared helper. Follow that pattern when editing or adding similar bootstrap scripts.
- Do not silently normalize package-manager behavior across the repo. `common.sh` assumes APT, while `install_docker.sh` is explicitly YUM-based; that mixed-distro behavior appears intentional.
- `~/.zshrc_local` is the extension point for machine-local shell additions. `init_z.sh` appends the `z.lua` init snippet there instead of editing `.zshrc` directly.
- `init_tmux.sh` copies `.tmux.conf.local` into `$HOME` but symlinks other config files. Keep that distinction unless you also update the workflow that depends on it.
- Mercurial is still part of the expected tooling even though this repository is in Git: `.zshrc` defines `alias hd="hg diff -w"`, `format_dts.py` shells out to `hg`, and `.vimrc` includes Mercurial plugins.
- The Vim configuration is opinionated and cross-file relevant:
  - plugin management is via `vim-plug`
  - trailing whitespace is removed on every save (`autocmd BufWritePre * :%s/\s\+$//e`)
  - ALE is configured to lint Python with `pylint` and shell scripts with `shellcheck`
  - async build/run integration defaults to `make`
  - project-root detection includes both `.git` and `.hg`
- The tmux config is layered on top of `gpakosz/.tmux` plus TPM plugins, with local customizations stored in `.tmux.conf.local` and plugin bootstrap expected at the bottom of that file.
