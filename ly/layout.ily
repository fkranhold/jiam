%% Size and main font
#(set-global-staff-size 16)
\paper {
  myStaffSize = #16
  #(define fonts
     (make-pango-font-tree "URW Palladio L"
       "URW Classico"
       "TeX Gyre Cursor"
      (/ myStaffSize 20)))
  
  indent       = #0
  left-margin  = #37  % 1.5/8*210mm
  right-margin = #37
}

\header {
  tagline  = ""
}
