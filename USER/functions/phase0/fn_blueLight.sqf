if (!isServer) exitWith {};

(getPos light_phase0) params ["_posX", "_posY", "_posZ"]; 
light_phase0 setPos [_posX, _posY, 10]; 
[light_phase0, -90, 0] call BIS_fnc_setPitchBank; 
light_phase0 setObjectScale 150;


gradVM_portalPhase_0 = 0; 
/*
0 - default
1 - opening starts with lightning
2 - move stuff to center
3 - beam and flare/portal
4 - delete stuff
*/
gradVM_portalPhaseEnd_0 = 4;

private _machineCircle = nearestObjects [light_phase0, ["Land_DPP_01_transformer_F"], 30];

{
    private _pos = getPosWorld _x;
    _pos params ["", "", "_posZ"];
    _pos set [2, _posZ - 5];
    private _light = createSimpleObject ["\A3\data_f\VolumeLight", _pos, true];
    [_light, -90, 0] call BIS_fnc_setPitchBank; 
    _light setObjectScale 30;

    [{gradVM_portalPhase_0 == gradVM_portalPhaseEnd_0},{
        deleteVehicle (_this select 0);
    }, [_light]] call CBA_fnc_waitUntilAndExecute;
} forEach _machineCircle;


[_machineCircle] call grad_VM_fnc_sparksEffectServer;