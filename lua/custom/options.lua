vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.wrap = false

-- Auto folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevel = 99
vim.o.foldenable = true
-- retrigger folding when setting filetype / tree-sitter attaches
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.cmd 'normal! zx'
  end,
})
