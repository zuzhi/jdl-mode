;;; jdl-mode.el --- Simple major mode for editing/highlighting JDL files

;; Copyright © 2021, by zuzhi

;; Author: zuzhi hu ( zuzhi.hu@gmail.com )
;; Version: 0.1.0
;; Created: 15 Aug 2021
;; Keywords: languages
;; Homepage: https://github.com/zuzhi/jdl-mode

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 3.

;;; Commentary:

;; TODO short description here

;; TODO full doc on how to use here

;;; Code:
;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq jdl-font-lock-keywords
      (let* (
             ;; define several category of keywords
             (x-keywords '("application" "config" "entities" "entity" "enum" "relationship" "paginate"
                           "filter" "service" "microservice" "deployment"))
             (x-types '("String" "Integer" "Long" "BigDecimal" "Float" "Double" "Enum"
                        "Boolean" "LocalDate" "ZonedDateTime" "Instant" "Duration" "UUID"
                        "Blob" "AnyBlob" "ImageBlob" "TextBlob"))
             (x-constants '("required" "maxlength" "minlength" "min" "max"))
             (x-events '("to" "with"))
             (x-functions '("baseName" "applicationType" "packageName" "buildTool" "testFrameworks"
                            "authenticationType" "prodDatabaseType" "cacheProvider" "clientFramework"
                            "databaseType" "devDatabaseType" "enableHibernateCache" "enableTranslation"
                            "nativeLanguage" "languages" "useSass" "serviceDiscoveryType" "reactive"
                            "serverPort" "skipUserManagement" "deploymentType" "appsFolders"
                            "dockerRepositoryName" "istio" "kubernetesServiceType" "kubernetesNamespace"
                            "ingressDomain" "searchEngine"))

             ;; generate regex string for each category of keywords
             (x-keywords-regexp (regexp-opt x-keywords 'words))
             (x-types-regexp (regexp-opt x-types 'words))
             (x-constants-regexp (regexp-opt x-constants 'words))
             (x-events-regexp (regexp-opt x-events 'words))
             (x-functions-regexp (regexp-opt x-functions 'words)))

        `(
          (,x-types-regexp . font-lock-type-face)
          (,x-constants-regexp . font-lock-constant-face)
          (,x-events-regexp . font-lock-builtin-face)
          (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

;; (setq jdl-highlights
;;       '(("application\\|config\\|entity\\|entities\\|enum\\|relationship" . font-lock-function-name-face)
;;         ("ZonedDateTime\\|Integer\\|Double\\|LocalDate\\|String\\|paginate" . font-lock-constant-face)))

(define-derived-mode jdl-mode fundamental-mode "jdl"
  "Major mode for editing/highlighting JDL (JHipster Domain Language)."
  (setq font-lock-defaults '((jdl-font-lock-keywords))))

;; setup files ending in “.jh” or "jdl" to open in jdl-mode
(add-to-list 'auto-mode-alist '("\\.jh\\'" . jdl-mode))
(add-to-list 'auto-mode-alist '("\\.jdl\\'" . jdl-mode))

;; add the mode to the `features' list
(provide 'jdl-mode)

;;; jdl-mode.el ends here
