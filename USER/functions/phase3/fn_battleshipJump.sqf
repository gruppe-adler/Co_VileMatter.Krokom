if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };
// if !(canSuspend) exitWith { _this spawn GRAD_VM_fnc_battleshipJump; };

// playSound3D [getMissionPath "sounds\Capital_Ship_Detected.ogg", Grad_VM_commsArray, false, getPosASL Grad_VM_commsArray, 5];
// playSound "Ship_Detected";
["Ship_Detected"] remoteExec ["playSound", [0, -2] select isMultiplayer];
[3500] remoteExec ["setViewDistance", [0, -2] select isMultiplayer];

// playSound3D [getMissionPath "USER\sounds\Hyperspace_Jump_Loud.ogg", GRAD_VM_BattleshipSound, false, getPosASL GRAD_VM_BattleshipSound, 5];
[GRAD_VM_BattleshipSound, ["Hyperspace_Jump", 10000, 1, false, 0]] remoteExec ["say3D", [0, -2] select isMultiplayer];
sleep 11;

[] remoteExec ["GRAD_VM_phase3_fnc_handleBattleshipLocal", [0, -2] select isMultiplayer];

// [] remoteExec ["GRAD_VM_phase3_fnc_jumpEffect", [0, -2] select isMultiplayer];
// // execVM "functions\phase3\fn_jumpEffect.sqf";

// movementSpeed = 10; 
// private _pfhHandler = [ 
//  { 
//   params ["_args", "_handle"]; 
//   _args params ["_shipPos"]; 
 
//   movementSpeed = movementSpeed/1.03; 
//   private _newPos = GRAD_VM_Battleship getRelPos [movementSpeed, 180]; 
//   _newPos = AGLToASL _newPos; 
//   _newPos set [2, _shipPos # 2]; 
 
//   if (movementSpeed < 1) then { 
// 	movementSpeed = 0.025;
//   }; 
 
//   GRAD_VM_Battleship setPosASL _newPos; 
//  }, 
//  0, 
//  [getPosASL GRAD_VM_Battleship] 
// ] call CBA_fnc_addPerFrameHandler;

sleep 4;

private _soundSource = createSoundSource ["GRAD_VM_AlarmSound", Grad_VM_commsArray, [], 0];

sleep 3;

[Grad_VM_commsArray, ["The_slaves_are_here", 800, 1, false, 0]] remoteExec ["say3D", [0, -2] select isMultiplayer];

sleep 3.5;

[Grad_VM_commsArray, ["Imperial_Maggots", 800, 0.9, false, 0]] remoteExec ["say3D", [0, -2] select isMultiplayer];

sleep 1.5;

private _allHydras = [Grad_VM_AAphase3_1, Grad_VM_AAphase3_2, Grad_VM_AAphase3_3];
{
	[_x] spawn Grad_VM_phase3_fnc_fireAA;
	sleep (random 1);
} forEach _allHydras;

sleep 7;

{
	private _cannon = selectRandom ["GRAD_VM_cannonPos_1", "GRAD_VM_cannonPos_2", "GRAD_VM_cannonPos_3", "GRAD_VM_cannonPos_4"];
	[_cannon, getPosASL _x, "TIOW_IG_PlasmaCannon_Rnd", 20, 50, _x] remoteExec ["Grad_VM_phase3_fnc_battleshipFiring", [0, -2] select isMultiplayer];
	sleep ((random 2) + 3);
} forEach _allHydras;

[] call Grad_VM_phase3_fnc_spawnGuardsmen;

sleep 5;

// systemChat "Guardsmen";
[] spawn Grad_VM_phase3_fnc_startBattleshipBarrage;