{ ... }:

{
  programs.git = {
    enable = true;

    # Change the values depending on work or private
    userName = "gutehall";
    userEmail = "mathias@dm3.io";

    ignores = [
      ".DS_Store"
    ];

    difftastic = {
      enable = true;
      display = "inline";
    };

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      pull.ff = "only";
      merge.conflictstyle = "zdiff3";
    };
  };

  programs.gh.enable = true;
}
