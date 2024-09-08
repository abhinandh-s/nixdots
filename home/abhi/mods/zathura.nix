# -- Catppuccin Color scheme --------------------------------------------

{ config, pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      # -- Theming ------------------------------------------------------
      default-bg = "rgba(30,30,46,1)";
      default-fg = "rgba(30,30,46,1)";
      completion-bg = "rgba(49,50,68,1)";
      completion-fg = "rgba(205,214,244,1)";
      completion-highlight-bg = "rgba(87,82,104,1)";
      completion-highlight-fg = "rgba(205,214,244,1)";
      completion-group-bg = "rgba(49,50,68,1)";
      completion-group-fg = "rgba(137,180,250,1)";
      statusbar-fg = "rgba(205,214,244,1)";
      statusbar-bg = "rgba(49,50,68,1)";
      notification-bg = "rgba(49,50,68,1)";
      notification-fg = "rgba(205,214,244,1)";
      notification-error-bg = "rgba(49,50,68,1)";
      notification-error-fg = "rgba(243,139,168,1)";
      notification-warning-bg = "rgba(49,50,68,1)";
      notification-warning-fg = "rgba(250,227,176,1)";
      inputbar-fg = "rgba(205,214,244,1)";
      inputbar-bg = "rgba(49,50,68,1)";
      recolor = "true";
      recolor-lightcolor = "rgba(30,30,46,1)";
      recolor-darkcolor = "rgba(205,214,244,1)";
      index-fg = "rgba(205,214,244,1)";
      index-bg = "rgba(30,30,46,1)";
      index-active-fg = "rgba(205,214,244,1)";
      index-active-bg = "rgba(49,50,68,1)";
      render-loading-bg = "rgba(30,30,46,1)";
      render-loading-fg = "rgba(205,214,244,1)";
      highlight-color = "rgba(87,82,104,0.5)";
      highlight-fg = "rgba(245,194,231,0.5)";
      highlight-active-color = "rgba(245,194,231,0.5)";
    };

    mappings = {
        D = "toggle_page_mode";
        "<Right>" = "navigate next";
        "[fullscreen] <C-i>" = "zoom in";
      };
  };
}

/*

Official Documetnation: https://pwmt.org/projects/zathura/documentation/
Arch wiki: https://wiki.archlinux.org/title/Zathura
MyNixOs: https://mynixos.com/search?q=zathura


zathura automatically reloads documents. When working in compiled documents such as those written in LaTeX, zathura will refresh the output whenever compilation takes place. zathura has the option of enabling inverse search (using "synctex").

zathura can adjust the document to page-fit (a) or to fit width (s), and it can rotate pages (r). It can view pages side-by-side (d) and has a fullscreen mode. Pages can also be recolored to have a black background and white foreground (C-r). Most of vi's movement/scrolling commands are supported.

Links can be followed by clicking them. Additionally, one can press f to highlight all links on the page and assign them a number, typing the number of the link and pressing enter will then jump to the link's location. If F is used, only the location of the link will be shown in the status bar.

zathura can search for text and copy text to the primary X selection. It supports bookmarks and can open encrypted files.

The behavior and appearance of zathura can be customised using a configuration file. zathura has the ability to execute external shell commands. It can be opened in tabs using tabbed.

You can create a mode-specific mapping by specifying the mode before the key:
`"[normal] <C-b>" = "scroll left";`
'';
example = {
        D = "toggle_page_mode";
        "<Right>" = "navigate next";
        "[fullscreen] <C-i>" = "zoom in";
      };
*/
