if (!isServer) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

// rock shower after the first door
[
	{
		private _unitsPresent = (allPlayers select { side _x isEqualTo west }) inAreaArray [[669.588,716.957,6], 2, 4, 304.892, true, 6];
		(count _unitsPresent) > 0
	},
	{
		[getPos GRAD_VM_rockShowerSource_1, GRAD_VM_rockShowerSource_1, 10, 2] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
		[GRAD_VM_rockShowerSource_1, ["rocksFalling_1", 100]] remoteExec ["say3D", [0, -2] select isMultiplayer];
		// [3, 4, 40] remoteExec ["addCamShake", [0, -2] select isMultiplayer];
	}
] call CBA_fnc_waitUntilAndExecute;

// bolder smashing unit
[
	{
		private _unitsPresent = (allUnits select { side _x isEqualTo civilian }) inAreaArray [[664.518,738.426,6], 2, 3, 226.469, true, 6];
		(count _unitsPresent) > 0
	},
	{
		private _unitsPresent = (allUnits select { side _x isEqualTo civilian }) inAreaArray [[664.518,738.426,6], 2, 3, 226.469, true, 6];
		// [GRAD_VM_fallingStone, _unitsPresent # 0] remoteExec ["GRAD_VM_phase4_fnc_smashingRock", [0, -2] select isMultiplayer];
		[GRAD_VM_fallingStone, missionNamespace getVariable ["GRAD_VM_phase4_bolderTarget", objNull]] remoteExec ["GRAD_VM_phase4_fnc_smashingRock", [0, -2] select isMultiplayer];
	}
] call CBA_fnc_waitUntilAndExecute;

// rock shower after stairs
[
	{
		private _unitsPresent = (allPlayers select { side _x isEqualTo west }) inAreaArray [[655.245,748.018,5], 5, 5, 0, false, 6];
		(count _unitsPresent) > 0
	},
	{
		[getPos GRAD_VM_rockShowerSource_2, GRAD_VM_rockShowerSource_2, 10, 2] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
		[GRAD_VM_rockShowerSource_2, ["rocksFalling_3", 100]] remoteExec ["say3D", [0, -2] select isMultiplayer];
		// [3, 4, 40] remoteExec ["addCamShake", [0, -2] select isMultiplayer];
	}
] call CBA_fnc_waitUntilAndExecute;

// rock shower next to scaffolding
[
	{
		private _unitsPresent = (allPlayers select { side _x isEqualTo west }) inAreaArray [[626.891,726.544,5], 3, 8, 310.958, true, 6];
		(count _unitsPresent) > 0
	},
	{
		[getPos GRAD_VM_rockShowerSource_3, GRAD_VM_rockShowerSource_3, 10, 4] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
		[GRAD_VM_rockShowerSource_3, ["rocksFalling_2", 100]] remoteExec ["say3D", [0, -2] select isMultiplayer];
		// [3, 4, 40] remoteExec ["addCamShake", [0, -2] select isMultiplayer];
	}
] call CBA_fnc_waitUntilAndExecute;

// rock shower arc
[
	{
		private _unitsPresent = (allPlayers select { side _x isEqualTo west }) inAreaArray [[584.555,691.749,0.0809937], 3, 4.5, 135.868, true, 6];
		(count _unitsPresent) > 0
	},
	{
		[getPos GRAD_VM_rockShowerSource_4, GRAD_VM_rockShowerSource_4, 10, 60, [0,0,0], 2] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
		[getPos GRAD_VM_rockShowerSource_5, GRAD_VM_rockShowerSource_5, 10, 90, [0,0,0], 1] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
		// [GRAD_VM_rockShowerSource_4, ["rocksFalling_2", 100]] remoteExec ["say3D", [0, -2] select isMultiplayer];
		// [3, 4, 40] remoteExec ["addCamShake", [0, -2] select isMultiplayer];
	}
] call CBA_fnc_waitUntilAndExecute;

[
	{
		private _unitsPresent = (allPlayers select { side _x isEqualTo west }) inAreaArray [[643.366,746.862,4.987], 3, 8, 315.677, true, 6];
		(count _unitsPresent) > 0
	},
	{
		[getPos GRAD_VM_rockShowerSource_6, GRAD_VM_rockShowerSource_6, 10, 2] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
		[GRAD_VM_rockShowerSource_6, ["rocksFalling_1", 100]] remoteExec ["say3D", [0, -2] select isMultiplayer];
	}
] call CBA_fnc_waitUntilAndExecute;

[
	{
		private _unitsPresent = (allPlayers select { side _x isEqualTo west }) inAreaArray [[603.419,702.497,4.987], 2, 5, 136.915, true, 6];
		(count _unitsPresent) > 0
	},
	{
		[getPos GRAD_VM_rockShowerSource_7, GRAD_VM_rockShowerSource_7, 10, 2] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
		[GRAD_VM_rockShowerSource_7, ["rocksFalling_3", 100]] remoteExec ["say3D", [0, -2] select isMultiplayer];
	}
] call CBA_fnc_waitUntilAndExecute;