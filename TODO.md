# Neovim PHPStorm-like Environment TODO

This file tracks the plan to transform Neovim into a PHPStorm-like IDE.

## Phase 1: Foundational UI & Theming
- [x] **Plugin Manager:** Setup `lazy.nvim`.
- [x] **Core LSP Infrastructure:** Configured `nvim-lspconfig` and `mason.nvim`.
- [x] **Lua Language Support:** Installed and configured `lua-language-server`.
- [x] **File Explorer:** Installed and configured `nvim-tree.lua`.
- [x] **UI Icons:** Installed `nvim-web-devicons`.
- [x] **Colorscheme:** Install and configure `catppuccin`.
- [x] **Status Line:** Install and configure `lualine.nvim`.
- [x] **Buffer/Tab Management:** Install and configure `bufferline.nvim`.
- [x] **Keybinding Helper:** Install and configure `which-key.nvim`.

---

## Phase 2: PHP Language & Autocompletion
- [ ] **PHP Language Server:** Install and configure `intelephense` via Mason.
- [ ] **Autocompletion Engine:** Install `nvim-cmp`.
- [ ] **LSP-Completion Bridge:** Configure `nvim-cmp` to use `intelephense` as a source.
- [ ] **Snippet Support:** Install `LuaSnip` and a PHP snippets pack.

## Phase 3: Enhanced Navigation & Project Search
- [ ] **Fuzzy Finding:** Install and configure `telescope.nvim` for files, text, and symbols.
- [ ] **Code Outline:** Install and configure `symbols-outline.nvim`.

## Phase 4: Debugging & Testing
- [ ] **Debugging:** Install `nvim-dap` and configure it for PHP/Xdebug.
- [ ] **Testing:** Install `neotest` and `neotest-pest` to run tests from within Neovim.

## Phase 5: Quality of Life & Advanced Features
- [ ] **Git Integration:** Install `gitsigns.nvim` and enhance Telescope for git browsing.
- [ ] **Code Formatting:** Configure `conform.lua` to use `php-cs-fixer` or `pint`.
- [ ] **Comment Helpers:** Install `Comment.nvim` for easy code commenting.
