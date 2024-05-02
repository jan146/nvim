local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-Right>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-S-Left>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-S-Right>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-Enter>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-BS>', '<Cmd>BufferClose<CR>', opts)
-- Open new buffer
map('n', '<A-n>', ':enew<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<A-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Leader>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
