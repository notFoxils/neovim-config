local function setupKeybinds(bufferNumber)
  require("nvim-tree.api").config.mappings.default_on_attach(bufferNumber)

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      -- buffer = bufferNumber,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  vim.keymap.set("n", "<C-n>",     "<cmd>NvimTreeToggle<CR>", opts("Toggle Window"))
  vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>",  opts("Focus Window"))
end

local function onAttach(bufferNumber)
  setupKeybinds(bufferNumber)
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    on_attach = onAttach,
    view = {
      side = "right",
      width = 50,
    },
    filters = {
      git_ignored = false,
    },
  },
  lazy = false,
}
