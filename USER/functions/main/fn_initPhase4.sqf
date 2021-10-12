/*

    server side, manages phase 4

*/

if (!isServer) exitWith {};

// todo insert correct object


[
    {
        ([] call GRAD_VM_main_fnc_getCurrentPhase) isEqualTo 4
    },
    {
        {
            _x enableSimulationGlobal true;
            _x hideObjectGlobal false;
            _x allowDamage false;
            _x engineOn true;
        } forEach [GRAD_VM_phase4_exfilHeli_1, GRAD_VM_phase4_exfilHeli_2];
    },
    []
] call CBA_fnc_waitUntilAndExecute;