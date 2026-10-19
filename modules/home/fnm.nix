{ lib, ... }:
{
  # fnm switches Node versions automatically when entering a directory with
  # .nvmrc, .node-version, or package.json "engines".
  programs.zsh.initContent = lib.mkAfter ''
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell zsh)"
  '';
}
