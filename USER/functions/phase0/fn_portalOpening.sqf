// reset
teleportcenter_phase0 setVariable ["gradVM_zPos", -3];

private _transformers = nearestObjects [teleportcenter_phase0, ["Land_DPP_01_transformer_F"], 30];
private _transformerTips = [];
private _light_top = getPosASL teleportcenter_phase0;



_light_top set [2, ((_light_top select 2) + 1.6)];



{
    private _stone = _x;
    private _position = getPosASL _stone;
    _position set [2, ((_position select 2) + 2)];

    _transformerTips pushBackUnique _position;

} forEach _transformers;


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

} forEach _transformerTips;

// systemChat str _lightPoints;

// lightpoints moving to center
[{
    params ["_args", "_handle"];
    _args params ["_lightPoints", "_light_top"];

    {
        private _lightpoint = _x;
        private _position = (_lightPoint getPos [0.02, (_lightpoint getRelDir _light_top)]);
        _position set [2, _light_top select 2];

        _lightpoint setPosASL _position;


        drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,1,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (_lightpoint distance2d _light_top < 0.2) exitWith {
            // first player sends signal
            if (gradVM_portalPhase_0 < 3) then {
                gradVM_portalPhase_0 = 3;
                publicVariable "gradVM_portalPhase_0";
            };
            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    } forEach _lightPoints;


}, 0.02, [_lightPoints, _light_top]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_args", "_handle"];
    _args params ["_lightPoints", "_light_top"];

    {
        private _lightpoint = _x;
        private _position = (_lightPoint getPos [0.02, (_lightpoint getRelDir _light_top)]);
        _position set [2, _light_top select 2];

        _lightpoint setPosASL _position;


        drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,1,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (_lightpoint distance2d _light_top < 0.1) exitWith {
            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    } forEach _lightPoints;


}, 0.02, [_lightPoints, _light_top]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_args", "_handle"];
    _args params ["_lightPoints", "_light_top"];

    {
        private _lightpoint = _x;
        private _position = (_lightPoint getPos [0.02, (_lightpoint getRelDir _light_top)]);
        _position set [2, _light_top select 2];

        _lightpoint setPosASL _position;

        drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.7,[1,1,0],[0,0,0],0,9,7,0,[.1,1,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (_lightpoint distance2d _light_top < 0.1) exitWith {
            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    } forEach _lightPoints;


}, 0.02, [_lightPoints, _light_top]] call CBA_fnc_addPerFrameHandler;


// JIP proof execution
[{gradVM_portalPhase_0 >= 3},
{
    params ["_light_top"];
    private _lightPoint = "#lightpoint" createvehiclelocal (ASLtoAGL _light_top);
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 5; _lightPoint setLightFlareMaxDistance 5000;
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
    _lightPoint setLightAttenuation [0, 0, 0, 0, 0, 500];
    _lightPoint setLightBrightness 10;

    // lightpoint moving in center of stoneHenge
    [{
        params ["_args", "_handle"];
        _args params ["_lightPoint"];

        private _lightFlareSize = teleportcenter_phase0 getVariable ["gradVM_lightFlareSize", 5];
        private _lightFlareExpanding = teleportcenter_phase0 getVariable ["gradVM_lightFlareExpanding", true];

        if (isNull _lightPoint) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

        private _maxSize = 100;
        private _minSize = 50;
        private _distanceToPoint = player distance2d _lightPoint;
        private _currentMaxSize = (_maxSize * ((1/_distanceToPoint) min 1));
        private _currentMinSize = (_minSize * ((1/_distanceToPoint) min 1));

        if (_lightFlareSize > _currentMaxSize) then {
            _lightFlareExpanding = false;
            teleportcenter_phase0 setVariable ["gradVM_lightFlareExpanding", _lightFlareExpanding];
        };

        if (_lightFlareSize < _currentMinSize) then {
            _lightFlareExpanding = true;
            teleportcenter_phase0 setVariable ["gradVM_lightFlareExpanding", _lightFlareExpanding];
        };

        if (_lightFlareExpanding) then {
            _lightFlareSize = _lightFlareSize + random 0.5;
            _lightPoint setLightFlareSize _lightFlareSize;
        } else {
            _lightFlareSize = _lightFlareSize - random 0.5;
            _lightPoint setLightFlareSize _lightFlareSize;
        };


        teleportcenter_phase0 setVariable ["gradVM_lightFlareSize", _lightFlareSize];

        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[1,4,1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];
        // systemChat str _currentMaxSize;


    }, 0.02, [_lightPoint]] call CBA_fnc_addPerFrameHandler;


    // clean up
    [{gradVM_portalPhase_0 == gradVM_portalPhaseEnd_0},{
        deleteVehicle (_this select 0);
    }, [_lightPoint]] call CBA_fnc_waitUntilAndExecute;



    _lightPoint say3D "gradVM_hum2";

    drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,5,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


    // tail of beams
    [{
        params ["_args", "_handle"];
        _args params ["_lightPoint"];

        if (isNull _lightPoint) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

         private _zPos = teleportcenter_phase0 getVariable ["gradVM_zPos", -3];
        _zPos = _zPos + 3;
        teleportcenter_phase0 setVariable ["gradVM_zPos", _zPos];

        // systemChat str _zPos;

        if (_zPos > 300) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

        private _pos = getPosASL teleportcenter_phase0;
        private _dir = random 360;
        _pos set [2, ((_pos select 2) + _zPos)];

        private _beam = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", [0,0,0], true];
        _beam setPosASL _pos;

        _beam setDir _dir;
        [_beam, -90, 0] call BIS_fnc_setPitchBank;

        // clean up
        [{gradVM_portalPhase_0 == gradVM_portalPhaseEnd_0},{ deleteVehicle (_this select 0);}, [_beam]] call CBA_fnc_waitUntilAndExecute;

    }, 0.02, [_lightPoint]] call CBA_fnc_addPerFrameHandler;



    /*
    private _pos = getPosWorld teleportcenter_phase0;
    _sparksColumn = "#particlesource" createVehicleLocal _pos;
    _sparksColumn setParticleCircle [0.1,[0,0,0]];
    _sparksColumn setParticleRandom [1,[0,0,0],[0,0,1],0,1,[0,0,0,0],0.1,0.1];
    _sparksColumn setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,3,[0,0,0],[0,0,10],13,9.999,7.9,0.005,[1,1,1,0.1],[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.08],1,0,"","",teleportcenter_phase0,0,true,1,[[100,100,100,10],[100,100,100,10]]];
    _sparksColumn setDropInterval 0.05;
    _sparksColumn setPos _pos;

    for "_i" from 1 to 10 do {
        [{
            params ["_sparksColumn", "_i"];
            _sparksColumn setParticleCircle [0.1,[0,0,0]];
            _sparksColumn setParticleRandom [1,[0,0,0],[0,0,1],0,0.2,[0,0,0,0],0.1,0.1];
            _sparksColumn setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,3,[0,0,0],[0,0,10],13,9.999,7.9,0.005,[1,1,1,0.1],[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.08],1,0,"","",teleportcenter_phase0,0,true,1,[[100,100,100,10],[100,100,100,10]]];
            _sparksColumn setDropInterval (random 1);
        }, [_sparksColumn, _i], _i] call CBA_fnc_waitAndExecute;
    };

    [{gradVM_portalPhase == gradVM_portalPhaseEnd},{ deleteVehicle (_this select 0);}, [_sparksColumn]] call CBA_fnc_waitUntilAndExecute;
    */

}, [_light_top]] call CBA_fnc_waitUntilAndExecute;
