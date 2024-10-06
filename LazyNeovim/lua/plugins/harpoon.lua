return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('harpoon'):setup()
        end,
        keys = {
            {
            "<leader>a",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():add()
                end,
            },
            {
            "<leader>h",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
            },
            {
            "<F1>",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(1)
                end,
            },
            {
            "<F2>",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(2)
                end,
            },
            {
            "<F3>",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(3)
                end,
            },
            {
            "<F4>",
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():select(4)
                end,
            },
        }
    }
}
