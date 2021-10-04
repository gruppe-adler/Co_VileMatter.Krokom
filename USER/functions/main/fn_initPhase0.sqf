/*

    server side, manages phase 0

*/

if (!isServer) exitWith {};

(getPos teleportcenter_phase0) params ["_posX", "_posY", "_posZ"];
light_phase0 = createSimpleObject ["\A3\data_f\VolumeLight", [_posX, _posY, _posZ]];

light_phase0 setPos [_posX, _posY, 10];
[light_phase0, -90, 0] call BIS_fnc_setPitchBank;
[light_phase0, 150] call GRAD_VM_common_fnc_setObjectScaleSafe;

private _machineCircle = nearestObjects [light_phase0, ["Land_DPP_01_transformer_F"], 30];

{
    private _pos = getPosWorld _x;
    _pos params ["", "", "_posZ"];
    _pos set [2, _posZ - 5];
    private _light = createSimpleObject ["\A3\data_f\VolumeLight", _pos, true];
    [_light, -90, 0] call BIS_fnc_setPitchBank;
    _light setObjectScale 30;

    [{
      private _currentPhaseProgress = [0] call GRAD_VM_main_fnc_getPhaseProgress;
      private _currentPhaseMaxProgress = [0] call GRAD_VM_main_fnc_getPhaseMaxProgress;
      _currentPhaseProgress == _currentPhaseMaxProgress
      },{
        deleteVehicle (_this select 0);
    }, [_light]] call CBA_fnc_waitUntilAndExecute;
} forEach _machineCircle;


[_machineCircle] call grad_VM_phase0_fnc_sparksEffectServer;


// phase 0 init
[
    {
      private _currentPhaseProgress = [0] call GRAD_VM_main_fnc_getPhaseProgress;
      _currentPhaseProgress == 1
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

        [] remoteExec ["GRAD_VM_phase0_fnc_portalOpening", 0];

}] call CBA_fnc_waitUntilAndExecute;



// phase 3 init
[
    {
      private _currentPhaseProgress = [0] call GRAD_VM_main_fnc_getPhaseProgress;
    _currentPhaseProgress == 3 },
    {
        playSound3D [getMissionPath "USER\sounds\teleport_global.ogg", light_phase0];
        private _duration = 38;
        {
            [{
                params ["_unit", "_targetposition", "_index", "_duration", "_numberStart", "_numberEnd"];
                ["BLU_F", "vm_vilematter_phase1", false] remoteExec ["GRAD_Loadout_fnc_FactionSetLoadout", _unit];
                [_unit, _targetposition, _index, _duration, _numberStart, _numberEnd] remoteExec ["GRAD_VM_teleport_fnc_teleport", _unit];
            }, [_x, gradVM_portalPhaseTarget_0, _forEachIndex, _duration, _numberStart, _numberEnd], (_forEachIndex/_count)*_duration*((random 1) min 0.5)] call CBA_fnc_waitAndExecute;
        } forEach playableUnits + switchableUnits;

        // end light effects
        [{
            ["gradVM_phaseControl", [0,4]] call CBA_fnc_serverEvent;

            // 3rd param is broadcast
            ["BLU_F", "vm_vilematter_phase1", true] call GRAD_Loadout_fnc_FactionSetLoadout;

            [] call GRAD_VM_phase1_fnc_init; // start next management step

        }, [], (_duration+5)] call CBA_fnc_waitAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;


// phase 4 (close effects)
