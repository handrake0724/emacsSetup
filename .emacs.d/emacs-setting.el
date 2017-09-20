;(setq debug-on-error t)
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;(global-set-key (kbd "RET") 'newline-and-indent)

(setq column-number-mode t)
(setq display-time-mode t)
;; Tool and menu bar mode
(tool-bar-mode 0)
(scroll-bar-mode 0)
;; (menu-bar-mode 0)

;; Syntax highlight mode
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; no emacs start-up message
(setq inhibit-startup-message t)

(recentf-mode t)
(show-paren-mode t)
(transient-mark-mode t)
(setq make-backup-files nil)
(setq auto-save-mode nil)
; selected region delete
(delete-selection-mode t)

;; font setting
(set-face-font 'default "NanumGothicCoding-12")
(setq-default line-spacing 2)

;; display line and column
(global-linum-mode 1)
(setq-default column-number-mode t)

;; color theme
(load-theme 'monokai t)

;; ;; extension association
;; (add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; gdb setting
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; OpenFOAM coding style
;; for OpenFOAM
(c-add-style "OpenFOAMStyle"
             '(
     (c-basic-offset . 4)
     (c-tab-always-indent . t)
     (indent-tabs-mode . nil)
     (c-comment-only-line-offset . (0 . 0))
     (c-indent-comments-syntactically-p . t)
     (c-block-comments-indent-p nil)
     (c-cleanup-list .
         '((defun-close-semi) (list-close-comma) (scope-operator)))
     (c-backslash-column . 48)
     (c-offsets-alist .
     (
     (c . +)                     ;; inside a multi-line C style block  comment
     (defun-open . 0)            ;; brace that opens a function definition
     (defun-close . 0)           ;; brace that closes a function definition
     (defun-block-intro . +)     ;; the first line in a top-level defun
     (class-open . 0)            ;; brace that opens a class definition
     (class-close . 0)           ;; brace that closes a class definition
     (inline-open . +)           ;; brace that opens an in-class inline method
     (inline-close . 0)          ;; brace that closes an in-class inline method
     (topmost-intro . 0)         ;; the first line in a topmost construct
                                 ;; definition
     (topmost-intro-cont . 0)    ;; topmost definition continuation lines
     (member-init-intro . +)     ;; first line in a member initialization list
     (member-init-cont . 0)      ;; subsequent member initialization list lines
     (inher-intro . 0)           ;; first line of a multiple inheritance list
     (inher-cont . +)            ;; subsequent multiple inheritance lines
     (block-open . 0)            ;; statement block open brace
     (block-close . 0)           ;; statement block close brace
     (brace-list-open . 0)       ;; open brace of an enum or static array list
     (brace-list-close . 0)      ;; open brace of an enum or static array list
     (brace-list-intro . +)      ;; first line in an enum or static array list
     (brace-list-entry . 0)      ;; subsequent lines in an enum or static array
                                 ;; list
     (statement . 0)             ;; a C/C++/ObjC statement
     (statement-cont . 0)        ;; a continuation of a C/C++/ObjC statement
     (statement-block-intro . +) ;; the first line in a new statement block
     (statement-case-intro . +)  ;; the first line in a case `block'
     (statement-case-open . +)   ;; the first line in a case `block'
                                 ;; starting with brace
     (substatement . 0)          ;; the first line after an if/while/for/do/else
     (substatement-open . 0)     ;; the brace that opens a substatement block
     (case-label . +)            ;; a case or default label
     (access-label . -)          ;; C++ private/protected/public access label
     (label . -)                 ;; any non-special C/C++/ObjC label
     (do-while-closure . 0)      ;; the `while' that ends a do/while construct
     (else-clause . 0)           ;; the `else' of an if/else construct
     (comment-intro . 0)         ;; line containing only a comment introduction
     (arglist-intro . +)         ;; the first line in an argument list
     (arglist-cont . 0)          ;; subsequent argument list lines when no
                                 ;; subsequent argument list lines
                                 ;; when no the
                                 ;; arglist opening paren
     (arglist-cont-nonempty . 0) ;; subsequent argument list lines when at
                                 ;; subsequent argument list lines
                                 ;; when at line
                                 ;; as the arglist opening paren
     (arglist-close . 0)         ;; line as the arglist opening paren
     (stream-op . +)             ;; lines continuing a stream operator construct
     (inclass . +)               ;; the construct is nested inside a class
                                 ;; definition
     ;; (cpp-macro . +)             ;; the construct is nested inside a class
     ;;                             ;; definition
     (cpp-macro . c-lineup-cpp-define) ;; indent according to construct preceding macro
     (friend . 0)                ;; a C++ friend declaration
     (namespace-open  . 0)
     (namespace-close . 0)
     (innamespace     . 0)
     )
     )
     )
)
(defun openfoamstyle-c-mode-hook ()
  (c-set-style "OpenFOAMStyle")
  )

(add-hook 'c-mode-common-hook 'openfoamstyle-c-mode-hook)
;; add to list

(defalias 'yes-or-no-p 'y-or-n-p)
