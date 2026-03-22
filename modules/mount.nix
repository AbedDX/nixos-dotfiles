{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mount;
in
{
  options.mount = {
    games.enable = lib.mkEnableOption "Local mount for storing video game files";
    media.enable = lib.mkEnableOption "Local media mount for Jellyfin, Kavita, Immich, and Navidrome";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.games.enable {
      fileSystems."/mnt/games" = {
        device = "/dev/disk/by-uuid/number"; # set value
        fsType = "ext4";
        options = [
          "nosuid"
          "nodev"
          "noatime"
          "nofail"
        ];
      };
    })

    (lib.mkIf cfg.media.enable {
      fileSystems."/mnt/jelly" = {
        device = "/dev/disk/by-uuid/number"; # set value
        fsType = "ext4";
        options = [
          "nosuid"
          "nodev"
          "noatime"
          "nofail"
        ];
      };
    })
  ];
}
