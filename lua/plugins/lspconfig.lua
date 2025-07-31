-- lua/plugins/lspconfig.lua

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- These are some useful plugins that enhance the LSP experience.
    { 'williamboman/mason-lspconfig.nvim', config = true },
    { 'williamboman/mason.nvim', build = ':MasonUpdate' },
    { 'hrsh7th/cmp-nvim-lsp' },
  },
  config = function()
    -- Get the lspconfig plugin.
    local lspconfig = require('lspconfig')

    -- Get the cmp_nvim_lsp plugin.
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    -- This function will be called for each language server.
    local on_attach = function(client, bufnr)
      -- This creates a keymap to show hover documentation.
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Show hover documentation' })
      -- This creates a keymap to go to the definition of a symbol.
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
      -- This creates a keymap to show references to a symbol.
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Show references' })
      -- This creates a keymap to rename a symbol.
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename symbol' })
    end

    -- This sets up the capabilities for the language servers.
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- This sets up the language servers.
    lspconfig.intelephense.setup { on_attach = on_attach, capabilities = capabilities }
    lspconfig.ts_ls.setup { on_attach = on_attach, capabilities = capabilities }
    lspconfig.gopls.setup { on_attach = on_attach, capabilities = capabilities }
    lspconfig.jdtls.setup { on_attach = on_attach, capabilities = capabilities }
  end,
}
