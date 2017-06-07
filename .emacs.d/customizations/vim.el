;;; Evil Mode Config
;; Use Evil Mode by Default

(setq evil-want-C-u-scroll t)
(require 'evil-leader)
(global-evil-leader-mode)

;; (require 'evil) ;; Required by evil-leader
(evil-mode 1)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(require 'evil-nerd-commenter-sdk)
(evilnc-default-hotkeys)

(require 'evil-surround)
(global-evil-surround-mode 1)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "t" 'ffip
  "j" 'evil-window-down
  "k" 'evil-window-up
  "h" 'evil-window-left
  "l" 'evil-window-right
  "+" 'evil-window-increase-height
  "-" 'evil-window-decrease-heigth
  ">" 'evil-window-increase-width
  "<" 'evil-window-decrase-width
  "c" 'evil-window-delete
  "gs" 'magit-status
  "ga" 'magit-stage-all
  "gc" 'magit-commit
  "n" 'neotree-toggle
  "s" 'evil-window-split
  "v" 'evil-window-vsplit
  "," 'evilnc-comment-or-uncomment-lines
)

(define-key evil-normal-state-local-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-local-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-local-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-local-map (kbd "C-l") 'evil-window-right)

(require 'projectile)
(defun neotree-project-dir ()
  "Open NeoTree using the git root"
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (if (neotree-toggle)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find the git root."))))

(global-set-key [f8] 'neotree-project-dir)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "ESC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)))
