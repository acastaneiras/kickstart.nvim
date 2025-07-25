return {
  'mbbill/undotree',
  keys = {
    { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Toggle Undotree' },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_HelpLine = 0
  end,
}
