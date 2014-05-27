; let's get some ELPA repos setup so we can enhance all the things
(require 'package)
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ;("marmalade" . "http://marmalade-repo.org/packages/")
			 ))

; solarized-dark errywhere
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

; font tweaking
(set-face-attribute 'default nil
                    :family "Inconsolata for Powerline" :height 180 :weight 'normal)

; handy for stuff like ~/.muttrc
(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))

; ensures new gui clients end up as frames of a single gui instance
(when (featurep 'ns)
  (defun ns-raise-emacs ()
    "Raise Emacs."
    (ns-do-applescript "tell application \"Emacs\" to activate"))

  (defun ns-raise-emacs-with-frame (frame)
    "Raise Emacs and select the provided frame."
    (with-selected-frame frame
      (when (display-graphic-p)
        (ns-raise-emacs))))

  (add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)

  (when (display-graphic-p)
    (ns-raise-emacs)))

; starts the emacs server (equiv to --daemon) when starting the cocoa gui
(when (and window-system (not (boundp 'server-process))) (server-start))

; put all backups in a single place
(setq backup-directory-alist `(("." . "~/.saves")))
(setq delete-old-versions t
  kept-new-versions 2
  kept-old-versions 1
  version-control t)

;;------------------------------------------------------------------------------
;; On-demand installation of packages
;;------------------------------------------------------------------------------

;; Initialiaze packages
(package-initialize)

(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
	(package-install package)
      (progn
	(package-refresh-contents)
	        (require-package package min-version t)))))

;;------------------------------------------------------------------------------
;; Install missing packages
;;------------------------------------------------------------------------------

;; various
(require-package 'magit)
