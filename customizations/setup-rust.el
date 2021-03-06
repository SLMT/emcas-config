(setq racer-cmd (concat (getenv "HOME") "C:/Users/SLMT/.cargo/bin/racer"))
(setq racer-rust-src-path (concat (getenv "HOME") "D:/Rust/rustc-1.10.0/src"))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook  #'company-mode)
(add-hook 'rust-mode-hook  #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'rust-mode-hook
	  '(lambda ()
	     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
	     (local-set-key (kbd "TAB") #'company-indent-or-complete-common)))
