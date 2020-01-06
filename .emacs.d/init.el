;; Emacs stores a bunch of automatically set configurations in this file, so I have moved my manually set configurations to a separate file.

(load-file "~/.emacs.d/my-config.el")

;; ~~~~~~~~~~~~~~~~~~~~~~~ CUSTOM CONFIGURATIONS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~ DO NOT TOUCH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-auto-complete nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
	 (quote
		("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" default)))
 '(evil-want-C-u-scroll t)
 '(fci-rule-color "#383838")
 '(global-company-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
	 (quote
		("#efe4da49afb1" "#cfc4e1acd08b" "#fe52c9e6b34e" "#dbb6d3c2dcf3" "#e183dee0b053" "#f944cc6dae47" "#d35fdac4e069")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
	 (quote
		(("#eee8d5" . 0)
		 ("#b3c34d" . 20)
		 ("#6ccec0" . 30)
		 ("#74adf5" . 50)
		 ("#e1af4b" . 60)
		 ("#fb7640" . 70)
		 ("#ff699e" . 85)
		 ("#eee8d5" . 100))))
 '(hl-bg-colors
	 (quote
		("#e1af4b" "#fb7640" "#ff6849" "#ff699e" "#8d85e7" "#74adf5" "#6ccec0" "#b3c34d")))
 '(hl-fg-colors
	 (quote
		("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(inhibit-startup-screen t)
 '(nrepl-message-colors
	 (quote
		("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("~/workspace/todo.org")))
 '(package-selected-packages
	 (quote
		(company nova-theme moe-theme solarized-theme helm-fuzzier helm-flx diminish use-package evil-mc paradox rainbow-delimiters anzu flycheck spaceline swiper magit ace-jump-mode helm which-key evil)))
 '(paradox-lines-per-entry 2)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(safe-local-variable-values
	 (quote
		((org-todo-keyword-faces
			("GOOD" . "green")
			("OKAY" . "yellow")
			("BAD" . "red"))
		 (org-todo-keyword-faces
			("GOOD" . "green")
			("OKAY" . "orange")
			("BAD" . "red")))))
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#657b83" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
	 (quote
		((20 . "#dc322f")
		 (40 . "#cb4366eb20b4")
		 (60 . "#c1167942154f")
		 (80 . "#b58900")
		 (100 . "#a6ae8f7c0000")
		 (120 . "#9ed892380000")
		 (140 . "#96be94cf0000")
		 (160 . "#8e5397440000")
		 (180 . "#859900")
		 (200 . "#77679bfc4635")
		 (220 . "#6d449d465bfd")
		 (240 . "#5fc09ea47092")
		 (260 . "#4c68a01784aa")
		 (280 . "#2aa198")
		 (300 . "#303498e7affc")
		 (320 . "#2fa1947cbb9b")
		 (340 . "#2c879008c736")
		 (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
	 (quote
		(unspecified "#fdf6e3" "#eee8d5" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
	 ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
	 ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))



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
