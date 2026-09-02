{ config, pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = false;
    withPython3 = false;

    extraPackages = with pkgs; [
      lua-language-server
      nixd
      clang-tools
      basedpyright
      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [

      # LSP
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./plugin/lsp.lua;
      }

      # Comments
      {
        plugin = comment-nvim;
        type = "lua";
        config = ''require("Comment").setup()'';
      }

      # Theme
      # {
      #   plugin = gruvbox-nvim;
      #   type = "viml";
      #   config = "colorscheme gruvbox";
      # }

      # Lua development
      neodev-nvim

      {
        plugin = toggleterm-nvim;
        type = "lua";
        config = builtins.readFile ./plugin/toggleterm.lua;
      }

      # Completion
      {

        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./plugin/cmp.lua;
      }

      #harpoon
      {
        plugin = harpoon2;
        type="lua";
        config = builtins.readFile ./plugin/harpoon.lua;
      }

      #nerdTree
      {
        plugin = nerdtree;
        type = "lua";
        config = builtins.readFile ./plugin/tree.lua;
      }

      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets

      # Telescope
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./plugin/telescope.lua;
      }

      telescope-fzf-native-nvim

      # Statusline / icons
      lualine-nvim
      nvim-web-devicons

      # Treesitter
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

      # Nix filetype support
      vim-nix
    ];

    initLua = ''
      ${builtins.readFile ./options.lua}
    '';
  };
}

