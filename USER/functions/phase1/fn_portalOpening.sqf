params ["_stoneHengeCenter"];


[_stoneHengeCenter] execVM "User\functions\phase1\fn_stoneHengeFX.sqf";

private _stoneCircle = nearestObjects [_stoneHengeCenter, ["Land_Bare_boulder_04_F"], 30];
private _effectDuration = 5;
private _stoneTips = [];
private _stoneHengeCenterTop = getPosWorld _stoneHengeCenter;
_stoneHengeCenterTop set [2,3];


gradVM_portalPhase = 0; // initial step


{
    private _stone = _x;
    private _position = getPosASL _stone;
    _position set [2, ((_position select 2) + 2)];

    _stoneTips pushBackUnique _position;
} forEach _stoneCircle;


private _lightPoints = [];
{
    _x params ["_xPos", "_yPos", "_zPos"];

    private _lightPoint = "#lightpoint" createvehiclelocal (ASLtoAGL _x);
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 5; _lightPoint setLightFlareMaxDistance 5000;   
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
    _lightPoint setLightAttenuation [2, 4, 4, 0, 9, 10];// [0,0,0,0,0,4000]; 
    _lightPoint setLightBrightness .1;

    _lightPoints pushBackUnique _lightPoint;

} forEach _stoneTips;

// lightpoints moving to center
private _handle = [{
    params ["_args", "_handle"];
    _args params ["_lightPoints", "_stoneHengeCenterTop"];

    {
        private _lightpoint = _x;
        private _position = (_lightPoint getPos [0.02, (_lightpoint getRelDir _stoneHengeCenterTop)]);
        _position set [2, 1.5];

        _lightpoint setPos _position;

        drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,1,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (_lightpoint distance2d _stoneHengeCenterTop < 0.1) exitWith {
            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
            gradVM_portalPhase = 1;
        };
    } forEach _lightPoints;


}, 0.02, [_lightPoints, _stoneHengeCenterTop]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_args", "_handle"];
    _args params ["_lightPoints", "_stoneHengeCenterTop"];

    {
        private _lightpoint = _x;
        private _position = (_lightPoint getPos [0.02, (_lightpoint getRelDir _stoneHengeCenterTop)]);
        _position set [2, 1.5];

        _lightpoint setPos _position;

        drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,1,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (_lightpoint distance2d _stoneHengeCenterTop < 0.1) exitWith {
            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    } forEach _lightPoints;


}, 0.02, [_lightPoints, _stoneHengeCenterTop]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_args", "_handle"];
    _args params ["_lightPoints", "_stoneHengeCenterTop"];

    {
        private _lightpoint = _x;
        private _position = (_lightPoint getPos [0.02, (_lightpoint getRelDir _stoneHengeCenterTop)]);
        _position set [2, 1.5];

        _lightpoint setPos _position;

        drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,1,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (_lightpoint distance2d _stoneHengeCenterTop < 0.1) exitWith {
            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    } forEach _lightPoints;


}, 0.02, [_lightPoints, _stoneHengeCenterTop]] call CBA_fnc_addPerFrameHandler;






[{gradVM_portalPhase == 1},
{
    params ["_stoneHengeCenter", "_stoneHengeCenterTop"];
    private _lightPoint = "#lightpoint" createvehiclelocal (getPos _stoneHengeCenter);
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 5; _lightPoint setLightFlareMaxDistance 5000;   
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
    _lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
    _lightPoint setLightBrightness 10;


    // lightpoint rising in center of stonehenge
    [{
        params ["_args", "_handle"];
        _args params ["_lightPoint", "_stoneHengeCenterTop"];
            
        private _position = getPos _lightPoint;
        private _speed = _lightPoint getVariable ["gradVM_speed", 0.1];
        _speed = _speed + 1;
        _lightPoint setVariable ["gradVM_speed", _speed];
        _position set [2, (_position select 2) + _speed];

        _lightpoint setPos _position;

        // drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        // drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,1,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (((getPos _lightpoint) select 2) > 500) exitWith {
            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };


    }, 0.02, [_lightPoint, _stoneHengeCenterTop]] call CBA_fnc_addPerFrameHandler;


    // tail of beams
    [{
        params ["_args", "_handle"];
        _args params ["_lightPoint"];

        if (isNull _lightPoint) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

        
        private _pos = getPos _lightpoint;
        private _dir = random 360;

        private _beam = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", _pos, true];

        _beam setDir _dir;
        [_beam, -88, 0] call BIS_fnc_setPitchBank;
        
        /*
        _risingEffect = "#particlesource" createVehicleLocal _pos;  
        _risingEffect setVectorDirAndUp [[0,0,-1], [0,1,0]]; 
        _risingEffect setParticleCircle [0,[0,0,0]];
        _risingEffect setParticleRandom [0,[0,0,0],[0,0,0],0,1,[0,0,0,0],0,0];   
        _risingEffect setParticleParams [["A3\data_f\VolumeLight_searchLight.p3d",1,0,1,0],"","SpaceObject",1,60,[0,0,0],[0,0,0],13,9.999,7.9,0.005,[.01,3],[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0],0,0,"","",_stoneHengeCenter,0,true,0,[[100,100,100,10]],[1,0,0]]; 
        _risingEffect setDropInterval 0.05;
        _risingEffect setPos _pos;
        */

        [{ deleteVehicle (_this select 0);
        }, [_beam], 30] call CBA_fnc_waitAndExecute;

    }, 0.02, [_lightPoint]] call CBA_fnc_addPerFrameHandler;



    private _pos = getPosWorld _stoneHengeCenter;
    _sparksColumn = "#particlesource" createVehicleLocal _pos;  
    _sparksColumn setParticleCircle [0.1,[0,0,0]];
    _sparksColumn setParticleRandom [1,[0,0,0],[0,0,1],0,1,[0,0,0,0],0.1,0.1];   
    _sparksColumn setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,3,[0,0,0],[0,0,10],13,9.999,7.9,0.005,[1,1,1,0.1],[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.08],1,0,"","",_stoneHengeCenter,0,true,1,[[100,100,100,10],[100,100,100,10]]]; 
    _sparksColumn setDropInterval 0.05;
    _sparksColumn setPos _pos;

    for "_i" from 1 to 10 do {
        [{  
            params ["_sparksColumn", "_i"];
            _sparksColumn setParticleCircle [0.1,[0,0,0]];
            _sparksColumn setParticleRandom [1,[0,0,0],[0,0,1],0,0.2,[0,0,0,0],0.1,0.1];   
            _sparksColumn setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,3,[0,0,0],[0,0,10],13,9.999,7.9,0.005,[1,1,1,0.1],[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.08],1,0,"","",_stoneHengeCenter,0,true,1,[[100,100,100,10],[100,100,100,10]]]; 
            _sparksColumn setDropInterval 0.05;
            if (_i == 10) then { deleteVehicle _sparksColumn; };
        }, [_sparksColumn, _i], _i] call CBA_fnc_waitAndExecute;
        
    };


}, [_stoneHengeCenter, _stoneHengeCenterTop]] call CBA_fnc_waitUntilAndExecute;