;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Пн фев 16 19:10:11 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Вторник февраля 17 19:26:50 MSK 2026>



;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "-----------------------------------------------")
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)
            (message "-----------------------------------------------")
            ))



;;; засекаем время начала загрузки
(setq emacs-load-start-time (current-time))


;;; выводим в буфер сообщений
(message "start .init loading")
(message "---------------------------------------------------------")


(defconst emacs-start-time (current-time))

(setq-default initial-frame-alist   (quote    ((fullscreen . maximized))))

(setq doom-font (font-spec :family "JetBrainsMono" :size 22 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 22)
      doom-symbol-font (font-spec :family "FiraCode Nerd Font Mono")
      doom-big-font (font-spec :family "JetBrainsMono" :size 24))

(setq-default cursor-type     '(bar . 3))

;; Масштабируемые шрифты в графическом интерфейсе
;; C-x C-+ or C-x C--
(setq scalable-fonts-allowed t)

;; Mouse & Smooth Scroll
;; Scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))
      mouse-wheel-progressive-speed nil)




;; ;;; Unset keys
;; (global-unset-key (kbd "C-c"))      ; Эта комбинация изначально предназначалась для пользователя
(global-unset-key (kbd "C-d"))      ; `delete-char'
(global-unset-key (kbd "C-x C-l"))  ; `downcase-region' - у меня для этого функция есть
(global-unset-key (kbd "C-x C-u"))  ; `upcase-region' - у меня для этого функция есть
(global-unset-key (kbd "C-z"))      ; `suspend-frame'
(global-unset-key (kbd "M-h"))      ; `mark-paragraph'
;; (global-unset-key (kbd "M-k"))      ; `kill-sentence'
;; (global-unset-key (kbd "M-m"))      ; `back-to-indentation'
;; (global-unset-key (kbd "M-s h"))    ; `hi-lock-...', `highlight-...', `unhighlight-' - перебиндил
;; (global-unset-key (kbd "M-s o"))    ; `occur'

;; Выключить кнопку Insert (включение overwrite-mode):
(define-key global-map [(insert)] nil)


;; Функция Emacs Lisp display-startup-echo-area-message отвечает за отображение начального
;; стартового сообщения в эхо-области (области минибуфера) при запуске Emacs.
;; Сообщение по умолчанию обычно следующее: «Для получения информации о GNU Emacs и системе GNU введите C-h C-a».
(fset 'display-startup-echo-area-message #'ignore)



