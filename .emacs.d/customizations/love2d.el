(defvar love2d-program "/Applications/love.app/Contents/MacOS/love")

(defun love2d-launch-current ()
  (interactive)
  (let ((app-root (locate-dominating-file (buffer-file-name) "main.lua")))
    (if app-root
        (shell-command (format "%s %s &" love2d-program app-root))
      (error "main.lua not found"))))
