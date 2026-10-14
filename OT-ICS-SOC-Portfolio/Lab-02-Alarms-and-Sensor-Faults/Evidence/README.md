# Lab 02 Evidence

This folder contains screenshot evidence captured from the user's OpenPLC Editor and Simulator. The images are cropped from the actual screenshots to make the declaration and debugger values easier to inspect.

## Uploaded evidence

1. [01 — Variable declarations](01-variable-declarations.webp) — the five declared variables: `Level`, `Pump`, `LowLevelAlarm`, `HighLevelAlarm`, and `SensorFault`.
2. [03 — Low-level alarm test](03-low-level-alarm-test.webp) — Level = 8; `LowLevelAlarm = TRUE`; `Pump = TRUE`.
3. [04 — High-level alarm test](04-high-level-alarm-test.webp) — Level = 95; `HighLevelAlarm = TRUE`; `Pump = FALSE`.
4. [05 — Upper sensor-fault test](05-upper-sensor-fault-test.webp) — Level = 105; `SensorFault = TRUE`; both normal alarms = `FALSE`.
5. [06 — Lower sensor-fault test](06-lower-sensor-fault-test.webp) — Level = -5; `SensorFault = TRUE`; both normal alarms = `FALSE`.
6. [07 — Lower valid boundary](07-lower-valid-boundary.webp) — Level = 0; `SensorFault = FALSE`; `LowLevelAlarm = TRUE`.
7. [08 — Upper valid boundary](08-upper-valid-boundary.webp) — Level = 100; `SensorFault = FALSE`; `HighLevelAlarm = TRUE`.

## Still to capture

- A full editor view showing the complete Structured Text body and its closing `END_IF;` statements.
- A console screenshot showing successful compilation and simulator startup.

## Scope note

The six test results are from the OpenPLC software simulation. `Level` was set using debugger test values, and `Pump` represents a logical command only. No physical tank, transmitter, pump, or safety system was tested. These results should not be presented as physical-equipment validation.
