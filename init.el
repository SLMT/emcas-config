;; Basic information of the author
(setq user-full-name "SLMT")
(setq user-mail-address "sam123456777@gmail.com")

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)

;; Load and activate emacs packages
(package-initialize)

;; Download list of packages available from ELPA (Emacs Lisp Package Archive).
;; Learn about it on http://www.emacswiki.org/emacs/ELPA
(when (not package-archive-contents)
  (package-refresh-contents))

;; The list of my packages
(defvar my-packages
  '(atom-one-dark-theme
    ido-ubiquitous
    smex
    flycheck
    projectile ;; Sometimes it cannot find this package
    company

    ;; For Rust
    rust-mode
    racer
    flycheck-rust))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
  (add-to-list 'my-packages 'exec-path-from-shell))

;; Iterate over the list of packages and install
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Setup exec-path-from-shell package for Mac
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
    '("PATH")))

;; Use customizations
(defvar my-customizations-folder
  (concat user-emacs-directory "customizations/"))
(defvar my-customizations
  '("ui"
    "navigation"
    "editing"
    "miscellaneous"
    "setup-company-mode"
    "setup-rust"))
(dolist (c my-customizations)
  (load (concat my-customizations-folder c ".el")))
