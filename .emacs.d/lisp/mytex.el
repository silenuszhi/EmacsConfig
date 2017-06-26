(require-package 'auctex)
 	
(setq TeX-auto-save t)
(setq TeX-parse-self t)	
(setq-default TeX-engine 'xetex)
(setq TeX-save-query  nil )

(custom-set-variables 
'(TeX-source-correlate-method (quote synctex)) 
'(TeX-source-correlate-mode t) 
'(TeX-source-correlate-start-server t))
(setq TeX-view-program-list
   '(("Sumatra PDF" ("\"C:/Program Files /SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))) 

(custom-set-faces)
(setq TeX-view-program-selection '((output-pdf "SumatraPDF")))

(provide 'mytex)