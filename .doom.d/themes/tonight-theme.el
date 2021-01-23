;;; themes/doom-tonight.el -*- lexical-binding: t; -*-

;;; doom-tonight-stanzu10-edit.el -*- no-byte-compile: t; -*-
(require 'doom-themes)

(defgroup doom-tonight-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-tomorrow-night-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-tonight-theme
  :type '(choice integer boolean))

(def-doom-theme tonight
  "A theme based off of Chris Kempson's Tomorrow Dark."

  ;; name        gui       256       16
  ((bg         '("#1d1f21" nil       nil          ))
   (bg-alt     '("#161719" nil       nil          ))
   (base0      '("#0d0d0d" "black"   "black"      ))
   (base1      '("#1b1b1b" "#1b1b1b"              ))
   (base2      '("#212122" "#1e1e1e"              ))
   (base3      '("#292b2b" "#292929" "brightblack"))
   (base4      '("#3f4040" "#3f3f3f" "brightblack"))
   (base5      '("#5c5e5e" "#525252" "brightblack"))
   (base6      '("#757878" "#6b6b6b" "brightblack"))
   (base7      '("#969896" "#979797" "brightblack"))
   (base8      '("#fdfccf" "#fdfccf" "light-yellow"))
   (fg          '("#a2f1ff" "#a2f1ff" "light-blue"))
   (fg-alt     (doom-darken fg 0.4))

   (grey       '("#9e9e9e" "#9a9a9a" "brightblack"))
   (red        '("#ffa3a3" "#ffa3b3" "red"))
   (orange     '("#ffbf7f" "#ffbf8f" "brightred"))
   (yellow     '("#f0c674" "#f0c674" "yellow"))
   (green      '("#6bf9b0" "#6bf9b0" "green"))
   (blue       '("#81b9ea" "#81e8da" "brightblue"))
   (dark-blue  '("#76abc9" "#76abc9" "blue"))
   (teal       '("#60ede8" "#60eee8" "teal"))
   (magenta    '("#f4ceff" "#f4cfff" "magenta"))
   (violet     '("#d7b1e2" "#d7b2e2" "brightmagenta"))
   (cyan       '("#8abeb7" "#8abeb7" "cyan"))
   (dark-cyan  (doom-darken cyan 0.4))

   ;; face categories
   (highlight      blue)
   (vertical-bar   base0)
   (selection      `(,(car (doom-lighten bg 0.1)) ,@(cdr base4)))
   (builtin        blue)
   (comments       grey)
   (doc-comments   (doom-lighten grey 0.14))
   (constants      orange)
   (functions      blue)
   (keywords       violet)
   (methods        blue)
   (operators      fg)
   (type           yellow)
   (strings        green)
   (variables      red)
   (numbers        orange)
   (region         selection)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    fg-alt)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (modeline-bg     `(,(doom-darken (car bg-alt) 0.3) ,@(cdr base3)))
   (modeline-bg-alt `(,(car bg) ,@(cdr base1)))
   (modeline-fg     base8)
   (modeline-fg-alt comments)
   (-modeline-pad
    (when doom-tomorrow-night-padded-modeline
      (if (integerp doom-tomorrow-night-padded-modeline)
          doom-tomorrow-night-padded-modeline
        4))))

  ;; --- faces ------------------------------
  ((doom-modeline-buffer-path       :foreground violet :bold bold)
   (doom-modeline-buffer-major-mode :inherit 'doom-modeline-buffer-path)

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground blue :bold bold)

   ;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground violet)
   (rainbow-delimiters-depth-2-face :foreground blue)
   (rainbow-delimiters-depth-3-face :foreground orange)
   (rainbow-delimiters-depth-4-face :foreground green)
   (rainbow-delimiters-depth-5-face :foreground magenta)
   (rainbow-delimiters-depth-6-face :foreground yellow)
   (rainbow-delimiters-depth-7-face :foreground teal)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-alt :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt))))

  ;; --- variables --------------------------
  ;; ()
  )

(provide 'doom-tonight-theme)
;;; doom-tonight-theme.el ends here
