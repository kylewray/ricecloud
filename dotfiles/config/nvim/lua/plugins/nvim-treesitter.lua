return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,           -- Always load this plugin at startup.
    build = ":TSUpdate",    -- Adding this command ensures languages are built when changes happen.
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c", "cpp", "cuda",
                "julia", "python",
                "latex", "bibtex",
                "lua", "vim",
                "proto",
                "printf",
                "doxygen", "regex",
                "bash", "dockerfile",
                "make", "cmake",
                "json", "json5", "markdown", "csv", "yaml",
                "javascript", "typescript",
                "html", "css",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,  -- Improves speed.
            }
        })
    end,
}
