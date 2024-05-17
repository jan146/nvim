local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ph', function ()
  builtin.find_files({ hidden = true, no_ignore = true })
end, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, {})

require "telescope".setup {
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
}
