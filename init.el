;;----------------------------------------------------------------------
;; packages
(require 'package)

;; erbody has this
(setq package-user-dir "~/.emacs.d/elpa/")
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;;----------------------------------------------------------------------
;; evil mode

(package-require 'evil)
(evil-mode t)

(setq evil-shift-width 2)
(setq evil-default-cursor t)
;;(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
;;(setq evil-emacs-state-modes nil)
;;----------------------------------------------------------------------
;; auto complete

(package-require 'auto-complete)
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;;----------------------------------------------------------------------
;; ack grep

(package-require 'ag)

;;----------------------------------------------------------------------
;; rainbow mode - render hex colors as they are typed

(package-require 'rainbow-mode)

;;----------------------------------------------------------------------
;; highlight indentation

(package-require 'indent-guide)
(indent-guide-global-mode)
(set-face-background 'indent-guide-face "#EBE9CC")

;;----------------------------------------------------------------------
;; Spelling!
;; Flyspell - config here relies on aspell (brew install)

(setq ispell-program-name "/usr/local/bin/ispell")

(package-require 'flyspell)
(require 'flyspell)
(setq flyspell-issue-message-flg nil)
(flyspell-prog-mode)
;; flyspell mode breaks auto-complete mode without this.
(ac-flyspell-workaround)



;;----------------------------------------------------------------------
;; ido

(package-require 'ido-ubiquitous)
(package-require 'ido-vertical-mode)
(require 'ido)

(ido-mode t)
(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-enable-flex-matching t)
(ido-ubiquitous)
(setq ido-use-virtual-buffers t)

;;----------------------------------------------------------------------
;; smex

(package-require 'smex)
(require 'smex)
(smex-initialize)
(smex-initialize-ido)

;;----------------------------------------------------------------------
;; Keybindings with more than one key at a time
;; and fancy stuff

(package-require 'key-chord)
(require 'key-chord)
(key-chord-mode t)

;; M-x simulation
(key-chord-define-global ",x" 'smex)
;; Find file
(key-chord-define-global ",f" 'find-file)
;; Buffer switching
;;(key-chord-define evil-normal-state-map "s" 'ido-switch-buffer)

;;----------------------------------------------------------------------
;; Neotree

(package-require 'neotree)
(setq neo-smart-open t)

;;----------------------------------------------------------------------
;; General Emacs settings

;; Save backups and auto-saves in one location
(setq backup-directory-alist
  `((".*" . ,"backups")))
(setq auto-save-file-name-transforms
  `((".*" ,"backups")))
(setq auto-save-list-file-prefix "backups")
(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t)     ; Use version numbers on backups

;; Save version controlled files
(setq vc-make-backup-files t)

;; Disable the splash screen
(setq inhibit-startup-message t)

;; set tabs to 2 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Turn on column numbers.
(column-number-mode 1)

;; Turn on line numbers where relevant.
(add-hook 'prog-mode-hook 'linum-mode)

;; Turn off scroll bars, the tool bar, and the menu bar.
(dolist (mode '(menu-bar-mode scroll-bar-mode tool-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

;; Show full path in frame title
(setq frame-title-format
  '((:eval (buffer-file-name) "%b")))

;; Turn off the visual bell.
(setq visible-bell nil)

;; Highlight matching brackets.
(show-paren-mode 1)

;; Turn off blinking cursor
(blink-cursor-mode 0)

;; Smooth scrolling.
(setq scroll-step 1
      scroll-conservatively 10000)

;; Mouse scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; Ask for y/n instead of yes/no.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Font
(set-face-attribute 'default nil :height 175)

;; Copy to clipboard
(setq x-select-enable-clipboard)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;----------------------------------------------------------------------
;; Theme settings

;;(package-require 'solarized-theme)

;;(load-theme 'solarized-light t)

;;----------------------------------------------------------------------
;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
    (lambda ()
      (eldoc-mode t)))
     ;; (define-key evil-normal-state-local-map ",e" 'eval-defun)))

;;----------------------------------------------------------------------
;; End manual settings


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-executable "/usr/local/bin/ag")
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(sql-postgres-program
   "/Applications/Postgres.app/Contents/Versions/latest/bin/psql"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;----------------------------------------------------------------------
;;
