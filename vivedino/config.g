; Configuration file for Duet WiFi (firmware version 1.20 or newer)
; executed by the firmware on start-up

; --- general preferences ---
M111 S0                                            ; debugging off
G21                                                ; work in millimetres
G90                                                ; send absolute coordinates
M83                                                ; relative extruder moves
M555 P2                                            ; set firmware compatibility to look like Marlin

M667 S1                                            ; select CoreXY mode
M208 X5 Y0 Z0 S1                                   ; set axis minima to end of safe travel.
M208 X410 Y408 Z510 S0                             ; set axis maxima to match endstop location.

; ---filament sensing---
; M591 D0 P1 C3 S1

; Automatic power saving
M911 S23 R24 P"M913 X0 Y0 G91 M83 G1  E-3 F1000"   ; Set voltage thresholds and actions to run on power loss

; --- endstops ---
M574 X2 Y2 S1

; Z-Probe
M574 Z1 S0                               ; Set endstops controlled by probe
M307 H7 A-1 C-1 D-1                      ; Disable heater on PWM channel for BLTouch
G31 P50 X0 Y21 Z1.49                     ; Set Z probe trigger value, offset and trigger height
M558 P5 H3 F300 T6000                    ; Set Z probe type to bltouch and the dive height + speeds
M557 X5:405 Y0:390 S20                   ; Define mesh grid

; --- z-axis stepper leveling configuration ---
M584 X0 Y1 E3 Z6:5:8:7                              ; four motors, at 5, 6, 7, and 8
M671 X-100:-100:420:420 Y380:-115:-115:380 S20      ; Z belts at 4 corners

; --- drive map ---
;    _______
;   | 6 | 7 |
;   | ----- |
;   | 5 | 8 |
;    -------
;     front

; Network

M550 P"Sleeper Service"                  ; Set machine name

M552 S1
M587 S"Rushup Edge" P"itsadinosaur"

M586 P0 S1                               ; Enable HTTP
M586 P1 S0                               ; Disable FTP
M586 P2 S0                               ; Disable Telnet

M575 P1 B115200 S1


; --- drives ---
M569 P0 S1	; X
M569 P1 S1	; Y
;M569 P2 S0	; Z
M569 P3 S1	; E0
;M569 P4 S1	; E1

; -- duex --
M569 P5 S1  ; Z5
M569 P6 S0	; Z6
M569 P7 S1	; Z7
M569 P8 S0	; Z8

M569 P2 R-1
M569 P4 R-1
M569 P9 R-1

M350 X16 Y16 Z16 E16 I1			                          ; microstepping with interpolation (I1)
M92  X80 Y79.2 Z400 E408		                          ; steps per mm - with bt
M566 X2000 Y2000 Z602.65 E1000		                 	  ; maximum instantaneous speed changes (mm/min) (jerk)
M203 X20000 Y20000 Z1500 E10000	                	  	  ; maximum speeds (mm/min)
M201 X1500 Y1500 Z500 E10000		                    	  ; accelerations
M906 X1200 Y1200 Z1200 E1250 I60		              	  ; motor currents (mA) and motor idle factor in per cent

M84 S60 				                          ; set idle timeout

; --- firmware retraction ---
M207 S2.5 R0 F6500 T4500 Z0	                  ; [ Snnn positive length to retract, in mm ]
					          ; [ Rnnn positive or negative additional length to un-retract, in mm ]
					          ; [ Fnnn retraction feedrate, in mm/min ]
					          ; [ Tnnn feedrate for un-retraction if different from retraction, mm/min ]
					          ; [ Znnn additional zlift/hop ]

; --- heaters ---
M305 P0 T100000 B4138 C0 R4700                      ; set thermistor + ADC parameters for heater 0
M307 H3 A-1 C-1 D-1                                 ; set PID tuned settings for heater 0
M143 H0 S125                                        ; set temperature limit for heater 0 to 120C
M305 P1 T100000 B4138 C0 R4700                      ; set thermistor + ADC parameters for heater 1
M307 H1 A517.3 C213.3 D11.1 V24 B0		    ; set PID tuned settings for heater 1
M143 H1 S280                                        ; set temperature limit for heater 1 to 280C

; --- tools ---
M563 P0 D0 H1                                       ; define tool 0
G10 P0 X0 Y0 Z0                                     ; set tool 0 axis offsets
G10 P0 R0 S0                                        ; set initial tool 0 active and standby temperatures to 0C

; --- fans ---
M106 P0 S0 I0 F500 H-1                              ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1 I0 F500 H1 T50                           ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S0.3 I0 F500 H1 T50                         ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on

M572 D0 S.15
;M572 D0 S.4					    ; Linear Advance
;M592 D0 A0.01 B0.0005				    ; nonlinear extrusion

; --- Set or report heating process parameters---
M106 P3 I-1
M106 P4 I-1
M106 P5 I-1
M106 P6 I-1
M106 P7 I-1
M106 P8 I-1

; --- RGB leds - White ---
;M106 P3 S255 ; V+
M42 P24 S255 ; R-
M42 P25 S255 ; G-
M42 P26 S255 ; B-
M42 P28 S195 ;

M501
M500
M851
