{
  pkgs,
  inputs,
  username,
  ...
}:
let
  unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    ./programs.nix
    ./lazyvim.nix
    ./fnm.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    # Like system.stateVersion, preserve this value after the first activation.
    stateVersion = "26.05";

    packages = with pkgs; [
      tree
      ripgrep
      unstable.uv
      unstable.rustup
      fnm

      # Common build/download support for project-managed runtimes.
      curl
      unzip
      gcc
      pkg-config
    ];

    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      CARGO_HOME = "$HOME/.cargo";
      RUSTUP_HOME = "$HOME/.rustup";
      RUSTUP_AUTO_INSTALL = "1";
    };
  };

  # Keep the standalone Home Manager CLI in the managed profile after the
  # one-time bootstrap command.
  programs.home-manager.enable = true;
}
