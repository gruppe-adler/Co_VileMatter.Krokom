params ["_stoneHengeCenter", "_gradVM_portalPhaseEnd"];

private _stoneCircle = nearestObjects [_stoneHengeCenter, ["Land_Bare_boulder_04_F"], 30];
private _effectDuration = 20;

{
    private _pos = getPosWorld _x;
    _pos params ["", "", "_posZ"];
    _pos set [2, _posZ - 5];
    private _light = createSimpleObject ["\A3\data_f\VolumeLight", _pos, true];
    [_light, -90, 0] call BIS_fnc_setPitchBank; 
    _light setObjectScale 30;

    /*
    [{
        params ["_args", "_handle"];
        _args params ["_light"];

        if (isNull _light) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

        private _dir = getDir _light;
        _light setDir (_dir + 0.1);
        [_light, -90, 0] call BIS_fnc_setPitchBank; 
        // (_light call BIS_fnc_getPitchBank) params ["_pitch", "_bank"];
        //[_light, -90, _random] call BIS_fnc_setPitchBank;
        
        _light setObjectScale 30;

        // private _objectScale = getObjectScale _light;
        // _light setObjectScale (_objectScale + (random 0.2 - random 0.2));

       // systemChat str _random;

    }, 0, [_light]] call CBA_fnc_addPerFrameHandler;
    */

    [{gradVM_portalPhase == gradVM_portalPhaseEnd},{
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

[{gradVM_portalPhase == 1},{
        { deleteVehicle _x; } forEach _this;
}, [_sparksColumn, _sparksRandom]] call CBA_fnc_waitUntilAndExecute;


// central big light
private _light = createSimpleObject ["\A3\data_f\VolumeLight", _pos, true];
[_light, -90, 0] call BIS_fnc_setPitchBank; 
_light setObjectScale 150;

[{gradVM_portalPhase == gradVM_portalPhaseEnd},{
        // systemChat (str (_this select 0));
        deleteVehicle (_this select 0);
}, [_light]] call CBA_fnc_waitUntilAndExecute;

    /*


    private _plasma_wave = "#particlesource" createVehicleLocal (getPosATL player);   
 _plasma_wave setParticleCircle [0,[0,0,0]];   
 
 _plasma_wave setParticleRandom [5,[2500,20,10],[0,0,0],10,0,[0,0,0,0],1,0];   
 _plasma_wave setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,180,[0,0,0],[0,0,0],13,9.999,7.9,0.005,[150,150,150,300],[[0,1,0,0],[0,1,0,1],[0,0.3,0.7,0.5],[0.9,0,0.7,1],[0.4,0,0.2,0]],[0.08],1,0,"","",_sky_obj]; 
 _plasma_wave setDropInterval 0.05; 

[{ params ["_plasma_wave"]; deleteVehicle _plasma_wave; }, [_plasma_wave], 10] call CBA_fnc_waitAndExecute;

*/