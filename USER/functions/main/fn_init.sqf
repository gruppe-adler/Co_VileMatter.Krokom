/*
0 - default
1 - opening starts with lightning
2 - move stuff to center
3 - beam and flare/portal
4 - delete stuff
*/

// EXTEND REVIVE BLEEDOUT TO INFINITY
if (isServer) then {

    setTimeMultiplier 0.1;

    // current Phase, max Phase
    private _grad_VM_portalPhase = [
      0,
      [
        [0,4],
        [0,4],
        [0,4],
        [0,4]
      ]
    ];
    missionNamespace setVariable ["grad_VM_portalPhase", _grad_VM_portalPhase, true];
    ["BLU_F", "vm_vilematter_phase0", true] call GRAD_Loadout_fnc_FactionSetLoadout;

    [2500, false] remoteExecCall ["ace_viewdistance_fnc_changeViewDistance", [0, -2] select isMultiplayer];

    // relevant only for AI
    { 
        [_x] call grad_loadout_fnc_doLoadoutForUnit;
    } forEach playableUnits + switchableUnits;

    // start phase 0 manually
    call GRAD_VM_main_fnc_initPhase0;

 
    [{
        time > 1
    },{
        bis_revive_bleedOutDuration = 99999;
        publicVariable "bis_revive_bleedOutDuration";
    }, []] call CBA_fnc_waitUntilAndExecute;

};


// LOADING SCREEN MASK
if (hasInterface) then {

    "normal" cutText ["", "BLACK FADED", 15];

    ["CBA_loadingScreenDone", {
        [{
            !isGamePaused && isGameFocused
        },{

            [{
                if ([] call GRAD_VM_main_fnc_getCurrentPhase < 1) then {
                    playSound "grad_VM_ropethump";
                };
                [player] call grad_loadout_fnc_doLoadoutForUnit;
                player setPosWorld (selectRandom ([(_currentPhase - 1)] call GRAD_VM_main_fnc_getCurrentTeleportTarget));
            }, [], 5] call CBA_fnc_waitAndExecute;

            [{
                "normal" cutText ["", "BLACK IN", 5];
            }, [], 15] call CBA_fnc_waitAndExecute;

        }, []] call CBA_fnc_waitUntilAndExecute;

    }] call CBA_fnc_addEventHandler;

};
