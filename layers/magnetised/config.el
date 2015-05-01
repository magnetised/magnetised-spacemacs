;; see:  http://www.emacswiki.org/emacs/DeletingWhitespace
;; and: http://stackoverflow.com/questions/14164292/my-emacs-deletes-trailing-white-space-how-can-i-disable-this-behaviour
(add-hook 'before-save-hook (lambda ()
    ;; markdown needs to be able to add two spaces at the end of a line
    ;; for <br>s so turn off the whitespace removal
    (when (not (eq major-mode 'markdown-mode))
        (delete-trailing-whitespace))))

(add-hook 'ruby-tools-mode-hook
  (lambda ()
    ;; make "_" a word character
    ;; https://bitbucket.org/lyro/evil/wiki/Home
    ;; (modify-syntax-entry ?_ "w")
    (modify-syntax-entry ?_ "w")
    ;; hit ctrl-shift-3 to insert an interpolation into a string
    ;; https://github.com/rejeep/ruby-tools.el#string-interpolation
    (local-set-key (kbd "C-#") #'ruby-tools-interpolate)
    ;; Don't put a 'coding ...' line at the top of every file after save
    (setq-default ruby-insert-encoding-magic-comment nil)
    ;; disable syntax checking for ruby -- it's just annoying
    (flycheck-mode -1)
  ))

;; this should turn of highlighting but I think I'd have to move it somewhere else
;; (setq global-hl-line-mode -1)
