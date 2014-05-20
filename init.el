(require 'package)
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ;("marmalade" . "http://marmalade-repo.org/packages/")
			 ))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")

(load-theme 'solarized-dark t)
