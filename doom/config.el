;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Oshiro Akira"
      user-mail-address "tionf33@gmail.com")

(setq doom-font (font-spec :family "Terminess Nerd Font" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Geist" :size 16 :weight 'regular))

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

(setq doom-modeline-enable-word-count t)

(setq olivetti-body-width 94)
(add-hook 'text-mode-hook 'olivetti-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(map! :nvo "n" 'evil-next-line)
(map! :nvo "l" 'evil-previous-line)
(map! :nvo "e" 'evil-forward-char)

;; For adding everforest as a theme, but it look kinda ugly.
;; I prefer something like Gruvbox or Kanagawa or Rose Pine.
;; (add-to-list 'custom-theme-load-path "~/.config/emacs/everforest-emacs")

(setq ispell-program-name "hunspell")
(setq ispell-dictionary "en_US,nb_NO,es_VE")
(setq ispell-personal-dictionary "~/.config/doom/.hunspell_per_dic")

(after! ccls
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
  (set-lsp-priority! 'ccls 1))
