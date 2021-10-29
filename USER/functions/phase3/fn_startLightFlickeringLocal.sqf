#include "\x\zen\addons\modules\script_component.hpp"
params ["_center", "_radius", "_duration", "_lamps", "_sources"];

private _stopTime = time + _duration;
private _state = true;

while { time < _stopTime } do {
	if (_state) then {
		_state = false;
	} else {
		_state = true;
	};	
	
	{
		if (_x call EFUNC(common,getLightingSelections) isNotEqualTo []) then {
			_x switchLight (["OFF", "ON"] select _state);
		};	
	} forEach _lamps;

	{
		_x params ["_lightpoint", "_lightParams"];
		_lightParams params ["_color", "_attenuation"];
		_attenuation params ["_range", "_constant", "_linear", "_quadratic"];
			
		_lightpoint setLightColor ([[0,0,0], _color] select _state);
		_lightpoint setLightAttenuation [[0, _range] select _state, _constant, [0, _linear] select _state, [0, _quadratic] select _state];
	} forEach _sources;

	sleep (random 0.5);
};

_state = true;
{
	if (_x call EFUNC(common,getLightingSelections) isNotEqualTo []) then {
		_x switchLight (["OFF", "ON"] select _state);
	};	
} forEach _lamps;

{
	_x params ["_lightpoint", "_lightParams"];
	_lightParams params ["_color", "_attenuation"];	
	_attenuation params ["_range", "_constant", "_linear", "_quadratic"];
		
	_lightpoint setLightColor ([[0,0,0], _color] select _state);
	_lightpoint setLightAttenuation [[0, _range] select _state, _constant, _linear, _quadratic];
} forEach _sources;