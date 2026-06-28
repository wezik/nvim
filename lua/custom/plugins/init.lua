-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local function gh(repo) return 'https://github.com/' .. repo end

-- ============================================================
-- COLOR SCHEMES
-- ============================================================

-- JetBrains-inspired theme (swap colorscheme in init.lua to use)
vim.pack.add { gh 'nickkadutskyi/jb.nvim' }

-- ============================================================
-- GIT
-- ============================================================

vim.pack.add { gh 'tpope/vim-fugitive' }

-- ============================================================
-- AI COMPLETION
-- ============================================================

vim.pack.add { gh 'supermaven-inc/supermaven-nvim' }
require('supermaven-nvim').setup {
  keymaps = {
    accept_word = '<C-Tab>',
    accept_suggestion = '<C-j>',
  },
}

-- ============================================================
-- FILE NAVIGATION - HARPOON
-- ============================================================

vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
}

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader><Tab>', function() harpoon:list():add() end)
vim.keymap.set('n', '<leader>H', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end)
vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end)

local harpoon_extensions = require 'harpoon.extensions'
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

-- ============================================================
-- BREADCRUMBS - NVIM-NAVIC
-- (LspAttach handler lives in Section 6 of init.lua)
-- ============================================================

vim.pack.add { gh 'SmiteshP/nvim-navic' }

-- ============================================================
-- HTTP REST CLIENT - KULALA
-- ============================================================

vim.pack.add { gh 'mistweaverco/kulala.nvim' }

-- Register session hooks so kulala can save/restore request history
vim.api.nvim_create_autocmd({ 'SessionLoadPost', 'VimLeavePre' }, {
  group = vim.api.nvim_create_augroup('kulala-session', { clear = true }),
  callback = function() pcall(require, 'kulala') end,
})

require('kulala').setup {
  kulala_core = {
    path = nil,
    timeout = 60000,
    data_dir = nil,
    download_url = 'https://github.com/mistweaverco/kulala-core/releases/download/%s/%s',
  },
  session = {
    restore = true,
  },
  default_env = 'default',
  environment_scope = 'b',
  vscode_rest_client_environmentvars = false,
  response_format = {
    indent = 2,
    expand_tabs = true,
    sort_keys = false,
  },
  ui = {
    display_mode = 'split',
    split_direction = 'right',
    win_opts = { bo = {}, wo = {} },
    default_view = 'body',
    winbar = true,
    default_winbar_panes = { 'body', 'headers', 'verbose', 'script_output', 'report' },
    winbar_labels = {
      body = 'Body',
      headers = 'Headers',
      headers_body = 'All',
      verbose = 'Verbose',
      script_output = 'Script Output',
      stats = 'Stats',
      report = 'Report',
      help = 'Help',
    },
    winbar_labels_keymaps = true,
    show_variable_info_text = false,
    show_icons = 'on_request',
    icons = {
      inlay = {
        loading = '⏳',
        done = '✔',
        error = '✘',
      },
      lualine = '🐼',
      textHighlight = 'WarningMsg',
      loadingHighlight = 'Normal',
      doneHighlight = 'String',
      errorHighlight = 'ErrorMsg',
    },
    show_request_summary = true,
    max_response_size = 32768,
    max_request_size = 2048,
    report = {
      show_script_output = true,
      show_asserts_output = true,
      show_summary = true,
      headersHighlight = 'Special',
      successHighlight = 'String',
      errorHighlight = 'Error',
    },
    scratchpad_default_contents = {
      '@MY_TOKEN_NAME=my_token_value',
      '',
      '# @name scratchpad',
      'POST https://echo.kulala.app/post HTTP/1.1',
      'accept: application/json',
      'content-type: application/json',
      '',
      '{',
      '  "foo": "bar"',
      '}',
    },
    pickers = {
      snacks = {
        layout = function()
          local has_snacks, snacks_picker = pcall(require, 'snacks.picker')
          return not has_snacks and {}
            or vim.tbl_deep_extend('force', snacks_picker.config.layout 'telescope', {
              reverse = true,
              layout = {
                { { win = 'list' }, { height = 1, win = 'input' }, box = 'vertical' },
                { win = 'preview', width = 0.6 },
                box = 'horizontal',
                width = 0.8,
              },
            })
        end,
      },
    },
  },
  lsp = {
    enable = true,
    filetypes = { 'http', 'rest', 'javascript', 'typescript', 'lua' },
    enforce_external_script_naming_convention = true,
    keymaps = false,
    on_attach = nil,
  },
  debug = 3,
  generate_bug_report = false,
  global_keymaps = true,
  global_keymaps_prefix = '<leader>R',
  kulala_keymaps = true,
  kulala_keymaps_prefix = '',
}

-- vim: ts=2 sts=2 sw=2 et
