["GRAD_VM_curatorInfo",[player, "respawned"]] call CBA_fnc_serverEvent;

player setPosWorld (selectRandom ([-1] call GRAD_VM_main_fnc_getCurrentTeleportTarget));

["GRAD_VM_loadoutControl", [player]] call CBA_fnc_serverEvent;
