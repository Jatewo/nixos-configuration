{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jacobtw = {
    isNormalUser = true;
    description = "Jacob";
    extraGroups = ["networkmanager" "wheel" "video"];
    shell = pkgs.zsh;
  };
}
