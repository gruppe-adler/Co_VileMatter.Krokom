/*
* Spawns a marine squad in the phase 3 arena.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call Grad_VM_phase3_fnc_spawnMarines;
*/

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, [0, -2] select isMultiplayer]; };

params ["_spawnPads"];

private _group = createGroup west;
{
	
	[_x] remoteExec ["Grad_VM_fnc_marineSpawnEffect", [0, -2] select isMultiplayer];
	sleep 0.1;
	private _unit = _group createUnit ["TIOW_Tactical_IF_2", _x, [], 0, "NONE"];
	_unit setDir (getDir _x);
	_unit disableAI "MOVE";
	_unit allowDamage false;
	_unit say3D ["Teleport_phase3", 500, 0.85];

	sleep (random 0.5);

} forEach _spawnPads;

private _newGroup = createGroup independent;
(units _group) joinSilent _newGroup;
_newGroup setBehaviour "CARELESS";

sleep 1;

playSound3D [getMissionPath "USER\sounds\Captain_voiceLine.ogg", (leader _newGroup), false, getPosASL (leader _newGroup), 3, 0.9, 500];
sleep 5.5;
playSound3D [getMissionPath "USER\sounds\For_the_Emperor_2.ogg", (leader _newGroup), false, getPosASL (leader _newGroup), 3, 1, 600];

sleep 1.5;

_newGroup setBehaviour "AWARE";
{
	_x enableAI "ALL";
	_x allowDamage true;
} forEach (units _newGroup);

sleep 25;

playSound3D [getMissionPath "USER\sounds\Purge_the_xenos.ogg", (leader _newGroup), false, getPosASL (leader _newGroup), 3, 1, 600];