(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))
	
(add-to-list 'load-path "d:/Google Drive/emacsconfig/.emacs.d/elpa/predictive/latex/")		

;;init-package	
(require 'init-package)
;;verilog mode
(require 'myverilogmode)
;;misc
(require 'mymisc)
;;auto compelete
(require 'ac)
;;tex
(require 'mytex)
;;
(require 'auto-complete-auctex)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
