;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Пн фев 16 19:10:11 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Понедельник февраля 23 21:19:2 MSK 2026>


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

;; Показывает в логах каждый загружаемый .el/.elc файл
(setq force-load-messages t)

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



;; Общие настройки интерфейса и поведения:
(setq-default
 window-combination-resize       t       ; Новые окна делят место равномерно
 x-stretch-cursor                t       ; Курсор растягивается на ширину глифа (напр. Tab)
 scroll-margin                   3       ; Начинать скроллинг за 3 строки до края
 scroll-step                     1
 scroll-conservatively           100000
 delete-by-moving-to-trash       t       ; Удалять в корзину
 ;; Выход из emacs без вопросов.
 ;; Даже с этой настройкой Emacs всё равно спросит:
 ;; Save file ...? (y, n, !, ., q, C-r or C-h), если у вас есть изменения в файлах.
 ;; Процессы: Если запущены активные процессы (например, терминал shell или компиляция),
 ;; Emacs спросит: Active processes exist; kill them and exit anyway?.
 confirm-kill-emacs              nil
 indent-tabs-mode                nil     ; Использовать пробелы вместо табуляции
 tab-width                       4)


;; Настройки поиска и регистров:
(setq   case-fold-search t
        read-buffer-completion-ignore-case t
        read-file-name-completion-ignore-case t
        completion-ignore-case t)

;; Навигация и сохранение позиции:
(setq   scroll-preserve-screen-position 'always
        ;; Allows navigation through the mark ring by doing C-u C-SPC once, then C-SPC
        ;; C-SPC.  instead of C-u C-SPC C-u C-SPC C-u C-SPC ...
        set-mark-command-repeat-pop t)

;; НАСТРОЙКА БЭКАПОВ:
(setq   make-backup-files               t
        ;; Эта настройка заставляет Emacs создавать резервные копии
        ;; (те самые файлы с тильдой ~ в конце) даже для тех файлов,
        ;; которые уже находятся под управлением системы контроля версий (Git, SVN и др.):
        vc-make-backup-files            t
        ;; Отключаем файлы блокировки (.#):
        create-lockfiles                 nil
        backup-by-copying               t
        backup-by-copying-when-linked   t
        backup-by-copying-when-mismatch t
        version-control                 t
        delete-old-versions             t
        kept-new-versions               40
        kept-old-versions               10
        backup-directory-alist `(("." . ,(concat doom-cache-dir "backup/")))
        )


;; force-backup-of-buffer ()
(defun my/force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist `(("." . ,(concat doom-cache-dir "backup/per-session"))))
          (kept-new-versions 5))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

;; Автоматизация при сохранении
(add-hook 'before-save-hook #'my/force-backup-of-buffer)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
;; (add-hook 'before-save-hook #'whitespace-cleanup)

(use-package! backup-walker
  :commands (backup-walker-start)
  :config
  (message "Loading \"backup-walker\""))


(use-package backup-each-save
  :hook
  (after-save . backup-each-save)
  :init
  (defun backup-each-save-filter (filename)
    (let ((ignored-filenames
    	   '("\\/cache/auto-save-list"
             "\\/cache/cache/backup"
             "\\/cache/undo-tree-history"
             "^/tmp"
             "semantic.cache$"
             "\\.emacs-places$"
    	     "\\.recentf$"
             ".newsrc\\(\\.eld\\)?"))
    	  (matched-ignored-filename nil))
      (mapc
       (lambda (x)
         (when (string-match x filename)
    	   (setq matched-ignored-filename t)))
       ignored-filenames)
      (not matched-ignored-filename)))

  (setq backup-each-save-filter-function 'backup-each-save-filter)
  (setq backup-each-save-mirror-location "~/.backup-each-save")
  :config
  (message "Loading \"backup-each-save\"")
  ;; (add-hook 'after-save-hook 'backup-each-save)
  )



;; SAVEHIST (улучшенное сохранение истории)
;; В Doom модуль (:ui workspaces) или (:completion ...) уже могут включать savehist,
;; но ручная донастройка переменных полезна:
(after! savehist
  (setq history-length                          1000
        savehist-save-minibuffer-history        t
        history-delete-duplicates               t
        savehist-additional-variables           '(command-history
                                                  minibuffer-history
                                                  file-name-history
                                                  kill-ring
                                                  mark-ring
                                                  global-mark-ring
                                                  search-ring
                                                  regexp-search-ring
                                                  regexp-history
                                                  register-alist
                                                  read-expression-history
                                                  shell-command-history))
  (add-to-list 'savehist-additional-variables 'register-alist))

