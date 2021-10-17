if (!isServer) exitWith {};

params ["_unit", "_position", "_index", ["_duration", 10], ["_numberStart", 2035], ["_numberEnd", 9], ["_date", [2035,2,9,7,0]]];

if (!isNull (getAssignedCuratorLogic _unit)) exitWith {
    diag_log "curator detected, exiting teleport";
};

// debug
// server knows current position than players in the future
[_unit, getPos _unit, _position, _index, _duration, _numberStart, _numberEnd, _date] remoteExec ["GRAD_VM_teleport_fnc_teleportFX", _unit];
