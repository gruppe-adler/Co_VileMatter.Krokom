private _cam = "camera" camCreate (getPos GRAD_VM_outro_camPos_1);
_cam camSetPos (getPos GRAD_VM_outro_camPos_1);
_cam camSetTarget GRAD_VM_outro_Target_1;
_cam camCommit 0;
_cam cameraEffect ["internal", "BACK"];

// [] call ace_goggles_fnc_removeDirtEffect;
[2] call GRAD_VM_outro_fnc_fadeFromBlack;
2 fadeSound 0.1;
2 fadeSpeech 0;

sleep 5;

_cam camSetTarget GRAD_VM_outro_Target_2;
_cam camCommit 5;

sleep 4;

private _rockType = typeOf GRAD_VM_outro_closingRock_1;
private _rock = _rockType createVehicleLocal [0,0,0];
_rock setDir (getDir GRAD_VM_outro_closingRock_1);
_rock setVectorDirAndUp [vectorDir GRAD_VM_outro_closingRock_1, vectorUp GRAD_VM_outro_closingRock_1];
private _pos = getPosASL GRAD_VM_outro_closingRock_1;
_rock setPosASL _pos;
GRAD_VM_outro_closingRock_1 hideObject true;

private _pen1 = "Land_PencilRed_F" createVehicleLocal [0,0,0];
// hideObject _pen;
_pen1 setPosASL [_pos#0, _pos#1, (_pos#2) - 1];
_rock attachTo [_pen1, [0,0,0]];

[
	{
		params ["_rock", "_pen"];
		private _height = (getPos _rock) # 2;
		_height < 286.836
	},
	{
		params ["_rock", "_pen"];
		detach _rock;
		deleteVehicle _pen;
	},
	[_rock, _pen1]
] call CBA_fnc_waitUntilAndExecute;


private _rockType = typeOf GRAD_VM_outro_closingRock_2;
private _rock2 = _rockType createVehicleLocal [0,0,0];
_rock2 setDir (getDir GRAD_VM_outro_closingRock_2);
_rock2 setVectorDirAndUp [vectorDir GRAD_VM_outro_closingRock_2, vectorUp GRAD_VM_outro_closingRock_2];
private _pos2 = getPosASL GRAD_VM_outro_closingRock_1;
_rock2 setPosASL (getPosASL GRAD_VM_outro_closingRock_2);
GRAD_VM_outro_closingRock_2 hideObject true;

private _pen2 = "Land_PencilRed_F" createVehicleLocal [0,0,0];
// hideObject _pen;
_pen2 setPosASL [_pos2#0, _pos2#1, (_pos2#2) - 1];
_rock2 attachTo [_pen2, [0,0,0]];

[
	{
		params ["_rock", "_pen"];
		private _height = (getPosASL _rock) # 2;
		_height < 286.836
	},
	{
		params ["_rock", "_pen"];
		detach _rock;
		deleteVehicle _pen;
	},
	[_rock2, _pen2]
] call CBA_fnc_waitUntilAndExecute;

// private _pfh = 
// [
// 	{
// 		params ["_args", "_handle"];
// 		_args params ["_localRock", "_height", "_xPos", "_yPos"];

// 		private _time = player getVariable ["GRAD_VM_closingRockFallTime_1", 0.9];
// 		private _pos = getPosASL _localRock;
// 		_newHeight = _height - (0.5 * 9.81 * _time^2);

// 		_localRock setPosASL [_xPos, _yPos, _newHeight max 286.836];
// 		player setVariable ["GRAD_VM_closingRockFallTime_1", _time + 0.06];

// 		if (_newHeight <= 286.836) exitWith {
// 			[_handle] call CBA_fnc_removePerFrameHandler;
// 		};
		
// 	},
// 	0,
// 	[_rock, (getPosASL GRAD_VM_outro_closingRock_1) # 2, (getPosASL GRAD_VM_outro_closingRock_1) # 0, (getPosASL GRAD_VM_outro_closingRock_1) # 1]
// ] call CBA_fnc_addPerFrameHandler;

// private _pfh = 
// [
// 	{
// 		params ["_args", "_handle"];
// 		_args params ["_localRock", "_height", "_xPos", "_yPos"];

// 		private _time = player getVariable ["GRAD_VM_closingRockFallTime_2", 0.9];
// 		private _pos = getPosASL _localRock;
// 		_newHeight = _height - (0.5 * 9.81 * _time^2);

// 		_localRock setPosASL [_xPos, _yPos, _newHeight max 286.836];
// 		player setVariable ["GRAD_VM_closingRockFallTime_2", _time + 0.06];

// 		if (_newHeight <= 286.836) exitWith {
// 			[_handle] call CBA_fnc_removePerFrameHandler;
// 		};
		
// 	},
// 	0,
// 	[_rock2, (getPosASL GRAD_VM_outro_closingRock_2) # 2, (getPosASL GRAD_VM_outro_closingRock_2) # 0, (getPosASL GRAD_VM_outro_closingRock_2) # 1]
// ] call CBA_fnc_addPerFrameHandler;