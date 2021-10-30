if (!hasInterface) exitWith {};

[{
    lifeState player == "INCAPACITATED"
}, {
    player allowDamage false;

    [{
        lifeState player != "INCAPACITATED"
    }, {
        player allowDamage true;
        [] call GRAD_VM_common_fnc_handleUnconscious;
        
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_waitUntilAndExecute;