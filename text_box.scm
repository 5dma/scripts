(define (script-fu-text-box image drawable inText inFont inFontSize inTextColor)

(let*
	(
		(pastedlayer (car (gimp-image-get-layer-by-name image "Pasted Layer")))
		;(myimage (car (gimp-image-new 100 100 RGB)))
		;(mylayer (car (gimp-layer-new image 200 200 RGB-IMAGE "background" 100  1)))
		;(activedrawable (car (gimp-image-get-active-drawable image)))
		;(textlayer (car (gimp-text-layer-new myimage inText inFont inFontSize UNIT-PIXEL)))
	)	
	;(gimp-item-transform-scale image 0 0 100 100)
	;(gimp-image-insert-layer image mylayer 0 -1)
	(gimp-layer-scale pastedlayer 480 640 TRUE)
	(gimp-image-resize-to-layers image)
	;(gimp-image-scale image 480 640)
;	(gimp-item-transform-scale activedrawable 0 0 100 100)
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
