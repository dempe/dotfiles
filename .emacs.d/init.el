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
(package-refresh-contents)

;; Setup use-package
(eval-when-compile
  (require 'use-package))

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

(use-package smartparens-config
  :ensure smartparens
  :config (progn (show-smartparens-global-mode t))
	:hook ((prog-mode . turn-on-smartparens-mode)
				 (markdown-mode . turn-on-smartparens-mode)))

;; Enable rainbow delimters for most programming languages
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(use-package paradox
	:config
	(paradox-enable))

(use-package ace-jump-mode
	:init
	(define-key my-leader-map "aj" 'ace-jump-mode))

(use-package anzu
	:config
	(global-anzu-mode +1))

(use-package evil-mc
	:config
	(global-evil-mc-mode 1)
	(define-key my-leader-map "emc" 'evil-mc-make-all-cursors)
  (define-key my-leader-map "emu" 'evil-mc-undo-all-cursors))

(use-package which-key
	:config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

(use-package spaceline-config
	:config
  (spaceline-emacs-theme))

;; Bind <SPC e> to the M-x function (with Helm).
;; I'm using e, because I cannot get <SPC SPC> (what Spacemacs uses) to work.
;;(define-key my-leader-map "e" 'execute-extended-command)
(use-package helm
	:config
	(define-key my-leader-map "c" 'helm-M-x))

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
 '(custom-enabled-themes (quote (wheatgrass)))
 '(evil-want-C-u-scroll t)
 '(fci-rule-color "#383838")
 '(global-company-mode t)
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/workspace/todo.org")))
 '(package-selected-packages
	 (quote
		(use-package smartparens evil-mc paradox rainbow-delimiters anzu flycheck spaceline swiper magit ace-jump-mode helm which-key evil)))
 '(paradox-lines-per-entry 2)
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
 '(tool-bar-mode nil))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
