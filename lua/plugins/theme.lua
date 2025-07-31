-- lua/plugins/theme.lua

return {
  -- This is the name of the plugin, found on its GitHub repository
  -- e.g., 'folke/tokyonight.nvim'
  'folke/tokyonight.nvim',

  -- `lazy = false` means this plugin will be loaded on startup.
  -- We want our colorscheme to load immediately to avoid a flash of the default theme.
  lazy = false,

  -- `priority = 1000` ensures this plugin is loaded before others.
  -- This is important for a colorscheme.
  priority = 1000,

  -- `opts = {}` is for passing options to the plugin.
  -- We are using the default options for tokyonight, so this is empty for now.
  opts = {},

  -- `config` is a function that runs after the plugin is loaded.
  -- This is where we tell Neovim to actually use the colorscheme.
  config = function()
    -- `vim.cmd` is used to execute a Vim command from Lua.
    -- `colorscheme tokyonight` sets the active colorscheme.
    vim.cmd.colorscheme 'tokyonight'
  end,
}