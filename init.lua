-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Function to apply transparency settings globally
local function set_transparency()
  vim.cmd([[
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi TabLine guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE
hi TabLineSel guibg=NONE ctermbg=NONE
hi Pmenu guibg=NONE ctermbg=NONE
hi PmenuSel guibg=NONE ctermbg=NONE
hi NeoTreeNormal guibg=NONE ctermbg=NONE
hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
]])
end

-- Apply transparency settings initially
set_transparency()

-- Set up neo-tree with default settings and no custom mappings
require("neo-tree").setup({
  window = {
    -- Use default settings with no custom mappings
  },
})

-- Reapply transparency on buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = set_transparency,
})

-- Lua specific indentation settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.expandtab = true -- Use spaces instead of tabs
    vim.opt_local.shiftwidth = 2 -- Indent using 2 spaces
    vim.opt_local.tabstop = 2 -- Tabs are 2 spaces
    vim.opt_local.softtabstop = 2 -- Tab key equals 2 spaces
  end,
})
