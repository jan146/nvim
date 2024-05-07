require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>gn', function()
      if vim.wo.diff then
        vim.cmd.normal({'<leader>gn', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '<leader>gp', function()
      if vim.wo.diff then
        vim.cmd.normal({'<leader>gp', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>ghs', gitsigns.stage_hunk)
    map('n', '<leader>ghr', gitsigns.reset_hunk)
    map('n', '<leader>ghu', gitsigns.undo_stage_hunk)
    map('n', '<leader>ghp', gitsigns.preview_hunk)
    map('v', '<leader>ghs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>ghr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>gbs', gitsigns.stage_buffer)
    map('n', '<leader>gbr', gitsigns.reset_buffer)
    map('n', '<leader>gbl', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>gbt', gitsigns.toggle_current_line_blame)
    map('n', '<leader>gds', gitsigns.diffthis)
    map('n', '<leader>gdh', function() gitsigns.diffthis('~') end)
    map('n', '<leader>gtd', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
