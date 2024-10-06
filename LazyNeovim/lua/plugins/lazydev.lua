return {
    -- A plugin that properly configures LuaLS (Lua LSP) for editing
    -- your Neovim config by lazily updating your workspace libraries.
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
        library = {
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        },
    }
}
