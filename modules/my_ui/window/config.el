;;; my_ui/window/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Пн фев 16 19:13:41 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Понедельник февраля 16 19:13:44 MSK 2026>


;; (bind-key "M-1"     'delete-other-windows)
;; (bind-key "M-2"     'other-window)

(use-package! emacs
  :bind
  (
   ("M-1"   .   delete-other-windows)
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
   ([remap split-window-right]  .   my/split-window-right)
   )
  :config
  (message "Loading built-in \"window\" - \"pseudo emacs\"")
  ;; Ignore split window vertically
  (setq split-height-threshold            nil                         ; window.el
        ;; split-height-threshold        48                           ; window.el
        ;; split-height-threshold        4                            ; window.el
        ;; split-width-threshold         140                          ; window.el
        split-width-threshold             40                          ; window.el
        window-min-height                 7                           ; window.el
        )
  (add-to-list 'display-buffer-alist                                  ; window.el
               '("*Apropos*" display-buffer-same-window))             ; window.el


  ;; my/split-window-right ("C-x 3")
  (defun my/split-window-right ()
    (interactive)
    (split-window-right)
    (balance-windows)
    (other-window 1))
  ;; (bind-key [remap split-window-right] 'my/split-window-right global-map)


  ;; Переключает отображение фреймов (двух) - с вертикального на горизонтальный и наоборот
  ;; my/toggle-window-split ("C-x |")
  (defun my/toggle-window-split ()
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

