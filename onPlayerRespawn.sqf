["GRAD_VM_curatorInfo",[player, "respawned"]] call CBA_fnc_serverEvent;


private _currentPhase = call GRAD_VM_main_fnc_getCurrentPhase;

if (_currentPhase > 0) then {
    player setPos ([(_currentPhase - 1)] call GRAD_VM_main_fnc_getCurrentTeleportTarget);
};