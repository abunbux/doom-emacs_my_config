;;; my_ui/key/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Пн фев 16 19:12:28 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Четверг февраля 19 16:11:36 MSK 2026>



(after! bind-key
  (use-package! bind-key
    :preface
    ;; my/describe-personal-keybindings ("<f6> b")
    (defun my/describe-personal-keybindings ()
      "Вызывает `describe-personal-keybindings' и перемещается в новое окно. Так
  реально удобнее! (Мне так кажется)."
      (interactive)
      (describe-personal-keybindings)
      (other-window 1))

    :bind (("<f6> b" . my/describe-personal-keybindings))
    :config
    (message "Loading \"bind-key\"")
    (setq bind-key-describe-special-forms t)
    ))




(after! which-key
  (use-package! which-key
    ;; :hook
    ;; (after-init . which-key-mode)
    :config
    (message "Loading \"which-key\"")
    ;; default

    (which-key-setup-side-window-right-bottom)
    (setq which-key-allow-imprecise-window-fit          t)
    (setq which-key-max-description-length              45)
    (setq which-key-side-window-max-width               0.75)
    (setq which-key-show-prefix                         'top)
    ;; (setq which-key-separator                        " ")
    (setq which-key-sort-order                          'which-key-key-order)

    ;; (require 'which-key)


    ;; (setq which-key-highlighted-command-list
    ;;       '(("\\`counsel-"    . ((t (:inherit default :foreground "seashell1"))))
    ;;         ("\\`swiper-"     . ((t (:inherit default :foreground "seashell1"))))
    ;;         ("\\`swiper"      . ((t (:inherit default :foreground "seashell1"))))
    ;;         ("\\`ivy-"        . ((t (:inherit default :foreground "seashell1"))))
    ;;         ("\\`helm-command-prefix" . ((t (:inherit default :weight bold :foreground "yellow"))))
    ;;         ("\\`helm-"       . ((t (:inherit default :foreground "red"))))
    ;;         ("-helm"          . ((t (:inherit default :foreground "red"))))
    ;;         ("bookmark"       . ((t (:inherit default :foreground "hot pink"))))
    ;;         ;; Highlight using the default `which-key-highlighted-command-face'
    ;;         ("register"       . ((t (:inherit default :foreground "DeepSkyBlue"))))
    ;;         ("rectangle-"     . ((t (:inherit default :foreground "LimeGreen"))))
    ;;         ("-rectangle"     . ((t (:inherit default :foreground "LimeGreen"))))

    ;;         ("hlt-"           . ((t (:inherit default :foreground "green"))))
    ;;         ("highlight-regexp"                 . ((t (:inherit default :foreground "IndianRed1"))))
    ;;         ("highlight-phrase"                 . ((t (:inherit default :foreground "IndianRed1"))))
    ;;         ("unhighlight-regexp"               . ((t (:inherit default :foreground "IndianRed1"))))
    ;;         ("hi-lock-"                         . ((t (:inherit default :foreground "IndianRed1"))))
    ;;         ("highlight-lines-matching-regexp"  . ((t (:inherit default :foreground "IndianRed1"))))
    ;;         ("highlight-symbol-"                . ((t (:inherit default :foreground "#ab82ff"))))

    ;;         ("loccur"  . ((t (:inherit default :foreground "RosyBrown1"))))

    ;;         ("dired-narrow"         . ((t (:inherit default :foreground "goldenrod1"))))


    ;;         ("find-dired"           . ((t (:inherit default :foreground "SeaGreen1"))))
    ;;         ("find-grep-dired"      . ((t (:inherit default :foreground "SeaGreen1"))))
    ;;         ("find-name-dired"      . ((t (:inherit default :foreground "SeaGreen1"))))
    ;;         ("dired-do-find"        . ((t (:inherit default :foreground "DeepSkyBlue1"))))
    ;;         ))



    ;; (set-face-attribute 'which-key-command-description-face nil :inherit 'default)
    ;; (set-face-attribute 'which-key-group-description-face nil :foreground "yellow" :weight 'bold)
    (custom-set-faces
     '(which-key-command-description-face ((t (:inherit default))))
     '(which-key-group-description-face ((t (:inherit default :foreground "yellow" :weight bold)))))



    ;; (which-key-add-key-based-replacements
    ;;   "C-d -"     "kill/delete------->"
    ;;   "C-d s"     "as root----------->"
    ;;   "C-c g"     "git--------------->"
    ;;   "C-c r"     "recentf----------->"
    ;;   "C-c t"     "insert date/time-->"
    ;;   "C-c &"     "yasnippet--------->"
    ;;   "C-x 8"     "unicode----------->"
    ;;   "C-x @"     "event------------->"
    ;;   "C-x RET"   "locale/coding----->"
    ;;   "C-x C-a"   "edebug------------>"
    ;;   "C-x C-k"   "kmacro-keymap----->"
    ;;   "C-x a"     "abbrev/expand----->"
    ;;   "C-x c h"   "helm info/doc----->"
    ;;   "C-x D"     "dired------------->"
    ;;   "C-x r"     "rect/reg/bookmark->"
    ;;   "C-x t"     "...tab...--------->"
    ;;   "C-x X"     "edebug------------>"
    ;;   "C-x v"     "vc-prefix-map----->"
    ;;   "C-x w"     "highlight--------->"
    ;;   "C-z v"     "vimish-fold------->"
    ;;   "C-z v a"   "vimish for all---->"
    ;;   "M-s a"     "search ag--------->"
    ;;   "M-h b"     "helm-------------->"
    ;;   "M-s d"     "search do ag------>"
    ;;   "M-h h"     "highlight--------->"
    ;;   "M-h l"     "hide/loccur------->"
    ;;   "M-h o"     "org-mode-map------>"
    ;;   "M-m i"     "mc insert--------->"
    ;;   "M-m n"     "mc next----------->"
    ;;   "M-m p"     "mc previous------->"
    ;;   "M-m r"     "mc regions-------->"
    ;;   "M-s f"     "file search------->"
    ;;   "M-s g"     "search grep------->"
    ;;   "M-s s"     "search in files--->"
    ;;   "<f6> c"    "counsel---------->"
    ;;   "<f6> h"    "helpful/helm----->"
    ;;   )

    ))
