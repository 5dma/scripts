(define (script-fu-text-box image drawable inText inFont inFontSize)

(let*
	(
		(pastedlayer (car (gimp-image-get-layer-by-name image "Pasted Layer")))
		;(myimage (car (gimp-image-new 100 100 RGB)))
		(calloutlayer (car (gimp-layer-new image 480 640 RGBA-IMAGE "callout" 0  1)))
		(balloonlayer (car (gimp-layer-new image 480 640 RGBA-IMAGE "balloon" 0  1)))
		;(activedrawable (car (gimp-image-get-active-drawable image)))
		(textlayer (car (gimp-text-layer-new image inText inFont inFontSize UNIT-PIXEL)))
		(balloonstem (car (gimp-vectors-new image "Balloon stem")))
	)	
	(gimp-context-set-foreground '(0 0 0))
	(gimp-context-set-background '(246 244 192))
	;(gimp-item-transform-scale image 0 0 100 100)
	;(gimp-layer-resize pastedlayer 480 640 0 0)
	;(gimp-image-resize-to-layers image)
	;(gimp-image-resize image 480 640 0 0)
	(gimp-image-scale image 480 640)
	(gimp-layer-scale pastedlayer 480 640 1)
	;(gimp-image-scale image 480 640)
;	(gimp-item-transform-scale activedrawable 0 0 100 100)
	(gimp-image-insert-layer image balloonlayer 0 -1)
	(gimp-image-insert-layer image calloutlayer 0 -1)
	(gimp-image-insert-layer image textlayer 0 -1)
	(gimp-vectors-stroke-new-from-points balloonstem 0 6  #(100 100 100 100 100 100 200 200 200 200 200 200 300 300 300 300 300 300) 0)
	;(gimp-vectors-stroke-new-from-points balloonstem 0 6  #(100 100 200 200 300 300) 0)
	(gimp-item-set-visible balloonstem 1)
	(gimp-image-insert-vectors image balloonstem 0 -1)
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
  )
(script-fu-menu-register "script-fu-text-box" "<Image>/Image/Itai/Meme")
