; -----------------------------------------------------------------------

;I can’t count parentheses. I use an advice override to change how the parenthesis locating functionality works. This is because I use a block cursor with meow, which makes cursor position slightly deceptive.

; Basically, the block cursor by default highlights the parenthesis when your cursor is immediately AFTER the parenthesis in question, because the point is always between two characters in emacs (the point is really right after the parenthesis as well). So, if you have nested parentheses, as we often do, it’s strange to see the “wrong parenthesis” highlighted.

; This advice first checks before the point and only then after the point for a parenthesis. I think this behavior is very intuitive. The defined function overrides the internal function used to find parentheses.

; -----------------------------------------------------------------------

; -----------------------------------------------------------------------

(require 'lsp-grammarly)

(add-to-list 'default-frame-alist '(alpha-background . 85)) ; For all new frames henceforth
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


    (global-display-line-numbers-mode 1) ;; Display line numbers
    (global-visual-line-mode t)  ;; Enable truncated lines
    (menu-bar-mode -1)           ;; Disable the menu bar 
    (scroll-bar-mode -1)         ;; Disable the scroll bar
    (tool-bar-mode -1)           ;; Disable the tool bar
 

; ------------------------------------------------------------------
; -- Dash Board
; ------------------------------------------------------------------
 (dashboard-setup-startup-hook)
(setq initial-buffer-choice 'dashboard-open)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  ;;(setq dashboard-startup-banner "~/.config/emacs/images/dtmacs-logo.png")  ;; use custom image as banner
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          (projects . 3)
                          (registers . 3)))

(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

(load-theme 'doom-tokyo-night t)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

(doom-modeline-mode 1)

(setq doom-modeline-height 35      ;; sets modeline height
      doom-modeline-bar-width 5    ;; sets right bar width
      doom-modeline-persp-name t   ;; adds perspective name to modeline
      doom-modeline-persp-icon t) ;; adds folder icon next to persp name

; ----------------------------------------------------------------
; -- Evil Mode
; ----------------------------------------------------------------
(setq evil-want-integration t  ;; This is optional since it's already set to t by default.
          evil-want-keybinding nil
          evil-vsplit-window-right t
          evil-split-window-below t
          evil-undo-system 'undo-redo)  ;; Adds vim-like C-r redo functionality
    (evil-mode)
;;(add-to-list 'evil-collection-mode-list 'help) ;; evilify help mode
(evil-collection-init)

; ----------------------------------------------------------------
; -- Fonts
; ----------------------------------------------------------------
(set-face-attribute 'default nil
  :font "Maple Mono"
  :height 110
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "Maple Mono"
  :height 120
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "Maple Mono"
  :height 110
  :weight 'medium)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.
(add-to-list 'default-frame-alist '(font . "Maple Mono-11"))

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)



(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))


; ------------------------------------------------------------------
; -- Which Key
; ------------------------------------------------------------------

