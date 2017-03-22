;; ELPA setting
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(setq package-user-dir (expand-file-name "~/.emacs.d/elpa"))
(package-initialize)

;; insert parenthesis by pair
(smartparens-global-mode t)

;; company mode
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode 1)
;; rtags
(defun setup-flycheck-rtags ()
  (interactive)
  (flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays.
  (setq-local flycheck-highlighting-mode nil)
  (setq-local flycheck-check-syntax-automatically nil))

;; only run this if rtags is installed
(when (require 'rtags nil :noerror)
  ;; make sure you have company-mode installed
  (require 'company)
  (require 'company-rtags)
  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
  (add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)

  ;; install standard rtags keybindings. Do M-. on the symbol below to
  ;; jump to definition and see the keybindings.
  (rtags-enable-standard-keybindings)
  ;; comment this out if you don't have or don't use helm
  (setq rtags-use-helm t)
  ;; company completion setup
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  ;; (push 'company-rtags company-backends)
  (add-to-list 'company-backends 'company-rtags)
  ;; use rtags flycheck mode -- clang warnings shown inline
  (require 'flycheck-rtags)
  ;; c-mode-common-hook is also called by c++-mode
  (add-hook 'c-mode-common-hook 'setup-flycheck-rtags)
  (add-hook 'c++-mode-common-hook 'setup-flycheck-rtags)
  )

;; helm mode
(require 'helm-config)
(require 'helm-grep)

(setq
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-candidate-number-limit 500 ; limit the number of displayed canidates
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers
 )

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;; Locate the helm-swoop folder to your path
(require 'helm-swoop)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)
;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)
;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)
;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color t)
(helm-mode 1)

;; magit
(setq magit-last-seen-setup-instructions "1.4.0")

;; hide-show mode
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Package: yasnippet
;(require 'yasnippet)
;(yas-global-mode 1)

(require 'volatile-highlights)
(volatile-highlights-mode t)

;; AUCTeX
(setq-default TeX-master nil)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)
(setq TeX-command-extra-options "-shell-escape")
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-mode t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode) ; with AUCTeX LaTeX math mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(setq TeX-quote-after-quote t)
(cond
 ((eq system-type 'gnu/linux)
  (setq TeX-view-program-list '(("Okular" "okular --unique %o #src:%n%b")))
  (setq TeX-view-program-selection '((output-pdf "Okular"))))
 ((eq system-type 'windows-nt)
  (setq TeX-view-program-list '(("Sumatra PDF" ("d:/Apps/SumatraPDF/SumatraPDF.exe -reuse-instance" (mode-io-correlate " -forward-search %b %n")
                                 " %o"))))
  (setq TeX-view-program-selection '((output-pdf "Sumatra PDF"))))
 )
;; (latex-preview-pane-enable)

;; environment module
(defun Modules-module (command)
  "Run the string COMMAND as a Modules cmd using the tcl version of modules. "
  (interactive (list (read-string "Module cmd: " nil nil)))
    ;; clear cmd buffer, log buffer is replaced below

  (let (
        (cmd-buffer (get-buffer-create "*modules-cmd*"))
        (log-buffer (get-buffer-create "*modules-log*"))
        )
    (set-buffer cmd-buffer)
    (delete-region (point-min) (point-max))
    (shell-command
     (concat "/usr/bin/tclsh /usr/share/Modules/default/libexec/modulecmd.tcl lisp "
             (shell-quote-argument command))
     cmd-buffer
     log-buffer
     )
    (set-buffer cmd-buffer)
    (eval-buffer)
    )
  )


;; realgud
(require 'realgud)

;; white space removal
(add-hook 'before-save-hook 'whitespace-cleanup)
