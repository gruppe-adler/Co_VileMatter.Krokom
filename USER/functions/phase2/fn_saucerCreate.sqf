params ["_position"];

private _disk = createVehicle ["rkb_flyingDisk_dark", [0,0,0], [], 0, "NONE"];
_disk setCaptive true;

[_disk, _position] remoteExec ["GRAD_VM_phase2_fnc_saucerSpawnFX", 0];

[{
    params ["_disk", "_position"];
    _disk setPos [_position#0, _position#1, 100];    
}, [_disk, _position], 1] call CBA_fnc_waitAndExecute;