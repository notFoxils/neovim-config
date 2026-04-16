local function setup_plugin(loaded_plugin, opts)
    if not opts then
        return
    end

    loaded_plugin.setup(opts)
end

local function setup_keybinds()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "fh", builtin.help_tags, { desc = "Telescope help tags" })
end

---@module "lazy.types"
---@type LazyPluginSpec
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function(_, opts)
        local loaded_plugin = require("telescope")

        setup_plugin(loaded_plugin, opts)
        setup_keybinds()
    end,
}
