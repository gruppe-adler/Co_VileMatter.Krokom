params ["_rock", "_target"];

if (_target isEqualTo objNull) exitWith {};

private _localRock = "Land_Cliff_stone_big_F" createVehicleLocal [0,0,0];
private _vecDir = vectorDir _rock;
private _vecUp = vectorUp _rock;
private _pos = getPosASL _rock;
_localRock setPosASL _pos;
_localRock setDir (getDir _rock);
_localRock setVectorDirAndUp [_vecDir, _vecUp];

private _pen = "Land_PencilRed_F" createVehicleLocal [0,0,0];
// hideObject _pen;
_pen setPosASL [_pos#0, _pos#1, (_pos#2) - 1];
_localRock attachTo [_pen, [0,0,0]];

[
	{
		params ["_rock", "_target", "_pen"];
		private _height = (getPosASL _rock) # 2;
		_height < 290.187
	},
	{
		params ["_rock", "_target", "_pen"];
		hideObject _target;
	},
	[_localRock, _target, _pen]
] call CBA_fnc_waitUntilAndExecute;

[
	{
		params ["_rock", "_target", "_pen"];
		private _height = (getPosASL _rock) # 2;
		_height < 288.46
	},
	{
		params ["_rock", "_target", "_pen"];
		detach _rock;
		deleteVehicle _pen;
		[ASLToAGL (getPosASL _target)] call GRAD_VM_localEffects_fnc_meatSplashEffect;
	},
	[_localRock, _target, _pen]
] call CBA_fnc_waitUntilAndExecute;

// player setVariable ["GRAD_VM_rockFallTime", 0.1];
// private _pfh = 
// [
// 	{
// 		params ["_args", "_handle"];
// 		_args params ["_localRock", "_victim", "_height"];

// 		private _time = player getVariable ["GRAD_VM_rockFallTime", 1];
// 		private _pos = getPosASL _localRock;
// 		_newHeight = _height - (0.5 * 9.81 * _time^2);

// 		_localRock setPosASL [_pos#0, _pos#1, _newHeight max 288.36];
// 		player setVariable ["GRAD_VM_rockFallTime", _time + 0.05];

// 		if ((_newHeight < 290.187) && !(isObjectHidden _victim)) then {
// 			hideObject _victim;
// 		};
// 		if (_newHeight <= 288.36) exitWith {
// 			[_handle] call CBA_fnc_removePerFrameHandler;
// 			[
// 				{
// 					params ["_victim"];
// 					[ASLToAGL (getPosASL _victim)] call GRAD_VM_localEffects_fnc_meatSplashEffect;
// 				}, 
// 				[_victim],
// 				0
// 			] call CBA_fnc_waitAndExecute;
// 		};
		
// 	},
// 	0,
// 	[_rock, _target, _pos # 2]
// ] call CBA_fnc_addPerFrameHandler;