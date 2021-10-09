params ["_object"];

_object say3d "steam";

private _particleSource = "#particlesource" createVehicleLocal (getPos _object); 
_particleSource setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 1.5],
 [0, 0, 2], 0, 10, 7.9, 0.075, [0.2, 3], [[0.7, 0.7, 0.7, 0.01], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", "",0];
_particleSource setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_particleSource setParticleCircle [0, [0, 0, 0]];
_particleSource setDropInterval 0.05;

[{
    deleteVehicle _this;
}, _particleSource, 3] call CBA_fnc_waitAndExecute;