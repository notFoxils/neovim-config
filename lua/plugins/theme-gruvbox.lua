return { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("gruvbox")

        -- You can configure highlights by doing something like:
        -- vim.cmd.hi("Comment gui=none")
    end,
    opts = {
        contrast = "medium",
        transparent_mode = false,
        dim_inactive = false,
    },
}
