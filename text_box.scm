(define (script-fu-text-box image drawable inText inFont inFontSize inTextColor)

(let*
	(
		;(myimage (car (gimp-image-new 100 100 RGB)))
		(mylayer (car (gimp-layer-new image 50 50 RGB-IMAGE "background" 50  1)))
		;(textlayer (car (gimp-text-layer-new myimage inText inFont inFontSize UNIT-PIXEL)))
	)	
	;(gimp-item-transform-scale image 0 0 100 100)
	(gimp-image-insert-layer image mylayer 0 -1)
	;(gimp-image-insert-layer myimage textlayer 0 -1)
	;(gimp-display-new myimage)
)



)

(script-fu-register
    "script-fu-text-box"                        ;func name
    "Text Box"                                  ;menu label
    "Creates a simple text box, sized to fit\
      around the user's choice of text,\
      font, font size, and color."              ;description
    "Abba"                             ;author
    "copyright 1997, Michael Terry;\
      2009, the GIMP Documentation Team"        ;copyright notice
    "October 27, 1997"                          ;date created
    ""                     ;image type that the script works on
  	SF-IMAGE       "The image"   0
  	SF-DRAWABLE    "The drawable"   0
    SF-STRING      "Text"          "Text Box"   ;a string variable
    SF-FONT        "Font"          "DejaVu Sans Bold"    ;a font variable
    SF-ADJUSTMENT  "Font size"     '(39 1 1000 1 10 0 1)
                                                ;a spin-button
    SF-COLOR       "Color"         '(0 0 0)     ;color variable
  )
(script-fu-menu-register "script-fu-text-box" "<Image>/Image/Itai/Meme")
