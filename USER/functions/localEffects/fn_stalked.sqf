/*
 * Starts a PFH that .
 *
 * Arguments:
 * The target object / position <OBJECT> or <ARRAY>
 *
 * Return Value:
 * The object can be seen <BOOL>
 *
 * Example:
 * [monster] call Grad_VM_fnc_objectIsOnScreen;
 */

params ["_monsterType"];

if !(canSuspend) exitWith {
	_this spawn Grad_VM_fnc_stalked;
};

private _alreadyRunning = player getVariable ["GRAD_VM_stalkedIsRunning", false];
if (_alreadyRunning) exitWith {};
player setVariable ["GRAD_VM_stalkedIsRunning", true, true];

private _counter = 0;
private _spawnPos = [worldSize / 2, worldSize / 2, 0];
while {_counter < 100} do {
	private _pos = [player, 30, 60, 1] call BIS_fnc_findSafePos;
	if !([[_pos # 0, _pos # 1, 0]] call Grad_VM_fnc_objectIsOnScreen) exitWith {
		_spawnPos = _pos;
	};
	_counter = _counter + 1;
};
if (_spawnPos isEqualTo [worldSize / 2, worldSize / 2, 0]) exitWith {};

private _monster = _monsterType createVehicleLocal _spawnPos;
_monster setDir (_monster getDir player);
_monster allowDamage false;
_monster switchMove "RR_anim_horrorTwitchPose_1";
// _monster switchMove "Acts_Arrival_Response";
// sleep 1.5;
// _monster enableSimulation false;

private _box = boundingBoxReal _monster;
_box params ["_low", "_high", "_diameter"];
private _top = [(_high#0) / 2, (_high#1) / 2, _high#2];  
private _left = [_high#0, (_high#1) / 2, (_high#2) / 2]; 
private _right = [_low#0, (_high#1)  / 2, (_high#2) / 2];

private _handler = 
[
	{
		params ["_args", "_handle"];
		_args params ["_monster", "_top", "_left", "_right", "_monsterType"];
;
		if !(alive _monster) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			player setVariable ["GRAD_VM_stalkedIsRunning", false, true];
			deleteVehicle _monster;
			[_monsterType] call Grad_VM_fnc_stalked;			
		};
		
		private _topVisible = [_monster modelToWorld _top] call Grad_VM_fnc_objectIsOnScreen;
		private _leftVisible = [_monster modelToWorld _left] call Grad_VM_fnc_objectIsOnScreen;
		private _rightVisible = [_monster modelToWorld _right] call Grad_VM_fnc_objectIsOnScreen;

		// createVehicle ["Sign_Sphere10cm_F", _monster modelToWorld _top, [], 0, "CAN_COLLIDE"];
		// createVehicle ["Sign_Sphere10cm_F", _monster modelToWorld _left, [], 0, "CAN_COLLIDE"];
		// createVehicle ["Sign_Sphere10cm_F", _monster modelToWorld _right, [], 0, "CAN_COLLIDE"];		
		
		private _dir = _monster getDir player;
		if !(_topVisible || _leftVisible || _rightVisible) exitWith {
			if ((_monster distance player) > 2) then {
				private _newPos = _monster getPos [0.07, _dir];
				_monster setPos _newPos;
				_monster setDir _dir;
			};
		};
		// _monster setDir _dir;
		if ((_monster distance player) < 2) then {
			[_handle] call CBA_fnc_removePerFrameHandler;
			deleteVehicle _monster;
			player setVariable ["GRAD_VM_stalkedIsRunning", false, true];
		};
	},
	0,
	[_monster, _top, _left, _right, _monsterType]
] call CBA_fnc_addPerFrameHandler;