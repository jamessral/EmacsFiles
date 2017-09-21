;;; Ruby Config
(require 'seeing-is-believing)

(setq seeing-is-believing-prefix "C-.")
(add-hook 'ruby-mode-hook 'seeing-is-believing)

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(require 'ruby-test-mode)
(add-hook 'ruby-mode-hook 'ruby-test-mode)
