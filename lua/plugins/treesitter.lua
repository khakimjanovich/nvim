-- lua/plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  -- This plugin has a build step that needs to be run.
  build = ':TSUpdate',
  config = function()
    -- Get the treesitter plugin.
    local treesitter = require('nvim-treesitter.configs')

    -- Set up treesitter with the languages you use.
    treesitter.setup {
      -- A list of parser names, or "all" for all available parsers.
      ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'typescript', 'php', 'go', 'java' },

      -- Install parsers synchronously (only applied to `ensure_installed`).
      sync_install = false,

      -- Automatically install missing parsers when entering a buffer.
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally.
      auto_install = true,

      -- List of parsers to ignore installing.
      ignore_install = { 'latex' },

      -- This enables syntax highlighting based on treesitter.
      highlight = {
        enable = true,
        -- List of language that will be disabled.
        disable = { 'c', 'rust' },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
