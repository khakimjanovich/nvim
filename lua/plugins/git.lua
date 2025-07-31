-- lua/plugins/git.lua

return {
  -- This plugin shows git signs in the gutter.
  { 'lewis6991/gitsigns.nvim', config = true },

  -- This plugin provides a powerful terminal UI for git.
  {
    'jesseduffield/lazygit.nvim',
    -- We are setting a keymap to open lazygit.
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
