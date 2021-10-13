if (!isServer) exitWith {};

params ["_object", "_scale"];

[{
    time > 3
}, {
    params ["_object", "_scale"];

    _object attachTo [_object];
    [_object, _scale] remoteExec ["setObjectScale", _object, _object];
}, [_object, _scale]] call CBA_fnc_waitUntilAndExecute