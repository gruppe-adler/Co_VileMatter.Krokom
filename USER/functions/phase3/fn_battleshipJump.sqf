if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };
// if !(canSuspend) exitWith { _this spawn GRAD_VM_fnc_battleshipJump; };

// playSound3D [getMissionPath "sounds\Capital_Ship_Detected.ogg", Grad_VM_commsArray, false, getPosASL Grad_VM_commsArray, 5];
// playSound "Ship_Detected";
["Ship_Detected"] remoteExec ["playSound", [0, -2] select isMultiplayer];
[3500] remoteExec ["setViewDistance", [0, -2] select isMultiplayer];

playSound3D [getMissionPath "USER\sounds\Hyperspace_Jump_Loud.ogg", GRAD_VM_BattleshipSound, false, getPosASL GRAD_VM_BattleshipSound, 5];
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

sleep 10;

// systemChat "Barrage";
[] spawn Grad_VM_phase3_fnc_startBattleshipBarrage;

sleep 5;

// systemChat "Guardsmen";
[] call Grad_VM_phase3_fnc_spawnGuardsmen;