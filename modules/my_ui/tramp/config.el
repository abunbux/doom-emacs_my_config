;;; my_ui/tramp/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Вт фев 17 13:32:46 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Вторник февраля 17 15:54:9 MSK 2026>

(use-package! tramp
  :defer t
  :preface

  (defface find-file-root-header-face
    '((t (:foreground "white" :background "red3")))
    "*Face use to display header-lines for files opened as root.")

  ;; Если буфер открыт от root - будет светиться вверху большой баннер с предупреждением.
  (defun find-file-root-header-warning ()
    "*Display a warning in header line of the current buffer.
This function is suitable to add to `find-file-hook'."
    (when (string-equal
           (file-remote-p (or buffer-file-name default-directory) 'user)
           "root")
      (let* ((warning "WARNING: EDITING FILE AS ROOT!")
             (space (+ 6 (- (window-width) (length warning))))
             (bracket (make-string (/ space 2) ?-))
             (warning (concat bracket warning bracket)))
        (setq header-line-format
              (propertize  warning 'face 'find-file-root-header-face)))))

  (add-hook 'find-file-hook 'find-file-root-header-warning)
  (add-hook 'dired-mode-hook 'find-file-root-header-warning)

  :init
  (setq tramp-default-method        "ssh"
        tramp-verbose               6)
  
  (setq gpg-agent-ssh-support t)
  
  (setq epg-gpg-program "/usr/bin/gpg2")
  (setq epa-pinentry-mode 'loopback)

  ;; Кэшировать пароль на час
  (setq password-cache-expiry 3600)
  
  
  :config
  (message "Loading built-in \"tramp\"")


  (setq auth-sources '("~/.authinfo.gpg" "~/.authinfo"))

  ;; (add-to-list 'tramp-default-method-alist
  ;;              '("\\`localhost\\'"
  ;;                "\\`root\\'"
  ;;                "su"
  ;;                "sudo"
  ;;                ""
  ;;                "abunbux"
  ;;                "ssh"))

  ;; (use-package tramp-sh
  ;;   :defer t
  ;;   :config
  ;;   (message "Loading built-in \"tramp-sh\"")
  ;;   (require 'tramp-sh nil t)
  ;;   (setf tramp-ssh-controlmaster-options (concat "-o SendEnv TRAMP=yes " tramp-ssh-controlmaster-options))
  ;;   )

  )
