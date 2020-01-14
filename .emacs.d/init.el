;; Emacs stores a bunch of automatically set configurations in this file, so I have moved my manually set configurations to a separate file.

(load-file "~/.emacs.d/my-config.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
	 (quote
		("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-want-C-u-scroll t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
	 (quote
		(spacemacs-theme spotlight osx-dictionary markdown-mode ido-completing-read+ desktop+ speed-type darkroom evil-surround evil-rsi evil-commentary solarized-theme helm-fuzzier helm-flx diminish use-package evil-mc paradox rainbow-delimiters anzu flycheck swiper magit ace-jump-mode helm which-key evil)))
 '(paradox-lines-per-entry 2)
 '(safe-local-variable-values
	 (quote
		((org-todo-keyword-faces
			("GOOD" . "green")
			("OKAY" . "yellow")
			("BAD" . "red")))))
 '(show-paren-mode t)
 '(spacemacs-theme-custom-colors
	 (quote
		((bg1 . "#000000")
		 (bg2 . "#00000f")
		 (bg3 . "#ffffff"))))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "#ff0000"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "#ffa500"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "#ffff00"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "#00ff00"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "#0000ff"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "#ff00ff"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "#ffffff"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "#00ff00"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "#89cffa")))))
(put 'narrow-to-region 'disabled nil)
