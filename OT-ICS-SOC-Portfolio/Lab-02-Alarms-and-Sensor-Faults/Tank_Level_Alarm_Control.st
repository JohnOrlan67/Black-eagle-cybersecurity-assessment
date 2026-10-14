PROGRAM main
VAR
    Level : REAL := 0.0;
    Pump : BOOL := FALSE;
    LowLevelAlarm : BOOL := FALSE;
    HighLevelAlarm : BOOL := FALSE;
    SensorFault : BOOL := FALSE;
END_VAR

(* 1. Detect invalid tank-level readings *)
IF (Level < 0.0) OR (Level > 100.0) THEN
    SensorFault := TRUE;
ELSE
    SensorFault := FALSE;
END_IF;

(* 2. Update alarms only when the sensor is valid *)
IF SensorFault THEN
    LowLevelAlarm := FALSE;
    HighLevelAlarm := FALSE;
ELSE
    IF Level <= 10.0 THEN
        LowLevelAlarm := TRUE;
    ELSE
        LowLevelAlarm := FALSE;
    END_IF;

    IF Level >= 90.0 THEN
        HighLevelAlarm := TRUE;
    ELSE
        HighLevelAlarm := FALSE;
    END_IF;
END_IF;

(* 3. Control the pump only when the sensor is valid *)
IF NOT SensorFault THEN
    IF Level <= 20.0 THEN
        Pump := TRUE;
    ELSIF Level >= 80.0 THEN
        Pump := FALSE;
    END_IF;
END_IF;

END_PROGRAM
