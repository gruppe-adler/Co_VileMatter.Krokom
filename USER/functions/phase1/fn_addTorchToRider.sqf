params ["_rider"];

private _torch = createSimpleObject ["\medieval_Torch_weapon\Medieval_torch.p3d", [0,0,0]]; 
_torch attachTo [_rider, [0,0,0], "righthand", true];

private _torch2 = createSimpleObject ["\medieval_Torch_weapon\Medieval_torch1.p3d", [0,0,0]]; 
_torch2 attachTo [_rider, [0,0,0], "righthand", true];

private _fire = "#particlesource" createVehicleLocal [0,0,0];   
_fire setParticleClass "SmallFireBarrel";
_fire attachTo [_torch, [0,0,0.6]];

private _lightColor = [1,0.28,0.05];

private _lightPoint = "#lightpoint" createvehiclelocal [0,0,0];
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 1; _lightPoint setLightFlareMaxDistance 1000;
_lightPoint setLightAmbient _lightColor; _lightPoint setLightColor _lightColor;
_lightPoint setLightAttenuation [0.5, 0, 0, 1, 20, 30];// [0,0,0,0,0,4000];
_lightPoint setLightIntensity 800;
_lightPoint attachTo [_fire, [0,0,0]];

[{
    params ["_rider"];
    !(_rider getVariable ["GRAD_VM_isRider", false]) || !alive _rider
}, {
    params ["_rider", "_torch", "_torch2", "_fire", "_lightPoint"];
    deleteVehicle _torch;
    deleteVehicle _torch2;
    deleteVehicle _fire;
    deleteVehicle _lightPoint;
}, [_rider, _torch, _torch2, _fire, _lightPoint]] call CBA_fnc_waitUntilAndExecute;