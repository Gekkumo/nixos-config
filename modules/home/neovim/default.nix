{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      nvim-treesitter.withAllGrammars
      telescope-nvim
      nvim-autopairs
    ];

    initLua = ''
      require('lualine').setup({
        options = { theme = 'auto' }
      })
    '';
  };

  stylix.targets.neovim.enable = true;
}
