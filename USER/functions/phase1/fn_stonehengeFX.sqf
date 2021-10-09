/*

  clientside

*/

// JIP check
if ([1] call GRAD_VM_main_fnc_getPhaseProgress == [1] call GRAD_VM_main_fnc_getPhaseMaxProgress) exitWith {};


params ["_stoneHengeCenter"];

private _stoneCircle = nearestObjects [_stoneHengeCenter, ["Land_Bare_boulder_04_F"], 30];
private _effectDuration = 20;

{
    private _pos = getPosWorld _x;
    _pos params ["", "", "_posZ"];
    _pos set [2, _posZ - 5];
    private _light = createSimpleObject ["\A3\data_f\VolumeLight", _pos, true];
    [_light, -90, 0] call BIS_fnc_setPitchBank;
    _light setObjectScale 30;

    // JIP proof deletion
    [{[1] call GRAD_VM_main_fnc_getPhaseProgress == [1] call GRAD_VM_main_fnc_getPhaseMaxProgress},{
        deleteVehicle (_this select 0);
    }, [_light]] call CBA_fnc_waitUntilAndExecute;
} forEach _stoneCircle;

private _pos = getPosWorld _stoneHengeCenter;
_sparksColumn = "#particlesource" createVehicleLocal _pos;
_sparksColumn setParticleCircle [1,[0,0,0]];
_sparksColumn setParticleRandom [10,[0,0,0],[0,0,1],0,0,[0,0,0,0],1,0];
// _sparksColumn setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,120,[0,0,.5],[0,0,5],13,9.999,7.9,0.005,[.1,15,20,40],[[1,1,1,1],[0,1,0,1],[0,0.3,0.7,0.5],[0.9,0,0.7,1],[0.4,0,0.2,0]],[0.08],1,1,"","",_stoneHengeCenter];
_sparksColumn setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,10,[0,0,.5],[0,0,5],13,9.999,7.9,0.005,[.01,.01,.01,.1],[[1,.5,0,1],[1,0,0,1],[0,0.3,0.7,0.5],[0.9,0,0.7,1],[0.4,0,0.2,0]],[0.08],1,0.1,"","",_stoneHengeCenter,0,true,1,[[200,100,0,10],[200,000,0,1]]];
_sparksColumn setDropInterval 0.05;
_sparksColumn setPos _pos;

private _pos = getPosWorld _stoneHengeCenter;
_sparksRandom = "#particlesource" createVehicleLocal _pos;
_sparksRandom setParticleCircle [1,[0,0,0]];
_sparksRandom setParticleRandom [10,[0,0,0],[0,0,1],0,0,[0,0,0,0],1,0];
// _sparksRandom setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,120,[0,0,.5],[0,0,5],13,9.999,7.9,0.005,[.1,15,20,40],[[1,1,1,1],[0,1,0,1],[0,0.3,0.7,0.5],[0.9,0,0.7,1],[0.4,0,0.2,0]],[0.08],1,1,"","",_stoneHengeCenter];
_sparksRandom setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,10,[0,0,.5],[0,0,5],13,9.999,7.9,0.005,[.01,.01,.1,0],[[1,.5,0,1],[1,0,0,1],[1,0,0,0]],[0.08],1,1,"","",_stoneHengeCenter,0,true,1,[[200,100,0,10],[200,000,0,1]]];
_sparksRandom setDropInterval 0.05;
_sparksRandom setPos _pos;

// JIP proof deletion
[{[1] call GRAD_VM_main_fnc_getPhaseProgress >= 1},{
        { deleteVehicle _x; } forEach _this;
}, [_sparksColumn, _sparksRandom]] call CBA_fnc_waitUntilAndExecute;


// central big light
private _light = createSimpleObject ["\A3\data_f\VolumeLight", _pos, true];
[_light, -90, 0] call BIS_fnc_setPitchBank;
_light setObjectScale 150;

// end all effects when phase1 is done
[{[1] call GRAD_VM_main_fnc_getPhaseProgress == [1] call GRAD_VM_main_fnc_getPhaseMaxProgress},{
        // systemChat (str (_this select 0));
        deleteVehicle (_this select 0);
}, [_light]] call CBA_fnc_waitUntilAndExecute;
