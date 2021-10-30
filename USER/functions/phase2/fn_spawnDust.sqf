params ["_position"];

if (!isGameFocused) exitWith {};

private _duration = 0.01 + random 0.1;
private _amount = 0.001 + random 0.01;
private _dust = "#particlesource" createVehicleLocal _position;
private _lifetime = 3;


_dust setParticleCircle [0, [0, 0, 0]];
_dust setParticleRandom [1, [0.05, 0.05, 0.1], [0.4, 0.4, 0], 0, 0.0025, [0, 0, 0, 0], 0, 0];
_dust setParticleParams [
    ["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",
    1, _lifetime, [0, 0, 0], [0, 0, -0.1], 0, 20, 7.9, 0,
    [0.5,0.5,0.5], [[0.3, 0.3, 0.3, 1]], [0.08], 1, 0, "", "", _dust,0,true,0.2];
_dust setDropInterval _amount;


[{
    params ["_dust"];
    deleteVehicle _dust;

}, [_dust], _duration] call CBA_fnc_waitAndExecute;

