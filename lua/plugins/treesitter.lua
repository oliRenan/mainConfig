return {
  -- NOTE: treesitter CLI installation needed
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- O segredo está em usar o sub-módulo .configs
      local configs = require 'nvim-treesitter.configs'

      configs.setup {
        -- Substitui o seu treesitter.install()
        ensure_installed = {
          'json',
          'javascript',
          'typescript',
          'tsx',
          'go',
          'yaml',
          'html',
          'css',
          'python',
          'http',
          'prisma',
          'markdown',
          'markdown_inline',
          'svelte',
          'graphql',
          'bash',
          'lua',
          'vim',
          'dockerfile',
          'gitignore',
          'query',
          'vimdoc',
          'c',
          'java',
          'rust',
          'ron',
        },

        -- Habilita o realce (syntax highlighting) automaticamente
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        -- Habilita a indentação inteligente baseada no Treesitter
        indent = {
          enable = true,
          -- Se quiser desabilitar para tipos específicos, o Treesitter
          -- gerencia melhor do que via autocmd manual
          disable = { 'yaml', 'markdown' },
        },

        sync_install = false,
        auto_install = true, -- Tenta instalar se o parser estiver faltando
      }
    end,
  },

  -- NOTE: js,ts,jsx,tsx Auto Close Tags
  {
    'windwp/nvim-ts-autotag',
    -- Mantive sua configuração do autotag que parece correta
    ft = { 'html', 'xml', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte' },
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },
}
