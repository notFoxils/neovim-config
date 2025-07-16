return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = { auto_show = false },
        },
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "lazydev",
            },
            providers = {
                lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
            },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
        }
    },
    build = "cargo build --release",
}
