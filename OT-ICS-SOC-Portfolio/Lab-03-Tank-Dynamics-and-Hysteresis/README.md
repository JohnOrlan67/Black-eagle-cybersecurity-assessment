# Lab 03 — Tank Dynamics and Hysteresis

## 1. Overview

This lab extends the simulated tank-level controller developed in Lab 01 and Lab 02. It adds a simplified process model so the tank level changes automatically as the simulated pump command switches ON and OFF.

The controller uses separate pump start and stop thresholds. The tank fills while the pump command is ON and drains while the pump command is OFF, creating a repeating simulated cycle.

**Environment:** OpenPLC Editor and simulation/debugging environment  
**Language:** Structured Text (ST), based on IEC 61131-3  
**Scope:** Software simulation only. No physical tank, sensor, pump, transmitter, or industrial controller is connected.

## 2. Objectives

- Simulate tank filling and draining in Structured Text.
- Apply hysteresis to a pump command.
- Observe the interaction between a process variable and control logic.
- Retain the alarm and sensor-fault logic developed in Lab 02.
- Identify the difference between a software model and a real industrial process.

## 3. System variables

The program reuses the Lab 02 variables:

| Variable | Type | Purpose |
|---|---|---|
| `Level` | `REAL` | Simulated tank level, expressed as a percentage |
| `Pump` | `BOOL` | Simulated pump command |
| `LowLevelAlarm` | `BOOL` | Indicates a valid level at or below 10% |
| `HighLevelAlarm` | `BOOL` | Indicates a valid level at or above 90% |
| `SensorFault` | `BOOL` | Flags a level value outside the configured 0–100% range |

The alarm and sensor-fault behaviour remains as documented in Lab 02.

## 4. Control requirements

- At or below 20%, command the pump ON when the sensor reading is considered valid.
- At or above 80%, command the pump OFF when the sensor reading is considered valid.
- Between 20% and 80%, retain the previous pump command.
- While the simulated pump is ON, increase the tank level.
- While the simulated pump is OFF, decrease the tank level.
- Clamp the simulated level so it does not exceed 100% or fall below 0%.

The 20% and 80% thresholds are illustrative values for this exercise, not recommended setpoints for a real process.

## 5. Hysteresis logic

```iecst
IF Level <= 20.0 THEN
    Pump := TRUE;
ELSIF Level >= 80.0 THEN
    Pump := FALSE;
END_IF;
```

The controller commands the pump ON at or below 20%, and OFF at or above 80%. If neither condition is true, this code assigns no new value to `Pump`, so it retains its previous state.

Separate start and stop thresholds create a hysteresis band and help reduce rapid switching when the measured level fluctuates near a single switching point.

## 6. Process simulation

The following process-model block was added after the alarm and pump-control logic:

```iecst
(* Simulate the tank process *)
IF Pump THEN
    Level := Level + 0.5;
    IF Level > 100.0 THEN
        Level := 100.0;
    END_IF;
ELSE
    Level := Level - 0.2;
    IF Level < 0.0 THEN
        Level := 0.0;
    END_IF;
END_IF;
```

### Explanation

- If `Pump` is TRUE, `Level` increases by 0.5 per program execution.
- If `Pump` is FALSE, `Level` decreases by 0.2 per program execution.
- The two inner conditions clamp the simulated level at the boundaries of 0% and 100%.

These are increments per program execution, not calibrated flow rates or percentages per second. Actual elapsed time depends on the runtime and scan behaviour.

## 7. Validation and observations

During simulation, the user observed the following behaviour:

1. The level increased automatically while the pump command was ON.
2. The pump command changed to OFF at the upper switching threshold.
3. The level decreased while the pump command was OFF.
4. The pump command changed to ON at the lower switching threshold.
5. The filling and draining cycle repeated without manually forcing the level.

The program was reported to compile and run in the OpenPLC simulation environment. The pump transition and repeating cycle were observed by the user.

This records observed simulation behaviour; it is not a physical equipment test or a formal verification result.

## 8. Scan-order consideration

In the current program, the alarm and pump-control logic execute before the process-model block updates `Level`. Consequently, a threshold crossing created by the process-model update may only be acted upon when the control logic evaluates the updated level on the next execution. Alarm states can similarly lag the process-model update by one scan.

A future improvement would be to separate the process model from the controller, with clearly defined update order, and then test the resulting behaviour.

## 9. Limitations and safety considerations

- This is a software-only simulation. No real tank, sensor, actuator, motor, or PLC hardware was connected.
- Fixed increments simplify the process and do not represent calibrated tank geometry, flow, pump curves, or sensor dynamics.
- `Pump` represents a logical command, not verified physical pump operation.
- Lab 02's sensor-fault response retains the previous pump command and clears the normal level alarms. This is a training choice, not a universally safe response. A real design requires a documented, risk-assessed fault response and appropriate fault indication.
- This exercise does not implement or validate a Safety Instrumented System (SIS), safety interlocks, electrical protection, or a Safety Integrity Level (SIL).
- Do not connect this training logic to live industrial equipment without qualified engineering review, appropriate testing, and an approved design.

## 10. Learning outcomes

This lab demonstrates how a controller's output affects a changing process variable in a simplified model. It reinforces hysteresis, threshold-based control, the interaction between process dynamics and PLC execution order, and the limits of conclusions drawn from simulation.

## 11. Future improvements

- Separate process simulation from controller logic.
- Add independent sensor-fault indication.
- Record repeatable test cases with expected and observed results.
- Model flow using a configurable rate and scan interval.
- Add a simulated actuator-feedback signal.
- Introduce industrial networking and OT monitoring in a later, separate lab.

## 12. Reproduction

1. Open the existing tank-level project in OpenPLC Editor.
2. Confirm the Lab 02 variable declarations and alarm/pump-control logic.
3. Add the process-simulation block after the existing control logic.
4. Compile and run the project in the simulator.
5. Observe `Level` and `Pump` in the debugger as the cycle repeats.
6. Record actual observations and capture clear screenshots from the running environment.
7. Stop the simulator when finished.

## Evidence

Screenshots for this lab have not yet been added to this directory. Add clear, genuine screenshots from the OpenPLC environment after capturing them; do not represent simulated evidence as physical hardware testing.
