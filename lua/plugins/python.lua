return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig').pyright.setup{
        settings = {
          python = {
            linting = {
              flake8Enabled = true,
              flake8Path = "flake8",
              flake8Args = {"--ignore=E501,W503, --max-line-length=80"},
            },
          },
        },
        vim.cmd [[autocmd BufWritePost *.py execute 'silent! !flake8 % > /tmp/flake8_qf && cfile /tmp/flake8_qf' | redraw!]]
      }
    end,
  },
}
