return {
  {
    'dmmulroy/ts-error-translator.nvim',
    config = function()
      require('ts-error-translator').setup()
    end,
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  },
}
