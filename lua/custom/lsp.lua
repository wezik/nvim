-- TODO: Custom Kotlin LSP handling, remove once lspconfig calls correct executable

vim.g.loaded_zipPlugin = nil

vim.lsp.config('kotlin_lsp', {
  cmd = { 'intellij-server', '--stdio' },
  filetypes = { 'kotlin' },
  root_markers = { 'settings.gradle', 'settings.gradle.kts', 'build.gradle', 'build.gradle.kts' },
})
vim.lsp.enable('kotlin_lsp')
