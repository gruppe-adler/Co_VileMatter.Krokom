/*

    server side, manages phase 0

    [2035,2,9,17,32]

*/

if (!isServer) exitWith {};



(getPos teleportcenter_phase0) params ["_posX", "_posY", "_posZ"];
private _light_phase0 = createSimpleObject ["\A3\data_f\VolumeLight", [_posX, _posY, _posZ]];

_light_phase0 setPos [_posX, _posY, 10];
[_light_phase0, -90, 0] call BIS_fnc_setPitchBank;
[_light_phase0, 150] call GRAD_VM_common_fnc_setObjectScaleSafe;

private _machineCircle = nearestObjects [_light_phase0, ["Land_DPP_01_transformer_F"], 30];

{
    private _pos = getPosWorld _x;
    _pos params ["", "", "_posZ"];
    _pos set [2, _posZ - 5];
    private _light = createSimpleObject ["\A3\data_f\VolumeLight", _pos];
    [_light, -90, 0] call BIS_fnc_setPitchBank;
    [_light, 30] call GRAD_VM_common_fnc_setObjectScaleSafe;

    [{
      [0] call GRAD_VM_main_fnc_getPhaseProgress == 
      [0] call GRAD_VM_main_fnc_getPhaseMaxProgress
      },{
        deleteVehicle (_this select 0);
    }, [_light]] call CBA_fnc_waitUntilAndExecute;
} forEach _machineCircle;


[_machineCircle] call grad_VM_phase0_fnc_sparksEffectServer;
[] remoteExec ["GRAD_VM_phase0_fnc_lightSourceTeleporter", 0, true];


// phase 0 init
[
    {
        ([0] call GRAD_VM_main_fnc_getPhaseProgress) == 1
    },
    {
        {
            _x params ["_object1", "_object2"];

            [{
                params ["_object1", "_object2"];

                private _duration = 10;
                [_object1, _object2, _duration] remoteExec ["grad_VM_phase0_fnc_lightningBetween", 0, true];

                [{
                    ["GRAD_VM_phaseControl", [0,2]] call CBA_fnc_serverEvent;
                }, [], _duration] call CBA_fnc_waitAndExecute;

            }, [_object1, _object2], _forEachIndex * 0.1] call CBA_fnc_waitAndExecute;

        } forEach [
            [phase0_transformer1,phase0_transformer2],
            [phase0_transformer2,phase0_transformer3],
            [phase0_transformer3,phase0_transformer4],
            [phase0_transformer4,phase0_transformer5],
            [phase0_transformer5,phase0_transformer6],
            [phase0_transformer6,phase0_transformer7],
            [phase0_transformer7,phase0_transformer8],
            [phase0_transformer8,phase0_transformer9],
            [phase0_transformer9,phase0_transformer1]
        ];

        [teleportcenter_phase0] remoteExec ["GRAD_VM_phase0_fnc_portalOpening", 0, true];


        {
            [{
                [_this] remoteExec ["GRAD_VM_phase0_fnc_steameffect"];
            }, _x, random 2] call CBA_fnc_waitAndExecute;
        } forEach (missionNamespace getVariable ["GRAD_VM_phase0_hatches", []]);

}, []] call CBA_fnc_waitUntilAndExecute;



// phase 3 init
[
    {
        ([0] call GRAD_VM_main_fnc_getPhaseProgress) == 3 
    },
    {
        params ["_light_phase0"];

        playSound3D [getMissionPath "USER\sounds\teleport_global.ogg", _light_phase0];
        private _duration = 38;
        private _date = [2035,2,9,6,50];
        private _numberStart = 2035;
        private _numberEnd = 9;
        private _count = count (playableUnits + switchableUnits);
        {
            [{
                params ["_unit", "_targetposition", "_index", "_duration", "_numberStart", "_numberEnd", "_date"];
                ["BLU_F", "vm_vilematter_phase1", false] remoteExec ["GRAD_Loadout_fnc_FactionSetLoadout", _unit];
                [_unit, _targetposition, _index, _duration, _numberStart, _numberEnd, _date] call GRAD_VM_teleport_fnc_teleport;
                // systemChat ("teleporting unit " + str _index);
            }, [_x, ([0] call GRAD_VM_main_fnc_getCurrentTeleportTarget), _forEachIndex, _duration, _numberStart, _numberEnd, _date], 
            (_forEachIndex/_count)*_duration+((random 1) max 0.5)] call CBA_fnc_waitAndExecute;

        } forEach playableUnits + switchableUnits;

        // end light effects
        [{
            params ["_date"];
            ["grad_VM_phaseControl", [0,4]] call CBA_fnc_serverEvent;
            call GRAD_VM_main_fnc_initPhase1;
            // 3rd param is broadcast
            ["BLU_F", "vm_vilematter_phase1", true] call GRAD_Loadout_fnc_FactionSetLoadout;
            [_date] remoteExec ["setDate"];

            [] spawn GRAD_VM_phase1_fnc_ambientSounds;

        }, [_date], (_duration+5)] call CBA_fnc_waitAndExecute;

}, [_light_phase0]] call CBA_fnc_waitUntilAndExecute;


// phase 4 (close effects)
