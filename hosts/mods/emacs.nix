{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
      ((emacsPackagesFor unstable.emacs-gtk).emacsWithPackages (
        epkgs: with epkgs; [
          # orderless
          # marginalia
          # consult
          # embark
          # embark-consult
          # cape
          # corfu
          # corfu-candidate-overlay
          # nerd-icons-corfu
          # tempel
          # vertico
          # counsel
          # company-box
          # ispell
          # auctex
          # auctex-latexmk
          # lsp-ltex
          # company
          # company-org-block
          # company-suggest
          # company-auctex
          # company-dict
          # company-spell
          # company-fuzzy
          # nano-modeline
          # nano-theme
          # evil
          # evil-collection
          # hydra
          # projectile
          # counsel-projectile
          # magit
          # doom-modeline
          # dashboard
          # elfeed
          # neotree
          # centaur-tabs
          # all-the-icons
          # nerd-icons
          # nerd-icons-dired
          # nerd-icons-ivy-rich
          # nerd-icons-completion
          # rust-mode
          # hl-todo
          # org
          # org-roam
          # org-bullets
          # lsp-mode
          # lsp-ui
          # flycheck
          # flymake
          # yasnippet
          # lsp-treemacs
          # treemacs-nerd-icons
          # treemacs
          # lsp-ivy
          # # dired
          # dired-single
          # all-the-icons-dired
          # dired-open
          # dired-hide-dotfiles
          # evil-nerd-commenter
          # rainbow-mode
          # rainbow-delimiters
          # which-key
          # ivy-rich
          # general
        ]
      ))
    ];
#   services.emacs.package = with pkgs; (
#     (emacsPackagesFor unstable.emacs-gtk).emacsWithPackages (
#       epkgs: [ epkgs.evil ]
#     )
#   );
}
