{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        pull.rebase = false;
        # On WSL, reuse Windows credentials via Git for Windows' GCM.
        # Skipped at runtime on hosts where the .exe does not exist.
        credential.helper = "!f() { gcm='/mnt/c/Program Files/Git/ucrt64/bin/git-credential-manager.exe'; [ -x \"$gcm\" ] && exec \"$gcm\" \"$@\"; }; f";
      };
    };

    bat = {
      enable = true;
      config = {
        style = "plain";
        pager = "less -FR";
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 100000;
        save = 100000;
        share = true;
      };

      shellAliases = {
        cat = "bat";
        grep = "rg";
        ll = "ls -alh";
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    autojump = {
      enable = true;
      enableZshIntegration = true;
    };

    # Load each project's Nix development shell when entering its directory.
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
