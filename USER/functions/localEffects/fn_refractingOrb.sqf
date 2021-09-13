if !(canSuspend) exitWith {
	_this spawn GRAD_VM_fnc_refractingOrb;
};

private _pos = player getRelPos [75, random 360];
_pos set [2, 5];
private _orb = "Sign_Sphere100cm_F" createVehicleLocal _pos;
hideObject _orb;

private _lightpoint = "#lightpoint" createVehicleLocal _pos;
private _color = [226, 88, 34];
_color = _color apply { _x / 255 };
_lightpoint setLightColor _color;
_lightpoint setLightAmbient _color;
_lightpoint setLightUseFlare true;
_lightpoint setLightFlareMaxDistance 500;
_lightpoint setLightFlareSize 7;
_lightpoint setLightIntensity 5000;

_lightpoint setPos _pos;
_orb setPos _pos;

private _iterations = 0;
private _counter = 5;
while { _iterations < _counter } do {
	private _targetPos = player getPos [75, _orb getDir player];
	_targetPos set [2, 5];
	[_orb, _lightpoint, _targetPos] call GRAD_VM_fnc_moveOrb;
	waitUntil { ((getPos _orb) distance _targetPos) < 2 };
	sleep (random 0.2) + 0.5;

	_targetPos = player getRelPos [75, random 360];
	_targetPos set [2, 5];
	[_orb, _lightpoint, _targetPos] call GRAD_VM_fnc_moveOrb;	
	waitUntil { ((getPos _orb) distance _targetPos) < 2 };
	sleep (random 2) + 0.5;

	_iterations = _iterations + 1;
};

[_orb, _lightpoint] call GRAD_VM_fnc_endOrb;