local function on_init()
    vim.g.barbar_auto_setup = false
end

local function setup_plugin(loaded_plugin, opts)
    if not opts then
        return
    end

    loaded_plugin.setup(opts)
end

local function setup_keybinds()
    ---@type vim.keymap.set.Opts
    local opts = { silent = true }

    vim.keymap.set("n", "<C-h>", "<Cmd>BufferPrevious<CR>", opts)
    vim.keymap.set("n", "<C-h>", "<Cmd>BufferPrevious<CR>", opts)
    vim.keymap.set("n", "<C-l>", "<Cmd>BufferNext<CR>", opts)

    do -- Map Alt + 1->9->0 to their respective BufferGoto commands
        for i = 1, 9 do
            vim.keymap.set("n", "<C-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", opts)
        end
        vim.keymap.set("n", "<C-0>", "<Cmd>BufferLast<CR>", opts)
    end

    vim.keymap.set("n", "<C-p>", "<Cmd>BufferPin<CR>", opts)

    vim.keymap.set("n", "<C-q>", "<Cmd>BufferClose<CR>", opts)

    vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
    vim.keymap.set("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", opts)

    vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
    vim.keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
    vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
    vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
    vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
end

---@module "lazy.types"
---@type LazyPluginSpec
return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = on_init,
    opts = {
        hide = {
            extensions = true,
        },
    },
    config = function(_, opts)
        local loaded_plugin = require("barbar")

        setup_plugin(loaded_plugin, opts)
        setup_keybinds()
    end,
    lazy = false,
}
