-- Leader key
vim.g.mapleader = " "

-- Splitting
vim.api.nvim_set_keymap('n', '<Leader>sh', ':split<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>sv', ':vsplit<CR>', {noremap = true, silent = true})

-- Move text in visual mode
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- Map function keys F1 to F12 to <nop> in insert mode
for i = 1, 12 do
    vim.api.nvim_set_keymap('i', '<F' .. i .. '>', '<nop>', { noremap = true })
    vim.api.nvim_set_keymap('i', '<S-F' .. i .. '>', '<nop>', { noremap = true })
    vim.api.nvim_set_keymap('i', '<C-F' .. i .. '>', '<nop>', { noremap = true })
    vim.api.nvim_set_keymap('i', '<A-F' .. i .. '>', '<nop>', { noremap = true })
end

-- Don't yank on paste over
vim.keymap.set("x", "p", "P")
vim.keymap.set("x", "P", "p")

