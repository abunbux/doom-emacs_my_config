;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Пн фев 16 19:10:11 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Воскресенье февраля 22 14:21:22 MSK 2026>


;;; Commentary:



;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;; Code:

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

(setq force-load-messages t) ; Показывает в логах каждый загружаемый .el/.elc файл

(setq-default initial-frame-alist   (quote    ((fullscreen . maximized))))

(setq doom-font (font-spec :family "JetBrainsMono" :size 22 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 22)
      doom-symbol-font (font-spec :family "FiraCode Nerd Font Mono")
      doom-big-font (font-spec :family "JetBrainsMono" :size 24))

;; Назначаем `Symbola' фолбэк-шрифтом (fallback).
;; Это значит: если основной шрифт не знает какой-то символ (стрелку, эмодзи, редкий глиф),
;; Emacs автоматически возьмет его из Symbola:
(defun setup-unicode-fallback-h ()
  (set-fontset-font t 'unicode (font-spec :family "Symbola") nil 'append))
(add-hook 'doom-init-ui-hook #'setup-unicode-fallback-h)

;; Что делает этот `🡅' код:
;;      'unicode        - указывает Emacs использовать этот шрифт для всех символов,
;;                      которые не входят в базовую латиницу/кириллицу.
;;      'append         - важнейший параметр. Он ставит Symbola в конец очереди.
;;                      Сначала Emacs ищет символ в вашем основном шрифте (например, JetBrains Mono),
;;                      и только если его там нет - лезет в Symbola.
;;      doom-init-ui-hook - гарантирует, что настройка применится после того, как Doom загрузит свои стандартные шрифты.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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



(use-package! emacs
  :custom
  ;; Выход из emacs без вопросов.
  ;; Даже с этой настройкой Emacs всё равно спросит:
  ;; Save file ...? (y, n, !, ., q, C-r or C-h), если у вас есть изменения в файлах.
  ;; Процессы: Если запущены активные процессы (например, терминал shell или компиляция),
  ;; Emacs спросит: Active processes exist; kill them and exit anyway?.
  (confirm-kill-emacs                   nil)
  (kill-whole-line                      t)
  (kill-ring-max                        1000)
  ;; Allows navigation through the mark ring by doing C-u C-SPC once, then C-SPC
  ;; C-SPC.  instead of C-u C-SPC C-u C-SPC C-u C-SPC ...
  (set-mark-command-repeat-pop          t)
  (mark-ring-max                        64)
  (global-mark-ring-max                 64)
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
  (select-enable-clipboard              t)
  (select-enable-primary                nil)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;                          ЛОКАЛЬ, ВРЕМЯ                                  ;;;
;;;                                                                         ;;;
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
(use-package! time-stamp
  :hook
  (before-save . time-stamp)
  :config
  (message "Loading built-in \"time-stamp\"")
  (setq time-stamp-active         t)
  ;; check first 15 buffer lines for Time-stamp: <>
  (setq time-stamp-line-limit     15)
  (setq time-stamp-format "Последнее обновление -- %:a %:b %:d %:H:%:M:%:S %:Z %:Y")
  )

(use-package! reverse-im
  :config
  (reverse-im-activate "russian-computer")
  (message "Loading \"reverse-im\""))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;                    БЛОК  ЛОКАЛЬ, ВРЕМЯ ЗАКОНЧИЛСЯ                       ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;                          РЕДАКТИРОВАНИЕ                                 ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;; Встроенная функция для перемещения линии `drag-stuff-down' - `M-<down>'
;; Встроенная функция для дублирования линии `duplicate-line',
;; Встроенная функция для дублирования линии или выделения `duplicate-dwim':
(bind-key "C-x <down>" 'duplicate-dwim)


;; indent buffer-region
;; https://github.com/djui/dot-files/blob/master/dot-emacs ****************
;; my/indent-region-or-buffer ("C-M-\\")
(defun my/indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))
(defun my/indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (my/indent-buffer)
        (message "Indented buffer.")))))
