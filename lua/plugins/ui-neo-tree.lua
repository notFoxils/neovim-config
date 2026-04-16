---@module "lazy.types"
---@type LazyPluginSpec
return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    ---@module "neo-tree"
    ---@type neotree.Config
    opts = {
        window = {
            position = "right",
            mappings = {
                ["/"] = "noop",
                ["f"] = "noop",
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
            },
        },
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
        { "<C-n>", "<cmd>Neotree toggle<CR>", mode = "n", desc = "" },
    },
    branch = "v3.x",
}
