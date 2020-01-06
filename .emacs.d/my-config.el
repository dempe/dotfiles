;; ~~~~~~~~~~~~~~~~~~~~~~~ GENERAL CONFIGURATION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Open recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

(setq initial-scratch-message "")
(setq org-hide-emphasis-markers t)

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

;; *Both* TAB and RET autocomplete a word. This is extremely frustrating when I want to enter a newline. How do you turn this off for RET?
;; Update: Solved with https://emacs.stackexchange.com/a/13290
;; However, now if you press tab to complete something from the menu then try to press RET, you will get an error message and be unable to move the cursor.
;; How do you turn off the menu?
;; Update: You can get unstuck with C-g; the menu is simply for when there are multiple choices. Still annoying.
(use-package company
	:diminish
	:config
	(define-key company-active-map (kbd "RET") nil)
	(define-key company-active-map (kbd "C-SPC") #'company-complete-selection)
	:hook (after-init . global-company-mode))

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
	:diminish
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
  (define-key my-leader-map "ltsd" 'cld/load-theme-solarized-dark))

(use-package moe-theme
	:config
  (define-key my-leader-map "ltml" 'moe-light)
  (define-key my-leader-map "ltmd" 'moe-dark))

(use-package nova-theme
	:config
  (define-key my-leader-map "ltn" 'cld/load-theme-nova))
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
(define-key my-leader-map "fed" 'cld/open-config)
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
(define-key my-leader-map "iday" 'cld/insert-day)
(define-key my-leader-map "it" 'cld/insert-time)
(define-key my-leader-map "idt" 'cld/insert-datetime)
(define-key my-leader-map "idl" 'cld/insert-date-long)

;; narrow & widen -------------------------------------------------------------
(define-key my-leader-map "nf" 'narrow-to-defun)
(define-key my-leader-map "nos" 'org-narrow-to-subtree)
(define-key my-leader-map "np" 'narrow-to-page)
(define-key my-leader-map "nr" 'narrow-to-region)
(define-key my-leader-map "nw" 'widen)

;; navigation/jumping ---------------------------------------------------------
(define-key my-leader-map "j0" 'spacemacs/push-mark-and-goto-beginning-of-line)
(define-key my-leader-map "j$" 'spacemacs/push-mark-and-goto-end-of-line)
(define-key my-leader-map "jf" 'find-function)
(define-key my-leader-map "jv" 'find-variable)

;; org-mode --------------------------------------------------------------------
(define-key my-leader-map "ob" 'org-backward-heading-same-level)
(define-key my-leader-map "oc" 'org-clock-in)
(define-key my-leader-map "odd" 'org-do-demote)
(define-key my-leader-map "odp" 'org-do-promote)
(define-key my-leader-map "ods" 'org-demote-subtree)
(define-key my-leader-map "oes" 'org-edit-special)
(define-key my-leader-map "oem" 'cld/toggle-org-emphasis-markers)
(define-key my-leader-map "of" 'org-forward-heading-same-level)
(define-key my-leader-map "oi" 'org-insert-heading-respect-content)
(define-key my-leader-map "ops" 'org-promote-subtree)
(define-key my-leader-map "osa" 'outline-show-all)
(define-key my-leader-map "osp" 'org-set-property)
(define-key my-leader-map "ost" 'org-set-tags-command)
(define-key my-leader-map "ot" 'org-todo)

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