(bind-key "C-M-\\" 'my/indent-region-or-buffer)


;; Если есть выделение - комментирует выделение, если выделения нет - комментирует строку.
;; https://github.com/rigidus/.emacs.d/blob/master/init.el
;; my/comment-or-uncomment-this ("C-x /")
(defun my/comment-or-uncomment-this (&optional lines)
  (interactive "P")
  (if mark-active
      (if (< (mark) (point))
          (comment-or-uncomment-region (mark) (point))
        (comment-or-uncomment-region (point) (mark)))
    (comment-or-uncomment-region
     (line-beginning-position)
     (line-end-position lines))))
(bind-key "C-x /" 'my/comment-or-uncomment-this)



;;; delsel.el
(bind-key "C-g" 'minibuffer-keyboard-quit mode-specific-map)

;;; Работа с выделением.
;;; При существующем выделении (region) нажатие:
;;;     -d	Удалить region;
;;;     -w	Скопировать region;
;;;     -c	Дублировать, то есть скопировать и сразу вставить.

(bind-key
 (kbd "d")
 (lambda (arg)
   (interactive "p")
   (if (region-active-p)
       (delete-active-region)
     (self-insert-command arg))))

(bind-key
 (kbd "w")
 (lambda (arg)
   (interactive "p")
   (if (region-active-p)
       (call-interactively 'kill-ring-save)
     (self-insert-command arg))))

(bind-key
 (kbd "c")
 (lambda (arg)
   (interactive "p")
   (if (region-active-p)
       (let ((str (buffer-substring-no-properties
                   (region-beginning)
                   (region-end))))
         (goto-char (region-end))
         (insert "\n" str))
     (self-insert-command arg))))


(with-eval-after-load 'corfu
  (setq tab-always-indent nil))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;                РАЗДЕЛ РЕДАКТИРОВАНИЯ ЗДЕСЬ ЗАКОНЧИЛСЯ                   ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;             ИСТОРИЯ, РЕЗЕРВНЫЕ КОПИИ, КОНТРОЛЬ ВЕРСИЙ                   ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Emacs переменная `auto-save-list-file-name' указывает на файл, в котором Emacs
;; регистрирует список всех текущих файлов автосохранения для восстановления
;; сессии после сбоя.
;; При запуске команда M-x `recover-session' читает этот файл, чтобы найти все
;; несохраненные данные и предложить их восстановить.
;; Если вдруг захотелось странного - отключить создание этого файла,
;; раскомментируй это `🡇':
;; (setq auto-save-list-file-name      nil)

;; savehist
(use-package! savehist
  :hook (after-init . savehist-mode)
  :config
  (message "Loading built-in \"savehist\"")
  (setq savehist-additional-variables
        '(command-history
          file-name-history
          global-mark-ring
          kill-ring
          mark-ring
          minibuffer-history
          regexp-history
          read-expression-history
          regexp-search-ring
          ring
          savehist-minibuffer-history-variables
          search
          search-ring
          set-variable-value-history
          shell-command-history))
  (setq savehist-file (concat doom-cache-dir "savehist")
        ;; ;; По умолчанию `savehist-autosave-interval' имеет значение 300,
        ;; ;; пусть так и остаётся
        ;; savehist-autosave-interval           60
        savehist-save-minibuffer-history        t
        history-length                          1000
        history-delete-duplicates               t)
  )




(after! files
  (use-package! files
    :hook
    (before-save . delete-trailing-whitespace)
    ;; (before-save . whitespace-cleanup)
    (before-save . force-backup-of-buffer)
    :custom
    ;; 1. Бэкапы и Автосохранение (в кэш Doom, чтобы не мусорить):
    ;; Отключаем файлы блокировки (.#)
    (create-lockfiles                 nil)
    (make-backup-files                t)
    ;; Эта настройка заставляет Emacs создавать резервные копии
    ;; (те самые файлы с тильдой ~ в конце) даже для тех файлов,
    ;; которые уже находятся под управлением системы контроля версий (Git, SVN и др.)
    (vc-make-backup-files             t)
    (version-control                  t)
    (backup-by-copying                t)
    (backup-by-copying-when-linked    t)
    (backup-by-copying-when-mismatch  t)
    (delete-old-versions              t)
    (kept-new-versions                40)
    (kept-old-versions                10)

    ;; 2. Поведение интерфейса и процессов
    (auto-revert-verbose t)
    (compilation-always-kill t)
    (ad-redefinition-action 'accept)

    :config
    (message "Loading built-in \"files\"")
    (setq backup-directory-alist `(("." . ,(concat doom-cache-dir "backup/"))))
    (setq-default find-file-visit-truename t)

    ;; force-backup-of-buffer ()
    (defun force-backup-of-buffer ()
      ;; Make a special "per session" backup at the first save of each
      ;; emacs session.
      (when (not buffer-backed-up)
        ;; Override the default parameters for per-session backups.
        (let ((backup-directory-alist `(("." . ,(concat doom-cache-dir "backup/per-session"))))
              (kept-new-versions 10))
          (backup-buffer)))
      ;; Make a "per save" backup on each save.  The first save results in
      ;; both a per-session and a per-save backup, to keep the numbering
      ;; of per-save backups consistent.
      (let ((buffer-backed-up nil))
        (backup-buffer)))
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;      БЛОК ИСТОРИЯ, РЕЗЕРВНЫЕ КОПИИ, КОНТРОЛЬ ВЕРСИЙ  ЗАКОНЧИЛСЯ         ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;           ПОДСКАЗКИ, СОРТИРОВКА И ОТОБРАЖЕНИЕ РЕЗУЛЬТАТОВ               ;;;
;;;
;;; vertico - это современный и минималистичный интерфейс для автодополнения в минибуфере.
;;;             В отличие от Ivy или Helm, он не переписывает стандартные функции Emacs,
;;;             а использует встроенный механизм completing-read, что делает его очень
;;;             быстрым и стабильным.
;;; Обычно Vertico используют не один, а в связке с другими модулями, которые Doom включает
;;;             автоматически при активации vertico:
;;; orderless   - позволяет искать компоненты запроса в любом порядке через пробел.
;;; consult     - предоставляет полезные команды поиска (например, consult-line вместо Swiper или consult-buffer).
;;; marginalia  - добавляет полезные пояснения в список кандидатов (права доступа к файлам, описания функций).
;;; позволяет      - embark вызывать контекстные действия для выбранного кандидата (например, удалить файл прямо из списка поиска).
;;;
;;;
;;; corfu - это современный и минималистичный интерфейс для автодополнения в тексте (completion-at-point) для Emacs.
;;;             В Doom Emacs он является альтернативой стандартному модулю company.
;;;
;;;     в терминале M-x `completion-at-point' или `C-M-i'                   ;;;
;;;     Не забываем:                                                        ;;;
;;;     M-x `nerd-icons-install-fonts'                                      ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(with-eval-after-load 'orderless
  (message "Loading \"orderless\"")

  (setq orderless-matching-styles '(orderless-regexp
                                    orderless-literal
                                    ;; Добавляет fuzzy-поиск
                                    ;; orderless-flex
                                    ))
  ;; Чтобы не использовать постоянно flex (fuzzy) поиск будет использована функция,
  ;; которая включает flex (fuzzy) поиск,когда ставишь в конце запроса `~':
  (defun my/orderless-dispatch (pattern _index _total)
    (cond
     ;; Если слово заканчивается на ~, использовать flex (fuzzy)
     ((string-suffix-p "~" pattern)
      `(orderless-flex . ,(substring pattern 0 -1)))
     ;; Если слово начинается на !, использовать исключение (not)
     ((string-prefix-p "!" pattern)
      `(orderless-not . ,(substring pattern 1)))))

  (setq orderless-style-dispatchers '(my/orderless-dispatch)
        ))


(use-package! vertico-prescient
  :after vertico
  :config
  ;; Оставляем только сортировку (фреквенцию), отключаем фильтрацию prescient:
  (setq vertico-prescient-enable-filtering nil)
  ;; Включаем интеграцию с Vertico
  (vertico-prescient-mode 1)
  ;; Включаем сохранение истории выбора между сессиями:
  (prescient-persist-mode 1)
  (message "Loading \"vertico-prescient\"")
  )

;; С помощью пакета corfu-terminal corfu будет нормально работать в консольном режиме:
(use-package! corfu-terminal
  :after corfu
  :config
  (message "Loading \"corfu-terminal\"")
  (unless (display-graphic-p)
    (corfu-terminal-mode +1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;    БЛОК ПОДСКАЗОК, СОРТИРОВКИ И ОТОБРАЖЕНИЯ РЕЗУЛЬТАТОВ ЗАКОНЧИЛСЯ      ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;             РАБОТА С БУФЕРАМИ, ФАЙЛАМИ И ДИРЕКТОРИЯМИ                   ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Переименовывает текущий буфер
;; my/rename-current-buffer-file ()
(defun my/rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))


;; Копирует абсолютный путь к файлу и имя файла.
;; my/copy-full-file-name-to-clipboard ()
(defun my/copy-full-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))


;; Копирует имя файла без директории.
;; my/copy-buffer-file-name-nondirectory ()
(defun my/copy-buffer-file-name-nondirectory ()
  (interactive)
  (kill-new (file-name-nondirectory buffer-file-name)))


;; Копирует имя директории.
;; my/copy-buffer-file-name-directory ()
(defun my/copy-buffer-file-name-directory ()
  (interactive)
  (kill-new (file-name-directory buffer-file-name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                         ;;;
;;;      БЛОК РАБОТЫ  С БУФЕРАМИ, ФАЙЛАМИ И ДИРЕКТОРИЯМИ ЗАКОНЧИЛСЯ         ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






(setq read-file-name-completion-ignore-case     t)              ; minibuffer.el
(setq enable-recursive-minibuffers              t)
(minibuffer-depth-indicate-mode                 1)


(after! markdown-mode
  (use-package! markdown-mode
    :init
    (setq markdown-bold-underscore                t
          markdown-command                        "pandoc"
          ;; syntax highlighting for latex fragments
          markdown-enable-math                    t
          markdown-enable-wiki-links              t
          markdown-fontify-code-blocks-natively   t
          markdown-header-scaling                 t
          markdown-hide-markup                    nil
          ;; trigger with `markdown-toggle-url-hiding'
          markdown-hide-urls                      nil
          markdown-indent-function                t
          markdown-italic-underscore              t
          ;; for compat with org-mode
          markdown-gfm-uppercase-checkbox         t)
    ;; (setq markdown-command "multimarkdown")
    :config
    (message "Loading \"markdown-mode\"")

    ;; Don't change font in code blocks
    ;; (set-face-attribute 'markdown-code-face nil
    ;;                     :inherit nil)

    (custom-set-faces
     '(markdown-header-delimiter-face   ((t (:foreground "mediumpurple"))))
     '(markdown-header-face-1           ((t (:foreground "LimeGreen" :weight bold :height 1.0))))
     '(markdown-header-face-2           ((t (:foreground "lightslateblue" :weight bold :height 1.0))))
     '(markdown-header-face-3           ((t (:foreground "mediumpurple1" :weight bold :height 1.0))))
     '(markdown-link-face               ((t (:background "#0e1014" :foreground "#bd93f9"))))
     '(markdown-list-face               ((t (:foreground "mediumpurple"))))
     '(markdown-pre-face                ((t (:foreground "#bd98fe"))))
     )))



(message "-----------------------------------------------")


;; Используем хук Doom, который срабатывает, когда всё точно готово
(add-hook 'doom-after-init-hook
          (lambda ()
            (message "--- Doom ready in %s (GCs: %d) ---"
                     (emacs-init-time)
                     gcs-done)))

(message "-----------------------------------------------")
