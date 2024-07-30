{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.unstable.emacs-gtk;
    extraPackages = epkgs: with epkgs; [
      all-the-icons
      all-the-icons-dired
      async
      auctex
      auctex-latexmk

      company
      company-auctex
      company-box
      company-prescient
      company-quickhelp
      catppuccin-theme
      counsel

      dashboard
      doom-modeline
      doom-themes
      drag-stuff
      dap-mode

      elfeed
      elfeed-dashboard
      elfeed-org
      elfeed-protocol
      elfeed-goodies
      evil
      evil-snipe
      evil-collection
      evil-tex

      flycheck
      flymake

      general

      hl-todo
      highlight-indent-guides

      ivy
      indent-guide


      lsp-mode
      lsp-ui
      lsp-grammarly
      luarocks
      lua-mode

      magit

      nix-mode
      nerd-icons
      nerd-icons-completion
      nerd-icons-ivy-rich
      nerd-icons-dired
      neotree
      nixpkgs-fmt
      nix-ts-mode


      org-bullets
      org-roam
      olivetti

      python-mode
      python-isort
      python-black
      perspective
      pdf-tools
      projectile




      rainbow-delimiters
      rainbow-mode
      rust-mode
      rustic
      rust-auto-use

      sudo-edit

      toc-org

      unicode-fonts
      uwu-theme

      yasnippet
      which-key
    ];
    extraConfig = ''
    '';

  };
  services.emacs = {
    enable = true;
    package = pkgs.unstable.emacs-gtk;
    client = {
      enable = true;
      arguments = [
        "-c"
      ];
    };
  };

  #  xdg.configFile."emacs/init.el".source  = ./init.el;

}
