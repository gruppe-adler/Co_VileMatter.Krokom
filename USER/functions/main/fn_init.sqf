/*
0 - default
1 - opening starts with lightning
2 - move stuff to center
3 - beam and flare/portal
4 - delete stuff
*/

// start compound
gradVM_portalPhase_0 = 0;
gradVM_portalPhaseEnd_0 = 4;
gradVM_portalPhaseTarget_0 = getMarkerPos "mrk_phase_0_teleportTarget";

// stonehenge
gradVM_portalPhase_1 = 0;
gradVM_portalPhaseEnd_1 = 4;
gradVM_portalPhaseTarget_1 = getMarkerPos "mrk_phase_1_teleportTarget";

// ww2 reichstag
gradVM_portalPhase_2 = 0;
gradVM_portalPhaseEnd_2 = 4;
gradVM_portalPhaseTarget_2 = getMarkerPos "mrk_phase_2_teleportTarget";

// warhammer future arena
gradVM_portalPhase_3 = 0;
gradVM_portalPhaseEnd_3 = 4;
gradVM_portalPhaseTarget_3 = getMarkerPos "mrk_phase_3_teleportTarget";


if (hasInterface) then {

    "normal" cutText ["", "BLACK FADED", 5]; 

    ["CBA_loadingScreenDone", {
        [{
            !isGamePaused && isGameFocused
        },{

            [{
                playSound "gradVM_ropethump";
            }, [], 1] call CBA_fnc_waitAndExecute;

            [{
                "normal" cutText ["", "BLACK IN", 5];

                    enableCamShake true;
                    addCamShake [20, 2, 15];
            }, [], 5] call CBA_fnc_waitAndExecute;

        }, []] call CBA_fnc_waitUntilAndExecute;

    }] call CBA_fnc_addEventHandler;

};