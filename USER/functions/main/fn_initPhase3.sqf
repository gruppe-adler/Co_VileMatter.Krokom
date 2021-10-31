/*

    server side, manages phase 3

*/

if (!isServer) exitWith {};

// lighten up the phase 3 cave
[{
    ([] call GRAD_VM_main_fnc_getCurrentPhase) isEqualTo 3
},
{
    private _phase3Lamps = [Grad_VM_caveLamp_1, Grad_VM_caveLamp_2, Grad_VM_caveLamp_3, Grad_VM_caveLamp_4, Grad_VM_caveLamp_5, Grad_VM_caveLamp_6, Grad_VM_caveLamp_7, Grad_VM_caveLamp_8, Grad_VM_caveLamp_9, Grad_VM_caveLamp_10, Grad_VM_caveLamp_11, Grad_VM_caveLamp_12];
    {
        private _brightness = _x getVariable ["Grad_VM_brightness", 0.42];
        [_x, _brightness] remoteExec ["Grad_VM_phase3_fnc_activateCaveLamp", [0, -2] select isMultiplayer];
    } forEach _phase3Lamps;

    [1000] remoteExec ["Grad_VM_phase3_fnc_hideTreesLocal", [0, -2] select isMultiplayer];

    private _light = createSimpleObject ["\A3\data_f\VolumeLight", getPosASL GRAD_VM_phase3_volumeLightPos];
    [_light, -90, 0] call BIS_fnc_setPitchBank;
    [_light, 15] call GRAD_VM_common_fnc_setObjectScaleSafe;
    private _light2 = createSimpleObject ["\A3\data_f\VolumeLight", getPosASL GRAD_VM_phase3_volumeLightPos];
    [_light2, -90, 0] call BIS_fnc_setPitchBank;
    [_light2, 15] call GRAD_VM_common_fnc_setObjectScaleSafe;
    private _light3 = createSimpleObject ["\A3\data_f\VolumeLight", getPosASL GRAD_VM_phase3_volumeLightPos];
    [_light3, -90, 0] call BIS_fnc_setPitchBank;
    [_light3, 15] call GRAD_VM_common_fnc_setObjectScaleSafe;

    // GRAD_VM_phase3_caveSound_4
    private _caveSounds = missionNamespace getVariable ["GRAD_VM_phase3_caveSounds", []];
    {
        private _sound = createSoundSource ["caveSounds_source", position _x, [], 0];
        _sound setPos (getPos _x);
        _caveSounds pushBack _sound;
    } forEach [GRAD_VM_phase3_caveSound_1, GRAD_VM_phase3_caveSound_2];
    missionNamespace setVariable ["GRAD_VM_phase3_caveSounds", _caveSounds];

    {
        [
            {
                params ["_pad"];

                private _caveSounds = missionNamespace getVariable ["GRAD_VM_phase3_caveSounds", []];
                private _sound = createSoundSource ["caveChanting_source", position _pad, [], 0];
                _caveSounds pushBack _sound;
                missionNamespace setVariable ["GRAD_VM_phase3_caveSounds", _caveSounds];
                _sound setPos (getPos _pad);
            },
            [_x],
            (random 5) + 1
        ] call CBA_fnc_waitAndExecute;
    } forEach [GRAD_VM_phase3_caveSound_3, GRAD_VM_phase3_caveSound_4, GRAD_VM_phase3_caveSound_5];

    [{
        private _light = "#lightPoint" createVehicleLocal (getPos GRAD_VM_phase3_brightenSky);
        _light setPos (getPos GRAD_VM_phase3_brightenSky);
        _light setLightColor [1,1,1];
        _light setLightBrightness 30;
        player setVariable ["GRAD_VM_phase3_skyLightSource", _light];
    }] remoteExec ["call", [0, -2] select isMultiplayer];

},[]] call CBA_fnc_waitUntilAndExecute;


// phase 0 init
[
    {
        ([3] call GRAD_VM_main_fnc_getPhaseProgress) == 1
    },
    {
        [phase3_teleportcrystal] remoteExec ["GRAD_VM_phase3_fnc_portalOpening", 0, true];

}, []] call CBA_fnc_waitUntilAndExecute;


// phase 3 init
[
    {
        ([3] call GRAD_VM_main_fnc_getPhaseProgress) isEqualTo 3
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
            }, [_x, ([3] call GRAD_VM_main_fnc_getCurrentTeleportTarget), _forEachIndex, _duration, _numberStart, _numberEnd, _date], 
            (_forEachIndex/_count)*_duration+((random 1) max 0.5)] call CBA_fnc_waitAndExecute;
        } forEach playableUnits + switchableUnits;

        // end light effects
        [{
            params ["_date"];
            ["grad_VM_phaseControl", [3, 4]] call CBA_fnc_serverEvent;
            call GRAD_VM_main_fnc_initPhase4;
            // 3rd param is broadcast
            ["BLU_F", "vm_vilematter_phase0", true] call GRAD_Loadout_fnc_FactionSetLoadout;
            [_date] remoteExec ["setDate"];

        }, [_date], (_duration+5)] call CBA_fnc_waitAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;