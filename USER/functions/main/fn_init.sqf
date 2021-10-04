/*
0 - default
1 - opening starts with lightning
2 - move stuff to center
3 - beam and flare/portal
4 - delete stuff
*/

// EXTEND REVIVE BLEEDOUT TO INFINITY
if (isServer) then {

    // current Phase, max Phase
    private _gradVM_portalPhase = [
      0,
      [
        [0,4],
        [0,4],
        [0,4],
        [0,4]
      ]
    ];
    missionNamespace setVariable ["gradVM_portalPhase", _gradVM_portalPhase, true];

    call GRAD_VM_main_fnc_initPhase0;

    // iran cave
    gradVM_portalPhaseTarget_0 = getMarkerPos "mrk_phase_0_teleportTarget"; publicVariable "gradVM_portalPhaseTarget_0";

    // stonehenge
    gradVM_portalPhaseTarget_1 = getMarkerPos "mrk_phase_1_teleportTarget"; publicVariable "gradVM_portalPhaseTarget_1";

    // ww2 reichstag
    gradVM_portalPhaseTarget_2 = getMarkerPos "mrk_phase_2_teleportTarget"; publicVariable "gradVM_portalPhaseTarget_2";

    // warhammer future arena
    gradVM_portalPhaseTarget_3 = getMarkerPos "mrk_phase_3_teleportTarget"; publicVariable "gradVM_portalPhaseTarget_3";

    [{
        time > 1
    },{
        bis_revive_bleedOutDuration = 99999;
        publicVariable "bis_revive_bleedOutDuration";
    }, []] call CBA_fnc_waitUntilAndExecute;

    // MARCHING FIX
    ["lambs_danger_OnContact", {
        params ["_unit", "_group"];

        if (_unit getVariable ["GRAD_VM_isRoman", false]) then {
            {
                detach _x;
            } forEach attachedObjects _unit;
        };

    }] call CBA_fnc_addEventHandler;
};


// LOADING SCREEN MASK
if (hasInterface) then {

    "normal" cutText ["", "BLACK FADED", 15];

    ["CBA_loadingScreenDone", {
        [{
            !isGamePaused && isGameFocused
        },{

            [{
                playSound "gradVM_ropethump";
                [player] call grad_loadout_fnc_doLoadoutForUnit;
            }, [], 5] call CBA_fnc_waitAndExecute;

            [{
                "normal" cutText ["", "BLACK IN", 5];
            }, [], 15] call CBA_fnc_waitAndExecute;

        }, []] call CBA_fnc_waitUntilAndExecute;

    }] call CBA_fnc_addEventHandler;

};
