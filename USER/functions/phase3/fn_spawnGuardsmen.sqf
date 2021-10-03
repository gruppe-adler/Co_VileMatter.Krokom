if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, [0, -2] select isMultiplayer]; };
// if !(canSuspend) exitWith { _this spawn Grad_VM_fnc_spawnGuardsmen; };

private _spawnPads = [Grad_VM_marinePos_1, Grad_VM_marinePos_2, Grad_VM_marinePos_3, Grad_VM_marinePos_4, Grad_VM_marinePos_5, Grad_VM_marinePos_6,
					  Grad_VM_marinePos_7, Grad_VM_marinePos_8, Grad_VM_marinePos_9, Grad_VM_marinePos_10, Grad_VM_marinePos_11, Grad_VM_marinePos_12,
					  Grad_VM_marinePos_13];

private _group = createGroup independent;
{
	
	[_x] remoteExec ["Grad_VM_phase3_fnc_guardsmenSpawnEffect", [0, -2] select isMultiplayer];
	sleep 0.1;
	private _unit = _group createUnit [selectRandom ["TIOW_Cad_GM776th_Indep", "TIOW_Cad_SGT776th_Indep", "TIOW_Cad_VET776th_Indep"], _x, [], 0, "NONE"];
	_unit setDir (getDir _x);
	// _unit disableAI "MOVE";
	// _unit allowDamage false;
	// _unit say3D ["Teleport_phase3", 500, 0.85];
	[_unit, ["Teleport_phase3", 500, 0.85]] remoteExec ["say3D", [0, -2] select isMultiplayer];

	sleep (random 0.4);

} forEach _spawnPads;

// private _newGroup = createGroup independent;
// (units _group) joinSilent _newGroup;
// _newGroup setBehaviour "CARELESS";

// sleep 1;

// playSound3D [getMissionPath "sounds\Captain_voiceLine.ogg", (leader _newGroup), false, getPosASL (leader _newGroup), 3, 0.9, 500];
// sleep 5.5;
// playSound3D [getMissionPath "sounds\For_the_Emperor_2.ogg", (leader _newGroup), false, getPosASL (leader _newGroup), 3, 1, 600];

// sleep 1.5;

// _group setBehaviour "AWARE";
// {
// 	_x enableAI "ALL";
// 	_x allowDamage true;
// } forEach (units _group);

// sleep 25;

// playSound3D [getMissionPath "sounds\Purge_the_xenos.ogg", (leader _newGroup), false, getPosASL (leader _newGroup), 3, 1, 600];