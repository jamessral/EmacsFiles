;;; haxe-imports-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "haxe-imports" "haxe-imports.el" (22903 24507
;;;;;;  0 0))
;;; Generated autoloads from haxe-imports.el

(autoload 'haxe-imports-scan-file "haxe-imports" "\
Scans a haxe-mode buffer, adding any import class -> package mappings to the import cache.  If called with a prefix arguments overwrites any existing cache entries for the file.

\(fn)" t nil)

(autoload 'haxe-imports-list-imports "haxe-imports" "\
Return a list of all fully-qualified packages in the current Haxe-mode buffer.

\(fn)" t nil)

(autoload 'haxe-imports-add-import-with-package "haxe-imports" "\
Add an import for the class for the name and package.

CLASS-NAME refers to the name of the class.
PACKAGE refers to the package path.

Uses no caching.

\(fn CLASS-NAME PACKAGE)" t nil)

(autoload 'haxe-imports-add-import "haxe-imports" "\
Import the Haxe class for the symbol at point.

Makes use of the symbol at the point for the CLASS-NAME, ask for a
confirmation of the class name before adding it.
Checks the import cache to see if a package entry exists for the given class.
If found, adds an import statement for the class.

If not found, prompts for the package and saves it to the cache.
If called with a prefix argument, overwrites the package for an
already-existing class name.

\(fn CLASS-NAME)" t nil)

(autoload 'haxe-imports-add-import-dwim "haxe-imports" "\
Add an import statement for the class at point.

If no class is found, prompt for the class name.  If the class's
package already exists in the cache, add it and return, otherwise
prompt for the package and cache it for future statements.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; haxe-imports-autoloads.el ends here