;; Emacs переменная `auto-save-list-file-name' указывает на файл, в котором Emacs
;; регистрирует список всех текущих файлов автосохранения для восстановления
;; сессии после сбоя.
;; При запуске команда M-x `recover-session' читает этот файл, чтобы найти все
;; несохраненные данные и предложить их восстановить.
;; Если вдруг захотелось странного - отключить создание этого файла,
;; раскомментируй это `🡇':
;; (setq auto-save-list-file-name      nil)

(save-place-mode        1)
;; (desktop-save-mode   t)


;; Исправление/Оптимизация специфичных вещей.
;; Функция Emacs Lisp display-startup-echo-area-message отвечает за отображение начального
;; стартового сообщения в эхо-области (области минибуфера) при запуске Emacs.
;; Сообщение по умолчанию обычно следующее: «Для получения информации
;; о GNU Emacs и системе GNU введите C-h C-a»:
(fset 'display-startup-echo-area-message #'ignore)


;; auto-compression-mode — это режим, который позволяет Emacs «прозрачно» работать
;; со сжатыми файлами (например, .gz, .bz2, .xz, .zip).
;; 1. Авто-распаковка: Когда вы открываете файл logs.txt.gz, Emacs сам распаковывает
;; его в память и показывает содержимое.
;; 2. Авто-сжатие: При сохранении изменений (C-x C-s) Emacs автоматически упаковывает
;; файл обратно на диск, используя соответствующий архиватор:
(auto-compression-mode      t)


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
;;;      РАБОТА С ОКНАМИ, ФРЕЙМАМИ, БУФЕРАМИ, ФАЙЛАМИ И ДИРЕКТОРИЯМИ        ;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq help-window-select                        t
      apropos-do-all                            t
      apropos-sort-by-scores                    t
      apropos-documentation-sort-by-scores      nil)


;; `🡇' Этот код должен был бы указанные буферы (Apropos, Help и так далее)
;; заставлять открываться строго в текущем окне, но что-то не так сработало
;; и они открываются справа, что, в общем-то, не так плохо:
(setq display-buffer-alist
      (append
       '(("\\*\\(Apropos\\|Help\\|Messages\\|Man\\|Process List\\|grep\\|occur\\|flymake\\|project-.*\\)\\*"
          display-buffer-same-window
          (inhibit-same-window . nil)))
       display-buffer-alist))
;; Чтобы наши настройки `display-buffer-same-window' `🡅' работали в Doom Emacs без конфликтов,
;; нужно «успокоить» встроенную систему `popup'.
;; Doom использует макрос set-popup-rule!, который имеет приоритет над обычным display-buffer-alist.
;; :ignore t  заставит Doom игнорировать их и использовать стандартную логику (нашу `display-buffer-alist'):
(set-popup-rules!
  '(("^\\*\\(Apropos\\|Help\\|Messages\\|Man\\|grep\\|occur\\)\\*" :ignore t)
    ("^\\*project-" :ignore t)))



;; МИНИБУФЕР
(setq enable-recursive-minibuffers      t)
(minibuffer-depth-indicate-mode         1)

;; Высота временного буфера зависит от его содержимого:
(temp-buffer-resize-mode    t)

;; global-eldoc-mode — это глобальный режим, который выводит подсказки
;; по документации прямо в эхо-область (нижнюю строку) в реальном времени:
(global-eldoc-mode      -1)



