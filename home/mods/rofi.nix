{ ... }:
{
  programs.rofi.enable = true;
  home.file  = {
    ".local/share/rofi/windows11-list-dark.rasi".source  = ../../custom/themes/rofi-themes/windows11-list-dark.rasi;
    ".local/bin/powermenu.sh".source  = ../../custom/themes/rofi-themes/bin/powermenu.sh;
    ".local/share/rofi/powermenu.rasi".source  = ../../custom/themes/rofi-themes/powermenu.rasi;
    ".local/share/rofi/mpd-sidebar.rasi".source  = ../../custom/themes/rofi-themes/mpd-sidebar.rasi;
    ".local/share/rofi/shared/colors.rasi".source  = ../../custom/themes/rofi-themes/shared/colors.rasi;
    ".local/share/rofi/shared/fonts.rasi".source  = ../../custom/themes/rofi-themes/shared/fonts.rasi;
    ".local/share/rofi/shared/onedark.rasi".source  = ../../custom/themes/rofi-themes/shared/onedark.rasi;
    ".local/bin/mpd.sh".source  = ../../custom/themes/rofi-themes/bin/mpd.sh;
  };
}
