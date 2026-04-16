local function setup_plugin(loaded_plugin, opts)
    if not opts then
        return
    end

    loaded_plugin.setup(opts)
end

local function install_parsers(loaded_plugin)
    loaded_plugin.install({
        "bash",
        "cpp",
        "css",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "kotlin",
        "proto",
        "python",
        "rust",
        "slang",
        "toml",
        "typescript",
        "yaml",
    })
end

---@module "lazy.types"
---@type LazyPluginSpec
return {
    "nvim-treesitter/nvim-treesitter",
    config = function(self, opts)
        local loaded_plugin = require("nvim-treesitter")

        setup_plugin(loaded_plugin, opts)
        install_parsers(loaded_plugin)
    end,
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
}
