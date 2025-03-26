local builtin = require('telescope.builtin')
-- Search files, that may be hidden, ignore .git, don't include ignored files
vim.keymap.set('n', '<leader>pff', function()
    builtin.find_files({
	    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    })
end, {})
-- Search files, that may be hidden, ignore .git, and include ignored files
vim.keymap.set('n', '<leader>pfa', function ()
    builtin.find_files({
	    find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*" },
    })
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
