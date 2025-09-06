return {
  {
    'dmmulroy/ts-error-translator.nvim',
    config = function()
      require('ts-error-translator').setup()
    end,
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      require('typescript-tools').setup {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
          client.server_capabilities.documentRangeFormattingProvider = true
        end,
        settings = {
          jsx_close_tag = {
            enable = true,
            filetypes = { 'javascriptreact', 'typescriptreact' },
          },
        },
      }
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Imports
      keymap('n', '<leader>zo', '<cmd>TSToolsOrganizeImports<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Organize imports' }))
      keymap('n', '<leader>zs', '<cmd>TSToolsSortImports<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Sort imports' }))
      keymap('n', '<leader>zu', '<cmd>TSToolsRemoveUnusedImports<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Remove unused imports' }))
      keymap('n', '<leader>za', '<cmd>TSToolsAddMissingImports<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Add missing imports' }))

      -- Code cleanup / fixes
      keymap('n', '<leader>zx', '<cmd>TSToolsRemoveUnused<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Remove unused statements' }))
      keymap('n', '<leader>zf', '<cmd>TSToolsFixAll<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Fix all issues' }))

      -- Navigation / Refactor
      keymap('n', 'gZ', '<cmd>TSToolsGoToSourceDefinition<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Go to source definition' }))
      keymap('n', '<leader>zn', '<cmd>TSToolsRenameFile<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Rename current file' }))
      keymap('n', '<leader>zr', '<cmd>TSToolsFileReferences<CR>', vim.tbl_extend('force', opts, { desc = '[TSTools] Find file references' }))
    end,
  },
}
