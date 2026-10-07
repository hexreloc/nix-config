{ config, pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;

    vimdiffAlias = true;

    withRuby = false;
    withPython3 = false;

    extraPackages = with pkgs; [
      lua-language-server
      nixd
      clang-tools
      pyright
      xclip
      wl-clipboard
      ripgrep
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
        type = "lua";
        config = ''require("Comment").setup()'';
      }

      neodev-nvim
      yazi-nvim

      {
        plugin = toggleterm-nvim;
        type = "lua";
        config = builtins.readFile ./plugin/toggleterm.lua;
      }

      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./plugin/cmp.lua;
      }

      {
        plugin = harpoon2;
        type = "lua";
        config = builtins.readFile ./plugin/harpoon.lua;
      }


      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets

      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./plugin/telescope.lua;
      }

      {
        plugin =tokyonight-nvim;
        type = "lua";
        config = builtins.readFile ./plugin/colorscheme.lua;
      }

      plenary-nvim
      nui-nvim

      telescope-fzf-native-nvim
      lualine-nvim
      nvim-web-devicons

      {
        plugin = (
          nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-c
            p.tree-sitter-cpp
          ])
          );
          type = "lua";
          config = builtins.readFile ./plugin/treesitter.lua;
        }

        vim-nix
        vim-multiple-cursors
      ];

      initLua = ''
      ${builtins.readFile ./options.lua}

      vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:block,o:block"

      vim.diagnostic.config({
        signs = false,
      })

      vim.opt.signcolumn = "no"
      '';
    };
  }
