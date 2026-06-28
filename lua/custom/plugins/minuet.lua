return {
  'milanglacier/minuet-ai.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('minuet').setup {
      notify = 'debug',
      provider = 'openai_compatible',
      provider_options = {
        openai_compatible = {
          name = 'z.ai',
          end_point = 'https://api.z.ai/api/paas/v4/chat/completions',
          api_key = 'ZAI_API_KEY', -- set this env var
          model = 'glm-4.5-flash',
          stream = false,
          optional = {
            max_tokens = 80,
          },
        },
      },
      throttle = 2000,
      debounce = 800,
      request_timeout = 15,
      virtualtext = {
        auto_trigger_ft = { '*' },
        auto_trigger_ignore_ft = {},
        show_on_completion_menu = true,
        keymap = {
          accept = '<C-j>',
          accept_line = '<C-Tab>',
          next = '<A-]>',
          prev = '<A-[>',
          dismiss = '<C-e>',
        },
      },
    }
  end,
}
