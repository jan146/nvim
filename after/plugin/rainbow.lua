local rainbow_delimiters_setup = require("rainbow-delimiters.setup")
local rainbow_delimiters = require("rainbow-delimiters")

rainbow_delimiters_setup.setup {
    strategy = {
        -- [''] = 'rainbow-delimiters.strategy.global',
        -- commonlisp = 'rainbow-delimiters.strategy.local',
    },
    query = {
        -- [''] = 'rainbow-delimiters',
        -- latex = 'rainbow-blocks',
    },
    highlight = {
        -- 'RainbowDelimiterRed',
        -- 'RainbowDelimiterYellow',
        -- 'RainbowDelimiterBlue',
        -- 'RainbowDelimiterOrange',
        -- 'RainbowDelimiterGreen',
        -- 'RainbowDelimiterViolet',
        -- 'RainbowDelimiterCyan',
    },
    -- blacklist = {'c', 'cpp'},
}

vim.keymap.set('n', '<Leader>rt', function ()
    rainbow_delimiters.toggle()
end)
