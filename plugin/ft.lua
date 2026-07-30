-- if a file is a .env or .envrc file, set the filetype to sh
vim.filetype.add({
  filename = {
    [".env"] = "sh",
    [".envrc"] = "sh",
    ["*.env"] = "sh",
    ["*.envrc"] = "sh"
  },
  pattern = {
    -- Laravel Blade templates (intelephense/tailwind/treesitter are wired for "blade")
    [".*%.blade%.php"] = "blade",
  }
})
