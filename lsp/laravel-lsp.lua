-- Official Laravel language server: composer global require laravel/lsp
-- Runs alongside intelephense; adds Laravel-specific completions,
-- go-to-definition for routes/views/config, and Blade support.
return {
    cmd = { "laravel-lsp" },
    filetypes = { "php", "blade" },
    root_markers = { "artisan" },
}
