{pkgs, ...}: {
  home.packages = with pkgs; [
    heroic
    satisfactorymodmanager
    prismlauncher
  ];
}
