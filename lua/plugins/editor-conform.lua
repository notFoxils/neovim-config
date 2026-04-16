---@module "lazy.types"
---@type LazyPluginSpec
return {
    "stevearc/conform.nvim",
    ---@module "conform.types"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            java = { lsp_format = "prefer" },
            javascript = { "prettier" },
            lua = { "stylua" },
            python = { lsp_format = "prefer" },
            rust = { lsp_format = "prefer" },
            typescript = { "prettier" },
        },
        format_after_save = { async = true, lsp_format = "fallback" },
    },
}
