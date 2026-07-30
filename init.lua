require("core.mason-path")
require("core.lsp")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.mason-verify")
require("config.health-check")
require("core.lazy")

-- Load saved theme after plugins are loaded
vim.defer_fn(function()
  local utils = require("config.utils")
  local saved_theme = utils.load_saved_theme()

  if saved_theme then
    utils.apply_theme(saved_theme)
  end
end, 100)
