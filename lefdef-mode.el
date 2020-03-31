;; major mode for editing lef/def files

;; 1. keyword highlights
;; 2. indentation

;; (define-derived-mode lefdef-mode fundamental-mode "LEF/DEF"
;;   "A mode for editing lef/def files.")

(define-generic-mode lefdef-mode
  ;; comment
  '("#")
  ;; keyword list, using font-lock-keyword-face
  '("VERSION" "MACRO" "PROPERTY" "NAMESCASESENSITIVE" "BUSBITCHARS"
    "DIVIDERCHAR" "CLASS" "ORIGIN" "SIZE" "BY" "SYMMETRY" "SITE" "PIN"
    "DIRECTION" "PORT" "LAYER" "RECT" "END" 
    "DESIGN" "UNITS" "DISTANCE" "MICRONS" "DIEAREA" "ROW" "TRACKS" "VIAS"
    "DO" "STEP" "OFFSET" "PITCH" "TYPE" "WIDTH" "MAXWIDTH"
    "SPACINGTABLE" "PARALLELRUNLENGTH" "AREA" "MINENCLOSEDAREA"
    "MINIMUMCUT" "LENGTH" "WITHIN" "SPACING" "DATABASE" "MANUFACTURINGGRID"
    "PROPERTYDEFINITIONS" "STRING" "LIBRARY" "VIA" "VIARULE" "ENCLOSURE"
    "MAXVIASTACK" "RANGE" "TO" "COMPONENTS")
  ;; additional font lock list font-lock-keywords
  ;; candidtates: font-lock-type-face, font-lock-warning-face, font-lock-variable-name-face
  '(("\\(?:ROW\\|LAYER\\|END\\|MACRO\\|LIBRARY\\|VIA\\|VIARULE\\|SITE\\) \\([a-z_A-Z0-9]+\\)"
     . (1 font-lock-variable-name-face))
    ("\\bON\\b\\|\\bN\\b\\|\\bFS\\b" . font-lock-constant-face)
    ("CORE\\|DEFAULT\\|TOPOFSTACKONLY\\|GENERATE\\|ROUTING\\|HORIZONTAL\\|VERTICAL" . font-lock-constant-face)
    ("UNPLACED" . font-lock-constant-face)
    ("INPUT\\|OUTPUT" . font-lock-constant-face)
    ("\\bCUT\\b\\|\\bADJACENTCUTS\\b" . font-lock-constant-face)
    ("PROPERTY \\([a-z_A-Z0-9]+\\)" . (1 font-lock-variable-name-face))
    ("core" . font-lock-constant-face)
    ("\\b[+-]?[0-9]*\\(\\.[0-9]*\\)?\\b" . racket-selfeval-face)
    )
  ;; auto-mode-alist
  '("\\.lef\\'" "\\.def\\'")
  '())

(provide 'lefdef-mode)
