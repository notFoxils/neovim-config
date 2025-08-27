vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true;
vim.o.cursorline = true

vim.o.wrap = false
vim.o.showmode = false

vim.o.scrolloff = 10

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.completeopt = "menuone,noselect,popup"
vim.o.winborder = "rounded"

vim.diagnostic.config({
    virtual_lines = true,
})

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

require("misc.lazy")

vim.lsp.enable({
    "buf_ls",
    "cssls",
    "gopls",
    "html",
--    "kotlin_language_server",
    "lua_ls",
    "rust_analyzer",
})

require("nvim-treesitter").install({
    "css",
    "go",
    "html",
    "java",
--    "kotlin",
    "proto",
    "rust",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (event)
        vim.treesitter.start(event.buf)
    end
})
