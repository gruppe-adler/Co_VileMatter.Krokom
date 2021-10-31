
if (!hasInterface) exitWith {};

[{
    lifeState player == "INCAPACITATED"
}, {
    player allowDamage false;
    ["GRAD_VM_curatorInfo", [_unit, "unconscious"]] call CBA_fnc_serverEvent;

    [{
        lifeState player != "INCAPACITATED"
    }, {
        player allowDamage true;
        [] spawn GRAD_VM_common_fnc_checkLifeState;
        ["GRAD_VM_curatorInfo", [_unit, "revived"]] call CBA_fnc_serverEvent;
        
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_waitUntilAndExecute;
