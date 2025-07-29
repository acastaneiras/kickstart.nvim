return {
  {
    'f-person/git-blame.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_use_blame_commit_file_urls = true
      vim.cmd [[autocmd BufEnter * GitBlameDisable]]
      vim.keymap.set('n', '<leader>hb', ':GitBlameToggle<CR>', { desc = 'git [b]lame line' })
      vim.keymap.set('n', '<leader>go', ':GitBlameOpenCommitURL<CR>', { desc = 'Abre commit del blame en navegador' })
    end,
  },
}
