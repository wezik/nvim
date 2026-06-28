-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Some color schemes
  'nickkadutskyi/jb.nvim',

  -- Git integration in nvim
  'tpope/vim-fugitive',

  -- Supermaven integration
  -- TODO: Swap it with something maintained and allowing vendor swapping
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_word = '<C-Tab>',
          accept_suggestion = '<C-j>',
        },
      }
    end,
  },

  -- Harpoon, for quick file navigation
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      local ext = require 'harpoon.extensions'
      harpoon:extend(ext.builtins.highlight_current_file())
    end,
  },

  -- Breadcrumbs
  {
    "SmiteshP/nvim-navic",
    dependencies = 'neovim/nvim-lspconfig',
  },
  require 'custom.plugins.kulala',
}

