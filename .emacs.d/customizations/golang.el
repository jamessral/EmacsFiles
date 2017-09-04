;;; Golang Stuff

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (require 'go-autocomplete)
  (require 'company-go)
  (setq gofmt-command "goimports")
  (setq tab-width 4)
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
 (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (lambda ()
    (set (make-local-variable 'company-backends) '(company-go))
    (company-mode))
)
(add-hook 'go-mode-hook 'my-go-mode-hook)
