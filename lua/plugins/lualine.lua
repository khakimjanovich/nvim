-- lua/plugins/lualine.lua

return {
  'nvim-lualine/lualine.nvim',
  -- This plugin also has a dependency on `nvim-web-devicons`.
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Get the lualine plugin.
    local lualine = require('lualine')

    -- Set up lualine with a nice theme and some useful components.
    lualine.setup {
      options = {
        -- The theme for the statusline.
        theme = 'tokyonight',
        -- This makes the statusline look a bit nicer.
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      -- These are the sections of the statusline, from left to right.
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
