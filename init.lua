vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
