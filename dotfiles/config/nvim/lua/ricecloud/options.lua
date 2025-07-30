-------------------------------------------------------------------------------
----------------------------------- Leader ------------------------------------
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
------------------------------- General and GUI -------------------------------
-- This to do with the system-wide configuration;
-- it must be first. It enables 'vim' instead of 'vi'.
vim.opt.compatible = false

-- Set the command height to be 1 unit tall.
vim.opt.cmdheight = 1

-- Set padding on the top and bottom when you try to scroll, unless the start
-- or end of the file is reached, in which case it lets you go there.
vim.opt.scrolloff = 4

-- Enable line numbers. Make them relative.
vim.opt.number = true
vim.opt.relativenumber = true

-- Set 'hidden' which means it hides buffers instead
-- of closing them. Thus, you can open already opened
-- files and undo (provided buffer is still open).
vim.opt.hidden = true

-- Disable swap files.
vim.opt.backup = false
vim.opt.swapfile = false

-- Enable 24-bit colors.
vim.opt.termguicolors = true

-- Enable the left column that can display visual indicators in code.
vim.opt.signcolumn = "yes"

-- Color the column at 120 characters.
vim.opt.colorcolumn = "120"
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------- Highlighting ---------------------------------

-- Enable syntax highlighting with a color scheme.
--vim.syn = true -- TODO

-- Change the color of the pop-up menus to be more muted. -- TODO
--highlight Pmenu ctermbg=yellow guibg=yellow
----highlight PmenuSel ctermbg=black guibg=black
--highlight PmenuSbar ctermbg=black guibg=black
--highlight PmenuThumb ctermbg=darkgray guibg=darkgray

-- Show matching parenthesis.
vim.opt.showmatch = true

-- Assign files with non-standard extensions to use syntax highlighting. -- TODO
--au BufRead,BufNewFile *.cls,*.sty vim.opt.syn=tex
--au BufRead,BufNewFile *.cu vim.opt.syn=cpp

-- Enable spell-checking for text files.
vim.opt.spell = true -- TODO TODO TODO TODO TODO TODO TODO TODO
-- Variation: Enable spell-checking for text files.
--au BufRead,BufNewFile *.txt,*.tex,*.cls,*.sty vim.opt.spell
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
------------------------------- Tabs and Spacing ------------------------------

-- Auto and smart indentation. Optionally, return and auto-indent
-- once a certain number of characters is reached.
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Set wrap and line break. First we set the default: no wrap and no linebreak.
vim.opt.wrap = false
vim.opt.linebreak = false

-- Then, we override this with wraps and linebreaks on words only for text files.
--au BufRead,BufNewFile *.txt,*.tex vim.opt.wrap linebreak nolist textwidth=0 wrapmargin=0 -- TODO
--vim.opt.wrap
--vim.opt.linebreak
--vim.opt.textwidth=120
--vim.opt.wrapmargin=0

-- Setup the tabs to be 4 spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Insert tabs according to shiftwidth, not tabstop.
-- Also, use multiple shift widths with '>' or '<'.
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smarttab = true

-- For some file types, intelligently use different indenting.
--filetype plugin indent on -- TODO
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
---------------------------------- Searching ----------------------------------
-- Enable searching for case-sensitive only when capital
-- letters are used; otherwise, it is case-insensitive.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Setup searching so that it highlights search terms
-- as well as does it on-the-fly.
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Remember lots of commands and undo levels.
vim.opt.history = 1000
vim.opt.undolevels = 1000

-- Disable beeping.
vim.opt.visualbell = false
vim.opt.errorbells = false

-- Enable wildmenu for tab completion when opening files
-- or typing commands.
vim.opt.wildmode = "longest:full,full"
vim.opt.wildmenu = true

-- Disable `netrw`--the default file browser for (n)vim. Instead, `nvim-tree` is used.
-- Note: These two settings come from the `nvim-tree` setup documentation.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-------------------------------------------------------------------------------
