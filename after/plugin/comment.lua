require('Comment').setup({
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>cc',
        ---Block-comment toggle keymap
        block = '<leader>cb',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'cc',
        ---Block-comment keymap
        block = 'cb',
    },
})
