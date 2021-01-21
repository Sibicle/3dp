G28                         ; home X and Y
M564 H0                     ; disable axis limits
M140 S60                    ; set bed temp
G10 P0 S200 R150            ; set tool temp
M561                        ; cancel mesh compensation
G0 X200 Y200 Z10 F20000     ; jog to center

;
; jog down by increments until nozzle is just touching bed
;

; G92 Z0                     ; set Z = 0
; G0 Z20 F500                ; jog nozzle up
; G30 S-1                    ; deploy z probe and trigger

;
; view reported height and set with G31 in config.g
;
