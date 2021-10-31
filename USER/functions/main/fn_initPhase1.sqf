/*

    server side, manages phase 1

*/

if (!isServer) exitWith {};

[phase1_pedestal] remoteExec ["GRAD_VM_phase1_fnc_stoneHengeFX", [0,-2] select isDedicated, true];
[] remoteExec ["GRAD_VM_phase1_fnc_brighterNight", [0,-2] select isDedicated, true];
[] call createDruidCircle;
// phase 0 init
[
    {
        ([1] call GRAD_VM_main_fnc_getPhaseProgress) == 1
    },
    {
        [phase1_pedestal] remoteExec ["GRAD_VM_phase1_fnc_portalOpening", 0, true];

}, []] call CBA_fnc_waitUntilAndExecute;

// phase 3 init
[
    {
      [1] call GRAD_VM_main_fnc_getPhaseProgress == 3
    },
    {
        diag_log "phase 1 done";

        playSound3D [getMissionPath "USER\sounds\teleport_global.ogg", phase1_pedestal];
        private _duration = 38;
        private _date = [2035,2,9,7,05];
        private _numberStart = 9;
        private _numberEnd = 1945;
        private _count = count (playableUnits + switchableUnits);
        {
            [{
                params ["_unit", "_targetposition", "_index", "_duration", "_numberStart", "_numberEnd", "_date"];
                ["BLU_F", "vm_vilematter_phase2", false] remoteExec ["GRAD_Loadout_fnc_FactionSetLoadout", _unit];
                [_unit, _targetposition, _index, _duration, _numberStart, _numberEnd, _date] call GRAD_VM_teleport_fnc_teleport;
            }, [_x, ([1] call GRAD_VM_main_fnc_getCurrentTeleportTarget), _forEachIndex, _duration, _numberStart, _numberEnd, _date], 
            (_forEachIndex/_count)*_duration+((random 1) max 0.5)] call CBA_fnc_waitAndExecute;
        } forEach playableUnits + switchableUnits;

        // end light effects
        [{
            params ["_date"];
            ["grad_VM_phaseControl", [1, 4]] call CBA_fnc_serverEvent;
            call GRAD_VM_main_fnc_initPhase2;
            // 3rd param is broadcast
            ["BLU_F", "vm_vilematter_phase2", true] call GRAD_Loadout_fnc_FactionSetLoadout;
            [_date] remoteExec ["setDate"];


        }, [_date], (_duration+5)] call CBA_fnc_waitAndExecute;

        [{
            [] spawn GRAD_VM_phase2_fnc_ambientSounds;
        }, [], 90] call CBA_fnc_waitAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;

// delete phase1 sound sources
[
    {
        ([1] call GRAD_VM_main_fnc_getCurrentPhase) isEqualTo 3
    },
    {
        private _sounds = missionNamespace getVariable ["GRAD_VM_phase1_ambientSources", []];
        {
            deleteVehicle _x;   
        } forEach _sounds;

         missionNamespace setVariable ["GRAD_VM_phase1_ambientSources", []];
    },
    []
] call CBA_fnc_waitUntilAndExecute;