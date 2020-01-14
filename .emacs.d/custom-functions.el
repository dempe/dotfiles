;;; custom-functions.el -- Hacking Emacs.

;;; Commentary:
;;
;; This is a list of functions loaded in my config.  Many are my own (namespaced under "cld").  Others are cherry-picked from the Spacemacs project (namespaced "spacemacs").
;;
;; The Spacemacs files I used are:
;;   - https://github.com/syl20bnr/spacemacs/blob/c7a103a772d808101d7635ec10f292ab9202d9ee/core/core-funcs.el
;;   - https://github.com/syl20bnr/spacemacs/blob/c7a103a772d808101d7635ec10f292ab9202d9ee/layers/%2Bdistributions/spacemacs-base/funcs.el

;;; Code:

(defvar spacemacs-really-kill-emacs nil
  "Prevent window manager close from closing instance.")

(defun cld/insert-org-code-block ()
	"Insert an elisp `org-mode` code block on the following line."
  (interactive)

	;; First, make sure there is a newline to go to.
	(condition-case error
    (progn
      (search-forward "\n"))
    (error
	    (end-of-line)
      (insert "\n")))

	;; Go to next line and insert code block, placing cursor inside block.
	(forward-line)
  (insert "#+BEGIN_SRC emacs-lisp -n\n\n#+END_SRC")
	(forward-line -1))

(defun cld/insert-line-above ()
	"Insert a line above `point`."
	(interactive)
  (beginning-of-line)
  (insert "\n"))

(defun cld/insert-line-below ()
	"Insert a line below `point`."
	(interactive)
  (end-of-line)
  (insert "\n"))

(defun cld/insert-day ()
  "Insert weekday + ISO 8601 date string."
  (interactive)
  (insert (format-time-string "%a %Y-%m-%d")))

(defun cld/insert-time ()
  "Insert ISO 8601 time string."
  (interactive)
  (insert (format-time-string "%H:%M:%S")))

(defun cld/insert-datetime ()
  "Insert ISO 8601 date time string."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

(defun cld/insert-date-long ()
  "Insert date in locale format (e.g., Sat Jan  4 23:19:28 2020)."
  (interactive)
  (insert (format-time-string "%c")))

(defun cld/indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "indented selected region."))
      (progn
        (evil-indent (point-min) (point-max))
        (message "indented buffer.")))
    (whitespace-cleanup)))

;; This is more convenient than i SPC SPC ESC if you're in normal mode.
(defun cld/insert-space ()
	"Insert a space at `point`."
	(interactive)
	(insert " "))

(defun cld/org-demote-header ()
	"Demote a header and move to EOL."
	(interactive)
	(org-do-demote)
	(end-of-line))

;; When would you ever *not* want to put a space after the *?
(defun cld/org-insert-header ()
	"Insert new header below followed by a space."
	(interactive)
  (org-insert-heading-respect-content)
	(insert " "))

;; Can't seem to find a native `org-mode` function that does this.
(defun cld/org-insert-new-subheader ()
	"Insert new subheader below followed by a space."
	(interactive)
  (org-insert-heading-respect-content)
	(delete-char -1) ; We need the asterisks to be sequential. The above inserts a SPC.
	(insert "*  "))

(defun cld/org-promote-header ()
	"Promote a header and move to EOL."
	(interactive)
	(org-do-promote)
	(end-of-line))

