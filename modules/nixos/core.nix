{...}: {
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nix.gc = {
    automatic = true; # Enable automatic garbage collection
    dates = "daily"; # Run garbage collection daily
    options = "--delete-older-than 30d"; # remove store paths not used in last 30 days
  };
}
