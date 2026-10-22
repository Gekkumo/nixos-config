{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Gekkumo";
        email = "Gekkumo@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.autoStash = true;
      merge.conflictstyle = "zdiff3";
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };

  programs.delta = {
    enable = true;
    options = {
      navigate = true;
      line-numbers = true;
    };
  };

  home.packages = with pkgs; [
    pre-commit
    difftastic
  ];
}
