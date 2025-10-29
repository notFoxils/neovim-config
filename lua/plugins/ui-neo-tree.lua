---@module "lazy.nvim"
---@type LazyPluginSpec
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        window = {
            position = "right",
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
}
