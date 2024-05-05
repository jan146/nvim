-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
})

-- Toggle tree
vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', {noremap = true, silent = true})
-- Refresh tree
vim.api.nvim_set_keymap('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', {noremap = true, silent = true})
-- Change directory
vim.api.nvim_set_keymap('n', '<leader>cd', ':lua require("nvim-tree.api").tree.change_root_to_node()<CR>', {noremap = true, silent = true})
