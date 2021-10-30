/*
* Adds a flare effect to the guardsman spawning. 
*
* Arguments:
* 0: The pad the guardsman will spawn on <OBJECT>
*
* Return Value:
* None
*
* Example:
* [paddyThePad] call Grad_VM_phase3_fnc_guardsmenSpawnEffect;
*/

params ["_pad"];

// the effect will spaw over the guardsman head, so the flare isn't obscured.
private _pos = getPos _pad;
_pos set [2, 1.9];

// spawn the actual lightpoint with flare
private _lightPoint = "#lightpoint" createvehiclelocal _pos;
_lightPoint setPos _pos;
_lightPoint setLightColor[0.13, 0.17, 0.07];
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 50; _lightPoint setLightFlareMaxDistance 5000;
// _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.9,0.7,0.9];
_lightPoint setLightAmbient[0.13, 0.17, 0.07];
_lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
_lightPoint setLightBrightness 2;

// add a pfh that decreases the light's flare
private _pfhHandler = [
	{
		params ["_args", "_handle"];
		_args params ["_light", "_pad"];

		if (isNull _pad) exitWith {
			deleteVehicle _light;
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		private _flareSize = _pad getVariable ["GRAD_VM_flareSize", 50];
		if (_flareSize <= 0) exitWith {
			deleteVehicle _light;
			_pad setVariable ["GRAD_VM_flareSize", 50];
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
		_flareSize = _flareSize - 7;
		_light setLightFlareSize _flareSize;
		_pad setVariable ["GRAD_VM_flareSize", _flareSize];
	},
	0,
	[_lightPoint, _pad]
] call CBA_fnc_addPerFrameHandler;