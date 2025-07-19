vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.cursorline = true

vim.opt.wrap = false
vim.opt.showmode = false

vim.opt.scrolloff = 10

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.completeopt = "menuone,noselect,popup"
vim.opt.winborder = "rounded"

vim.diagnostic.config({
    virtual_lines = true,
})

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

require("misc.lazy")

vim.lsp.enable({
    "buf_ls",
    "gopls",
    "kotlin_language_server",
    "lua_ls",
})

require("nvim-treesitter").install({
    "java",
    "proto",
    "go",
    "kotlin",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (event)
        vim.treesitter.start(event.buf)
    end
})
