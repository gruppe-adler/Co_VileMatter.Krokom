params ["_monsterType"];

if !(canSuspend) exitWith {
	_this spawn Grad_VM_fnc_stalked;
};

private _alreadyRunning = player getVariable ["GRAD_VM_stalkedIsRunning", false];
if (_alreadyRunning) exitWith {};
player setVariable ["GRAD_VM_stalkedIsRunning", true, true];

private _spawnPos = [player, 30, 60, 1] call BIS_fnc_findSafePos; //select { !([_x] call Grad_VM_fnc_objectIsOnScreen) };
if (_spawnPos isEqualTo [worldSize / 2, worldSize / 2, 0]) exitWith {};

private _monster = _monsterType createVehicleLocal _spawnPos;
_monster setDir (_monster getDir player);

private _handler = 
[
	{
		params ["_args", "_handle"];
		_args params ["_monster"];

		private _height = ((boundingBoxReal _monster) select 1) select 2;
		_pos = _monster modelToWorld [0, 0.4, _height / 1.5];
		systemChat str _pos;
		
		private _dir = _monster getDir player;
		if !([_pos] call Grad_VM_fnc_objectIsOnScreen) exitWith {
			private _newPos = _monster getPos [0.01, _dir];
			_monster setPos _newPos;
		};
		_monster setDir _dir;
		if ((_monster distance player) < 2) then {
			deleteVehicle _monster;
			player setVariable ["GRAD_VM_stalkedIsRunning", false, true];
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
	},
	0,
	[_monster]
] call CBA_fnc_addPerFrameHandler;