params ["_targetPosition", "_duration"];

private _count = count (playableUnits + switchableUnits);
{
    private _unit = _x;

    [{
        params ["_unit", "_targetPosition"];

            [_unit, _targetPosition] execVM "User\functions\teleport\fn_teleport.sqf";

    }, [_unit, _targetPosition], (_forEachIndex/_count)*_duration*((random 1) min 0.5)] call CBA_fnc_waitAndExecute;

} forEach (playableUnits + switchableUnits);