;; window.el
;; (bind-key "M-1"     'delete-other-windows)
;; (bind-key "M-2"     'other-window)
(use-package! window
  :bind
  (("M-1"   .   delete-other-windows)
   ("M-2"   .   other-window)
   ("C-x |"  .   my/toggle-window-split)

   ([C-M-down]  . my/win-resize-vert-minimize)
   ([C-M-up]    . my/win-resize-enlarge-vert)
   ([C-M-left]  . my/win-resize-minimize-horiz)
   ([C-M-right] . my/win-resize-enlarge-horiz)
   ([C-M-up]    . my/win-resize-enlarge-horiz)
   ([C-M-down]  . my/win-resize-minimize-horiz)
   ([C-M-left]  . my/win-resize-enlarge-vert)
   ([C-M-right] . my/win-resize-minimize-vert)

   :map global-map
   ;; "C-x 3"
   ([remap split-window-right]  .   my/split-window-right))

  :config
  (message "Loading built-in \"window\"")


  ;; my/split-window-right ("C-x 3")
  (defun my/split-window-right ()
    "Делит окно на две части и перемещается во вновь созданное."
    (interactive)
    (split-window-right)
    (balance-windows)
    (other-window 1))
  ;; (bind-key [remap split-window-right] 'my/split-window-right global-map)


  ;; Переключает отображение фреймов (двух) - с вертикального на горизонтальный и наоборот:
  ;; my/toggle-window-split ("C-x |")
  (defun my/toggle-window-split ()
    "Переключает отображение фреймов (двух) -
        с вертикального на горизонтальный и наоборот."
    (interactive)
    (if (= (count-windows) 2)
        (let* ((this-win-buffer (window-buffer))
               (next-win-buffer (window-buffer (next-window)))
               (this-win-edges (window-edges (selected-window)))
               (next-win-edges (window-edges (next-window)))
               (this-win-2nd (not (and (<= (car this-win-edges)
                                           (car next-win-edges))
                                       (<= (cadr this-win-edges)
                                           (cadr next-win-edges)))))
               (splitter
                (if (= (car this-win-edges)
                       (car (window-edges (next-window))))
                    'split-window-horizontally
                  'split-window-vertically)))
          (delete-other-windows)
          (let ((first-win (selected-window)))
            (funcall splitter)
            (if this-win-2nd (other-window 1))
            (set-window-buffer (selected-window) this-win-buffer)
            (set-window-buffer (next-window) next-win-buffer)
            (select-window first-win)
            (if this-win-2nd (other-window 1))))))
  ;; (bind-key "C-x |" 'my/toggle-window-split)

  ;; WIN-RESIZE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  ;; (bind-key [C-M-down]  'my/win-resize-minimize-vert)
  ;; (bind-key [C-M-up]    'my/win-resize-enlarge-vert)
  ;; (bind-key [C-M-left]  'my/win-resize-minimize-horiz)
  ;; (bind-key [C-M-right] 'my/win-resize-enlarge-horiz)
  ;; (bind-key [C-M-up]    'my/win-resize-enlarge-horiz)
  ;; (bind-key [C-M-down]  'my/win-resize-minimize-horiz)
  ;; (bind-key [C-M-left]  'my/win-resize-enlarge-vert)
  ;; (bind-key [C-M-right] 'my/win-resize-minimize-vert)

  (defun my/win-resize-top-or-bot ()
    "Figure out if the current window is on top, bottom or in the
middle"
    (let* ((win-edges (window-edges))
           (this-window-y-min (nth 1 win-edges))
           (this-window-y-max (nth 3 win-edges))
           (fr-height (frame-height)))
      (cond
       ((eq 0 this-window-y-min) "top")
       ((eq (- fr-height 1) this-window-y-max) "bot")
       (t "mid"))))

  (defun my/win-resize-left-or-right ()
    "Figure out if the current window is to the left, right or in the
middle"
    (let* ((win-edges (window-edges))
           (this-window-x-min (nth 0 win-edges))
           (this-window-x-max (nth 2 win-edges))
           (fr-width (frame-width)))
      (cond
       ((eq 0 this-window-x-min) "left")
       ((eq (+ fr-width 4) this-window-x-max) "right")
       (t "mid"))))

  ;; [C-M-right] [C-M-up]
  (defun my/win-resize-enlarge-horiz ()
    (interactive)
    (cond
     ((equal "top" (my/win-resize-top-or-bot)) (enlarge-window -1))
     ((equal "bot" (my/win-resize-top-or-bot)) (enlarge-window 1))
     ((equal "mid" (my/win-resize-top-or-bot)) (enlarge-window -1))
     (t (message "nil"))))

  ;; [C-M-left] [C-M-down]
  (defun my/win-resize-minimize-horiz ()
    (interactive)
    (cond
     ((equal "top" (my/win-resize-top-or-bot)) (enlarge-window 1))
     ((equal "bot" (my/win-resize-top-or-bot)) (enlarge-window -1))
     ((equal "mid" (my/win-resize-top-or-bot)) (enlarge-window 1))
     (t (message "nil"))))

  ;; [C-M-up] [C-M-left]
  (defun my/win-resize-enlarge-vert ()
    (interactive)
    (cond
     ((equal "left" (my/win-resize-left-or-right)) (enlarge-window-horizontally -1))
     ((equal "right" (my/win-resize-left-or-right)) (enlarge-window-horizontally 1))
     ((equal "mid" (my/win-resize-left-or-right)) (enlarge-window-horizontally -1))))

  ;; [C-M-down] [C-M-right]
  (defun my/win-resize-minimize-vert ()
    (interactive)
    (cond
     ((equal "left"   (my/win-resize-left-or-right)) (enlarge-window-horizontally 1))
     ((equal "right"  (my/win-resize-left-or-right)) (enlarge-window-horizontally -1))
     ((equal "mid"    (my/win-resize-left-or-right)) (enlarge-window-horizontally 1))))

  ;; WIN-RESIZE ends here <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  )











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
;;;
;;; БЛОК РАБОТЫ  С ОКНАМИ, ФРЕЙМАМИ, БУФЕРАМИ, ФАЙЛАМИ И ДИРЕКТОРИЯМИ ЗАКОНЧИЛСЯ
;;;
;;;                                                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



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
