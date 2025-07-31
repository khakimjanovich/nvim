-- lua/plugins/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  -- This plugin has a dependency on `nvim-web-devicons` for nice icons.
  -- `lazy.nvim` will automatically install this for us.
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Get the nvim-tree plugin, which is referred to as `nvim_tree`.
    local nvim_tree = require('nvim-tree')

    -- Set up the plugin with some recommended options.
    nvim_tree.setup {
      -- When you open a file, the tree will automatically close.
      
      -- When you open a file, the tree will focus on that file.
      sync_root_with_cwd = true,
      -- Configuration for how the file tree is rendered.
      renderer = {
        -- This makes the root folder look nice.
        root_folder_modifier = ':t',
        -- This adds indentation markers to show the tree structure.
        indent_markers = {
          enable = true,
        },
        -- This shows icons next to files and folders.
        icons = {
          glyphs = {
            default = '',
            symlink = '',
            folder = {
              arrow_closed = '',
              arrow_open = '',
              default = '',
              open = '',
              empty = '',
              empty_open = '',
              symlink = '',
              symlink_open = '',
            },
            git = {
              unstaged = '',
              staged = 'S',
              unmerged = '',
              renamed = '➜',
              untracked = 'U',
              deleted = '',
              ignored = '◌',
            },
          },
        },
      },
      -- This prevents nvim-tree from showing up in buffers like tabline or bufferline.
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      -- This updates the tree when files are changed on disk.
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      -- This shows git status indicators in the tree.
      git = {
        enable = true,
        ignore = false,
      },
    }

    -- Set up a keymap to toggle the file tree.
    -- `<leader>e` will open and close the tree.
    -- `vim.keymap.set` is the recommended way to create keymaps in Neovim.
    -- `n` stands for "normal mode".
    -- `<leader>e` is the key combination to trigger the command.
    -- `function() nvim_tree.toggle() end` is the command to run.
    -- `{ desc = "Toggle file explorer" }` provides a description for the keymap.
    vim.keymap.set('n', '<leader>e', function()
      nvim_tree.toggle()
    end, { desc = 'Toggle file explorer' })
  end,
}
