params ["_pad"];

private _pos = getPos _pad;
_pos set [2, 1.9];

private _lightPoint = "#lightpoint" createvehiclelocal _pos;
_lightPoint setPos _pos;
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 50; _lightPoint setLightFlareMaxDistance 5000;
// _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.9,0.7,0.9];
_lightPoint setLightAmbient[0.13, 0.17, 0.07]; _lightPoint setLightColor[0.13, 0.17, 0.07];
_lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
_lightPoint setLightBrightness 2;

private _pfhHandler = [
	{
		params ["_args", "_handle"];
		_args params ["_light", "_pad"];

		private _flareSize = _pad getVariable ["GRAD_VM_flareSize", 50];
		if (_flareSize <= 0) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			deleteVehicle _light;
			_pad setVariable ["GRAD_VM_flareSize", 50];
		};
		_flareSize = _flareSize - 7;
		_light setLightFlareSize _flareSize;
		_pad setVariable ["GRAD_VM_flareSize", _flareSize];
	},
	0,
	[_lightPoint, _pad]
] call CBA_fnc_addPerFrameHandler;