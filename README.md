# Neovim Kickstart 2025

This repo contains my custom Neovim config for 2025, built on the foundation of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). This setup is designed to enhance your Neovim experience with modern features and seamless integration.
Config inspriara no [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

# Guia Definitivo: Neovim + Tree-sitter no Arch Linux

Este documento contém todos os comandos de terminal e o código Lua exato para instalar e configurar o Tree-sitter, resolvendo os erros de `libclang` e de API.

## 1. Instalação das Dependências do Sistema

O Tree-sitter e o Cargo precisam de compiladores (C/C++ e Rust) para rodar e construir os parsers. Rode no terminal:

```bash
# Atualiza os repositórios (evita erros 404) e instala os compiladores e o Rust
sudo pacman -Syu
sudo pacman -S base-devel clang gcc make git rust
```

## 2. Instalação do Tree-sitter CLI

Instale a ferramenta de linha de comando usando o Cargo:

```bash
cargo install tree-sitter-cli --locked
```

## 3. Exportação da Variável (PATH)

Para o sistema encontrar o comando `tree-sitter` recém-instalado, o diretório do Cargo precisa estar no seu PATH.

Rode os comandos abaixo diretamente no seu terminal (escolha de acordo com o seu shell):

**Para Zsh:**

```bash
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Para Bash:**

```bash
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 4. Configuração do Neovim (`treesitter.lua`)

Substitua todo o conteúdo do seu arquivo de configuração (geralmente em `~/.config/nvim/lua/plugins/treesitter.lua`) por este código:

```lua
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- API correta para o setup
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        -- Parsers que serão instalados automaticamente
        ensure_installed = {
          'c', 'lua', 'vim', 'vimdoc', 'query', 'rust', 'ron',
          'javascript', 'typescript', 'tsx', 'html', 'css',
          'json', 'yaml', 'bash', 'python', 'go', 'dockerfile',
          'markdown', 'markdown_inline', 'java', 'svelte', 'graphql'
        },

        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
          disable = { 'yaml', 'markdown' },
        },
      })
    end,
  },

  -- Auto Close Tags (JS/TS/HTML)
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'xml', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte' },
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },
}
```
