# Source: https://github.com/nvim-treesitter/nvim-treesitter/discussions/8357
local treesitter = require("nvim-treesitter")
treesitter.setup()
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'bash', 'java', 'c', 'lua', 'vim', 'javascript', 'typescript', 'html', 'yaml' },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
