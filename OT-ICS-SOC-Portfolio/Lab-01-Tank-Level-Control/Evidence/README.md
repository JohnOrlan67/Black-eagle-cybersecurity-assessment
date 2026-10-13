# Lab 01 Evidence

These screenshots were captured from the OpenPLC Editor and Simulator during the tank-level control exercise.

## Debugger test evidence

1. [03 — Low-level test](03-low-level-debugger.png) — Level = 0%; Pump = TRUE.
2. [04 — Intermediate level after low-level test](04-mid-level-pump-on.png) — Level = 50%; Pump remains TRUE.
3. [05 — High-level test](05-high-level-debugger.png) — Level = 80%; Pump = FALSE.
4. [06 — Return to intermediate level](06-hysteresis-final-middle.png) — Level = 50%; Pump remains FALSE after the high-level test.

The four observations match the intended hysteresis logic. The images are cropped around the debugger variable panel to emphasize the observed values.

## Additional evidence to capture later

- A full editor view showing the variable declarations for `Level` and `Pump`.
- A full editor view showing the Structured Text control logic.
- A console view showing successful compilation and simulator startup.

## Scope note

These results are from a software simulation. `Pump` represents a logical command; no physical tank, sensor, actuator, or pump was connected.
