params ["_orb", "_lightpoint"];

drop [
/*0*/	["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1],
/*1*/	"",
/*2*/	"Billboard",
/*3*/	0.2,
/*4*/	2,
/*5*/	[1,1,0],
/*6*/	[0,0,0],
/*7*/	0,
/*8*/	9,
/*9*/	7,
/*10*/	0,
/*11*/	[0.5,60,0.5],
/*12*/	[[0,0,0,0],
/*13*/	[0,0,0,1],
/*14*/	[0,0,0,0]],
/*15*/	[1],
/*16*/	0,
/*17*/	0,
/*18*/	"",
/*19*/	"",
/*20*/	_orb
];

[
	{
		params ["_args", "_handle"];
		_args params ["_orb", "_lightpoint"];

		private _currentFlare = _orb getVariable ["GRAD_VM_currentFlare", 7];
		private _currentBrightness = _orb getVariable ["GRAD_VM_currentBrightness", 5000];
		private _maxReached = _orb getVariable ["GRAD_VM_MaxReached", false];

		if (_currentFlare > 200) then {
			_orb setVariable ["GRAD_VM_MaxReached", true];
		};

		private _color = [((random 255) + 1) / 255, ((random 255) + 1) / 255, ((random 255) + 1) / 255];
		_lightpoint setLightColor _color;
		_lightpoint setLightAmbient _color;

		if !(_maxReached) then {
			_currentFlare = _currentFlare + 4;
			_currentBrightness = _currentBrightness + 1000000;
			// systemChat str _currentBrightness;
		} else {
			_currentFlare = _currentFlare - 20;
			_currentBrightness = _currentBrightness - 5000000;

			if (_currentFlare <= 0.1) exitWith {
				[_handle] call CBA_fnc_removePerFrameHandler;
				deleteVehicle _orb;
				deleteVehicle _lightpoint;
			};
		};

		_lightpoint setLightFlareSize _currentFlare;
		_lightpoint setLightIntensity _currentBrightness;
		_orb setVariable ["GRAD_VM_currentFlare", _currentFlare];
		_orb setVariable ["GRAD_VM_currentBrightness", _currentBrightness];
	},
	0,
	[_orb, _lightpoint]
] call CBA_fnc_addPerFrameHandler;