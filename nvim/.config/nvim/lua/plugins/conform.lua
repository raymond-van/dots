return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cc',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      just = { 'just' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      html = { 'djlint' },
      -- Conform can also run multiple formatters sequentially
      python = function(bufnr)
        if require('conform').get_formatter_info('ruff_format', bufnr).available then
          return { 'ruff_format' }
        else
          return { 'isort', 'black' }
        end
      end,
      rust = { 'rustfmt', lsp_format = 'fallback' },
      markdown = function(bufnr)
        if require('conform').get_formatter_info('deno_fmt', bufnr).available then
          return { 'deno_fmt' }
        else
          return {}
        end
      end,
      json = function(bufnr)
        if require('conform').get_formatter_info('deno_fmt', bufnr).available then
          return { 'deno_fmt' }
        else
          return {}
        end
      end,
      javascript = function(bufnr)
        if require('conform').get_formatter_info('deno_fmt', bufnr).available then
          return { 'deno_fmt' }
        else
          return { 'prettierd', 'prettier', stop_after_first = true }
        end
      end,
      typescript = function(bufnr)
        if require('conform').get_formatter_info('deno_fmt', bufnr).available then
          return { 'deno_fmt' }
        else
          return { 'prettierd', 'prettier', stop_after_first = true }
        end
      end,
    },
  },
}
