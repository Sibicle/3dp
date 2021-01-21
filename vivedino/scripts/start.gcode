; start script

M42 P24 S255                       ; R
M42 P25 S255                       ; G
M42 P26 S255                       ; B

M280 P7 S160
T0
G92 E0                             ; set extruder position 0
G1 E-10 F1800                      ; retract filament 10mm
G32                                ; run bed.g macro
; G29                                ; probe mesh
G29 S1                             ; load mesh from sd card
G1 X0 Y0 F4800                     ; move to origin
G92 E0                             ; set extruder position 0
G1 E10 F540                        ; extrude filament 10mm
G92 E0                             ; set extruder position 0
G1 E-3.0000 F1800                  ; retract extruder 3mm
G1 Z0.200 F1000                    ; move to .2mm above the bed
G1 X400 Y0 E43.5631 F1000          ; prime extruder by wiping across x axis
G1 E-6.0000 F1800                  ; retract extruder 5mm
G1 Z1 F3000                        ; lift z
G1 X205 Y200 F18000                ; move to center of bed
G1 E6.0000 F1800                   ; extrude 5mm
