if (!isServer) exitWith {};

private _devicesOriginal = nearestObjects [phase2_devicestatue, ["Land_Device_assembled_F"], 30]; 
private _devicesNew = [];

{
    private _deviceNew = [_x] call GRAD_VM_phase2_fnc_deviceReplaceWithSimpleObject;
    _devicesNew pushBack _deviceNew;
} forEach _devicesOriginal;


{
    _x hideSelection ["light_1_rot", true];
} forEach _devicesNew;


[
    {
        ([2] call GRAD_VM_main_fnc_getPhaseProgress) == 1
    },
    {
        params ["_devicesOriginal", "_devicesNew"];
        
        { _x hideObjectGlobal true; } forEach _devicesNew;
        { _x hideObjectGlobal false; } forEach _devicesOriginal;

}, [_devicesOriginal, _devicesNew]] call CBA_fnc_waitUntilAndExecute;