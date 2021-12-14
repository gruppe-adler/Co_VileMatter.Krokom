/*

    server side, manages phase 2

*/

if (!isServer) exitWith {};

// todo insert correct object
(getPos phase2_reichstagskuppel) params ["_posX", "_posY", "_posZ"];

// enhance intensity
private _light_phase2_1 = createSimpleObject ["\A3\data_f\VolumeLight", [_posX, _posY, _posZ]];
[_light_phase2_1, -90, 0] call BIS_fnc_setPitchBank;
[_light_phase2_1, 150] call GRAD_VM_common_fnc_setObjectScaleSafe;

private _light_phase2_2 = createSimpleObject ["\A3\data_f\VolumeLight", [_posX, _posY, _posZ]];
[_light_phase2_2, -90, 0] call BIS_fnc_setPitchBank;
[_light_phase2_2, 150] call GRAD_VM_common_fnc_setObjectScaleSafe;

private _light_phase2_3 = createSimpleObject ["\A3\data_f\VolumeLight", [_posX, _posY, _posZ]];
[_light_phase2_3, -90, 0] call BIS_fnc_setPitchBank;
[_light_phase2_3, 150] call GRAD_VM_common_fnc_setObjectScaleSafe;

private _light_phase2_4 = createSimpleObject ["\A3\data_f\VolumeLight", [_posX, _posY, _posZ]];
[_light_phase2_4, -90, 0] call BIS_fnc_setPitchBank;
[_light_phase2_4, 200] call GRAD_VM_common_fnc_setObjectScaleSafe;

private _light_phase2_5 = createSimpleObject ["\A3\data_f\VolumeLight", [_posX, _posY, _posZ]];
[_light_phase2_5, -90, 0] call BIS_fnc_setPitchBank;
[_light_phase2_5, 200] call GRAD_VM_common_fnc_setObjectScaleSafe;

private _light_phase2_6 = createSimpleObject ["\A3\data_f\VolumeLight", [_posX, _posY, _posZ]];
[_light_phase2_6, -90, 0] call BIS_fnc_setPitchBank;
[_light_phase2_6, 200] call GRAD_VM_common_fnc_setObjectScaleSafe;

[] remoteExec ["GRAD_VM_main_fnc_manageViewDistance", [0,-2] select isDedicated];

[{
  private _currentPhaseProgress = [2] call GRAD_VM_main_fnc_getPhaseProgress;
  _currentPhaseProgress > 0
},
{
  // [stoneHengerCenter] remoteExec ["GRAD_VM_phase1_fnc_stoneHengeFX", [0,-2] select isDedicated, true];
},[]] call CBA_fnc_waitUntilAndExecute;


// phase 0 init
[
    {
        ([2] call GRAD_VM_main_fnc_getPhaseProgress) == 2
    },
    {
        [phase2_devicestatue] remoteExec ["GRAD_VM_phase2_fnc_portalOpening", 0, true];

}, []] call CBA_fnc_waitUntilAndExecute;


// phase 3 init
[
    { [2] call GRAD_VM_main_fnc_getPhaseProgress == 3 },
    {
        params ["_light_phase2_1", "_light_phase2_2", "_light_phase2_3"];
        // playSound3D [getMissionPath "USER\sounds\teleport_global.ogg", light_phase0];
        private _duration = 38;
        private _date = [2035,2,9,6,35];
        private _numberStart = 1945;
        private _numberEnd = 40560;
        private _count = count (playableUnits + switchableUnits);
        {
            [{
                params ["_unit", "_targetposition", "_index", "_duration", "_numberStart", "_numberEnd", "_date"];
                ["BLU_F", "vm_vilematter_phase3", false] remoteExec ["GRAD_Loadout_fnc_FactionSetLoadout", _unit];
                [_unit, _targetposition, _index, _duration, _numberStart, _numberEnd, _date] call GRAD_VM_teleport_fnc_teleport;
            }, [_x, ([2] call GRAD_VM_main_fnc_getCurrentTeleportTarget), _forEachIndex, _duration, _numberStart, _numberEnd, _date], 
            ((_forEachIndex/_count) max 1)*_duration+((random 1) max 0.5)] call CBA_fnc_waitAndExecute;
        } forEach playableUnits + switchableUnits;

        // end light effects
        [{
            params ["_date", "_light_phase2_1", "_light_phase2_2", "_light_phase2_3"];
            ["grad_VM_phaseControl", [2, 4]] call CBA_fnc_serverEvent;
            call GRAD_VM_main_fnc_initPhase3;
            // 3rd param is broadcast
            ["BLU_F", "vm_vilematter_phase3", true] call GRAD_Loadout_fnc_FactionSetLoadout;
            [_date] remoteExec ["setDate"];

            deleteVehicle _light_phase2_1;
            deleteVehicle _light_phase2_2;
            deleteVehicle _light_phase2_3;

        }, [_date, _light_phase2_1, _light_phase2_2, _light_phase2_3], (_duration+5)] call CBA_fnc_waitAndExecute;


        // delay of 90 for all players to teleport safely
        [{
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
        }, [], 90] call CBA_fnc_waitAndExecute;


}, [_light_phase2_1, _light_phase2_2, _light_phase2_3]] call CBA_fnc_waitUntilAndExecute;

// delete phase2 sound sources
[
    {
        ([2] call GRAD_VM_main_fnc_getCurrentPhase) isEqualTo 3
    },
    {
        private _sounds = missionNamespace getVariable ["GRAD_VM_phase2_ambientSources", []];
        {
            deleteVehicle _x;   
        } forEach _sounds;

        missionNamespace setVariable ["GRAD_VM_phase2_ambientSources", []];
    },
    []
] call CBA_fnc_waitUntilAndExecute;