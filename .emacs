;; Moduled setting

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load (expand-file-name "~/.emacs.d/package-setting.el"))
(load (expand-file-name "~/.emacs.d/emacs-setting.el"))
(load (expand-file-name "~/.emacs.d/keybinding-setting.el"))
(load (expand-file-name "~/.emacs.d/env-setting.el"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (volatile-highlights request-deferred realgud neotree multiple-cursors monokai-theme helm-swoop helm-flycheck helm-company company-quickhelp company-auctex auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
