params ["_rider"];

private _torch = createSimpleObject ["\medieval_Torch_weapon\Medieval_torch.p3d", [0,0,0]]; 
_torch attachTo [_rider, [0,0,0], "righthand", true];

private _torch2 = createSimpleObject ["\medieval_Torch_weapon\Medieval_torch1.p3d", [0,0,0]]; 
_torch2 attachTo [_rider, [0,0,0], "righthand", true];


[_rider] remoteexec ["GRAD_VM_phase1_fnc_addTorchRiderLocal", 0, _rider];

[{
    params ["_rider"];
    !(_rider getVariable ["GRAD_VM_isRider", false]) || !alive _rider
}, {
    params ["_rider", "_torch", "_torch2"];
    deleteVehicle _torch;
    deleteVehicle _torch2;
}, [_rider, _torch, _torch2]] call CBA_fnc_waitUntilAndExecute;