local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>pa", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>pl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>p1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>p2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>p3", function() harpoon:list():select(3) end)
