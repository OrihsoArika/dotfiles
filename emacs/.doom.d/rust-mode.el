;;; rust-mode.el -*- lexical-binding: t; -*-

(use-package eglot
:ensure t
:config
(add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))
(add-hook 'rust-mode-hook 'eglot-ensure))
    (use-package rustic
      :ensure t
      :config
      (require 'rustic-mode)
      (add-hook 'rustic-mode-hook 'rustic-completion-setup)
      (add-hook 'rustic-mode-hook 'rustic-lsp-setup))
(setq rustic-cargo-command "cargo")
    (setq rustic-clippy-command "cargo clippy")
    (setq rustic-check-on-save t)
