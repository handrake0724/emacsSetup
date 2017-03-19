;; Key Binding
;; refer to https://www.masteringemacs.org/article/mastering-key-bindings-emacs

;;; global key binding
(global-set-key (kbd "<f1>") 'neotree-toggle)
(global-set-key (kbd "<f2>") 'grep)
(global-set-key (kbd "<f3>") 'replace-string)
(global-set-key (kbd "<f4>") 'replace-regexp)

;;;; mode specific key binding
;; to fine mode, M-x apropos-variable RET -mode-map$ RET

;; (global-set-key (kbd "<f5>") 'gdb)
(global-set-key (kbd "<f5>") 'realgud:gdb)
(global-set-key (kbd "<f7>") 'previous-error)
(global-set-key (kbd "<f8>") 'next-error)
(global-set-key (kbd "<f10>") 'compile)
(global-set-key (kbd "<f11>") 'magit-status)


;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h o") 'helm-occur)

(global-set-key (kbd "C-c h x") 'helm-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          '(lambda ()
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(define-key global-map [remap list-buffers] 'helm-buffers-list)

;; auctex-mode
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (define-key LaTeX-mode-map (kbd "<f10>") 'TeX-command-master)
            (define-key LaTeX-mode-map (kbd "C-c `") 'TeX-error-overview)
            )
          )

;; fortran setup

(add-hook 'f90-mode-hook
          (lambda ()
            (local-set-key (kbd "<f6>")
                            (lambda ()
                              (interactive)
                              (occur "^[ ]*\\\(subroutine\\\|function\\\)")
                              )
                            )
            ))


;; rtags
(add-hook 'c++-mode-hook
          (lambda ()
              (local-set-key (kbd "M-[") 'rtags-find-symbol-at-point)
              ))
(add-hook 'c++-mode-hook
          (lambda ()
              (local-set-key (kbd "M-]") 'rtags-location-stack-back)
          ))
;; (add-hook 'c++-mode-hook
;;           (lambda ()
;;               (local-set-key (kbd "M-]") 'rtags-find-references-at-point)
;;               ))
(add-hook 'c++-mode-hook
          (lambda ()
              (local-set-key (kbd "M-.") 'rtags-find-file)
              ))
(add-hook 'c++-mode-hook
          (lambda ()
              (local-set-key [C-tab] 'company-complete)
          ))

;; environment modules
    ;; load and init emacs lisp modules if not already loaded...

(add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key (kbd "<f12>")
                           (lambda ()
                             (interactive)
                             (Modules-module "load gcc openmpi OpenFOAM/4.x")
                             )
                           )
            ))
