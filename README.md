# .vimrc

This repository contains my personal Vim configuration file, `.vimrc`. It is used to customize and enhance the Vim (Vi IMproved) text editor with my preferred settings, key mappings, plugins, and workflow optimizations.

## Purpose

The `.vimrc` file is Vim's primary configuration file, allowing users to tailor the editor's behavior and appearance. By storing it in a version-controlled repository, I can:

- Safeguard against loss of my custom setup.
- Easily synchronize my Vim configuration across different machines.
- Share my setup with others or reference it for troubleshooting.

## Requirements

To use this configuration to its fullest, make sure you have the following installed:

- **Vim (latest version recommended, especially on Ubuntu):**
  ```bash
  sudo apt update
  sudo apt install vim
  ```
  > For the absolute latest Vim, consider installing from a PPA or building from source.

- **[ripgrep](https://github.com/BurntSushi/ripgrep)** (for fast file searching):
  ```bash
  sudo apt install ripgrep
  ```

- **[universal-ctags](https://github.com/universal-ctags/ctags)** (for code navigation):
  ```bash
  sudo apt install universal-ctags
  ```
  > If `universal-ctags` is not available in your package manager, [build from source](https://github.com/universal-ctags/ctags#readme).

- **[vim-plug](https://github.com/junegunn/vim-plug)** (plugin manager):  
  Install with:
  ```bash
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

## Features

- Custom key mappings for improved productivity.
- Sensible default settings for indentation, search, and interface.
- Plugin management setup with [vim-plug](https://github.com/junegunn/vim-plug).
- Color scheme preferences.
- Language-specific configuration snippets.

## Setup & Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Salanoid/.vimrc.git
   ```

2. **Backup your current `.vimrc` (optional but recommended):**
   ```bash
   mv ~/.vimrc ~/.vimrc.backup
   ```

3. **Symlink or copy the `.vimrc` from this repository:**
   ```bash
   ln -s /path/to/Salanoid/.vimrc/.vimrc ~/.vimrc
   # or
   cp /path/to/Salanoid/.vimrc/.vimrc ~/.vimrc
   ```

4. **Install plugins:**
   Open Vim and run:
   ```
   :PlugInstall
   ```

5. **Start/restart Vim to use the new configuration.**

## Customization

Feel free to fork this repository and adjust the `.vimrc` to suit your own workflow and preferences.

## License

This configuration is shared for personal use and as an example. You may use or adapt it freely.

---

> Maintained by [Salanoid](https://github.com/Salanoid)
