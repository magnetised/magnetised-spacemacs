
;; remove confirmations from save-some-buffers.

(add-hook 'find-file-hook (lambda () (setq buffer-save-without-query t)))

(define-key evil-normal-state-map (kbd "RET") 'save-some-buffers)
(define-key evil-normal-state-map (kbd "C-s-k") 'move-text-up)
(define-key evil-normal-state-map (kbd "C-s-j") 'move-text-down)

;; Maps to simulate the best parts of Sublime

;; Cmd-D to select multiple words
(define-key evil-normal-state-map (kbd "s-d") 'evil-iedit-state/iedit-mode)
;; Cmd-T to bring up fuzzy file finder
(define-key evil-normal-state-map (kbd "s-t") 'helm-projectile-find-file)

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

;; Cmd-Shift-D to duplicate line
(define-key evil-normal-state-map (kbd "s-D") 'duplicate-line)


(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)


(define-key evil-motion-state-map "L" 'evil-last-non-blank)
(define-key evil-motion-state-map "H" 'evil-first-non-blank)
