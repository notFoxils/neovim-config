local function getKeybinds()
  local opts = { noremap = true, silent = true }

  local binds = {}

  table.insert(binds, { '<C-,>', '<Cmd>BufferPrevious<CR>', opts })
  table.insert(binds, { '<C-.>', '<Cmd>BufferNext<CR>', opts })

  table.insert(binds, { '<C-<>', '<Cmd>BufferPrevious<CR>', opts })
  table.insert(binds, { '<C->>', '<Cmd>BufferNext<CR>', opts })

  do
    -- Map Alt + 1->9->0 to their respective BufferGoto commands
    for i = 1, 9, 1 do
      table.insert(binds, { '<C-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts })
    end
    table.insert(binds, { '<C-0>', '<Cmd>BufferLast<CR>', opts })
  end

  table.insert(binds, { '<C-p>', '<Cmd>BufferPin<CR>', opts })

  table.insert(binds, { '<C-q>', '<Cmd>BufferClose<CR>', opts })

  table.insert(binds, { '<C-p>', '<Cmd>BufferPick<CR>', opts })
  table.insert(binds, { '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts })

  table.insert(binds, { '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts })
  table.insert(binds, { '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts })
  table.insert(binds, { '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts })
  table.insert(binds, { '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts })
  table.insert(binds, { '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts })

  return binds
end

return {
  'romgrk/barbar.nvim',
  version = '*',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    hide = { extensions = true },
  },
  keys = getKeybinds,
  lazy = false,
}
