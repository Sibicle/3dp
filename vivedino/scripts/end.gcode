; end script

G91                                ; relative positioning
G1 E-5.00 F1000                    ; retract 5mm of filament
G1 Z+1.00 X+20.0 Y+20.0 F20000     ; short quick move to disengage from print
G1 Z+10.00  F20000                 ; move Z-Axis 10mm away from part
G90                                ; absolute positioning
G1 X400 Y400                       ; move gantry close to home
G91                                ; relative positioning
G1 E-5.00 F500                     ; retract additional filament to prevent oozing
G90                                ; absolute positioning
M104 S0                            ; turn off hotend
M140 S0                            ; turn off heatbed
M106 S0                            ; shut off blower
M84                                ; motors off

M42 P24 S255                       ; G-
M42 P25 S0                         ; R-
M42 P26 S0                         ; B-
