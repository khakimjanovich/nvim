-- lua/plugins/mason.lua

return {
  'williamboman/mason.nvim',
  config = function()
    -- Get the mason plugin.
    local mason = require('mason')

    -- Set up mason with some default options.
    mason.setup {
      ui = {
        -- This sets the border style for the mason window.
        border = 'rounded',
      },
    }
  end,
}
