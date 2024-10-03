{ ... }:
{
programs.rofi.enable = true;
  home.file.".local/share/rofi/windows11-list-dark.rasi".source  = ../../custom/themes/rofi-themes/windows11-list-dark.rasi;
  home.file.".local/bin/powermenu.sh".source  = ../../custom/themes/rofi-themes/bin/powermenu.sh;
  home.file.".local/share/rofi/powermenu.rasi".source  = ../../custom/themes/rofi-themes/powermenu.rasi;
}
