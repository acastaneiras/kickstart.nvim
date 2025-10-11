return {
  {
    'dmmulroy/ts-error-translator.nvim',
    config = function()
      require('ts-error-translator').setup()
    end,
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  },
  {
    'yioneko/nvim-vtsls',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('vtsls-keymaps', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == 'vtsls' then
            local bufnr = args.buf
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true, buffer = bufnr }

            -- Imports
            keymap('n', '<leader>zo', function()
              require('vtsls').commands.organize_imports(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Organize imports' }))
            keymap('n', '<leader>zs', function()
              require('vtsls').commands.sort_imports(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Sort imports' }))
            keymap('n', '<leader>zu', function()
              require('vtsls').commands.remove_unused_imports(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Remove unused imports' }))
            keymap('n', '<leader>za', function()
              require('vtsls').commands.add_missing_imports(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Add missing imports' }))

            -- Code cleanup / fixes
            keymap('n', '<leader>zx', function()
              require('vtsls').commands.remove_unused(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Remove unused statements' }))
            keymap('n', '<leader>zf', function()
              require('vtsls').commands.fix_all(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Fix all issues' }))

            -- Navigation / Refactor
            keymap('n', 'gZ', function()
              require('vtsls').commands.goto_source_definition(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Go to source definition' }))
            keymap('n', '<leader>zn', function()
              require('vtsls').commands.rename_file(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Rename current file' }))
            keymap('n', '<leader>zr', function()
              require('vtsls').commands.file_references(bufnr)
            end, vim.tbl_extend('force', opts, { desc = '[vtsls] Find file references' }))
          end
        end,
      })
    end,
  },
}
