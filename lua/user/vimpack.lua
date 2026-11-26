vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/uZer/pywal16.nvim',
  'https://github.com/RedsXDD/neopywal.nvim',
  'https://github.com/catppuccin/nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/hiphish/rainbow-delimiters.nvim',
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/xiyaowong/transparent.nvim',
  'https://github.com/romgrk/barbar.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/VonHeikemen/lsp-zero.nvim',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/kylechui/nvim-surround',
  'https://github.com/numToStr/Comment.nvim',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/jay-babu/mason-nvim-dap.nvim',
  'https://github.com/theHamsta/nvim-dap-virtual-text',
})
