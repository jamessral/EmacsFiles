;; ;;; Rust Settings

;; ;;; Code:
;; (add-hook 'rust-mode-hook
;;           ;; Add Binding to run rustfmt
;;           (lambda ()
;;             (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))


;; ;; User racer for company mode
;; (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
;; (setq racer-rust-src-path "/Users/julien/Code/rust/src") ;; Rust source code PATH

;; (add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)
;; (add-hook 'racer-mode-hook #'company-mode)

;; ;; Flycheck
;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; ;;; rust.el ends here
