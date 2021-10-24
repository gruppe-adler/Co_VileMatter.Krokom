if (!isServer) exitWith {};

params ["_object", "_scale"];


[{
    CBA_missionTime > 10
}, {
    params ["_object", "_scale"];

    [_object, _scale] remoteExec ["setObjectScale", 0, _object];

    private _allObjects = missionNamespace getVariable ["GRAD_VM_scaledObjects", []];
    _allObjects pushBackUnique [_object, _scale];
    missionNamespace setVariable ["GRAD_VM_scaledObjects", _allObjects, true];
}, [_object, _scale]] call CBA_fnc_waitUntilAndExecute;


