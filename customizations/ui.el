;; Turn off start message, menu bar, tool bar, scroll bar
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Adjust font size, line spacing
(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.4)

;; Turn off cursor blinking and bell
(blink-cursor-mode 0)
(setq ring-bell-function 'ignore)

;; Load a theme
;;(load-theme 'zenburn t)
(load-theme 'atom-one-dark t)

;; Set the font
(set-default-font "Consolas-12")
