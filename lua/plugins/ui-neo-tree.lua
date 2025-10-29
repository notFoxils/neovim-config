local function setupKeybinds(bufferNumber)
    require("nvim-tree.api").config.mappings.default_on_attach(bufferNumber)

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            -- buffer = bufferNumber,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    vim.keymap.set("n", "<C-n>",     "<cmd>NvimTreeToggle<CR>", opts("Toggle Window"))
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>",  opts("Focus Window"))
end

local function onAttach(bufferNumber)
    setupKeybinds(bufferNumber)
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
    },
}
