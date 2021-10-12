/*
* Spawns a guardsmen squad in the phase 3 arena.
*
* Arguments:
* 0: Use voicelines (optional) <BOOLEAN>
*
* Return Value:
* None
*
* Example:
* [] call Grad_VM_phase3_fnc_spawnGuardsmen;
*/

params [["_voicelines", true]];

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, [0, -2] select isMultiplayer]; };

private _spawnPads = [Grad_VM_marinePos_1, Grad_VM_marinePos_2, Grad_VM_marinePos_3, Grad_VM_marinePos_4, Grad_VM_marinePos_5, Grad_VM_marinePos_6,
					  Grad_VM_marinePos_7, Grad_VM_marinePos_8, Grad_VM_marinePos_9, Grad_VM_marinePos_10, Grad_VM_marinePos_11, Grad_VM_marinePos_12,
					  Grad_VM_marinePos_13, Grad_VM_marinePos_14, Grad_VM_marinePos_15];

private _group = createGroup independent;

// spawn a commisar first
[Grad_VM_marinePos_16] remoteExec ["Grad_VM_phase3_fnc_guardsmenSpawnEffect", [0, -2] select isMultiplayer];
sleep 0.1;
private _unit = _group createUnit ["TIOW_Comissar_I", Grad_VM_marinePos_16, [], 0, "NONE"];
_unit setDir (getDir Grad_VM_marinePos_16);

// schedule the voicelines after all guardsmen are spawned
if (_voicelines) then {
	[
		{
			params ["_unit", "_group"];
			[_unit, ["Charge", 500, 1]] remoteExec ["say3D", [0, -2] select isMultiplayer];

			[
				{
					params ["_unit"];
					[_unit, ["For_the_empirium_of_man", 500, 1]] remoteExec ["say3D", [0, -2] select isMultiplayer];
				},
				[selectRandom (units _group)],
				5
			] call CBA_fnc_waitAndExecute;
		},
		[_unit, _group],
		6
	] call CBA_fnc_waitAndExecute;
};

// spawn all guardsmen with their respective effects
{
	
	[_x] remoteExec ["Grad_VM_phase3_fnc_guardsmenSpawnEffect", [0, -2] select isMultiplayer];
	sleep 0.1;
	private _unit = _group createUnit [selectRandom ["TIOW_Cad_GM776th_Indep", "TIOW_Cad_SGT776th_Indep", "TIOW_Cad_VET776th_Indep"], _x, [], 0, "NONE"];
	_unit setDir (getDir _x);
	// _unit disableAI "MOVE";
	// _unit allowDamage false;
	// _unit say3D ["Teleport_phase3", 500, 0.85];
	[_unit, ["Teleport_phase3", 500, 0.85]] remoteExec ["say3D", [0, -2] select isMultiplayer];

	sleep (random 0.3);

} forEach _spawnPads;