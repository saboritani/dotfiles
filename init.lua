print('init.lua')
--move
vim.o.startofline = true
--visual
vim.o.tabstop = 4
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
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":nohl<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true})
--zenhan
vim.cmd("augroup zenhan")
vim.cmd("autocmd!")
vim.cmd("autocmd InsertLeave * :call system('zenhan 0')")
vim.cmd("autocmd CmdlineLeave * :call system('zenhan 0')")
vim.cmd("augroup END")

--plugin
--lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", --latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  "mattn/vim-maketable",
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
    require("nvim-surround").setup({
      --Configure here
    })
    end
  }
})
