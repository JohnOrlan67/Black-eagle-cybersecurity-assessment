# Lab 01 — Tank-Level Control Using OpenPLC

## Overview

This lab implements and tests a simulated tank-level control system using OpenPLC Editor and Simulator. The PLC logic is written in Structured Text (ST). Two level thresholds control a Boolean pump command, and the intermediate range retains the previous command state.

**Environment:** OpenPLC Editor and Simulator on Windows  
**Language:** Structured Text (IEC 61131-3)  
**Scope:** Software simulation only; no physical tank, sensor, or pump is connected.

## Objectives

- Declare PLC variables with suitable data types.
- Implement low-level and high-level pump control conditions.
- Compile and run the program in the simulator.
- Observe variable values with the OpenPLC debugger.
- Verify the expected results at different simulated levels.
- Document limitations and future improvements.

## System variables

| Variable | Type | Initial value | Purpose |
|---|---|---:|---|
| `Level` | `REAL` | `0.0` | Simulated tank level in percent |
| `Pump` | `BOOL` | `FALSE` | Simulated pump command |

## Control requirements

- When `Level <= 20.0`, set `Pump := TRUE`.
- When `Level >= 80.0`, set `Pump := FALSE`.
- Between the thresholds, retain the previous value of `Pump`.

The separate start and stop thresholds implement a simple hysteresis pattern, reducing frequent switching around one threshold.

## Structured Text

The following is the complete IEC Structured Text representation of the program. In the installed editor, declarations were managed in the variable/declaration section and the conditional logic was entered in the program-body pane.

```iecst
PROGRAM main
VAR
    Level : REAL := 0.0;
    Pump : BOOL := FALSE;
END_VAR

IF Level <= 20.0 THEN
    Pump := TRUE;
ELSIF Level >= 80.0 THEN
    Pump := FALSE;
END_IF;

END_PROGRAM
```

## Validation and test results

The OpenPLC console log reports a successful compilation, firmware loaded into the simulator, the simulator running, and the debugger started successfully.

| Test | Simulated level | Observed pump command | Result |
|---|---:|---|---|
| Low-level condition | 0% | `TRUE` (ON) | PASS |
| Intermediate level after low-level test | 50% | `TRUE` (ON) | PASS |
| High-level condition | 80% | `FALSE` (OFF) | PASS |
| Return to intermediate level | 50% | `FALSE` (OFF) | PASS |

These observations matched the intended control behaviour. The two 50% tests show that the command retains whichever state was established by the previous threshold crossing.

## Limitations

- `Level` was forced/set as a simulated test value; it was not provided by a physical level transmitter.
- `Pump` represents a logical command, not verified physical pump operation.
- This exercise does not validate electrical wiring, actuator response, process dynamics, interlocks, or a safety instrumented function.
- The result is a learning simulation, not a safety-certified design.

## Future improvements

- Generate a changing simulated level instead of forcing static test values.
- Add alarm thresholds and invalid-signal handling.
- Add a start/stop mode and a simulated actuator feedback signal.
- Recreate the logic using Ladder Diagram (LD).
- Develop a separate lab covering OT networking and monitoring after the automation fundamentals are established.

## Evidence

See the `Evidence/` directory for the evidence checklist. Screenshots should be captured from the user's OpenPLC environment and uploaded there. Do not label screenshots as physical hardware tests.

## Reproduction notes

1. Create the `Level` and `Pump` variables in the editor's declaration section.
2. Enter the conditional logic in the program-body pane.
3. Save and start/build the program.
4. Open the debugger variable view.
5. Test levels in this sequence: 0, 50, 80, 50.
6. Compare the observed `Pump` values with the test table above.
7. Release any forced values and stop the simulator when finished.
