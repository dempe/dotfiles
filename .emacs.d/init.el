;; ~~~~~~~~~~~~~~~~~~~~~~~ GENERAL CONFIGURATION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Open recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

(setq initial-scratch-message "")

(load-file "~/.emacs.d/custom-functions.el")

;; ~~~~~~~~~~~~~~~~~~~~~~~ PACKAGE CONFIGURATION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
												 ("melpa" . "https://melpa.org/packages/")
												 ("org" . "http://orgmode.org/elpa/")))
(require 'package)
(package-initialize)
;; Refresh packages asynchronously
(package-refresh-contents 1)

;; Setup use-package
(eval-when-compile
  (require 'use-package))
;; Generate a report of load times with M-x use-package-report
(setq use-package-compute-statistics 1)

(use-package anzu
	:diminish
	:config
	(global-anzu-mode 1))

(use-package diminish
	:config
	(diminish 'undo-tree-mode)
	(diminish 'eldoc-mode))

(use-package evil
	:ensure evil
	:config
	(evil-mode 1)

	(setq evil-search-wrap t
			evil-regexp-search t)
  (setq-default tab-width 2)

	(defvar my-leader-map (make-sparse-keymap)
	"Keymap for \"leader key\" shortcuts.")
	
  ;; binding "," to the keymap
  (define-key evil-normal-state-map "," my-leader-map)

	;; change the "leader" key to space
	(define-key evil-normal-state-map "," 'evil-repeat-find-char-reverse)
	(define-key evil-normal-state-map (kbd "SPC") my-leader-map))

(use-package ace-jump-mode
	:after evil ;; should make this order-agnostic, but this does not appear to work
	:init
	(define-key my-leader-map "aj" 'ace-jump-mode))

(use-package evil-mc
	:diminish
	:config
	(global-evil-mc-mode 1)
	(define-key my-leader-map "emc" 'evil-mc-make-all-cursors)
  (define-key my-leader-map "emu" 'evil-mc-undo-all-cursors))

(use-package flycheck
	:config
	(global-flycheck-mode)
	(define-key my-leader-map "en" 'next-error)
  (define-key my-leader-map "ep" 'previous-error))

;; Bind <SPC c> to the M-x function (with Helm).
;; I'm using c, because I cannot get <SPC SPC> (what Spacemacs uses) to work.
;;(define-key my-leader-map "c" 'execute-extended-command)
(use-package helm
	:config
	(setq
  helm-always-two-windows t
  helm-split-window-default-side 'left)
	(define-key my-leader-map "c" 'helm-M-x))

(use-package helm-flx
	:config
  (helm-flx-mode 1)
	(setq helm-flx-for-helm-find-files t
        helm-flx-for-helm-locate t))

;; needs more setup. does not work.
(use-package helm-fuzzier
	:config
	(helm-fuzzier-mode 1))

(use-package paradox
	:config
	(paradox-enable))

(use-package rainbow-delimiters
	:hook (prog-mode . rainbow-delimiters-mode))

;;(use-package smartparens
;;	:diminish
;;  :ensure smartparens
;;  :config
;;	(progn (show-smartparens-global-mode t))
;;	;; disable pairing of single quotes
;;	(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
;;	:hook ((prog-mode . turn-on-smartparens-mode)
;;				 (markdown-mode . turn-on-smartparens-mode)))

(use-package solarized-theme
	:init
	;; make the fringe stand out from the background
  (setq solarized-distinct-fringe-background t)
  
  ;; Don't change the font for some headings and titles
  (setq solarized-use-variable-pitch nil)
  
  ;; make the modeline high contrast
  (setq solarized-high-contrast-mode-line nil)
  
  ;; Use less bolding
  (setq solarized-use-less-bold t)
  
  ;; Use more italics
  (setq solarized-use-more-italic t)
	
  ;; Avoid all font-size changes
  (setq solarized-height-minus-1 1.0)
  (setq solarized-height-plus-1 1.0)
  (setq solarized-height-plus-2 1.0)
  (setq solarized-height-plus-3 1.0)
  (setq solarized-height-plus-4 1.0)

	:config
  (define-key my-leader-map "ltsl" 'cld/load-theme-solarized-light)
  (define-key my-leader-map "ltsd" 'cld/load-theme-solarized-dark)
	(load-theme 'solarized-light t))

(use-package spaceline-config
	:config
  (spaceline-emacs-theme))

(use-package which-key
	:diminish
	:config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

;; ~~~~~~~~~~~~~~~~~~~~~~~ KEYBINDINGS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Most of the following keybindings are taken from the Spacemacs project.
;; They can be found here: https://github.com/syl20bnr/spacemacs/blob/c7a103a772d808101d7635ec10f292ab9202d9ee/layers/%2Bdistributions/spacemacs-base/keybindings.el
;; Information about keybinding with Emacs and Evil can be found here: https://github.com/noctuid/evil-guide

;; shell command  -------------------------------------------------------------
(define-key my-leader-map "!" 'shell-command)

;; applications ---------------------------------------------------------------
(define-key my-leader-map "aP" 'proced)
(define-key my-leader-map "ac" 'calc-dispatch)
(define-key my-leader-map "ap" 'list-processes)
(define-key my-leader-map "au" 'undo-tree-visualize)

;; buffers --------------------------------------------------------------------
(define-key my-leader-map "TAB" 'spacemacs/alternate-buffer)
(define-key my-leader-map "bN" 'spacemacs/new-empty-buffer)
(define-key my-leader-map "bY" 'spacemacs/paste-clipboard-to-whole-buffer)
(define-key my-leader-map "bb" 'list-buffers)
(define-key my-leader-map "bd" 'kill-buffer)
(define-key my-leader-map "bn" 'next-buffer)
(define-key my-leader-map "bp" 'previous-buffer)
(define-key my-leader-map "bs" 'cld/switch-to-scratch-buffer)
(define-key my-leader-map "bw" 'read-only-mode)

;; These are commented out, because I never use them and wanted to use c for M-x
;; compilation ----------------------------------------------------------------
;;(define-key my-leader-map "cC" 'compile)
;;(define-key my-leader-map "ck" 'kill-compilation)
;;(define-key my-leader-map "cr" 'recompile)

;; files ----------------------------------------------------------------------
(define-key my-leader-map "fD" 'spacemacs/delete-current-buffer-file)
(define-key my-leader-map "fS" 'evil-write-all)
(define-key my-leader-map "fc" 'spacemacs/copy-file)
(define-key my-leader-map "fed" 'cld/find-dotfile)
(define-key my-leader-map "fer" 'cld/reload-config)
(define-key my-leader-map "ff" 'find-file)
(define-key my-leader-map "fg" 'rgrep)
(define-key my-leader-map "fl" 'find-file-literally)
(define-key my-leader-map "fr" 'recentf-open-files)
(define-key my-leader-map "fs" 'save-buffer)
(define-key my-leader-map "fvd" 'add-dir-local-variable)
(define-key my-leader-map "fvf" 'add-file-local-variable)
(define-key my-leader-map "fvp" 'add-file-local-variable-prop-line)
(define-key my-leader-map "fy" 'spacemacs/show-and-copy-buffer-filename)

;; evaluation ------------------------------------------------------------------
(define-key my-leader-map "eb" 'eval-buffer)

;; format ---------------------------------------------------------------------
(define-key my-leader-map "jo" 'open-line)
(define-key my-leader-map "ji" 'cld/indent-region-or-buffer) ;; note: spacemacs uses j=

;; help -----------------------------------------------------------------------
(define-key my-leader-map "hdb" 'describe-bindings)
(define-key my-leader-map "hdc" 'describe-char)
(define-key my-leader-map "hdf" 'describe-function)
(define-key my-leader-map "hdk" 'describe-key)
(define-key my-leader-map "hdp" 'describe-package)
(define-key my-leader-map "hdt" 'describe-theme)
(define-key my-leader-map "hdv" 'describe-variable)
(define-key my-leader-map "hn" 'view-emacs-news)

;; insert ---------------------------------------------------------------------
(define-key my-leader-map "ik" 'spacemacs/evil-insert-line-above)
(define-key my-leader-map "ij" 'spacemacs/evil-insert-line-below)
(define-key my-leader-map "id" 'cld/insert-date)

;; narrow & widen -------------------------------------------------------------
(define-key my-leader-map "nf" 'narrow-to-defun)
(define-key my-leader-map "np" 'narrow-to-page)
(define-key my-leader-map "nr" 'narrow-to-region)
(define-key my-leader-map "nw" 'widen)

;; navigation/jumping ---------------------------------------------------------
(define-key my-leader-map "j0" 'spacemacs/push-mark-and-goto-beginning-of-line)
(define-key my-leader-map "j$" 'spacemacs/push-mark-and-goto-end-of-line)
(define-key my-leader-map "jf" 'find-function)
(define-key my-leader-map "jv" 'find-variable)

;; text -----------------------------------------------------------------------
(define-key my-leader-map "xaa" 'align)
(define-key my-leader-map "xac" 'align-current)
(define-key my-leader-map "xc" 'count-region)
(define-key my-leader-map "xdw" 'delete-trailing-whitespace)
(define-key my-leader-map "xjc" 'set-justification-center)
(define-key my-leader-map "xjf" 'set-justification-full)
(define-key my-leader-map "xjl" 'set-justification-left)
(define-key my-leader-map "xjn" 'set-justification-none)
(define-key my-leader-map "xjr" 'set-justification-right)
(define-key my-leader-map "xtl" 'transpose-lines)
(define-key my-leader-map "xtw" 'transpose-words)
(define-key my-leader-map "xU" 'upcase-region)
(define-key my-leader-map "xu" 'downcase-region)

;; windows --------------------------------------------------------------------
(define-key my-leader-map "w=" 'balance-windows)
(define-key my-leader-map "wF" 'make-frame)
(define-key my-leader-map "wH" 'evil-window-move-far-left)
(define-key my-leader-map "wf" 'follow-mode)
(define-key my-leader-map "wk" 'delete-window)
(define-key my-leader-map "wo" 'other-frame)
(define-key my-leader-map "ws" 'spacemacs/split-window-below-and-focus)
(define-key my-leader-map "wv" 'spacemacs/split-window-right-and-focus)
(define-key my-leader-map "ww" 'other-window)

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
 '(company-auto-complete t)
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
		(solarized-theme helm-fuzzier helm-flx diminish use-package smartparens evil-mc paradox rainbow-delimiters anzu flycheck spaceline swiper magit ace-jump-mode helm which-key evil)))
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
