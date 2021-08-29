params ["_stoneHengeCenter"];

gradVM_portalPhase = 0; // initial step
gradVM_portalPhaseEnd = 4;
gradVM_beams = [];

phase1Timeout = 12;

[_stoneHengeCenter] execVM "User\functions\phase1\fn_stoneHengeFX.sqf";

// reset
_stoneHengeCenter setVariable ["gradVM_zPos", -3];

private _stoneCircle = nearestObjects [_stoneHengeCenter, ["Land_Bare_boulder_04_F"], 30];
private _effectDuration = 5;
private _stoneTips = [];
private _stoneHengeCenterTop = getPosWorld _stoneHengeCenter;
_stoneHengeCenterTop set [2,3];



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
    private _lightPoint = "#lightpoint" createvehiclelocal _stoneHengeCenterTop;
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 5; _lightPoint setLightFlareMaxDistance 5000;   
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
    _lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
    _lightPoint setLightBrightness 10;

    // lightpoint moving in center of stoneHenge
    
    [{
        params ["_args", "_handle"];
        _args params ["_lightPoint", "_stoneHengeCenter"];

        private _lightFlareSize = _stoneHengeCenter getVariable ["gradVM_lightFlareSize", 5];
        private _lightFlareExpanding = _stoneHengeCenter getVariable ["gradVM_lightFlareExpanding", true];
        
        if (isNull _lightPoint) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

        if (_lightFlareSize > 8) then {
            _lightFlareExpanding = false;
            _stoneHengeCenter setVariable ["gradVM_lightFlareExpanding", _lightFlareExpanding];
        };

        if (_lightFlareSize < 5) then {
            _lightFlareExpanding = true;
            _stoneHengeCenter setVariable ["gradVM_lightFlareExpanding", _lightFlareExpanding];
        };

        if (_lightFlareExpanding) then {
            _lightFlareSize = _lightFlareSize + random 1;
            _lightPoint setLightFlareSize _lightFlareSize;
        } else {
            _lightFlareSize = _lightFlareSize - random 1;
            _lightPoint setLightFlareSize _lightFlareSize;
        };
        _stoneHengeCenter setVariable ["gradVM_lightFlareSize", _lightFlareSize];

        systemChat str _lightFlareSize;


    }, 0.02, [_lightPoint, _stoneHengeCenter]] call CBA_fnc_addPerFrameHandler;
    
    
    // clean up
    [{gradVM_portalPhase == gradVM_portalPhaseEnd},{ 
        deleteVehicle (_this select 0);
    }, [_lightPoint]] call CBA_fnc_waitUntilAndExecute;


    [{
        gradVM_portalPhase = 4;
    }, [], 30] call CBA_fnc_waitAndExecute;



    // tail of beams
    [{
        params ["_args", "_handle"];
        _args params ["_stoneHengeCenter", "_lightPoint"];

        if (isNull _lightPoint) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

         private _zPos = _stoneHengeCenter getVariable ["gradVM_zPos", -3];
        _zPos = _zPos + 3;
        _stoneHengeCenter setVariable ["gradVM_zPos", _zPos];

        // systemChat str _zPos;

        if (_zPos > 300) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

        private _pos = getPosWorld _stoneHengeCenter;
        private _dir = random 360;
        _pos set [2, ((_pos select 2) + _zPos)];

        private _beam = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", _pos, true];

        _beam setDir _dir;
        [_beam, -90, 0] call BIS_fnc_setPitchBank;

        // clean up
        [{gradVM_portalPhase == gradVM_portalPhaseEnd},{ deleteVehicle (_this select 0);}, [_beam]] call CBA_fnc_waitUntilAndExecute;

    }, 0.02, [_stoneHengeCenter, _lightPoint]] call CBA_fnc_addPerFrameHandler;



    /*
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
            _sparksColumn setDropInterval (random 1);
        }, [_sparksColumn, _i], _i] call CBA_fnc_waitAndExecute;        
    };

    [{gradVM_portalPhase == gradVM_portalPhaseEnd},{ deleteVehicle (_this select 0);}, [_sparksColumn]] call CBA_fnc_waitUntilAndExecute;
    */
    
}, [_stoneHengeCenter, _stoneHengeCenterTop]] call CBA_fnc_waitUntilAndExecute;