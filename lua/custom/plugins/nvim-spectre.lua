return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = { 'Spectre' },
  keys = {
    {
      '<leader>rr',
      function()
        require('spectre').toggle()
      end,
      desc = '[R]eplace: Toggle Spectre',
    },
    {
      '<leader>rw',
      function()
        require('spectre').open_visual { select_word = true }
      end,
      mode = 'n',
      desc = '[R]eplace: Search current [W]ord',
    },
    {
      '<leader>rw',
      function()
        vim.cmd 'normal! <Esc>'
        require('spectre').open_visual()
      end,
      mode = 'v',
      desc = '[R]eplace: Search selected [W]ord',
    },
    {
      '<leader>rf',
      function()
        require('spectre').open_file_search { select_word = true }
      end,
      desc = '[R]eplace in current [F]ile',
    },
  },
  opts = {
    default = {
      replace = {
        cmd = 'sed',
      },
    },
    is_block_ui_break = true,
  },
}
