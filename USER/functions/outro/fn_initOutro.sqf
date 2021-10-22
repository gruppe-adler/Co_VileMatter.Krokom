if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

private _copilotTurrets = allTurrets GRAD_VM_phase4_exfilHeli_1 select { getNumber ([GRAD_VM_phase4_exfilHeli_1, _x] call BIS_fnc_turretConfig >> "isCopilot") > 0 };
private _copilot = (_copilotTurrets apply { GRAD_VM_phase4_exfilHeli_1 turretUnit _x }) # 0;
_copilot setUnitLoadout [[],[],["LIB_P08","","","",["LIB_8Rnd_9x19_P08",8],[],""],["U_LIB_GER_Oberst",[]],["V_LIB_GER_OfficerBelt",[]],[],"H_LIB_DAK_OfficerCap","",[],["","","ItemRadio","ItemCompass","gm_watch_kosei_80",""]];
[_copilot, "adi_face"] remoteExec ["setFace", 0, _copilot];

[] remoteExec ["GRAD_VM_outro_fnc_scene1", [0, -2] select isMultiplayer];
sleep 6;

[] remoteExec ["GRAD_VM_outro_fnc_scene2", [0, -2] select isMultiplayer];
sleep 3;

{
	[
		{
			params ["_object"];
			deleteVehicle _object;
		},
		[_x],
		random 3 + 1
	] call CBA_fnc_waitAndExecute;
} forEach [GRAD_VM_outro_platform_1, GRAD_VM_outro_platform_2, GRAD_VM_outro_tower_1];

{                    
	private _group = group _x;
	_group setBehaviour "CARELESS";
	_group addWaypoint [[-4156.77,1986.5,0], 0];
	sleep 1;
} forEach [GRAD_VM_phase4_exfilHeli_1, GRAD_VM_phase4_exfilHeli_2];
sleep 4.5;

(driver GRAD_VM_phase4_exfilHeli_1) unassignItem "NVGoggles";

GRAD_VM_phase4_lamp_1 setDamage 1;
GRAD_VM_outro_Truck setDamage 1;


sleep 6;

private _hitlerWatchPoint = "Land_HelipadEmpty_F" createVehicle (getPos GRAD_VM_phase4_exfilHeli_1);
_hitlerWatchPoint attachTo [GRAD_VM_phase4_exfilHeli_1, [-0.033783,7.48343,-0.329193]];
[] remoteExec ["GRAD_VM_outro_fnc_scene3", [0, -2] select isMultiplayer];
sleep 2;
_copilot lookAt _hitlerWatchPoint;

sleep 17;
[] spawn GRAD_VM_outro_fnc_createDance;

// "pilot_heli_transport_03_idle"