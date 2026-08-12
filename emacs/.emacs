;; official baby emacs
;; the goal is to actually learn everything
;; from scratch in general as well.

;; TODO
;; Make the including files more organized completely

(setq custom-file "~/.emacs.custom")
(load-file "~/.emacs.custom")

;; global font size
(add-to-list 'default-frame-alist `(font . "Iosevka-16"))

(menu-bar-mode 0)
(tool-bar-mode 0)

(scroll-bar-mode 0)
(column-number-mode 1)
(display-global-numbers-mode)
