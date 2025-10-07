return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'horizontal',
        open_mapping = [[<C-\>]],
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        persist_mode = true,
      }

      vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle horizontal terminal' })
      vim.keymap.set('n', '<leader>tk', '<cmd>ToggleTermToggleAll<CR>', { desc = 'Kill/hide all terminals' })
    end,
  },
}
