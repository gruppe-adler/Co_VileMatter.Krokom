params ["_unit", "_position", ["_spawnIn", false], ["_timeToTeleport", 2]];

drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,1,[1,1,0],[0,0,0],0,9,7,0,[.01,4,.01],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_unit];

private _beam = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", getPosWorld _unit, true];
getPosWorld _unit params ["_xPos", "_yPos"];
_beam setPos [_xPos, _yPos, 2];
[_beam, 90, 0] call BIS_fnc_setPitchBank;

private _firefly = "#particlesource" createVehicleLocal _position;
_firefly setParticleCircle [.5,[0,0,0]];
_firefly setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],1,0];
_firefly setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,1,[0,0,0],[0,0,2],3,1.3,1,0,[0.1,0.1],[[1,1,1,1],[0,0,0,0]],[0],0,0,"","",_unit, 0,true,0,[[255,255,255,10],[255,0,0,0]],[0,1,0]];
_firefly setDropInterval 0.001;

private _despawnEffect = [{
    params ["_args", "_handle"];
    _args params ["_firefly", "_unit"];

    _firefly setPos (_unit modelToWorldVisual [0,0,-1]);
}, 0, [_firefly, _unit]] call CBA_fnc_addPerFrameHandler;

playSound3D [getMissionPath "USER\sounds\teleport2.ogg", _unit, false, AGLtoASL _position, 1, 1, 500, 0, true];

if (!_spawnIn) then {
    private _position = (_unit modelToWorldVisual [0,0,1]);
    [{
        params ["_position"];
        private _lightPoint = "#lightpoint" createvehiclelocal _position;
        _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
        _lightPoint setLightFlareSize 10; _lightPoint setLightFlareMaxDistance 5000;   
        _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
        _lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
        _lightPoint setLightBrightness 3;

        [{
            params ["_lightPoint"];

            deleteVehicle _lightPoint;
        }, [_lightPoint], 0.5]  call CBA_fnc_waitAndExecute;
        
    }, [_position, _beam], _timeToTeleport]  call CBA_fnc_waitAndExecute;
} else {
    private _lightPoint = "#lightpoint" createvehiclelocal (_unit modelToWorldVisual [0,0,1]);
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 10; _lightPoint setLightFlareMaxDistance 5000;   
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
    _lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
    _lightPoint setLightBrightness 3;

    [{
        params ["_lightPoint"];

        deleteVehicle _lightPoint;
    }, [_lightPoint], 0.2]  call CBA_fnc_waitAndExecute;
};

[{
    params ["_firefly", "_despawnEffect", "_beam"];
    [_despawnEffect] call CBA_fnc_removePerFrameHandler;
    deleteVehicle _firefly;
    deleteVehicle _beam;
}, [_firefly, _despawnEffect, _beam], 1]  call CBA_fnc_waitAndExecute;