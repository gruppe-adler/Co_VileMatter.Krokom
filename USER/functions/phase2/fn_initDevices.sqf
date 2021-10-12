
private _devices = nearestObjects [phase2_devicestatue, ["Land_Device_assembled_F"], 30]; 
private _devicesNew = [];

{
    private _deviceNew = [_x] call BIS_fnc_replaceWithSimpleObject;
    _devicesNew pushBack _deviceNew;
} forEach _devices;


{
    _x hideSelection ["light_1_rot", true];
} forEach _devicesNew;



