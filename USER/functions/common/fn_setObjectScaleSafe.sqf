params ["_object", "_scale"];

[{
    time > 1
}, {
    params ["_object", "_scale"];

    [_object, _scale] remoteExec ["setObjectScale", _object];
}, [_object, _scale]] call CBA_fnc_waitUntilAndExecute