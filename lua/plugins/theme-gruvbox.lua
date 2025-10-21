return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("gruvbox")
    end,
    opts = {
        palette_overrides = {
            dark0 = "#202020"
        },
    },
}
