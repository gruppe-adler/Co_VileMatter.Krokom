// create the local battleship
private _battleship = "TIOW_Oberon" createVehicleLocal [0, 0, 0];
_battleship hideObject true;
_battleship setPosASL (getPosASL GRAD_VM_Battleship);
_battleship setDir (getDir GRAD_VM_Battleship);
player setVariable ["GRAD_VM_localBattleship", _battleship, true];

[_battleship] call GRAD_VM_phase3_fnc_jumpEffect;

movementSpeed = 10; 
private _pfhHandler = [ 
	{ 
	params ["_args", "_handle"]; 
	_args params ["_shipPos", "_ship"]; 
	
	movementSpeed = movementSpeed/1.03; 
	private _newPos = _ship getRelPos [movementSpeed, 180]; 
	_newPos = AGLToASL _newPos; 
	_newPos set [2, _shipPos # 2]; 
	
	if (movementSpeed < 1) then { 
		movementSpeed = 0.035;
	}; 
	
		_ship setPosASL _newPos; 
	}, 
	0, 
	[getPosASL _battleship, _battleship] 
] call CBA_fnc_addPerFrameHandler;