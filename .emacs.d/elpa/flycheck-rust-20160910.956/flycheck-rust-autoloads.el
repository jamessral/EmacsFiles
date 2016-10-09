;;; flycheck-rust-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "flycheck-rust" "flycheck-rust.el" (22491 61879
;;;;;;  818807 642000))
;;; Generated autoloads from flycheck-rust.el

(autoload 'flycheck-rust-setup "flycheck-rust" "\
Setup Rust in Flycheck.

If the current file is part of a Cargo project, configure
Flycheck according to the Cargo project layout.

\(fn)" t nil)

(autoload 'flycheck-rust-explain-error "flycheck-rust" "\
Explain ERROR-CODE by invoking `rustc --explain'.

ERROR-CODE defaults to the code of the error under point.

\(fn ERROR-CODE)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; flycheck-rust-autoloads.el ends here
