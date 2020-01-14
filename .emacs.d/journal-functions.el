;;; package -- Help streamline journaling
;;; Commentary:
;;; Code:

(defconst journal-posts-dir
	"~/workspace/journal/content/posts/")

;; Sort files in descending order, get the first, and add 1
(defun build-new-post-title ()
	"Return the title for the new post (simply the entry number)."
   (number-to-string
  	(+ 1
    	 (car
         (sort
           (mapcar
             (lambda (x) (string-to-number x))
             (directory-files journal-posts-dir))
          '>)))))

(defun build-new-post-filename ()
	"Return the filename of the new post."
	(concat
	  journal-posts-dir
    (concat
      (build-new-post-title)
      ".md")))


(defun build-frontmatter ()
	"Build Hugo's frontmatter."
	(concat
	  (concat
	    (concat
	      (concat "---\ntitle:  "
	    	  			(build-new-post-title))
	      "\ndate:   ")
      (format-time-string "%Y-%m-%dT%H:%M:%S"))
	  "\nlayout: post\n---\n"))

(defun create-and-open-file (filename)
	"Create file, FILENAME; write frontmatter contents to it; and open for editing."
	(write-region (build-frontmatter) nil filename)
	(find-file filename))

(defun cld/make-new-journal-post ()
	"Make a new journal post interactively and open for editing."
	(interactive)
	(create-and-open-file (build-new-post-filename))
	(darkroom-mode))

(defun cld/open-latest-journal-post ()
	"Open the most recent journal post for editing."
	(interactive)
  (find-file
	 (concat
		journal-posts-dir
		(concat
	   (number-to-string
			(-
			  (string-to-number (build-new-post-title))
			  1))
	   ".md")))
	(darkroom-mode))

(defun cld/insert-sidenote ()
	"Create a sidenote and place cursor inside tags."
	(interactive)
	(insert "**\\***<sidenote></sidenote>")
	(backward-char 11))                      ; The number of chars in "</sidenote>".


(provide 'journal-functions)

;;; journal-functions ends here
