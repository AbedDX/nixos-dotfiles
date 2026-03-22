{ config, lib, pkgs, ... }:

let
  cfg = config.workstation.displaylink;

  driverUrl = "https://www.synaptics.com/sites/default/files/exe_files/2025-09/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu6.2-EXE.zip";

  driverHash = "sha256-JQO7eEz4pdoPkhcn9tIuy5R4KyfsCniuw6eXw/rLaYE=";
in
{
  options.workstation.displaylink.enable =
    lib.mkEnableOption "DisplayLink support";

  config = lib.mkIf cfg.enable {

    nixpkgs.overlays = [
      (final: prev: {
        displaylink = prev.displaylink.overrideAttrs (_old: {
          src = builtins.fetchurl {
            url = driverUrl;
            name = "displaylink-620.zip";
            sha256 = driverHash;
          };
        });
      })
    ];
      
    # required for DisplayLink
    services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

  };
}
