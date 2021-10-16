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
        GRAD_VM_outro_showHelis = true;

        // create civilian scientist
        private _poorTarget = (createGroup civilian) createUnit ["C_scientist_02_formal_F", [672.032,719.395,6.15326], [], 0, "NONE"];
        _poorTarget setPos [672.032,719.395,6.15326];
        _poorTarget setDir 219.542;
        _poorTarget setUnitLoadout [[],[],[],["U_I_E_CBRN_Suit_01_EAF_F",[]],["rhsgref_otv_khaki",[]],["Tiger_Attack_Bag",[]],"","G_Respirator_blue_F",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
        missionNamespace setVariable ["GRAD_VM_phase4_bolderTarget", _poorTarget, true];       

        // start helis once players are close
        [
            {
                private _unitsPresent = (allPlayers select { side _x isEqualTo west }) inAreaArray [[603.419,702.497,4.987], 2, 5, 136.915, true, 6];
                (count _unitsPresent) > 0
            },
            {
                {                    
                    [_x, createGroup west] call BIS_fnc_spawnCrew;
                    _x engineOn true;
                } forEach [GRAD_VM_phase4_exfilHeli_1, GRAD_VM_phase4_exfilHeli_2];
            }
        ] call CBA_fnc_waitUntilAndExecute;
    },
    []
] call CBA_fnc_waitUntilAndExecute;