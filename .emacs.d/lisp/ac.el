;;autocompelete
(require-package 'auto-complete)


(require 'auto-complete)
(require 'auto-complete-config)

;; (add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(ac-config-default)
(setq ac-ac-show-menu-immediately-on-auto-complete t)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)


(provide 'ac)