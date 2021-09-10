params ["_targetPosition", "_duration"];

playSound3D [getMissionPath "USER\sounds\teleport_global.ogg", player];

private _count = count (playableUnits + switchableUnits);
{
    private _unit = _x;
    private _index = _forEachIndex;

    [{
        params ["_unit", "_targetPosition"];

            [_unit, _targetPosition, _index] call GRAD_VM_teleport_fnc_teleport;

    }, [_unit, _targetPosition], (_index/_count)*_duration*((random 1) min 0.5)] call CBA_fnc_waitAndExecute;

} forEach (playableUnits + switchableUnits);
