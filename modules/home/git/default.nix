{ ... }:
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
