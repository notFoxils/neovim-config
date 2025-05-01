local function setupKeybinds(bufferNumber)
  local api = require 'nvim-tree.api'
  api.config.mappings.default_on_attach(bufferNumber)

  local function opts(desc)
    return {
      desc = 'nvim-tree: ' .. desc,
      buffer = bufferNumber,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  local map = vim.keymap.set

  map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts 'Toggle Window')
  map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', opts 'Focus Window')
end

local function onAttach(bufferNumber)
  setupKeybinds(bufferNumber)
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    on_attach = onAttach,
    view = {
      side = 'right',
    },
    filters = {
      dotfiles = true,
    },
  },
}
