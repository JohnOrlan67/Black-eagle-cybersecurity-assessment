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
