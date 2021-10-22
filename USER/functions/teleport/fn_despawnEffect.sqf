params ["_unit", "_position", ["_spawnIn", false], ["_timeToTeleport", 2]];

drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,1,[1,1,0],[0,0,0],0,9,7,0,[.01,3,.01],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_unit];

private _beam = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", getPosWorld _unit, true];
private _beam2 = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", getPosWorld _unit, true];
getPosWorld _unit params ["_xPos", "_yPos", "_zPos"];
_beam setPos [_xPos, _yPos, 2];
[_beam, 90, 0] call BIS_fnc_setPitchBank;
_beam2 setPos [_xPos, _yPos, 1.5];
[_beam2, 90, 0] call BIS_fnc_setPitchBank;

[{
    params ["_args", "_handle"];
    _args params ["_beam", "_beam2"];

    if (isNull _beam) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    private _scale = getObjectScale _beam;
    _beam setObjectScale (_scale * 0.95);
    _beam2 setObjectScale (_scale * 0.95);

}, 0, [_beam, _beam2]] call CBA_fnc_addPerFrameHandler;

private _firefly = "#particlesource" createVehicleLocal [_xPos, _yPos, _zPos];
_firefly setParticleCircle [.5,[0,0,0]];
_firefly setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],1,0];
_firefly setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,0.5,[0,0,0],[0,0,4],3,1.3,1,0,[0.1,0.1],[[1,1,1,1],[0,0,0,0]],[0],0,0,"","",_firefly, 0,true,0,[[255,255,255,10],[255,0,0,0]],[0,1,0]];
_firefly setDropInterval 0.001;

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
    params ["_firefly", "_beam", "_beam2"];
    deleteVehicle _firefly;
    deleteVehicle _beam;
    deleteVehicle _beam2;
}, [_firefly, _beam, _beam2], 1]  call CBA_fnc_waitAndExecute;