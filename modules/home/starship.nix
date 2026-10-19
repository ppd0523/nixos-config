{ config, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Link the TOML in this repository instead of generating it from Nix
  # settings, so prompt edits apply without a Home Manager rebuild.
  xdg.configFile."starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nixos/dotfiles/starship/starship.toml";
}
