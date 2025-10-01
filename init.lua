-- Vim Environment Globals
--vim.g.loaded_netrw = 0
--vim.g.loaded_netrwPlugin = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

if vim.fn.has("win64") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
-- Vim Environment Globals

-- Vim Options
vim.o.number = true
vim.o.cursorline = true

vim.o.wrap = false
vim.o.showmode = false

vim.o.scrolloff = 10

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.o.winborder = "rounded"

vim.o.termguicolors = true

if vim.fn.has("win64") == 1 then
    vim.o.shell = "bash.exe"
    vim.o.shellcmdflag = "-c"
    vim.o.shellxescape = ""
    vim.o.shellxquote = ""
end

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)
-- Vim Options

vim.diagnostic.config({
    virtual_lines = true,
})

vim.lsp.enable({
    "bashls",
    "buf_ls",
    "cssls",
    "gopls",
    "html",
    "jsonls",
    --"kotlin_language_server",
    "lua_ls",
    "rust_analyzer",
    "slangd",
    "ts_ls",
    "yamlls",
})

require("misc.lazy")

require("nvim-treesitter").install({
    "bash",
    "css",
    "go",
    "html",
    "java",
    "javascript",
    "json",
    --"kotlin",
    "proto",
    "rust",
    "slang",
    "typescript",
    "yaml",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        vim.treesitter.start(event.buf)
    end
})
