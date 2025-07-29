return {
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      local gitlinker = require 'gitlinker'
      local actions = require 'gitlinker.actions'
      gitlinker.setup {
        mappings = nil,
      }
      vim.keymap.set('n', '<leader>go', function()
        gitlinker.get_buf_range_url('n', {
          action_callback = actions.open_in_browser,
        })
      end, { desc = 'Git: Open commit in browser' })
    end,
  },
}
