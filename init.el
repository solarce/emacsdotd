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
