---@module "lazy.types"
---@type LazyPluginSpec
return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module "todo-comments"
    ---@type TodoConfig
    opts = {
        signs = false
    },
}