(use-package emacs
  :custom
  (global-visual-line-mode              t)
  (kill-whole-line                      t)
  (kill-ring-max                        1000)
  (next-line-add-newlines               nil)
                                        ; simple.el
  ;; Allows navigation through the mark ring by doing C-u C-SPC once, then C-SPC
  ;; C-SPC.  instead of C-u C-SPC C-u C-SPC C-u C-SPC ...
  (set-mark-command-repeat-pop          t)
  (save-interprogram-paste-before-kill  t)
  (blink-matching-paren-distance        nil)
  (interprogram-cut-function            (and (fboundp #'x-select-text)
                                             #'x-select-text))
  (interprogram-paste-function          (and (fboundp #'x-selection-value)
                                             #'x-selection-value))
  (inhibit-x-resources                  t)

  ;; Не сжимать кеши шрифтов во время сборки мусора.
  ;; Это нужно при «doom-modeline», если есть проблема с притормаживанием.
  ;; Я ничего не заметил, но на всякий пожарный случай поставил.
  (inhibit-compacting-font-caches       t)

  (completion-ignore-case               t)
  (delete-by-moving-to-trash            t)
  (focus-follows-mouse                  t)
  (indicate-empty-lines                 t)
  (indicate-buffer-boundaries   '((bottom . right)))
  (left-margin-width                    0)
  (max-lisp-eval-depth                  5000)
  (max-mini-window-height               0.5)
  (max-specpdl-size                     10000)
  (right-margin-width                   0)
  (read-buffer-completion-ignore-case   t)
  (scroll-conservatively                100000)
  (scroll-margin                        3)
  (scroll-step                          1)
  (select-active-regions                t)

  (truncate-partial-width-windows       nil)
  (visible-bell                         nil)
  (visible-cursor                       nil)

  (x-stretch-cursor                     t)
  (use-dialog-box                       nil)

  :config
  (message "Loading built-in \"emacs\"")
  (setq-default indent-tabs-mode        nil
                tab-width               4)

  (setq-default truncate-lines t)

  ;; ignore case
  (setq-default case-fold-search        t)

  ;; C-v и M-v не отменяют друг друга, потому что положение точки не сохраняется.
  ;; Исправим это.
  (setq scroll-preserve-screen-position 'always)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                           ;;
;;                          ЛОКАЛЬ, ВРЕМЯ                                    ;;
;;                                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Чтобы не возникало ниже написанного:
;; "Warning (yasnippet): ‘lexical-binding-Time-stamp’ modified buffer in a backquote expression.
;;  To hide this warning, add (yasnippet backquote-change) to ‘warning-suppress-types’."
;;  добавляем следующую строку.
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))


;;; insert date and time
;; my/insert-current-date-time ("C-c t d")
;; my/insert-current-time ("C-c t t")
;; recode-region ("C-x RET R")
(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `my/insert-current-date-time' func
See help of `format-time-string' for possible replacements.")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `my/insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun my/insert-current-date-time ()
  "Insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
  (interactive)
  (insert "CREATED: <")
  (insert (format-time-string current-date-time-format (current-time)))
  (insert ">")
  )

(defun my/insert-current-time ()
  "Insert the current time (1-week scope) into the current buffer."
  (interactive)
  (insert (format-time-string current-time-format (current-time)))
  (insert "\n"))

(bind-key "C-c t d" 'my/insert-current-date-time)
(bind-key "C-c t t" 'my/insert-current-time)
(bind-key "C-x RET R"   'recode-region)



;;; Time-stamp
;; when there is a "Time-stamp:
;; <Последнее обновление -- Sunday September 24 23:32:21 EEST 2017>"
;; in the first 15 lines of the file,
;; emacs will write time-stamp information there when saving the file.
(use-package time-stamp
  :hook
  (before-save . time-stamp)

  :config
  (message "Loading built-in \"time-stamp\"")
  (setq time-stamp-active         t)
  ;; check first 15 buffer lines for Time-stamp: <>
  (setq time-stamp-line-limit     15)
  (setq time-stamp-format "Последнее обновление -- %:a %:b %:d %:H:%:M:%:S %:Z %:Y")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq vc-make-backup-files          t)                 ; vc-hooks.el
(setq ad-redefinition-action            'accept                     ; advice.el
      auto-revert-verbose               t                           ; autorevert.el
      compilation-always-kill           t                           ; compile.el
      x-select-enable-clipboard         t                           ; select.el
      x-select-enable-primary           nil                         ; select.el
      )
(setq read-file-name-completion-ignore-case t)                      ; minibuffer.el
(minibuffer-depth-indicate-mode)  

;; Если значение переменной sentence-end равно nil (по умолчанию),
;; Emacs вычисляет конец предложения динамически на основе sentence-end-double-space.
;; Если же вы хотите задать свои правила (например, добавить специфические символы),
;; вы можете присвоить этой переменной строку с регулярным выражением. 
(setq  sentence-end
       "\\([。、！？]\\|……\\|[,.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")

;; У нас не принято разделять предложения двойным пробелом:
;; Emacs традиционно ожидает два пробела после точки, чтобы отличить конец
;; предложения от сокращения (например, «т. е.»).
;; Если вы предпочитаете современный стиль с одним пробелом, установите:
(setq sentence-end-double-space   nil)


(setq tab-width         4)
(setq-default indent-line-function  'insert-tab                     ; indent.el
              sh-basic-offset       4                               ; sh-script.el
              tab-always-indent     nil                             ; indent.el
              )

(with-eval-after-load 'corfu
  (setq tab-always-indent nil))




(message "-----------------------------------------------")

(let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
  (message "Loading %s...done (%.3fs)" load-file-name elapsed))

(message ".init loaded OK.")

(message "Emacs startup time: %g seconds." (float-time (time-since emacs-load-start-time)))

(message "-----------------------------------------------")












;;; Finalization
(add-hook 'after-init-hook
          `(lambda ()
             (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
	       (message "-------------------------------------------------------------------")
               (message "Loading %s...done (%.3fs) [after-init]" ,load-file-name elapsed))
             (message "        INITIALIZATION COMPLETED")
             (message "-------------------------------------------------------------------")) t)




