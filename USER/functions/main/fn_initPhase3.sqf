/*

    server side, manages phase 3

*/

if (!isServer) exitWith {};

// todo insert correct object

// lighten up the phase 3 cave
[{
    ([3] call GRAD_VM_main_fnc_getPhaseProgress) > 0
},
{
    private _phase3Lamps = [Grad_VM_caveLamp_1, Grad_VM_caveLamp_2, Grad_VM_caveLamp_3, Grad_VM_caveLamp_4, Grad_VM_caveLamp_5, Grad_VM_caveLamp_6, Grad_VM_caveLamp_7, Grad_VM_caveLamp_8, Grad_VM_caveLamp_9, Grad_VM_caveLamp_10, Grad_VM_caveLamp_11];
    {
        private _brightness = _x getVariable ["Grad_VM_brightness", 0.42];
        [_x, _brightness] remoteExec ["Grad_VM_fnc_activateCaveLamp", [0, -2] select isMultiplayer];
    } forEach _phase3Lamps;
},[]] call CBA_fnc_waitUntilAndExecute;


// phase 3 init
[
    {
        [3] call GRAD_VM_main_fnc_getPhaseProgress == 3
    },
    {
        // playSound3D [getMissionPath "USER\sounds\teleport_global.ogg", light_phase0];
        private _duration = 38;
        {
            [{
                params ["_unit", "_targetposition", "_index", "_duration", "_numberStart", "_numberEnd"];
                ["BLU_F", "vm_vilematter_phase0", false] remoteExec ["GRAD_Loadout_fnc_FactionSetLoadout", _unit];
                [_unit, _targetposition, _index, _duration, _numberStart, _numberEnd] remoteExec ["GRAD_VM_teleport_fnc_teleport", _unit];
            }, [_x, (call GRAD_VM_main_fnc_getCurrentTeleportTarget), _forEachIndex, _duration, 9, 1945], (_forEachIndex/_count)*_duration*((random 1) min 0.5)] call CBA_fnc_waitAndExecute;
        } forEach playableUnits + switchableUnits;

        // end light effects
        [{
            ["grad_VM_phaseControl", [3, 4]] call CBA_fnc_serverEvent;

            // 3rd param is broadcast
            ["BLU_F", "vm_vilematter_phase0", true] call GRAD_Loadout_fnc_FactionSetLoadout;

        }, [], (_duration+5)] call CBA_fnc_waitAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;