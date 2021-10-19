if (!isServer) exitWith {};

params ["_object", "_scale"];

[{
    CBA_missionTime > 10
}, {
    params ["_object", "_scale"];

    [_object, _scale] remoteExec ["setObjectScale", 0, _object];
}, [_object, _scale]] call CBA_fnc_waitUntilAndExecute;