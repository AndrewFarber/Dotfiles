local harpoon = require("harpoon")

harpoon.setup({})

vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)

vim.keymap.set("n", "<F1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<F2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<F3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<F4>", function() harpoon:list():select(4) end)

