-------------------------------------------------------------------------------
-- Required: Bootstrap `lazy.nvim`.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
      "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Setup all of the general (n)vim options outside of the plugins' options.
-- Important: It also sets the important `leader` that must be bound before
-- `lazy` is setup below.
-- Note: These require tags search in the `~/.config/nvim/lua/` folder.
require("ricecloud.options")
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Setup `lazy.nvim`.
require("lazy").setup({
  spec = {
    -- Import all of the plugins.
    { import = "plugins" },
  },

  -- Configure any other settings here. See the documentation for more details.

  -- Set the colorscheme only for use when installing plugins.
  install = { colorscheme = { "everforest" } },

  -- Automatically check for plugin updates.
  checker = { enabled = true },
})
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Setup all keybinds, including setting up all the plugins' keybinds, now
-- that they are all loaded and setup.
-- Note: These require tags search in the `~/.config/nvim/lua/` folder.
require("ricecloud.keybinds")
-------------------------------------------------------------------------------