(defun cld/load-spacemacs-dark-theme ()
	"Load Spacemacs dark theme with some customizations."
	(interactive)
  (setq spacemacs-theme-custom-colors
                      '((bg1 . "#000000")
                        (bg2 . "#222222")
                        (bg3 . "#444444")
                        (bg4 . "#666666")
                        (cblk-bg . "#00000f")
                        (cblk-ln-bg . "#00000f")
                        (highlight . "#0000ff")))
	(load-theme 'spacemacs-dark t))
	
(defun cld/toggle-line-numbers ()
	"Toggle `global-linum-mode`."
	(interactive)
	(if global-linum-mode
		(global-linum-mode 0)
		(global-linum-mode t)))

(defun cld/switch-to-buffer-list ()
  "Switch to the `*Buffer List*' buffer and focus."
  (interactive)
	(switch-to-buffer (get-buffer-create "*Buffer List*")))

(defun cld/switch-to-scratch-buffer ()
  "Switch to the `*scratch*' buffer.  Create it first if needed."
  (interactive)
  (let ((exists (get-buffer "*scratch*")))
    (switch-to-buffer (get-buffer-create "*scratch*"))))

(defun cld/toggle-org-emphasis-markers ()
	"`org-mode` hides emphasis markers (*, /, =, etc.) by default.  Most of the time, I don't want to see them, but if I need to edit them, I need access to them."
	(interactive)
  (setq org-hide-emphasis-markers (not org-hide-emphasis-markers)))

(defun spacemacs/alternate-buffer (&optional window)
  "Switch back and forth between current and last buffer in the current WINDOW."
  (interactive)
  (let ((current-buffer (window-buffer window))
        (buffer-predicate
         (frame-parameter (window-frame window) 'buffer-predicate)))
    ;; switch to first buffer previously shown in this window that matches
    ;; frame-parameter `buffer-predicate'
    (switch-to-buffer
     (or (cl-find-if (lambda (buffer)
                       (and (not (eq buffer current-buffer))
                            (or (null buffer-predicate)
                                (funcall buffer-predicate buffer))))
                     (mapcar #'car (window-prev-buffers window)))
         ;; `other-buffer' honors `buffer-predicate' so no need to filter
         (other-buffer current-buffer t)))))

(defun spacemacs/copy-file ()
  "Write the file under new name."
  (interactive)
  (call-interactively 'write-file))

(defun spacemacs/copy-whole-buffer-to-clipboard ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max)))

(defun spacemacs/delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to delete this file? ")
        (delete-file filename t)
        (kill-buffer buffer)
        (when (and (configuration-layer/package-usedp 'projectile)
                   (projectile-project-p))
          (call-interactively #'projectile-invalidate-cache))
        (message "File '%s' successfully removed" filename)))))

(defun spacemacs/evil-insert-line-above (count)
  "Insert one or COUNT lines above the current point's line without changing the current state and point position."
  (interactive "p")
  (dotimes (_ count) (save-excursion (evil-insert-newline-above))))

(defun spacemacs/evil-insert-line-below (count)
  "Insert one or several lines below the current point's line without changing
the current state and point position."
  (interactive "p")
  (dotimes (_ count) (save-excursion (evil-insert-newline-below))))

(defun spacemacs/new-empty-buffer ()
  "Create a new buffer called untitled(<n>)"
  (interactive)
  (let ((newbuf (generate-new-buffer-name "untitled")))
    (switch-to-buffer newbuf)))

(defun spacemacs/push-mark-and-goto-beginning-of-line ()
  "Push a mark at current location and go to the beginning of the line."
  (interactive)
  (push-mark (point))
  (evil-beginning-of-line))

(defun spacemacs/push-mark-and-goto-end-of-line ()
  "Push a mark at current location and go to the end of the line."
  (interactive)
  (push-mark (point))
  (evil-end-of-line))

(defun spacemacs/show-and-copy-buffer-filename ()
  "Show and copy the full path to the current file in the minibuffer."
  (interactive)
  ;; list-buffers-directory is the variable set in dired buffers
  (let ((file-name (or (buffer-file-name) list-buffers-directory)))
    (if file-name
        (message (kill-new file-name))
      (error "Buffer not visiting a file"))))

(defun spacemacs/split-window-below-and-focus ()
  "Split the window vertically and focus the new window."
  (interactive)
  (split-window-below)
  (windmove-down)
  (when (and (boundp 'golden-ratio-mode)
             (symbol-value golden-ratio-mode))
    (golden-ratio)))

(defun spacemacs/split-window-right-and-focus ()
  "Split the window horizontally and focus the new window."
  (interactive)
  (split-window-right)
  (windmove-right)
  (when (and (boundp 'golden-ratio-mode)
             (symbol-value golden-ratio-mode))
    (golden-ratio)))

(provide 'custom-functions.el)
;;; custom-functions.el ends here
