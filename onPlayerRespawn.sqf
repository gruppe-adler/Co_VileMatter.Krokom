["GRAD_VM_curatorInfo",[player, "respawned"]] call CBA_fnc_serverEvent;

player setPosWorld (selectRandom ([-1] call GRAD_VM_main_fnc_getCurrentTeleportTarget));
