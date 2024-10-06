return {
    -- A vim-vinegar like file explorer that lets you edit your
    -- filesystem like a normal Neovim buffer.
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
        },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        require("oil").setup()
        vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
