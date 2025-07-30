-------------------------------------------------------------------------------
----------------------------------- Keyboard ----------------------------------

--------------- Disable ---------------
-- Disable the arrow keys.
vim.keymap.set({"n", "v", "i"}, "<up>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<down>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<left>", "<nop>")
vim.keymap.set({"n", "v", "i"}, "<right>", "<nop>")

-- Disable the "Ex" mode.

------ File and Folder Navigation -----
-- Across files/folders, browse using `nvim-tree`.
local nvim_tree_api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>o", nvim_tree_api.tree.toggle)

-- Use control+move to navigate multiple files.
vim.keymap.set({"n", "v", "i"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n", "v", "i"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n", "v", "i"}, "<C-k>", "<C-w>k")
vim.keymap.set({"n", "v", "i"}, "<C-l>", "<C-w>l")

-- Across files, have a "window switcher" using `harpoon`.
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>h", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>a", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>1", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon_ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon_ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon_ui.nav_file(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon_ui.nav_file(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon_ui.nav_file(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon_ui.nav_file(9) end)
vim.keymap.set("n", "<leader>0", function() harpoon_ui.nav_file(0) end)

----------- Searching Files -----------
-- Across files, search using `telescope`.
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", telescope_builtin.find_files) -- { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>g", telescope_builtin.git_files) -- { desc = "Telescope Find Files in Git" })
vim.keymap.set("n", "<leader>s", function()
    telescope_builtin.grep_string({ search = vim.fn.input("Search in Files > ") });
end) -- { desc = "Telescope Search in Files with Grep" })
--vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep) -- { desc = "Telescope Live Grep" })
--vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers) -- { desc = "Telescope Buffers" })
--vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags) -- { desc = "Telescope Help Tags" })

------------ Within a File ------------
-- Allow backspace to work properly in all modes.
vim.opt.backspace = "indent,eol,start"

-- Remap : to ;. This saves time in the long run.
vim.keymap.set("n", ";", ":")

-- Within a file, remap up and down (k and j) to move over wrapped lines.
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- When in visual mode, J and K move the selected text up and down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When using J, instead of putting the cursor at the end of the line, it puts it at the start.
vim.keymap.set("n", "J", "mzJ`z")

-- When scrolling, it appends `zz` which centers the screen, effectively keeping the cursor in the middle.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Similarly, when searching using `nvim`'s `n` and `N`, it also does the same trick as above.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Amazing! Normally, `nvim` will overwrite your buffer when using `p` if you have text selected.
-- This neat new `<leader>-p` pastes, except it *does not overwrite your buffer! Same for `d`, too.
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Also amazing! Yank using `<leader>y` (or `Y`) to the computer clipboard.
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>Y", "\"+Y")

-- Never press `Q`... Ever.
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix navigation.
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Helpful way to replace all words in a file that match the word that the cursor is on.
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Show the undo tree, using `undotree`.
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
------------------------------------- Mouse -----------------------------------
-- Enable the mouse for selecting text.
vim.opt.mouse = a
--vim.opt.ttymouse = xterm2

-- All input interactions should be fast.
vim.opt.ttyfast = true

-- Set the update time to be fast.
vim.opt.updatetime = 50
-------------------------------------------------------------------------------
