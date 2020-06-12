(setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024)))
(run-with-idle-timer 2 t (lambda () (garbage-collect)))


(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq mac-function-modifier 'hyper)
(setq mac-pass-command-to-system nil)

;; setup files ending in “.js” to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))


;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(setq history-length 100)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; themes                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/personal/themes")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; prelude configuration                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq prelude-theme nil)
(put 'scroll-left 'disabled nil)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


(setq ns-option-modifier 'meta)
(setq ns-command-modifier 'super)
(setq ns-function-modifier 'hyper)

(show-paren-mode 1)

(set-default 'truncate-lines nil)

(smartparens-global-mode 1)

(transient-mark-mode t)

;;(add-hook 'after-init-hook (lambda ()
;;							 (when (fboundp 'auto-dim-other-buffers-mode)
;;							   (auto-dim-other-buffers-mode t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load-package                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/personal/packages")









(beacon-mode 1)



;; Global settings (defaults)
;;(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;; (load-theme 'doom-one t)

;; Enable flashing mode-line on errors
;;(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
;;(doom-theme-neotree-config)
;; or for treemacs users
;;(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
;;(doom-themes-org-config)

;;(defun try-to-add-imen ()
;;  (condition-case nil (imenu-add-to-menubar "INDEX") (error nil)))
;;(add-hook 'font-lock-mode-hook 'try-to-add-imenu)




















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; js3                                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(use-package js3-mode
;;  :ensure t
;;  :defer t
;;  :init
;;  (setq
;;   js3-strict-cond-assign-warning nil
;;   js3-strict-inconsistent-return-warning nil
;;   js3-strict-trailing-comma-warning nil
;;   js3-strict-var-hides-function-arg-warning nil
;;   js3-strict-var-redeclaration-warning nil
;;   js3-error-face nil
;;   js3-warning-face nil
;;   )
;;  )

;;(defcustom js3-imenu-expression-alist
;;  '(("Sections"  "^.*?cffunction.*name=\\(.\\)\\([^\\1]+?\\)\\1.*$"          1)
;;	)
;;  "Alist of regular expressions for the imode index.  Each element has
;;the form (submenu-name regexp index).  Where submenu-name is the name of
;;the submenu under which items matching regexp are placed. When
;;submenu-name is nil the matching entries appear in the root imenu list.
;;Regexp index indicates which regext text group defines the text entry.
;;When the index is 0 the entire text that matches regexp appears."
;;  :type '(repeat (list (choice :tag "Submenu Name" string (const nil))
;;					   regexp (integer :tag "Regexp index")))
;;  :group 'tal
;;  )

;;(add-hook 'js2-mode-hook
;;		  (lambda ()
;;			(setq imenu-generic-expression js3-imenu-expression-alist)))


(setq indent-tabs-mode nil)

;;(autoload 'js3-mode "js3-mode" nil t)
;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-dim-other-buffers-mode                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook (lambda ()
							               (when (fboundp 'auto-dim-other-buffers-mode)
							                 (auto-dim-other-buffers-mode t))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dumb jump                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;(defun auto-complete-mode-maybe ()
;;  "Overwrite auto-complete-mode-maybe which by defaults turns autocomplete only on for buffers listed in ac-modes."
;;  (unless (minibufferp (current-buffer))
;;	(auto-complete-mode 1)))
;;(setq  ac-use-fuzzy t)
;;(setq ac-ignore-case (quote smart))
;;(global-auto-complete-mode t)

;;(require 'helm-rg)
;;(load "~/.emacs.d/personal/helm-locate")
;;(require 'helm-locate)
;;(require 'helm-config)

;;(setq helm-locate-command "   rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
;; replace locate with spotlight on Mac
(setq helm-locate-command "mdfind -name %s %s")



;;(setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
(setq helm-grep-ag-command "mdfind -name %s %s")


(setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))

(setq helm-locate-fuzzy-match t)
(setq avy-background t)
(setq auto-dim-other-buffers-mode t)

;;(eval-after-load "sql"
;;  (load-library "sql-indent"))




;; Mumamo is making emacs 25.1 freak out:
(when (and (equal emacs-major-version 25)
		       (equal emacs-minor-version 1))
  (eval-after-load "bytecomp"
	  '(add-to-list 'byte-compile-not-obsolete-vars
                  'syntax-begin-function))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
	  '(add-to-list 'byte-compile-not-obsolete-vars
                  'syntax-begin-function)))

;; (add-to-list 'load-path "~/.emacs.d/packages")
;; (load "~/.emacs.d/personal/nxhtml/autostart")


;; prelude sH-tuff
;;enable arrH-ow keys
(setq preludH-e-guru nil)
;; projectile stuff

(setq projectile-sort-order 'recentf)


;;(require 'helm-projectile)
;;(projectile-global-mode)
;;(setq projectile-completion-system 'helm)
;;(helm-projectile-on)

;; helm fuzzy matching
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq shell-file-name "/bin/bash")


;;(load "~/.emacs.d/personal/helm")



(setq whitespace-line-column 99999999)
(setq whitespace-style '( face spaces newline space-mark tab-mark newline-mark))

;;; hilite-line
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line "#084666")
(set-face-attribute 'region nil :background "#FF781F")
(set-face-attribute 'region nil :foreground "white")
(setq linum-format "%d")
;;(set-cursor-color "Yellow")

;; show line numbers
(global-linum-mode t)

;; rainbow delimeters mode





(add-to-list 'auto-mode-alist '("\\.cfm\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.cfc\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.el\\'"  . lisp-mode))


(setq flycheck-javascript-eslint-executable "eslint_d")
;;(add-hook 'flycheck-mode-hook 'add-node-modules-path)
;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-flycheck-mode)
;;(setq flycheck-check-syntax-automatically '(mode-enabled save))


;;(defun web-mode-init-prettier-hook ()
;;  (add-node-modules-path)
;;  (prettier-js-mode)
;;  )
;;(add-hook 'web-mode-hook  'web-mode-init-prettier-hook)



(setq clean-buffer-list-delay-general 1)


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)



;;Center to middle of screen after searching
;;    (add-hook 'isearch-mode-end-hook 'recenter-top-bottom)
(setq isearch-allow-scroll t)

(add-hook 'forward-line 'recenter-top-bottom)


(add-hook 'html-modp-hook 'whitespace-mode 0)


;; start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; hide scroll bars
(scroll-bar-mode -1)

;; Recenter after every isearch-forward
(defadvice
	  isearch-forward
	  (after isearch-forward-recenter activate)
  (recenter))
(ad-activate 'isearch-forward)

(defadvice
	  isearch-repeat-forward
	  (after isearch-repeat-forward-recenter activate)
  (recenter))
(ad-activate 'isearch-repeat-forward)

(defadvice
	  isearch-repeat-backward
	  (after isearch-repeat-backward-recenter activate)
  (recenter))
(ad-activate 'isearch-repeat-backward)


(require 'multiple-cursors)




;;val(add-hook 'html-mode-hook        'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook         'emmet-mode) ;; enable emmet's css abbreviation.
(add-hook 'javascript-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;;(add-hook '3js-mode-hook          'emmet-mode) ;; enable Emmet's css abbreviation.
;;(add-hook 'js2-mode-hook         'emmet-mode) ;; enable Emmet's css abbreviation.
;;(add-hook 'js3-mode-hook         'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.



;;(add-hook 'html-mode-hook
;;		  (lambda ()
;;			(org-set-local 'yas/trigger-key [tab])
;;			(define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)
;;			(define-key html-mode-map (kbd "<M-left>") 'sgml-skip-tag-backward)
;;			(define-key html-mode-map (kbd "<M-right>") 'sgml-skip-tag-forward)
;;			)
;;		  )









(require 'prelude-helm-everywhere)


;;(require 'multi-web-mode)
;;(setq mweb-default-major-mode 'html-mode)
;;(setq mweb-tags
;;      '(
;;        (js3-mode  "<script[^>]*>"   "</script>")
;;        (js3-mode  "<cfscript[^>]*>" "</cfscript>")
;;        (css-mode  "<style[^>]*>"    "</style>")))
;;(setq mweb-filename-extensions '("cfm" "htm" "html"))
;;(multi-web-global-mode 1)


;;(require 'iy-go-to-char)



(setq web-mode-html-entities
	    '(("quot" . 34)
		    ("amp" . 38)
		    ("apos" . 39)
		    ("lt" . 60)
		    ("gt" . 62)
		    ("nbsp" . 160)
		    ("iexcl" . 161)
		    ("cent" . 162)
		    ("pound" . 163)
		    ("curren" . 164)
		    ("yen" . 165)
		    ("brvbar" . 166)
		    ("sect" . 167)
		    ("uml" . 168)
		    ("copy" . 169)
		    ("ordf" . 170)
		    ("laquo" . 171)
		    ("not" . 172)
		    ("shy" . 173)
		    ("reg" . 174)
		    ("macr" . 175)
		    ("deg" . 176)
		    ("plusmn" . 177)
		    ("sup2" . 178)
		    ("sup3" . 179)
		    ("acute" . 180)
		    ("micro" . 181)
		    ("para" . 182)
		    ("middot" . 183)
		    ("cedil" . 184)
		    ("sup1" . 185)
		    ("ordm" . 186)
		    ("raquo" . 187)
		    ("frac14" . 188)
		    ("frac12" . 189)
		    ("frac34" . 190)
		    ("iquest" . 191)
		    ("Agrave" . 192)
		    ("Aacute" . 193)
		    ("Acirc" . 194)
		    ("Atilde" . 195)
		    ("Auml" . 196)
		    ("Aring" . 197)
		    ("AElig" . 198)
		    ("Ccedil" . 199)
		    ("Egrave" . 200)
		    ("Eacute" . 201)
		    ("Ecirc" . 202)
		    ("Euml" . 203)
		    ("Igrave" . 204)
		    ("Iacute" . 205)
		    ("Icirc" . 206)
		    ("Iuml" . 207)
		    ("ETH" . 208)
		    ("Ntilde" . 209)
		    ("Ograve" . 210)
		    ("Oacute" . 211)
		    ("Ocirc" . 212)
		    ("Otilde" . 213)
		    ("Ouml" . 214)
		    ("times" . 215)
		    ("Oslash" . 216)
		    ("Ugrave" . 217)
		    ("Uacute" . 218)
		    ("Ucirc" . 219)
		    ("Uuml" . 220)
		    ("Yacute" . 221)
		    ("THORN" . 222)
		    ("szlig" . 223)
		    ("agrave" . 224)
		    ("aacute" . 225)
		    ("acirc" . 226)
		    ("atilde" . 227)
		    ("auml" . 228)
		    ("aring" . 229)
		    ("aelig" . 230)
		    ("ccedil" . 231)
		    ("egrave" . 232)
		    ("eacute" . 233)
		    ("ecirc" . 234)
		    ("euml" . 235)
		    ("igrave" . 236)
		    ("iacute" . 237)
		    ("icirc" . 238)
		    ("iuml" . 239)
		    ("eth" . 240)
		    ("ntilde" . 241)
		    ("ograve" . 242)
		    ("oacute" . 243)
		    ("ocirc" . 244)
		    ("otilde" . 245)
		    ("ouml" . 246)
		    ("divide" . 247)
		    ("oslash" . 248)
		    ("Ugrave" . 249)
		    ("Uacute" . 250)
		    ("Ucirc" . 251)
		    ("Uuml" . 252)
		    ("yacute" . 253)
		    ("thorn" . 254)
		    ("yuml" . 255)
		    ("OElig" . 338)
		    ("oelig" . 339)
		    ("Scaron" . 352)
		    ("scaron" . 353)
		    ("Yuml" . 376)
		    ("fnof" . 402)
		    ("circ" . 710)
		    ("tilde" . 732)
		    ("Alpha" . 913)
		    ("Beta" . 914)
		    ("Gamma" . 915)
		    ("Delta" . 916)
		    ("Epsilon" . 917)
		    ("Zeta" . 918)
		    ("Eta" . 919)
		    ("Theta" . 920)
		    ("Iota" . 921)
		    ("Kappa" . 922)
		    ("Lambda" . 923)
		    ("Mu" . 924)
		    ("Nu" . 925)
		    ("Xi" . 926)
		    ("Omicron" . 927)
		    ("Pi" . 928)
		    ("Rho" . 929)
		    ("Sigma" . 931)
		    ("Tau" . 932)
		    ("Upsilon" . 933)
		    ("Phi" . 934)
		    ("Chi" . 935)
		    ("Psi" . 936)
		    ("Omega" . 937)
		    ("alpha" . 945)
		    ("beta" . 946)
		    ("gamma" . 947)
		    ("delta" . 948)
		    ("epsilon" . 949)
		    ("zeta" . 950)
		    ("eta" . 951)
		    ("theta" . 952)
		    ("iota" . 953)
		    ("kappa" . 954)
		    ("lambda" . 955)
		    ("mu" . 956)
		    ("nu" . 957)
		    ("xi" . 958)
		    ("omicron" . 959)
		    ("pi" . 960)
		    ("rho" . 961)
		    ("sigmaf" . 962)
		    ("sigma" . 963)
		    ("tau" . 964)
		    ("upsilon" . 965)
		    ("phi" . 966)
		    ("chi" . 967)
		    ("psi" . 968)
		    ("omega" . 969)
		    ("thetasym" . 977)
		    ("Upsih" . 978)
		    ("piv" . 982)
		    ("ensp" . 8194)
		    ("emsp" . 8195)
		    ("thinsp" . 8201)
		    ("zwnj" . 8204)
		    ("zwj" . 8205)
		    ("lrm" . 8206)
		    ("rlm" . 8207)
		    ("ndash" . 8211)
		    ("mdash" . 8212)
		    ("lsquo" . 8216)
		    ("rsquo" . 8217)
		    ("sbquo" . 8218)
		    ("ldquo" . 8220)
		    ("rdquo" . 8221)
		    ("bdquo" . 8222)
		    ("dagger" . 8224)
		    ("Dagger" . 8225)
		    ("bull" . 8226)
		    ("hellip" . 8230)
		    ("permil" . 8240)
		    ("prime" . 8242)
		    ("Prime" . 8243)
		    ("lsaquo" . 8249)
		    ("rsaquo" . 8250)
		    ("oline" . 8254)
		    ("frasl" . 8260)
		    ("euro" . 8364)
		    ("image" . 8465)
		    ("weierp" . 8472)
		    ("real" . 8476)
		    ("trade" . 8482)
		    ("alefsym" . 8501)
		    ("larr" . 8592)
		    ("uarr" . 8593)
		    ("rarr" . 8594)
		    ("darr" . 8595)
		    ("harr" . 8596)
		    ("crarr" . 8629)
		    ("lArr" . 8656)
		    ("UArr" . 8657)
		    ("rArr" . 8658)
		    ("dArr" . 8659)
		    ("hArr" . 8660)
		    ("forall" . 8704)
		    ("part" . 8706)
		    ("exist" . 8707)
		    ("empty" . 8709)
		    ("nabla" . 8711)
		    ("isin" . 8712)
		    ("notin" . 8713)
		    ("ni" . 8715)
		    ("prod" . 8719)
		    ("sum" . 8721)≈lisp
		    ("minus" . 8722)
		    ("lowast" . 8727)
		    ("radic" . 8730)
		    ("prop" . 8733)
		    ("infin" . 8734)
		    ("ang" . 8736)
		    ("and" . 8743)
		    ("or" . 8744)
		    ("cap" . 8745)
		    ("cup" . 8746)
		    ("int" . 8747)
		    ("there4" . 8756)
		    ("sim" . 8764)
		    ("cong" . 8773)
		    ("asymp" . 8776)
		    ("ne" . 8800)
		    ("equiv" . 8801)
		    ("le" . 8804)
		    ("ge" . 8805)
		    ("sub" . 8834)
		    ("sup" . 8835)
		    ("nsub" . 8836)
		    ("sube" . 8838)
		    ("supe" . 8839)
		    ("oplus" . 8853)
		    ("otimes" . 8855)
		    ("perp" . 8869)
		    ("sdot" . 8901)
		    ("lceil" . 8968)
		    ("rceil" . 8969)
		    ("lfloor" . 8970)
		    ("rfloor" . 8971)
		    ("lang" . 9001)
		    ("rang" . 9002)
		    ("loz" . 9674)
		    ("spades" . 9824)
		    ("clubs" . 9827)
		    ("hearts" . 9829)
		    ("diams" . 9830)))


(add-hook 'after-save-hook 'delete-trailing-whitespace )


(load "~/.emacs.d/personal/myfunctions")


(setq mac-allow-anti-aliasing t)


;; Scrolling
;;(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
;;(setq mouse-wheel-progressive-speed nil)


;; Not using flycheck
(global-flycheck-mode -1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; indentation to be more like sublime
;;(setq tab-always-indent 'complete)
(setq indent-line-function 'insert-tab)
(custom-set-variables
 ;; custom-set-variables was added by Custom.b
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100 102 104 106 108 110 112 114 116 118 120))))
;; use tabs insead of spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)



;;(add-hook 'anzu-mode-hook (lambda () (electric-indent-mode -1)))
;;(add-hook 'text-mode-hook (lambda () (electric-indent-mode -1)))





;; These are the lifessave hooks to make emacs behave more like sublime
(add-hook 'sgml-mode-hook
		      (lambda ()
			      ;; Default indentation is usually 2 spaces, changing to 4.
			      (set (make-local-variable 'sgml-basic-offset) 4)))

(add-hook 'javascript-mode-hook
		      (lambda ()
			      ;; Default indentation is usually 2 spaces, changing to 4.
			      (set (make-local-variable 'javascript-basic-offset) 4)))

(setq-default tab-always-indent 'complete)

(progn
  ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))

  ;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line char and “▷” for tab.
  (setq whitespace-display-mappings
		    ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
		    '(
		      ;;(space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
		      ;;(newline-mark 10 [182 10]) ; LINE FEED,
		      (tab-mark 9 [124 9] [92 9]) ; tab  9 [9655 9] [92 9]
		      )))


(set-face-attribute 'whitespace-space nil :background nil :foreground "#36648B")
(set-face-attribute 'whitespace-tab nil :background "#36648B" :foreground "#B0BEBF")

(electric-indent-mode t)


;;(load "~/.emacs.d/personal/modelineformat")






;; Customizing colors used in diff mode
(defun custom-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute
   'diff-added nil :foreground "green")
  (set-face-attribute
   'diff-removed nil :foreground "red")
  (set-face-attribute
   'diff-changed nil :foreground "purple"))
(eval-after-load "diff-mode" '(custom-diff-colors))



(setq ediff-split-window-function 'split-window-horizontally)

;; only hilight current diff:
(setq-default ediff-highlight-all-diffs 'nil)

;; turn off whitespace checking:
(setq ediff-diff-options "-w")


(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference))

(add-hook 'ediff-mode-hook 'ora-ediff-hook)



(autoload 'find-file-in-project "find-file-in-project" nil t)
(autoload 'find-file-in-project-by-selected "find-file-in-project" nil t)
(autoload 'find-directory-in-project-by-selected "find-file-in-project" nil t)
(autoload 'ffip-show-diff "find-file-in-project" nil t)
(autoload 'ffip-save-ivy-last "find-file-in-project" nil t)
(autoload 'ffip-ivy-resume "find-file-in-project" nil t)


;;(idle-highlight-mode t)

(setq locate-command "mdfind")

;;(require 'smooth-scrolling)
;;(smooth-scrolling-mode 1)

;;(require 'sr-speedbar)



(load "~/.emacs.d/personal/mykeycommands")

(load "~/.emacs.d/personal/mymenu")

(ediff-setup-keymap)
;;(define-key ediff-mode-map "j" 'ediff-next-difference)
;;(define-key ediff-mode-map "k" 'ediff-previous-difference)
(define-key ediff-mode-map "C-w"   'ediff-toggle-skip-similar)

;;(add-hook 'ediff-mode-hook 'ora-ediff-hook)
;;ediff-toggle-skip-similar)


;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist
	    `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transformsbb
	    `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
	    emacs-tmp-dir)

(setq cssm-indent-function #'cssm-c-style-indenter)


;; NeoTree
(setq neo-smart-open t)
;;(setq projectile-switch-project-action 'neotree-projectile-action)


;;(powerline-default-theme)


(add-hook 'after-init-hook (lambda ()
							               (when (fboundp 'auto-dim-other-buffers-mode)
							                 (auto-dim-other-buffers-mode t))))



;;(add-to-list 'yas-snippet-dirs "/path/to/angularjs-mode/snippets")
;;(add-to-list 'ac-dictionary-directories "/path/to/angularjs-mode/ac-dict")
;;(add-to-list 'ac-modes 'angular-mode)
;;(add-to-list 'ac-modes 'angular-html-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; imenu html mode                                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(add-hook 'html-mode-hook 'imenu-add-menubar-index)
;;(add-hook 'sqml-mode-hook 'imenu-add-menubar-index)
;;(add-hook 'js-mode-hook 'imenu-add-menubar-index)
;;(add-hook 'js3-mode-hook 'imenu-add-menubar-index)
;;(add-hook 'js2-mode-hook 'imenu-add-menubar-index)
(setq imenu-auto-rescan t)

;;(defvar my-coldfusion-imenu-generic-expression
;;  '(;;("test 1" "^.+cffunction.+name=([^ ]+) .*$" 1)
;;    ;;("test 2" "^.+cffunction.+(name.*$)" 1)
;;    ("test 3"  "^#\\s-+\\(.+\\)$" 1)))

;;(defun my-coldfusion-imenu-configure ()
;;  (interactive)
;;  (setq imenu-generic-expression my-coldfusion-imenu-generic-expression))

;;(add-hook 'html-mode-hook 'my-coldfusion-imenu-configure)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; END: imenu html mode                                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(defvar camdez/markdown-imenu-generic-expression
;;  '((nil "^#\\s-+\\(.+\\)$" 1)))

;;(defun camdez/markdown-imenu-configure ()
;;  (interactive)
;;  (setq imenu-generic-expression camdez/markdown-imenu-generic-expression))

;;(add-hook 'html-mode-hook 'camdez/markdown-imenu-configure)


(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "3" 'ediff-ignore-whitespace))


;;(set-face-attribute 'region nil :background "VioletRed4")
(setq rg-align-position-numbers t)
(setq rg-align-line-number-field-length 3)
(setq rg-align-column-number-field-length 3)
(setq rg-align-line-column-separator "#")
(setq rg-align-position-content-separator "|")

;;(use-package multi-web-mode
;;  :ensure t
;;  :init
;;  :config
;;  (setq mweb-default-major-mode 'html-mode)
;;  (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;					(js2-mode "<cfscript>" "</cfscript>")
;;					(css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;;  (setq mweb-filename-extensions '("cfm" "cfc" "htm" "html"))
;;  (multi-web-global-mode 1)
;;  )

;;(ac-config-default)
;;(define-key ac-mode-map (kbd "TAB") nil)
;;(define-key ac-completing-map (kbd "TAB") nil)
;;(define-key ac-completing-map [tab] nil)
;;(global-auto-complete-mode t)
;;(setq-default
;; ac-sources '(
;;			  ac-source-words-in-all-buffer
;;			  ac-source-words-in-buffer
;;			  ac-source-files-in-current-dir
;;			  )
;; )

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)



;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
										                     try-expand-dabbrev-all-buffers
										                     try-expand-dabbrev-from-kill
										                     try-complete-file-name-partially
										                     try-complete-file-name
										                     try-expand-all-abbrevs
										                     try-expand-list
										                     try-expand-line
										                     try-complete-lisp-symbol-partially
										                     try-complete-lisp-symbol))










;;(require 'multi-web-mode)
;;(setq mweb-default-major-mode 'html-mode)
;;(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;                 (js2-mode "<cfscript>" "</cfscript>")
;;                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;;(setq mweb-filename-extensions '("cfm" "cfc" "htm" "html"))
;;(multi-web-global-mode 1)

;;(add-hook 'after-init-hook 'global-company-mode)

(setq idle-highlight-in-visible-buffers-idle-time 3.0)



;; Note that the built-in 'describe-function' includes both functions
;; and macros. 'helpful-function' is functions only, so we provide
;; 'helpful-callable' as a drop-in replacement.

(setq auto-save-visited-mode t)


(setq default-buffer-file-coding-system 'utf-8-unix)


;;set the cursor we need
(set-default 'cursor-type 'box)
(blink-cursor-mode -1)



(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  ;;(define-key ediff-mode-map "j" 'ediff-next-difference)
  ;;(define-key ediff-mode-map "k" 'ediff-previous-difference)
  (setq ediff-highlight-all-diff t)
  (define-key ediff-mode-map "W" 'ediff-toggle-skip-similar)
  (define-key ediff-mode-map "I" 'ediff-toggle-ignore-case)
  )






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hooks                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'ediff-mode-hook 'ora-ediff-hook)


(add-hook 'html-mode-hook
          (lambda ()
            (whitespace-mode -1)
            (rainbow-delimiters-mode -1)
            ;;(customset-faces)
            (setq dash-at-point-docset "coldfusion")
            ;;(set-background-color "gray5")
            ;;(imenu-add-menubar-index)
            ;;(my-coldfusion-imenu-configure)
            ;;(set-face-attribute 'region nil :background "windowBackgroundColor")
            (setq sgml-basic-offset 2)
      			;;(setq indent-line-function 'indent-relative)
            (setq rainbow-mode t)
						;;(set-background-color "gray5")
            ;;(prettier-js-mode  -1)
            (set-face-attribute 'region nil :background "#FF781F")
            (set-face-attribute 'region nil :foreground "white")
            )
          )

;;(add-hook 'js3-mode-hook
;;          (lambda ()
;;			(whitespace-mode -1)
;;			(setq dash-at-point-docset "coldfusion")
;;			(rainbow-delimiters-mode t)
;;			(set-background-color "gray5")
;;			(setq js2-mode-show-parse-errors nil)
;;			(setq js2-mode-show-strict-warnings nil)
;;			;;(imenu-add-menubar-index)
;;			;;(my-coldfusion-imenu-configure)
;;			(set-face-attribute 'region nil :background "windowBackgroundColor")
;;      (set-background-color "gray5")
;;			)
;;		  )

(add-hook 'js2-mode-hook
          (lambda ()
			      (setq dash-at-point-docset "coldfusion")
			      (rainbow-delimiters-mode t)
			      ;;(set-background-color "gray5")
			      (setq js2-mode-show-parse-errors nil)
			      (setq js2-mode-show-strict-warnings nil)
			      ;;(imenu-add-menubar-index)
			      ;;(my-coldfusion-imenu-configure)
			      ;;(set-face-attribute 'region nil :background "windowBackgroundColor")
			      ;; (prettier-js-mode t)
            (setq indent-tabs-mode nil)
            (setq js-indent-level 2)
    				(setq-default js2-basic-offset 2)
            (setq rainbow-mode t)
						;; (set-background-color "gray5")
            (set-face-attribute 'region nil :background "#FF781F")
            (set-face-attribute 'region nil :foreground "white")
			      )
		      )


(add-hook 'rjsx-mode-hook
          (lambda ()
			      (setq dash-at-point-docset "coldfusion")
			      (rainbow-delimiters-mode t)
			      ;; (prettier-js-mode t)
            (setq indent-tabs-mode nil)
            (setq default-tab-width 2)
            (setq rainbow-mode t)
            (setq indent-for-tab-command nil)
            (setq-default tab-always-indent t)
            ;;(set-background-color "gray5")
            (set-face-attribute 'region nil :background "#FF781F")
            (set-face-attribute 'region nil :foreground "white")
			      )
		      )


(set-face-attribute 'default nil :height 170)
;;(set-default-font "hack")


(setq helm-rg-thing-at-point nil)



(require 'multi-scratch)



(setq dabbrev-case-replace nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "#084666" :weight bold))))
 '(magit-diff-file-heading-selection ((t (:inherit magit-diff-file-heading-highlight :background "#084666" :foreground "#00d3d0" :weight bold))))
    )

(set-background-color "gray5")

(global-flycheck-mode 1)
(set-face-attribute 'flycheck-error nil :background "red" :foreground "white")
(setq flycheck-highlighting-mode 'lines)

;; init.el ends here
