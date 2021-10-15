/*
* Creates and moves the local battleship of a player. 
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call Grad_VM_phase3_fnc_handleBattleshipServer;
*/

#include "scriptMacros.hpp"

// create the local battleship
// private _battleship = "TIOW_Oberon" createVehicleLocal [0, 0, 0];
// _battleship hideObject true;
// _battleship setPosASL (getPosASL GRAD_VM_Battleship);
// _battleship setDir (getDir GRAD_VM_Battleship);
// player setVariable ["GRAD_VM_localBattleship", _battleship, true];

// add the battleship's spawn effect
// [_battleship] call GRAD_VM_phase3_fnc_jumpEffect;

// add the pfh to move the battleship

GRAD_VM_Battleship hideObjectGlobal true;
movementSpeed = 10; 
private _pfhHandler = [ 
	{ 
	params ["_args", "_handle"]; 
	_args params ["_shipPos", "_ship"]; 
	
	if (([] call GRAD_VM_main_fnc_getCurrentPhase) isNotEqualTo 3) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		// wait a few seconds to delete the ship, to avoid conflicts with the ship firing
		[
			{
				params ["_ship"];
				deleteVehicle _ship;
			},
			[GRAD_VM_Battleship],
			8.2
		] call CBA_fnc_waitAndExecute;
	};
	
	movementSpeed = movementSpeed/1.03; 
	private _newPos = GRAD_VM_Battleship getRelPos [movementSpeed, 180]; 
	_newPos = AGLToASL _newPos; 
	_newPos set [2, _shipPos # 2]; 
	
	if (movementSpeed < 1) then { 
		movementSpeed = SHIP_SPEED;
	}; 
	
		GRAD_VM_Battleship setPosASL _newPos; 
	}, 
	0, 
	[getPosASL GRAD_VM_Battleship, GRAD_VM_Battleship] 
] call CBA_fnc_addPerFrameHandler;