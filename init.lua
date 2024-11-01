--move
vim.o.startofline = true
--visual
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = false
vim.o.smartindent = true

vim.o.showmatch = true
vim.o.matchtime = 1
--clipboard
vim.o.clipboard = "unnamedplus"
--search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

--keymap
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":nohl<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "jk", "<Esc>:w<CR>", { noremap = true, silent = true})

--lazy.nvim
require("config.lazy")

--indent-blankline.nvim
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
