-- [[ Options ]]

-- Nerd font
vim.g.have_nerd_font = true

local opt = vim.opt

-- Line numbers
opt.number = true           -- add line numbers
opt.relativenumber = true   -- relative line numbers

-- Tabs and indentation
opt.tabstop = 2             -- 4 spaces for tabs
opt.shiftwidth = 2          -- 4 spaces for indent width
opt.expandtab = true        -- expand tabs to spaces
opt.autoindent = true       -- copy indent from current line when starting new line

-- Appearance
opt.showmode = false        -- show mode below status bar
opt.signcolumn = 'yes'      -- always include column left of line numbers
opt.cursorline = true       -- highlight the text line of the cursor
opt.scrolloff = 10          -- min number of screen lines to keep above and below the cursor
opt.background = "dark"     -- colorschemes setting

-- Line wrap
opt.wrap = true             -- wrap text to next line
opt.breakindent = true      -- if text wraps, visually indent

-- Searching
opt.ignorecase = true       -- ignore case when searching
opt.smartcase = true        -- if you include mix case in search, assume you want case-sensetive

-- Key press timing
opt.timeoutlen = 400        -- mapped sequence time out (milliseconds)

-- Splits
opt.splitright = true       -- split vertical window to the right
opt.splitbelow = true       -- split horizontal window to the bottom

-- Whitespace characters
opt.list = true             -- update how whitespace characters are rendered
opt.listchars = {           -- whitespace overrides
    tab = '» ',
    trail = '·',
    nbsp = '␣',
    space = '·'
}

