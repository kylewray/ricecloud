-- A colorscheme plugin.
return {
    "sainnhe/everforest",
    lazy = false,           -- Load a colorscheme during startup.
    priority = 1000,        -- Load a colorscheme before all other plugins.
    config = function()
        --vim.cmd([[colorscheme everforest]])
        vim.cmd("colorscheme everforest")
    end,
}
