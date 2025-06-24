{ pkgs, lib, hyprland }:

{
  hyprscroller = import ./hyprscroller {
    inherit pkgs lib hyprland;
  };

  catppuccin-icons = import ./catppuccin-icons {
    inherit pkgs lib;
  };

  kureiji-ollie-cursors = import ./kureiji-ollie-cursors {
    inherit pkgs lib;
  };

  sddm-stray = import ./sddm-stray {
    inherit pkgs lib;
  };
  nitch = import ./nitch {
    inherit pkgs lib;
  };
  rxfetch = import ./rxfetch {
     inherit pkgs lib;
  };
}
