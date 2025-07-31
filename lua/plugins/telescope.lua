-- lua/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  -- Telescope has two dependencies that provide extra features.
  -- `plenary.nvim` is a library of useful Lua functions.
  -- `telescope-fzf-native.nvim` makes sorting and filtering much faster.
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    -- Get the telescope plugin.
    local telescope = require('telescope')

    -- Set up telescope with some default options.
    telescope.setup {
      defaults = {
        -- This sets the layout for the telescope window.
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
        },
        -- This sets the sorting algorithm.
        sorting_strategy = 'ascending',
        -- This sets the theme for the telescope window.
        theme = 'dropdown',
      },
    }

    -- This loads the fzf-native extension, which makes telescope faster.
    telescope.load_extension 'fzf'

    -- Set up keymaps for common telescope actions.
    local keymap = vim.keymap.set
    -- Find files in your project.
    keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
    -- Find text in your project.
    keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Find text' })
    -- Find open buffers.
    keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffers' })
    -- Find help tags.
    keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Find help tags' })
  end,
}
