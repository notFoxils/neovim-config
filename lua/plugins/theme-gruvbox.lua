---@module "lazy.types"
---@type LazyPluginSpec
return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("gruvbox")
    end,
    ---@module "gruvbox"
    ---@type GruvboxConfig
    opts = {
        palette_overrides = {
            dark0 = "#202020",
        },
    },
}
