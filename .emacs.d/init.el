;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))

;; Fix for the warnings

(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)
;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)
(add-hook 'after-init-hook 'global-company-mode)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    ;; paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    ;; clojure-mode

    ;; extra syntax highlighting for clojure
    ;; clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    ;; cider
    omnisharp
    ruby-mode
    js2-mode
    web-mode
    autopair
    company
    multi-term
    evil
    merlin
    ocp-indent
    go-mode
    rust-mode
    clojurescript-mode
    cider
    clojure-mode
    racket-mode
    rustfmt
    paredit
    slime
    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit
    ))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'flycheck)
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'git)
;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make editing a bit nicer.
;; (load "vim.el")

;; Show tabs as 4 spaces
(setq tab-width 4)

(load "editing.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

(load "jsconfig.el")

(load "golang.el")

(load "rust.el")
;; Love2d
(load "love2d.el")
;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")
(window-numbering-mode)

;; Langauage-specific
;; (load "setup-clojure.el")

;; Godot Script
(load "gdscript.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(autopair-global-mode t)
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" "5310b88333fc64c0cb34a27f42fa55ce371438a55f02ac7a4b93519d148bd03d" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "f2057733672d3b119791f5b7d1a778bf8880121f22ea122a21d221b45081f49e" "0eef522d30756a80b28333f05c7eed5721f2ba9b3eaaff244ea4c6f6a1b8ac62" "5673c365c8679addfb44f3d91d6b880c3266766b605c99f2d9b00745202e75f6" "8d3c5e9ba9dcd05020ccebb3cc615e40e7623b267b69314bdb70fe473dd9c7a8" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "84f35ac02435aa65aef82f510756ab21f173624fcb332dd81e3c9f2adaf6b85b" "9b349c5c09056c292d635725cecf587b44780e061c3d2477383d7eb25d4cdd68" "6b1e6953a08acf12843973ec25d69dbfa1a53d869f649dc991a56fbdf0d7eb9e" "363de9fd1194546e7461bdb766793b1442c222376faa8254b8eafaf25afe48dc" "4b3c24a1b13f29c6c6926c194eb8aa76e4ddab7a487cd171043b88ac1f3b4481" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "8b30636c9a903a9fa38c7dcf779da0724a37959967b6e4c714fdc3b3fe0b8653" "5999e12c8070b9090a2a1bbcd02ec28906e150bb2cdce5ace4f965c76cf30476" "770181eda0f652ef9293e8db103a7e5ca629c516ca33dfa4709e2c8a0e7120f3" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "3fd0fda6c3842e59f3a307d01f105cce74e1981c6670bb17588557b4cebfe1a7" "003a9aa9e4acb50001a006cfde61a6c3012d373c4763b48ceb9d523ceba66829" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "0820d191ae80dcadc1802b3499f84c07a09803f2cb90b343678bdb03d225b26b" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "32e3693cd7610599c59997fee36a68e7dd34f21db312a13ff8c7e738675b6dfc" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" default)))
 '(debug-on-error nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (tuareg flymake-ruby atom-one-dark-theme company-racer restclient railscasts-theme molokai-theme ace-jump-mode key-chord multiple-cursors expand-region yafolding slack utop yasnippet-bundle magit gited git company-go go-autocomplete flymake-rust flymake-lua company-lua luarocks lua-mode tao-theme all-the-icons-dired haxe-imports haxe-mode gruvbox-theme meghanada typescript tide stack-mode company-cmake company-c-headers flycheck-elixir alchemist haskell-tab-indent flycheck-haskell haskell-emacs xkcd w3m company-erlang ag flycheck window-numbering elpy multi-term elm-mode doom-themes slime use-package fiplr flycheck-rust flycheck-ycmd flycheck-ocaml flycheck-clojure markdown-mode+ god-mode color-theme-sanityinc-solarized evil-surround evil-nerd-commenter evil-leader haskell-mode rjsx-mode company-tern relative-line-numbers clojurescript-mode racket-mode helm omnisharp haml-mode company-flow eslint-fix autopair yasnippet web-mode tagedit scss-mode rustfmt rust-mode ruby-tools ruby-end ruby-dev ruby-block ruby-additional rubocop rsense robe rbenv rainbow-mode rainbow-delimiters projectile powerline popup neotree monokai-theme macrostep jsx-mode js2-mode javascript highlight-indentation go-mode exec-path-from-shell evil epc enh-ruby-mode doremi company-ycmd company-inf-ruby color-theme-solarized color-theme-sanityinc-tomorrow color-theme-monokai clojure-mode-extra-font-locking cider)))
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
