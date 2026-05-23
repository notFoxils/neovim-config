---@module "lazy.types"
---@type LazyPluginSpec
return {
    "dlyongemallo/diffview.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    ---@module "diffview"
    ---@type DiffviewConfig
    opts = {},
    keys = {},
    lazy = false,
}
