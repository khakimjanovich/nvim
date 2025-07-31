-- lua/plugins/cmp.lua

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- These are some useful plugins that provide completion sources for nvim-cmp.
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'L3MON4D3/LuaSnip' },
  },
  config = function()
    -- Get the nvim-cmp plugin.
    local cmp = require('cmp')

    -- Set up nvim-cmp with some default options.
    cmp.setup {
      -- This enables snippet support.
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      -- This sets the keymappings for nvim-cmp.
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },
      -- This sets the completion sources.
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
    }
  end,
}
