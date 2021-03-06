;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Allow hash to be entered
(defun my-insert-hash ()
  "Allow hash to be entered"
  (interactive)
  (when (not(eq major-mode 'org-mode))
	(if (region-active-p)
		(insert-pair 1 ?# ?#)
	  (insert "##")
	  (backward-char))
	)
  )
(global-unset-key (kbd "M-3"))
(global-set-key (kbd "M-3") '(lambda() (interactive) (my-insert-hash)))



(defun _my-clean-up-buffer ()
  "Clean up tabs and whitespace in file"
  (interactive)
  ;;(whitespace-cleanup)
  (delete-trailing-whitespce)
  ;;(my-untabify-buffer)
  ;;(my-insert-leading-tabs)
  ;;(message "All cleaned up")
  )


(defun my-clean-up-buffer ()
  "Untabifies, indents and deletes trailing whitespace from buffer or region."
  (interactive)
  (save-excursion
	(unless (region-active-p)
	  (mark-whole-buffer))
	(my-untabify-buffer (region-beginning) (region-end))
	(my-insert-leading-tabs  (region-beginning) (region-end))
	(keyboard-quit)
	)
  )
(global-set-key (kbd "H-s-SPC") 'my-clean-up-buffer)

(defun my-kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
		(delq (current-buffer)
			  (remove-if-not 'buffer-file-name (buffer-list))
			  )
		)
  )


;; join line to next line
(global-set-key (kbd "C-%")
				(lambda ()
				  (interactive)
				  (join-line -1)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pretty print xml region
(defun my-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
	;;(html-mode)
	(goto-char begin)
	;; split <foo><foo> or </foo><foo>, but not <foo></foo>
	(while (search-forward-regexp ">[ \t]*<[^/]" end t)
	  (backward-char 2) (insert "\n") (incf end))
	;; split <foo/></foo> and </foo></foo>
	(goto-char begin)
	(while (search-forward-regexp "<.*?/.*?>[ \t]*<" end t)
	  (backward-char) (insert "\n") (incf end))
	(indent-region begin end nil)
	;;(normal-mode)
	)
  (message "All indented!")
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clean up unclosed coldfusion tags like <cfset><cfargument>
(defun my-close-tags (begin end)
  "Close tag off corrctly with />"
  (interactive "r")
  (setq tags '("cfset" "cfparam" "cfinclude" "cfargument" "br" "hr" "cflocation" "cfproperty" "input" "cfreturn" "cfbreak" "cfcontinue" "cfsetting" "input" "attributes" "cfdump" "cfftp"))

  (dolist (s tags)
	(goto-char begin)
	(save-excursion
	  (goto-char begin)
	  (while (re-search-forward (concat "\\(<" s "[^>]*?[^/]\\)>") nil t)

		(replace-match (match-string 1) t nil)
		;;(backward-char)
		(insert " />") (incf end))
	  ;; (indent-region begin end nil)
	  ;;(normal-mode)
	  )
	)
  (message "All cleaned!")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my-align-whitespace
(defun my-align-whitespace (start end)
  "Align columns by whitespace"
  (interactive "r")
  (align-regexp start end
				"\\(\\s-*\\)\\s-" 1 0 t))

(defun my-untabify-buffer (begin end)
  "Untabify tabs in the middle of strings"
  (interactive "r")
  (save-excursion
	(goto-char (point-min))
	(while (search-forward-regexp "[^\n\r\t]\t" nil t)
	  (untabify (1- (point)) (line-end-position))
	  )
	(message "All untabbed!")
	))

(defun my-insert-leading-tabs (start end)
  "Call `tabify' with `tabify-regexp' set so that only leading
spaces are treated."
  (interactive "r")
  (setq tabify-regexp-old tabify-regexp)
  (unwind-protect
	  (progn
		(setq tabify-regexp "^\t* [ \t]+")
		(tabify start end))
	(setq tabify-regexp tabify-regexp-old)))


(defun my-align-& (start end)
  "Align columns by ampersand"
  (interactive "r")
  (align-regexp start end
				"\\(\\s-*\\)&" 1 1 t))


(defun my-switcheroo ()
  "Throw current buffer to other window, display previous buffer
in this window."
  (interactive)
  (save-selected-window
	(switch-to-buffer-other-window (current-buffer)))
  (switch-to-buffer (other-buffer)))
(global-set-key (kbd "H-o") 'my-switcheroo)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remove ^M characters
(defun my-remove-control-M ()
  "Remove ^M at end of line in the whole buffer."
  (interactive)
  (save-match-data
	(save-excursion
	  (let ((remove-count 0))
		(goto-char (point-min))
		(while (re-search-forward (concat (char-to-string 13) "$") (point-max) t)
		  (setq remove-count (+ remove-count 1))
		  (replace-match "" nil nil))
		(message (format "%d ^M removed from buffer." remove-count))))))


(defun my-replace-symbols-with-entity-names (start end)
  (interactive "r")
  (let ((count (count-matches "&")))
	(replace-string "&" "&amp;" nil start end)
	(setq end (+ end (* count 1))))
  (dolist (pair web-mode-html-entities)
	(unless (= (cdr pair) 38)
	  (let* ((str (char-to-string (cdr pair)))
			 (count (count-matches str start end)))
		(setq end (+ end (* count (1+ (length (car pair))))))
		(replace-string str
						(concat "&" (car pair) ";")
						nil start end)))))


(defun my-kill-other-buffers (begin end)
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
		(delq (current-buffer)
			  (remove-if-not 'buffer-file-name (buffer-list)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; same as Ctrl+i
(defun my-insert-tab-char ()
  "Insert a tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\t"))
(global-set-key (kbd "<M-tab>") 'my-insert-tab-char)

(defun my-package-recompile()
  "Recompile all packages"
  (interactive)
  (byte-recompile-directory "~/.emacs.d/elpa" 0 t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; indent-relative-below
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
	(save-excursion
	  (forward-line)
	  (transpose-lines 1))
	(forward-line)
	(move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
	(save-excursion
	  (forward-line)
	  (transpose-lines -1))
	(move-to-column col)))

;; Indent relative, but works for the line below rather than above
(defun indent-relative-below ()
  (interactive)
  (move-line-down)
  (indent-relative)
  (move-line-up)
  (previous-line)
  (previous-line))
(global-set-key  (kbd "<S-tab>") 'indent-relative-below)



(defun whack-whitespace (arg)
  "Delete all white space from point to the next word.  With prefix ARG
 delete across newlines as well.  The only danger in this is that you
 dont have to actually be at the end of a word to make it work.  It
skips over to the next whitespace and then whacks it all to the next
word."
  (interactive "P")
  (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
	(re-search-forward regexp nil t)
	(replace-match "" nil nil)))

(defun save-macro (name)
  "save a macro. Take a name as argument
		 and save the last defined macro under
		 this name at the end of your .emacs"
  (interactive "SName of the macro: ")  ; ask for the name of the macro
  (kmacro-name-last-macro name)         ; use this name for the macro
  (find-file user-init-file)            ; open ~/.emacs or other user init file
  (goto-char (point-max))               ; go to the end of the .emacs
  (newline)                             ; insert a newline
  (insert-kbd-macro name)               ; copy the macro
  (newline)                             ; insert a newline
  (switch-to-buffer nil))               ; return to the initial buffer



;; Move more quickly
(global-set-key (kbd "C-S-n")
				(lambda ()
				  (interactive)
				  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
				(lambda ()
				  (interactive)
				  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
				(lambda ()
				  (interactive)
				  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
				(lambda ()
				  (interactive)
				  (ignore-errors (backward-char 5))))

(global-set-key (kbd "C-S-M-n")
				(lambda ()
				  (interactive)
				  (ignore-errors (next-line 10))))

(global-set-key (kbd "C-S-M-p")
				(lambda ()
				  (interactive)
				  (ignore-errors (previous-line 10))))

(global-set-key (kbd "C-S-M-f")
				(lambda ()
				  (interactive)
				  (ignore-errors (forward-char 10))))

(global-set-key (kbd "C-S-M-b")
				(lambda ()
				  (interactive)
				  (ignore-errors (backward-char 10))))


(defun my-toggle-maximize-buffer () "Maximize buffer"
	   (interactive)
	   (if (= 1 (length (window-list)))
		   (jump-to-register '_)
		 (progn
		   (window-configuration-to-register '_)
		   (delete-other-windows))))

;;(defun helm-copy-to-buffer ()
;;  (interactive)
;;  (with-helm-buffer
;;  (cl-loop for cand in (helm-marked-candidates)
;;           do (with-helm-current-buffer
;;                (insert cand "\n")))))
;;(define-key helm-map (kbd "C-c C-i") 'helm-copy-to-buffer)




(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))


(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "ih"  'ediff-toggle-regexp-match)
  (define-key ediff-mode-map "if"  'ediff-toggle-regexp-match)
  (define-key ediff-mode-map "ic"  'ediff-toggle-ignore-case)
  (or ediff-word-mode
	  (define-key ediff-mode-map "iw"  'ediff-toggle-skip-similar)))

(add-hook 'ediff-mode-hook 'ora-ediff-hook)


(defun my-copy-full-path-to-kill-ring ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
	(kill-new (file-truename buffer-file-name))))




(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
  )

(defun my-coldfusion-code-style ()
  (interactive)
  (message "Coldfusion code style!")
  ;; use tab instead of space
  (setq-local indent-tabs-mode t)
  ;; indent 4 spaces width
  (my-setup-indent 4)
  )

(defun my-react-code-style ()
  (interactive)
  (message "React code style!")
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (my-setup-indent 2)
  )

(defun my-setup-develop-environment ()
  (interactive)
  (let ((proj-dir (file-name-directory (buffer-file-name))))
	;; if coldfusion project path contains string "hobby-proj1"
	(if (string-match-p "my-coldfusion-code-style" proj-dir)
		(my-personal-code-style))

	;; if react project path contains string "commerical-proj"
	(if (string-match-p "my-react-code-style" proj-dir)
		(my-office-code-style)))
  )

;; prog-mode-hook requires emacs24+
;;(add-hook 'prog-mode-hook 'my-setup-develop-environment)
;; a few major-modes does NOT inherited from prog-mode
;;(add-hook 'lua-mode-hook 'my-setup-develop-environment)
;;(add-hook 'web-mode-hook 'my-setup-develop-environment)



;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;;(defvar company-mode/enable-yas t
;;  "Enable yasnippet for all backends.")

;;(defun company-mode/backend-with-yas (backend)
;;  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;      backend
;;    (append (if (consp backend) backend (list backend))
;;            '(:with company-yasnippet))))

;;(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))



(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

;; Indent relative, but works for the line below rather than above
(defun indent-relative-below ()
  (interactive)
  (move-line-down)
  (indent-relative)
  (move-line-up)
  (previous-line 2))
(global-set-key  (kbd "M-s-]") 'indent-relative-below)



(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))




;; (defun highlight-selected-window ()
;;   "Highlight selected window with a different background color."
;;   (walk-windows (lambda (w)
;;                   (unless (eq w (selected-window))
;;                     (with-current-buffer (window-buffer w)
;;                       (buffer-face-set '(:background "#333344"))))))
;;   (buffer-face-set 'default))

;; (add-hook 'buffer-list-update-hook 'highlight-selected-window)
