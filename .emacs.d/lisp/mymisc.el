;;color
(require-package 'color-theme-solarized)
(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

;;font
(set-frame-font "Monaco-14")	

;;
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 )

(setq user-full-name "silenuszhi")
(setq frame-title-format "%b")
(global-set-key (kbd "C-z") 'undo)
(global-linum-mode t)
(column-number-mode t)
(global-linum-mode 'linum-mode)		  
(global-auto-revert-mode t)
(tool-bar-mode 0)
(menu-bar-mode 0) 
(set-scroll-bar-mode 0)
(desktop-save-mode 1)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq default-buffer-file-coding-system 'utf-8)

(defun px-toggle-comments ()
  "If region is set, [un]comments it. Otherwise [un]comments current line."
  (interactive)
  (if (eq mark-active nil)
      (progn 
                (beginning-of-line 1)
                (set-mark (point))
                (forward-line)
                (comment-dwim nil))
    (comment-dwim nil))
  (deactivate-mark))
  
(global-set-key "\M-3" 'px-toggle-comments)  

;;M-4 用/* */注释当前行 供verilog mode auto 使用
(fset 'commentAuto [?\M-b tab ?/ ?* ?\M-f ?* ?/ ?\C-e])
(global-set-key "\M-4" 'commentAuto)  
;;自动补完括号
(electric-pair-mode 1)
;;用空格代替tab
(setq-default indent-tabs-mode nil);

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))
(global-set-key (kbd "C-c r")  'rename-file-and-buffer)

(cua-selection-mode t)

(global-set-key "\M-s" "\C-a\C- \C-n\M-w\C-y")

(require-package 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)


(require 'server)
(or (server-running-p)
    (server-start))
	(setq server-socket-dir "~/.emacs.d/server")
	
(setq outline-minor-mode-prefix "\M-j")

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; markdown section
;; use pandoc as markdown compiler
(custom-set-variables
'(markdown-command "C:/Program Files (x86)/Pandoc/pandoc.exe"))

(eval-after-load "markdown-mode"
  '(defalias 'markdown-add-xhtml-header-and-footer 'as/markdown-add-xhtml-header-and-footer))

(defun as/markdown-add-xhtml-header-and-footer (title)
    "Wrap XHTML header and footer with given TITLE around current buffer."
    (goto-char (point-min))
    (insert "<!DOCTYPE html5>\n"
	    "<html>\n"
	    "<head>\n<title>")
    (insert title)
    (insert "</title>\n")
    (insert "<meta charset=\"utf-8\" />\n")
    (when (> (length markdown-css-paths) 0)
      (insert (mapconcat 'markdown-stylesheet-link-string markdown-css-paths "\n")))
    (insert "\n</head>\n\n"
	    "<body>\n\n")
    (goto-char (point-max))
    (insert "\n"
	    "</body>\n"
	    "</html>\n"))

(provide 'mymisc)