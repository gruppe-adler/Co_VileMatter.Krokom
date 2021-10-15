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
            // _x engineOn true;
        } forEach [GRAD_VM_phase4_exfilHeli_1, GRAD_VM_phase4_exfilHeli_2];

        // create civilian scientist
        private _poorTarget = (createGroup civilian) createUnit ["C_scientist_02_formal_F", [672.032,719.395,6.15326], [], 0, "NONE"];
        _poorTarget setPos [672.032,719.395,6.15326];
        _poorTarget setDir 219.542;
        _poorTarget setUnitLoadout [[],[],[],["U_I_E_CBRN_Suit_01_EAF_F",[]],["rhsgref_otv_khaki",[]],["Tiger_Attack_Bag",[]],"","G_Respirator_blue_F",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
        missionNamespace setVariable ["GRAD_VM_phase4_bolderTarget", _poorTarget, true];
    },
    []
] call CBA_fnc_waitUntilAndExecute;