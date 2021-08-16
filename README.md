# jdl-mode

Simple major mode for editing/highlighting JDL (JHipster Domain Language) files.

## Usage

Put `jdl-mode.el` in `~/.emacs.d/lisp/` folder,

then put the following in your emacs init file.

``` emacs-lisp
;; Tell emacs where is your personal elisp lib dir
;; By convention, the dir ~/.emacs.d/lisp/ is for packages you manually installed
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; load the package.
(load "jdl-mode")
;; setup files ending in “.jh” or "jdl" to open in jdl-mode
(add-to-list 'auto-mode-alist '("\\.jh\\'" . jdl-mode))
(add-to-list 'auto-mode-alist '("\\.jdl\\'" . jdl-mode))
```
