(with-eval-after-load 'org

  ;; Set to the location of your Org files on your local system
  ;; (setq org-directory "~/Dropbox/org")
  ;; Set to the name of the file where new notes will be stored
  ;; (setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
  ;; ;; Set to <your Dropbox root directory>/MobileOrg.
  ;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

  ;; ;; Sync file to mobile org after saving an org-mode file
  ;; (defun sync-to-mobile-org ()
  ;;   "Sync org file to MobileOrg."
  ;;   (when (eq major-mode 'org-mode)
  ;;     (org-mobile-push)))
  ;; (add-hook 'after-save-hook #'sync-to-mobile-org)

  ;; (setq org-agenda-files '(quote ("~/Dropbox/org") "~/org" "~/org-jira"))
  ;; (setq org-todo-keywords
  ;;       (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
  ;;               (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

  ;; (setq org-todo-keyword-faces
  ;;       (quote (("TODO" :foreground "red" :weight bold)
  ;;               ("NEXT" :foreground "blue" :weight bold)
  ;;               ("DONE" :foreground "forest green" :weight bold)
  ;;               ("WAITING" :foreground "orange" :weight bold)
  ;;               ("HOLD" :foreground "magenta" :weight bold)
  ;;               ("CANCELLED" :foreground "forest green" :weight bold)
  ;;               ("MEETING" :foreground "forest green" :weight bold)
  ;;               ("PHONE" :foreground "forest green" :weight bold))))
  ;; (setq org-todo-state-tags-triggers
  ;;       (quote (("CANCELLED" ("CANCELLED" . t))
  ;;               ("WAITING" ("WAITING" . t))
  ;;               ("HOLD" ("WAITING") ("HOLD" . t))
  ;;               (done ("WAITING") ("HOLD"))
  ;;               ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
  ;;               ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
  ;;               ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
  ;; (setq org-default-notes-file "~/Dropbox/org/inbox.org")

  ;; ;; I use C-c c to start capture mode
  ;; (global-set-key (kbd "C-c c") 'org-capture)

  ;; ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
  ;; (setq org-capture-templates
  ;;       (quote (("t" "todo" entry (file "~/Dropbox/org/inbox.org")
  ;;                "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
  ;;               ("T" "Tickler" entry
  ;;                (file+headline "~/Dropbox/org/tickler.org" "Tickler")
  ;;                "* %i%? \n %U")
  ;;               ("r" "respond" entry (file "~/git/org/inbox.org")
  ;;                "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
  ;;               ("n" "note" entry (file "~/git/org/inbox.org")
  ;;                "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
  ;;               ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
  ;;                "* %?\n%U\n" :clock-in t :clock-resume t)
  ;;               ("w" "org-protocol" entry (file "~/git/org/inbox.org")
  ;;                "* TODO Review %c\n%U\n" :immediate-finish t)
  ;;               ("m" "Meeting" entry (file "~/git/org/inbox.org")
  ;;                "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
  ;;               ("p" "Phone call" entry (file "~/git/org/inbox.org")
  ;;                "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
  ;;               ("h" "Habit" entry (file "~/git/org/inbox.org")
  ;;                "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))


  ;; ;;  (require '~/org-mode)
  ;; (setq jiralib-url "https://jira.covermymeds.com")
  ;; (setq org-jira-working-dir "~/org-jira")

(setq org-roam-directory "~/org/roam")

;; KEY MAPPINGS
(global-set-key "\C-crf" 'org-roam-node-find)
(global-set-key "\C-cri" 'org-roam-node-insert)
(global-set-key "\C-crt" 'org-roam-dailies-goto-today)

;; (require 'init-org-roam-func)

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "9274E588E866A10B713C9CCD9EB3AD425D1CCC11")

;; BEGIN org niceities
;; NOT WORKING!
(setq-default dotspacemacs-large-file-size 3)
(setq org-tags-match-list-sublevels 'indented)
(setq org-startup-indented t)
(setq org-startup-with-inline-images t)

;; Enable Roam
(setq org-enable-roam-support t)

;; Familiar zooming with Ctrl+ and Ctrl-
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(setq org-insert-heading-respect-content t)
(setq org-id-link-to-org-use-id t)
(setq org-id-track-globally t)

;; TODO Move this out from the org-layer, it's not org-specific.
;; Or make it specific to my org-files somehow https://emacs.stackexchange.com/a/3611
(setq global-auto-revert-mode t)
;; END org niceities

(setq org-journal-dir "~/org/journal/")
(setq org-journal-file-format "%Y-%m-%d")
(setq org-journal-date-prefix "#+TITLE: ")
(setq org-journal-date-format "%A, %B %d %Y")
(setq org-journal-time-prefix "* ")
(setq org-journal-time-format "")
(setq org-want-todo-bindings t)

;; TODO Keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "IN_PROGRESS(i)" "|" "DONE(d)")
              (sequence "WAITING(w@/)" "DELEGATED(D)" "HOLD(h@/)" "|" "CANCELLED(c@/)"))))

;; This conflicts with the evil key bindings in spacemacs, instead of using the old speedcommands, use =, T T= when inside org mode.
;;(setq org-use-fast-todo-selection t)
;;(setq org-use-speed-commands t)

;; Link abbreviations http://orgmode.org/manual/Link-abbreviations.html#Link-abbreviations
;; This makes it easy to create links in org files to common urls
;; Note: The actual link is not stored in the text, only when rendered
;; Usage: [[zendesk:2753]] or [[redmine:7481][My text]]
(setq org-link-abbrev-alist
      '(
        ;; ("cfe-func" . "https://docs.cfengine.com/docs/master/reference-functions-")
        ;; ("zendesk" . "https://cfengine.zendesk.com/agent/tickets/")
        ;; ("redmine" . "https://dev.cfengine.com/issues/")
        ;; ("core-pr" . "https://github.com/cfengine/core/pull/")
        ;; ("mpf-pr" . "https://github.com/cfengine/masterfiles/pull/")
        ;; ("core-commit" . "https://github.com/cfengine/core/commit/")
        ;; ("mpf-commit" . "https://github.com/cfengine/masterfiles/commit/")
        ;; ("jira" . "https://jira.collegeboard.org/secure/Dashboard.jspa")
        ))

(defvar my/org-meeting-template-generic "* %u %^{Meeting about} %^g
CREATED: %U

%?

** Notes


" "Meeting Template - Generic")

(defvar my/org-meeting-template-customer-status "* %u Status Check-in
%^{CUSTOMER}pCREATED: %U

%?

*Attendees:*
  - Chris Meadows
  -

** Info
- Current versions running:
- Next planned upgrade:
- Upcoming platform changes:

** Notes

" "Meeting Template - Customer Status Check-in")

(defvar my/org-meeting-template-grooming "* %u Meeting About Pivot grooming :internal_meeting:
CREATED: %U
%?
*Agenda:*
- [[https://jira.collegeboard.org/secure/RapidBoard.jspa?rapidView=2322][Review Progress on the sprint]]
- [[https://jira.collegeboard.org/secure/RapidBoard.jspa?rapidView=2322&view=planning.nodetail&issueLimit=100][Review Backlog]]

** Notes

" "Meeting Template - Grooming")

;; BEGIN Capture Templates
    ;; I picked up this neat trick from the Venerable Sacha Chua
(defvar my/org-meeting-template-planning "* %u Meeting About Pivot Planning   %^G
CREATED: %U

*Agenda:*
 - Demos
 - Review work in progress
 - Review newly registered issues

** Demos


" "Meeting Template - Planning")

    (defvar my/org-meeting-template-standup "* %u Pivot Standup  :internal_meeting:
CREATED: %U

** Steve
** Sam
** Misha
** Dan
** Chris
** Andrea
** Catherine
** Suba
** David

" "Meeting Template - Standup")

    (defvar my/org-meeting-template "* %u %^{Meeting About ...}   %^G
CREATED: %U

*Attendees:*

 - [X] Chris Meadows
 - [ ] %?


*Agenda:*
 -
 -

*Notes:*


" "Meeting Template")

    (defvar my/org-contact-capture-template "* %(org-contacts-template-name)
CREATED: %U
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:")


    (defvar my/org-respond-email-capture-template "** TODO [#B] Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n\n")

    (defvar my/org-capture-jira "** TODO [#B] [[jira:%^{ISSUE}]]: %^{DESCRIPTION} %^G\n\n%?\n")


    (defvar my/org-daily-review-capture-template "* %u\n\n%?\n")

;; Configure custom capture templates
(setq org-capture-templates
      `(;; Note the backtick here, it's required so that the defvar based tempaltes will work!
        ;;http://comments.gmane.org/gmane.emacs.orgmode/106890

        ("t" "To-do" entry (file+headline "~/org/refile.org" "Tasks")
         "** TODO %^{Task Description}\nCreated From: %a\n%?\n\n" :clock-in t :clock-resume t :append t)

        ("j" "Jira" entry (file+headline "~/org/refile.org" "Tasks")
         ,my/org-capture-jira :clock-in t :clock-resume t :append t)

        ("w" "Web site" entry
         (file "~/org/websites.org")
         "* %a :website:\n\n%U %?\n\n%:initial" :append t)

        ("r" "Respond to Email" entry (file+headline "~/org/refile.org" "Tasks")
         ,my/org-respond-email-capture-template :clock-in t :clock-resume t :append t)

        ("c" "Contact" entry (file "~/org/x-files.org") ,my/org-contact-capture-template :append t)
        ("d" "Daily Review" entry (file "~/org/daily_reviews.org") ,my/org-daily-review-capture-template :clock-in t :clock-resume t :append t)

        ("m" "Meetings" )
        ("ms" "Meeting - Standup" entry (file "~/org/cb/meetings.org" )
         ,my/org-meeting-template-standup :clock-in t :clock-resume t :append t :empty-lines-after 1)
        ("mc" "Meeting - Customer Status Check-in" entry (file "~/org/cb/meetings.org" )
         ,my/org-meeting-template-customer-status :clock-in t :clock-resume t :append t :empty-lines-after 1)
        ("mg" "Meeting - Grooming" entry (file "~/org/cb/meetings.org" )
         ,my/org-meeting-template-grooming :clock-in t :clock-resume t :append t :empty-lines-after 1)
        ("mp" "Meeting - Planning/Review" entry (file "~/org/cb/meetings.org" )
         ,my/org-meeting-template-planning :clock-in t :clock-resume t :append t :empty-lines-after 1)
        ("mm" "Meeting - Generic" entry (file "~/org/cb/meetings.org" )
         ,my/org-meeting-template-generic :clock-in t :clock-resume t :append t :empty-lines-after 1)
        ))
;; END Capture templates
;; Use UUIDs to identify each speicifc entry
(add-hook 'org-capture-prepare-finalize-hook 'org-id-get-create)

(setq org-src-fontify-natively t)

(setq org-src-tab-acts-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t) ; Works for sh, shell, bash
   ;; (python . t)
   ;; (ruby . t)
   ;; (ditaa . t)
   ;; (http . t)
   ;; (plantuml . t)
   ;; (perl . t))
   ))

;; BEGIN exports
;; Disable exporting subscripts (I use a lot of underscores, and they are never for subscript)
(setq org-export-with-sub-superscripts nil)

;; (when (configuration-layer/package-usedp 'ox-jira)
;;   (add-to-list 'org-export-backends 'jira))

(when (configuration-layer/layer-usedp 'markdown)
  (add-to-list 'org-export-backends 'md))

;; END exports

;; BEGIN Publishing
(setq org-publish-project-alist
      '(
        ("journal"
         :base-directory "~/org/journal/"
         :base-extension ""
         :publishing-directory "~/journal/"
         :recursive t
         :publishing-function org-html-publish-to-pdf
         :headline-levels 1
         :autopreamble nil)
        ("cb-html"
         :base-directory "~/org/cb/"
         :base-extension "org"
         :publishing-directory "~/cb/Google Drive/chris_org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :autopreamble t
         :eval "never-export")
        ("cb-org"
         :base-directory "~/org/cb/"
         :base-extension "org"
         :publishing-directory "~/cb/Google Drive/chris_org"
         :recursive t
         :publishing-function org-org-publish-to-org
         :headline-levels 4
         :autopreamble t)
        ("cb-pdf"
         :base-directory "~/org/cb/"
         :base-extension "org"
         :publishing-directory "~/cb/Google Drive/chris_org"
         :recursive nil
         :publishing-function org-latex-publish-to-pdf
         :headline-levels 4
         :autopreamble t)
        ("cb-txt"
         :base-directory "~/org/cb/"
         :base-extension "org"
         :publishing-directory "~/cb/Google Drive/chris_org"
         :recursive t
         :publishing-function org-ascii-publish-to-utf8
         :headline-levels 4
         :autopreamble t)

        ))
;; END Publishing
;; BEGIN org-agenda configuration

(setq org-agenda-span 'day)

(setq org-agenda-files
      '("~/org" "~/org/cb" "~/org/cb/customers"))
;; It's hard to see them (at least with the default color). Also this is a
;; reccomended change to speed up the agenda (not that it's too slow for me).
(setq org-agenda-dim-blocked-tasks nil)
(setq org-agenda-prefix-format '"%b")
;; END org-agenda configuration

(when (configuration-layer/package-used-p 'org-timeline)
  (require 'org-timeline)
  (add-hook 'org-agenda-finalize-hook 'org-timeline-insert-timeline :append)
  )

;; BEGIN clocking configuration
(setq spaceline-org-clock-p t)
(setq org-clock-idle-time 15)
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
;; END clocking configuration

(setq org-download-method 'attach)

;; (when (configuration-layer/package-used-p 'org-jira)
;;            (setq jiralib-url "https://jira.collegeboard.org:443")
;;             (setq org-jira-working-dir "~/.org-jira"))

)

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

;; (defun my/org-roam-filter-by-tag (tag-name)
;;   (lambda (node)
;;     (member tag-name (org-roam-node-tags node))))

;; (defun my/org-roam-list-notes-by-tag (tag-name)
;;   (mapcar #'org-roam-node-file
;;           (seq-filter
;;            (my/org-roam-filter-by-tag tag-name)
;;            (org-roam-node-list))))

;; (defun my/org-roam-refresh-agenda-list ()
;;   (interactive)
;;   (setq org-agenda-files (my/org-roam-list-notes-by-tag "Project")))

;; ;; Build the agenda list the first time for the session
;; (my/org-roam-refresh-agenda-list)

(defun my/org-roam-project-finalize-hook ()
  "Adds the captured project file to `org-agenda-files' if the
capture was not aborted."
  ;; Remove the hook since it was added temporarily
  (remove-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Add project file to the agenda list if the capture was confirmed
  (unless org-note-abort
    (with-current-buffer (org-capture-get :buffer)
      (add-to-list 'org-agenda-files (buffer-file-name)))))

(defun my/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (my/org-roam-filter-by-tag "Project")
   :templates
   '(("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
      :unnarrowed t))))

(defun my/org-roam-capture-inbox ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* %?"
                                  :if-new (file+head "Inbox.org" "#+title: Inbox\n")))))

(defun my/org-roam-capture-task ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Capture the new task, creating the project file if necessary
  (org-roam-capture- :node (org-roam-node-read
                            nil
                            (my/org-roam-filter-by-tag "Project"))
                     :templates '(("p" "project" plain "** TODO %?"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                                                          ("Tasks"))))))
(provide 'init-org-roam)
