local function setupKeybinds()
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
  map('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)

  map('n', '<C-<>', '<Cmd>BufferPrevious<CR>', opts)
  map('n', '<C->>', '<Cmd>BufferNext<CR>', opts)

  do
    -- Map Alt + 1->9->0 to their respective BufferGoto commands
    for i = 1, 9, 1 do
      map('n', '<C-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts)
    end
    map('n', '<C-0>', '<Cmd>BufferLast<CR>', opts)
  end

  map('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)

  map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)

  map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
  map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

  map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
  map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
  map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
  map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
  map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
end

return function()
  require('barbar').setup {
    hide = { extensions = true },
  }

  setupKeybinds()
end
