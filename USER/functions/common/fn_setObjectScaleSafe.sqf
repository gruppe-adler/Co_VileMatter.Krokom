if (!isServer) exitWith {};

params ["_object", "_scale"];


[{
    CBA_missionTime > 10
}, {
    params ["_object", "_scale"];


    // necessary to work on dedicated! (simpleobject might be fine but placement might be off)
    // attachToRelative makes sure rotation/dir is correct
    [_object, teleportcenter_phase0, true] call BIS_fnc_attachToRelative;
    
    [_object, _scale] remoteExec ["setObjectScale", 0, _object];

    private _allObjects = missionNamespace getVariable ["GRAD_VM_scaledObjects", []];
    _allObjects pushBackUnique [_object, _scale];
    missionNamespace setVariable ["GRAD_VM_scaledObjects", _allObjects, true];
}, [_object, _scale]] call CBA_fnc_waitUntilAndExecute;


