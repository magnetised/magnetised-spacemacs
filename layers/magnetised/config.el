;; see:  http://www.emacswiki.org/emacs/DeletingWhitespace
;; and: http://stackoverflow.com/questions/14164292/my-emacs-deletes-trailing-white-space-how-can-i-disable-this-behaviour
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; see: http://stackoverflow.com/questions/6453955/how-do-i-prevent-emacs-from-adding-coding-information-in-the-first-line
(setq ruby-insert-encoding-magic-comment nil)

;; make "_" a word character
;; https://bitbucket.org/lyro/evil/wiki/Home
;; (modify-syntax-entry ?_ "w")
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(setq global-hl-line-mode -1)
