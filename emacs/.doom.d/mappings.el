;;; mappings.el -*- lexical-binding: t; -*-

(map! :n "j" 'evil-forward-word-end)
(map! :n "J" 'evil-backward-word-end)
(map! :n "j" 'evil-forward-word-end)
(map! :n "J" 'evil-forward-word-end)

(map! :n "h" 'evil-backward-char)
(map! :n "n" 'evil-next-line)
(map! :n "l" 'evil-previous-line)
(map! :n "e" 'evil-forward-char)

(map! :v "h" 'evil-backward-char)
(map! :v "n" 'evil-next-line)
(map! :v "l" 'evil-previous-line)
(map! :v "e" 'evil-forward-char)

(map! :o "h" 'evil-backward-char)
(map! :o "n" 'evil-next-line)
(map! :o "l" 'evil-previous-line)
(map! :o "e" 'evil-forward-char)
