/*

    server side, manages phase 3

*/

if (!isServer) exitWith {};

// todo insert correct object


[{
    gradVM_portalPhase_3 > 0
},
{
  // [stoneHengerCenter] remoteExec ["GRAD_VM_phase3_fnc_stoneHengeFX", [0,-2] select isDedicated, true];
},[]] call CBA_fnc_waitUntilAndExecute;


// phase 3 init
[
    { gradVM_portalPhase_3 == 3 },
    {
        // playSound3D [getMissionPath "USER\sounds\teleport_global.ogg", light_phase0];
        private _duration = 38;
        {
            [{
                params ["_unit", "_targetposition", "_index", "_duration", "_numberStart", "_numberEnd"];
                ["BLU_F", "vm_vilematter_phase0", false] remoteExec ["GRAD_Loadout_fnc_FactionSetLoadout", _unit];
                [_unit, _targetposition, _index, _duration, _numberStart, _numberEnd] remoteExec ["GRAD_VM_teleport_fnc_teleport", _unit];
            }, [_x, gradVM_portalPhaseTarget_2, _forEachIndex, _duration, 9, 1945], (_forEachIndex/_count)*_duration*((random 1) min 0.5)] call CBA_fnc_waitAndExecute;
        } forEach playableUnits + switchableUnits;

        // end light effects
        [{
            ["gradVM_phaseControl", [3, 4]] call CBA_fnc_serverEvent;

            // 3rd param is broadcast
            ["BLU_F", "vm_vilematter_phase0", true] call GRAD_Loadout_fnc_FactionSetLoadout;

        }, [], (_duration+5)] call CBA_fnc_waitAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;