# -- Catppuccin Color scheme --------------------------------------------
{ pkgs, ... }:
let
  cat = pkgs.catppuccin.rgba.mocha;
in 
{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      # -- Theming ------------------------------------------------------
      default-bg = cat.base 1.0;
      default-fg = cat.base 1.0;
      completion-bg = cat.surface0 1.0;
      completion-fg = cat.text 1.0;
      completion-highlight-bg = cat.surface2 1.0;
      completion-highlight-fg = cat.text 1.0;
      completion-group-bg = cat.surface0 1.0;
      completion-group-fg = cat.blue 1.0;
      statusbar-fg = cat.text 1.0;
      statusbar-bg = cat.surface0 1.0;
      notification-bg = cat.surface0 1.0;
      notification-fg = cat.text 1.0;
      notification-error-bg = cat.surface0 1.0;
      notification-error-fg = cat.red 1.0;
      notification-warning-bg = cat.surface0 1.0;
      notification-warning-fg = cat.yellow 1.0;
      inputbar-fg = cat.text 1.0;
      inputbar-bg = cat.surface0 1.0;
      recolor = "true";
      recolor-lightcolor = cat.base 1.0;
      recolor-darkcolor = cat.text 1.0;
      index-fg = cat.text 1.0;
      index-bg = cat.base 1.0;
      index-active-fg = cat.text 1.0;
      index-active-bg = cat.surface0 1.0;
      render-loading-bg = cat.base 1.0;
      render-loading-fg = cat.text 1.0;
      highlight-color = cat.surface2 0.5;
      highlight-fg = cat.pink 0.5;
      highlight-active-color = cat.pink 0.5;
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
