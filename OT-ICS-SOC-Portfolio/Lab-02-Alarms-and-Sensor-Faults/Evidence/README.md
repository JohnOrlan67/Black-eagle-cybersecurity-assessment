# Lab 02 Evidence

Store screenshots captured from the actual OpenPLC Editor and Simulator in this directory.

## Recommended evidence

1. `01-variable-declarations.png` — declaration table showing `Level`, `Pump`, `LowLevelAlarm`, `HighLevelAlarm`, and `SensorFault`.
2. `02-structured-text-logic.png` — program body with all three logic sections and matching `END_IF;` statements visible.
3. `03-low-level-alarm-test.png` — Level = 8; LowLevelAlarm = TRUE; Pump = TRUE.
4. `04-high-level-alarm-test.png` — Level = 95; HighLevelAlarm = TRUE; Pump = FALSE.
5. `05-upper-sensor-fault-test.png` — Level = 105; SensorFault = TRUE; both normal alarms = FALSE.
6. `06-lower-sensor-fault-test.png` — Level = -5; SensorFault = TRUE; both normal alarms = FALSE.
7. `07-lower-valid-boundary.png` — Level = 0; SensorFault = FALSE; LowLevelAlarm = TRUE.
8. `08-upper-valid-boundary.png` — Level = 100; SensorFault = FALSE; HighLevelAlarm = TRUE.
9. `09-successful-compilation.png` — console showing successful compilation and simulator startup.

## Evidence status

The six variable-value test results were observed in the user's OpenPLC debugger and matched the expected results. The image files themselves still need to be added to this directory unless they appear here as actual PNG files.

Do not recreate or embellish screenshots and do not present simulated values as tests of physical equipment.
