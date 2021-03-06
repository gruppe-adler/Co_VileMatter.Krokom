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

#include "scriptMacros.hpp"

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

GRAD_VM_phase3_shipActive = true;
publicVariable "GRAD_VM_phase3_shipActive";
// plays some sounds and sets the ace_viewdistance to 3500m, so that the battlehsip will be visible
["Ship_Detected"] remoteExec ["playSound", [0, -2] select isMultiplayer];
[3500, false] remoteExecCall ["ace_viewdistance_fnc_changeViewDistance", [0, -2] select isMultiplayer];
[GRAD_VM_BattleshipSound, ["Hyperspace_Jump", 10000, 1, false, 0]] remoteExec ["say3D", [0, -2] select isMultiplayer];
// [getPos phase3_teleportcrystal, 200, 12] spawn GRAD_VM_phase3_fnc_startLightFlickering;
sleep 11;

// create and manage the movement of the local battleships
[] remoteExec ["GRAD_VM_phase3_fnc_handleBattleshipLocal", [0, -2] select isMultiplayer];
// [] call GRAD_VM_phase3_fnc_handleBattleshipServer;
// long delay to counter lag-spike ^^'
sleep 20;

// spawn the Alarm sound at the comms-Array
private _soundSource = createSoundSource ["GRAD_VM_AlarmSound", Grad_VM_commsArray, [], 0];
missionNamespace setVariable ["GRAD_VM_phase3_alarmSoundsource", _soundSource, true];
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
	private _startPosServer = AGLToASL (GRAD_VM_battleship modelToWorld (GRAD_VM_battleship getVariable _cannon));
	private _distance = _startPosServer distance (getPosASL _x);
	private _estimatedTravelTime = _distance / (PROJECTILE_SPEED_METERS * PROJECTILE_SPEED_FRAMES);
	[
		{
			params ["_pos"];
			private _projectile = "TIOW_IG_PlasmaCannon_Rnd" createVehicleLocal _pos;
			_projectile setPosASL _pos;
			_projectile setVelocity [0,0,-1];
		},
		[getPosASL _x],
		_estimatedTravelTime
	] call CBA_fnc_waitAndExecute;
	sleep ((random 2) + 2);
} forEach _allHydras;
sleep 5;

// imperial guardsmen warp in
[] call Grad_VM_phase3_fnc_spawnGuardsmen;
sleep 7;

// the battleship starts its barrage of random positions
[] spawn Grad_VM_phase3_fnc_startBattleshipBarrage;