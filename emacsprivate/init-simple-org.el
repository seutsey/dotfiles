;; (defun org-keys ()
;;   (interactive)
;;   ;; Make ~SPC ,~ work, reference:
;;   ;; http://stackoverflow.com/questions/24169333/how-can-i-emphasize-or-verbatim-quote-a-comma-in-org-mode
;;   (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\n")
;;   (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)

;;   (setq org-emphasis-alist '(("*" bold)
;;                              ("/" italic)
;;                              ("_" underline)
;;                              ("=" org-verbatim verbatim)
;;                              ("~" org-kbd)
;;                              ("+"
;;                               (:strike-through t))))

;;   (setq org-hide-emphasis-markers t))

(with-eval-after-load 'org
;;   (define-key org-mode-map (kbd "M-h") 'org-metaleft)
;;   (define-key org-mode-map (kbd "M-j") 'org-metadown)
;;   (define-key org-mode-map (kbd "M-k") 'org-metaup)
;;   (define-key org-mode-map (kbd "M-l") 'org-metaright)
;;   (define-key org-mode-map (kbd "M-H") 'org-shiftmetaleft)
;;   (define-key org-mode-map (kbd "M-J") 'org-shiftmetadown)
;;   (define-key org-mode-map (kbd "M-K") 'org-shiftmetaup)
;;   (define-key org-mode-map (kbd "M-L") 'org-shiftmetaright)
;;   (org-keys)

  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file "~/Dropbox/org/refile.org")

  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PRREVIEW" "CHAT" "PHONE" "MEETING"))))

  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("PRREVIEW" :foreground "forest green" :weight bold)
                ("MEETING" :foreground "forest green" :weight bold)
                ("CHAT" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold))))

  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  ; Tags with fast selection keys
  (setq org-tag-alist (quote ((:startgroup)
                              ("@errand" . ?e)
                              ("@office" . ?o)
                              ("@home" . ?H)
                              (:endgroup)
                              ("WAITING" . ?w)
                              ("HOLD" . ?h)
                              ("PERSONAL" . ?P)
                              ("WORK" . ?W)
                              ("NOTE" . ?n)
                              ("CANCELLED" . ?c)
                              ("FLAGGED" . ??))))

  ;; Setting org-journal related values
  (setq org-journal-dir "~/Dropbox/org/journal/")
  (setq org-journal-file-format "%Y-%m-%d")
  (setq org-journal-date-prefix "#+TITLE: ")
  (setq org-journal-date-format "%A, %B %d %Y")
  (setq org-journal-time-prefix "* ")

  ;; Setting up org-projectile to be included in the agenda
  (require 'org-projectile)
  (mapcar '(lambda (file)
             (when (file-exists-p file)
               (push file org-agenda-files)))
          (org-projectile-todo-files))

  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

  (setq org-agenda-files (quote ("~/Dropbox/org")))

  )
(provide 'init-simple-org)
