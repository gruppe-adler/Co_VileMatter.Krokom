if (!isServer) exitWith {};

params ["_object", "_scale"];

[{
    CBA_missionTime > 10
}, {
    params ["_object", "_scale"];

    _object attachTo [teleportcenter_phase0];
    [_object, _scale] remoteExec ["setObjectScale", _object, _object];
}, [_object, _scale]] call CBA_fnc_waitUntilAndExecute;