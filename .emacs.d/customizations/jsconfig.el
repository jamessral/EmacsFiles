;;; Javascript stuff

;; JSX w/ Flow
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-c <tab>") 'company-complete)

(require 'web-mode)

;; flow auto complete
;; skip this if you don't use company-mode
(with-eval-after-load 'company
  ;; '(add-to-list 'company-backends 'company-flow)
  '(add-to-list 'company-backends 'company-tern)
  '(add-to-list 'company-backends 'company-go))

;; Case sensitive company mode
(setq company-dabbrev-downcase nil)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(flycheck-add-mode 'javascript-eslint 'web-mode)
;;(flycheck-add-mode 'javascript-flow 'web-mode)

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun codefalling/reset-eslint-rc ()
    (let ((rc-path (if (projectile-project-p)
                       (concat (projectile-project-root) ".eslintrc"))))
      (if (file-exists-p rc-path)
          (progn
            (message rc-path)
          (setq flycheck-eslintrc rc-path)))))

(add-hook 'flycheck-mode-hook 'my/use-eslint-from-node-modules)

;; always use jsx mode for JS
(add-hook 'web-mode-hook
      (lambda ()
        ;; short circuit js mode and just do everything in jsx-mode
        (if (equal web-mode-content-type "javascript")
            (web-mode-set-content-type "jsx"))))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-hook 'web-mode-hook (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook (setq web-mode-css-indent-offset 2))
;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
