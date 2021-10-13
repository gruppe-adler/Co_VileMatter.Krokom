
params ["_fence", "_position"];

if (_fence isEqualType "") exitWith {
    diag_log format ["PANIC, fence is string %1", _fence];
};

private _sparkSound = selectRandom [
    "GRAD_electricFence_sound_spark1",
    "GRAD_electricFence_sound_spark2",
    "GRAD_electricFence_sound_spark3"
];
_fence say3D [_sparkSound, 75];

private _brightness = 0.1;
private _light = "#lightpoint" createVehicleLocal _position;
_light setLightBrightness _brightness;
_light setLightAmbient [1.0, 0.25, 0.25];
_light setLightColor [1.0, 0.25, 0.25];
// _light lightAttachObject [_object, [0,0,0]];


private _duration = 0.01 + random 0.1;
private _amount = 0.001 + random 0.01;
private _spark = "#particlesource" createVehicleLocal _position;
private _lifetime = (random 0.5);


_spark setParticleCircle [0, [0, 0, 0]];
_spark setParticleRandom [1, [0.05, 0.05, 0.1], [0.4, 0.4, 0], 0, 0.0025, [0, 0, 0, 0], 0, 0];
_spark setParticleParams [
    ["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject",
    1, _lifetime, [0, 0, 0], [0, 0, -0.1], 0, 20, 7.9, 0,
    [0.3,0.3,0.05], [[1, 1, 1, 1], [1, 0.5, 0.5, 1], [0.5, 0, 0, 0]], [0.08], 1, 0, "", "", _spark,0,true,0.2,[[1,0.25,0.25,1]]
];
_spark setDropInterval _amount;


[{
    params ["_spark", "_light"];
    deleteVehicle _spark;
    deleteVehicle _light;

}, [_spark, _light], _duration] call CBA_fnc_waitAndExecute;

