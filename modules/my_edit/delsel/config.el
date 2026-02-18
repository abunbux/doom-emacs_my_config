;;; my_ui/delsel/config.el -*- lexical-binding: t; -*-


;;; CREATED: <Пн фев 16 19:11:48 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Понедельник февраля 16 19:11:54 MSK 2026>


;;; delsel.el

(bind-key "C-g" 'minibuffer-keyboard-quit mode-specific-map)


  (message "Loading built-in \"delsel\"")

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


