-- Source: https://github.com/nvim-treesitter/nvim-treesitter/discussions/8357
-- Make sure to install tree-sitter-cli via OS package manager if vim.pack did not install it
local treesitter = require("nvim-treesitter")
local langs = {
    'javascript', 'typescript', 'vue', 'html',
    'python',
    'java',
    'c', 'cpp', 'make',
    'bash', 'zsh', 'nix', 'kitty',
    'dockerfile', 'yaml',
    'lua', 'vim',
    'latex', 'bibtex',
    'markdown',
}
treesitter.setup()
treesitter.install(langs)
vim.api.nvim_create_autocmd('FileType', {
  pattern = langs,
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
