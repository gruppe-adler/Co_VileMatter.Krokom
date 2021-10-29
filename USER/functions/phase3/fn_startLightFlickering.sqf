#include "\x\zen\addons\modules\script_component.hpp"

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_center", "_radius", "_duration"];

private _gods = [];
{
	private _unit = getAssignedCuratorUnit _x;
	if (isPlayer _unit) then {
		_gods pushBackUnique (getAssignedCuratorUnit _x);
	};
} forEach allCurators;

[_center, _radius] remoteExec ["GRAD_VM_phase3_fnc_moduleLightsource", selectRandom _gods];

waitUntil { (missionNamespace getVariable ["GRAD_VM_phase3_zeusLightSources", 1337]) isNotEqualTo 1337 };

private _affectedLamps = nearestObjects [_center, ["Building"], _radius, true];
private _sources = missionNamespace getVariable ["GRAD_VM_phase3_zeusLightSources", []];

[_center, _radius, _duration, _affectedLamps, _sources] remoteExec ["GRAD_VM_phase3_fnc_startLightFlickeringLocal", [0, -2] select isMultiplayer];

// while { time < _stopTime } do {
// 	if (_state) then {
// 		_state = false;
// 	} else {
// 		_state = true;
// 	};	
	
// 	{
// 		if (_x call EFUNC(common,getLightingSelections) isNotEqualTo []) then {
// 			private _eventID = format [QGVAR(moduleToggleLamps_%1), _x call BIS_fnc_netId];
// 			[QEGVAR(common,setLampState), [_x, _state, false], _eventID] call CBA_fnc_globalEventJIP;
// 		};	
// 	} forEach _affectedLamps;

// 	{
// 		_x params ["_lightpoint", "_lightParams"];
// 		_lightParams params ["_color", "_attenuation"];
// 		_attenuation params ["_range", "_constant", "_linear", "_quadratic"];

//         [QEGVAR(common,execute), [{
//             params ["_state", "_lightpoint", "_color", "_attenuation"];
// 			_attenuation params ["_range", "_constant", "_linear", "_quadratic"];

			
//             _lightpoint setLightColor ([[0,0,0], _color] select _state);
//         }, [_state, _lightpoint, _color, [_range, _constant, _linear, _quadratic]]]] call CBA_fnc_globalEventJIP;
// 	} forEach _sources;

// 	sleep (random 1);
// };

// {
// 	if (_x call EFUNC(common,getLightingSelections) isNotEqualTo []) then {
// 		private _eventID = format [QGVAR(moduleToggleLamps_%1), _x call BIS_fnc_netId];
// 		[QEGVAR(common,setLampState), [_x, true, false], _eventID] call CBA_fnc_globalEventJIP;
// 	};	
// } forEach _affectedLamps;

// {
// 	_x params ["_lightpoint", "_lightParams"];
// 	_lightParams params ["_color", "_attenuation"];
// 	_attenuation params ["_range", "_constant", "_linear", "_quadratic"];

// 	[QEGVAR(common,execute), [{
// 		params ["_state", "_lightpoint", "_color", "_attenuation"];
// 		_attenuation params ["_range", "_constant", "_linear", "_quadratic"];

		
// 		_lightpoint setLightColor _color;
// 	}, [true, _lightpoint, _color, [_range, _constant, _linear, _quadratic]]]] call CBA_fnc_globalEventJIP;
// } forEach _sources;