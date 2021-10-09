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
        private _date = [2035,2,9,7,0];
        private _numberStart = 40560;
        private _numberEnd = 2035;
        private _count = count (playableUnits + switchableUnits);
        {
            [{
                params ["_unit", "_targetposition", "_index", "_duration", "_numberStart", "_numberEnd", "_date"];
                ["BLU_F", "vm_vilematter_phase0", false] remoteExec ["GRAD_Loadout_fnc_FactionSetLoadout", _unit];
                [_unit, _targetposition, _index, _duration, _numberStart, _numberEnd, _date] call GRAD_VM_teleport_fnc_teleport;
            }, [_x, (call GRAD_VM_main_fnc_getCurrentTeleportTarget), _forEachIndex, _duration, _numberStart, _numberEnd, _date], 
            (_forEachIndex/_count)*_duration+((random 1) max 0.5)] call CBA_fnc_waitAndExecute;
        } forEach playableUnits + switchableUnits;

        // end light effects
        [{
            params ["_date"];
            ["grad_VM_phaseControl", [3, 4]] call CBA_fnc_serverEvent;

            // 3rd param is broadcast
            ["BLU_F", "vm_vilematter_phase0", true] call GRAD_Loadout_fnc_FactionSetLoadout;
            [_date] remoteExec ["setDate"];

        }, [_date], (_duration+5)] call CBA_fnc_waitAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;