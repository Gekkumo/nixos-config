{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Gekkumo";
        email = "777@gmail.com"; #change
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      merge.conflictstyle = "diff3";
    };
  };

  programs.delta = {
    enable = true;
    options = {
      navigate = true;
      line-numbers = true;
    };
  };
}