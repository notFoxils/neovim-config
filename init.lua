-- Vim Environment Globals
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
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

vim.o.winborder = "rounded"

vim.o.termguicolors = true

if vim.fn.has("win64") == 1 then
    vim.o.shell = "bash.exe"
    vim.o.shellcmdflag = "-c"
    vim.o.shellxescape = ""
    vim.o.shellxquote = ""
end

vim.o.clipboard = "unnamedplus"
-- Vim Options

vim.diagnostic.config({
    virtual_lines = true,
    severity_sort = true,
})

vim.lsp.enable({
    "bashls",
    "buf_ls",
    "clangd",
    "cssls",
    "gopls",
    "html",
    "jdtls",
    "jsonls",
    --"kotlin_language_server", -- NOTE: 3rd Party
    "kotlin_lsp", -- NOTE: Official from Kotlin-org
    "lua_ls",
    "ruff",
    "rust_analyzer",
    "slangd",
    "taplo",
    "ts_ls",
    "yamlls",
})

vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "grD", vim.lsp.buf.declaration)

require("misc.lazy")

vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        callback = function(event)
            vim.treesitter.start(event.buf)
        end
    }
)
