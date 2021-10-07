/*
* Initiates a sequence of timed events regarding the appearance of the battleship in phase 3.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] spawn Grad_VM_phase3_fnc_battleshipJump;
*/

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

// plays some sounds and sets the ace_viewdistance to 3500m, so that the battlehsip will be visible
["Ship_Detected"] remoteExec ["playSound", [0, -2] select isMultiplayer];
[7, false] remoteExecCall ["ace_viewdistance_fnc_changeViewDistance", [0, -2] select isMultiplayer];
[GRAD_VM_BattleshipSound, ["Hyperspace_Jump", 10000, 1, false, 0]] remoteExec ["say3D", [0, -2] select isMultiplayer];
sleep 11;

// create and manage the movement of the local battleships
[] remoteExec ["GRAD_VM_phase3_fnc_handleBattleshipLocal", [0, -2] select isMultiplayer];
sleep 4;

// spawn the Alarm sound at the comms-Array
private _soundSource = createSoundSource ["GRAD_VM_AlarmSound", Grad_VM_commsArray, [], 0];
sleep 3.5;

// Chaos mocking the imperium
[Grad_VM_commsArray, ["The_slaves_are_here", 800, 1, false, 0]] remoteExec ["say3D", [0, -2] select isMultiplayer];
sleep 3.5;
[Grad_VM_commsArray, ["Imperial_Maggots", 800, 0.9, false, 0]] remoteExec ["say3D", [0, -2] select isMultiplayer];
sleep 1.5;

// aa starts engaging the battleship
private _allHydras = [Grad_VM_AAphase3_1, Grad_VM_AAphase3_2, Grad_VM_AAphase3_3];
{
	[_x] spawn Grad_VM_phase3_fnc_fireAA;
	sleep (random 2);
} forEach _allHydras;
sleep 10;

// battleship destroys the aa
{
	private _cannon = selectRandom ["GRAD_VM_cannonPos_1", "GRAD_VM_cannonPos_2", "GRAD_VM_cannonPos_3", "GRAD_VM_cannonPos_4"];
	[_cannon, getPosASL _x, "TIOW_IG_PlasmaCannon_Rnd", 20, 50, _x] remoteExecCall ["Grad_VM_phase3_fnc_battleshipFiring", [0, -2] select isMultiplayer];
	sleep ((random 3) + 3);
} forEach _allHydras;
sleep 5;

// imperial guardsmen warp in
[] call Grad_VM_phase3_fnc_spawnGuardsmen;
sleep 7;

// the battleship starts its barrage of random positions
[] spawn Grad_VM_phase3_fnc_startBattleshipBarrage;