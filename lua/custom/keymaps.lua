-- Line wrap movement
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Nicer indent manipulation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move lines up and down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Neotree override
vim.keymap.set('n', '<leader>te', '<cmd>Neotree reveal<CR>')

vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = '[T]oggle [W]rap' })

-- Harpoon
local harpoon = require 'harpoon'

vim.keymap.set('n', '<leader><Tab>', function()
    harpoon:list():add()
end)

vim.keymap.set('n', '<leader>H', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<leader>1', function()
    harpoon:list():select(1)
end)

vim.keymap.set('n', '<leader>2', function()
    harpoon:list():select(2)
end)

vim.keymap.set('n', '<leader>3', function()
    harpoon:list():select(3)
end)

vim.keymap.set('n', '<leader>4', function()
    harpoon:list():select(4)
end)

vim.keymap.set('n', '<leader>5', function()
    harpoon:list():select(5)
end)

vim.keymap.set('n', '<leader>`', '<cmd>b#<CR>')

