--move
vim.o.startofline = true
--visual
vim.o.ambwidth = 'double'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.showmatch = true
vim.o.matchtime = 1
--clipboard
vim.o.clipboard = 'unnamedplus'
--search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true})
--zenhan
vim.cmd('augroup zenhan')
vim.cmd('autocmd!')
vim.cmd("autocmd InsertLeave * :call system('zenhan 0')")
vim.cmd("autocmd CmdlineLeave * :call system('zenhan 0')")
vim.cmd('augroup END')