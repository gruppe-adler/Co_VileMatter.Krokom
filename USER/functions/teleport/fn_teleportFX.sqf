params ["_unit"];

private _currentPosition = getPos _unit;

drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,5,[1,1,0],[0,0,0],0,9,7,0,[1,2,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_unit];

 private _firefly = "#particlesource" createVehicleLocal _currentPosition;
_firefly setParticleCircle [0,[0,0,0]];
_firefly setParticleRandom [0,[0.3,0.3,0],[0.1,0.1,0.1],1,0,[0,0,0,0.1],1,1];
_firefly setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,0.5,[0,0,0],[0,0,-3],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[0,0,0,0]],[1],1,0.1,"","",_firefly, 0,true,0,[[200,200,200,10],[200,200,200,0]]];
_firefly setDropInterval 0.01;
_firefly attachTo [_unit, [0,0,0], "head"];

[{
    params ["_currentPosition", "_unit"];
    _currentPosition distance2d _unit > 200
},{
    params ["_currentPosition", "_unit", "_firefly"];

    deleteVehicle _firefly;

    drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,5,[1,1,0],[0,0,0],0,9,7,0,[1,2,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_unit];

    _currentPosition params ["_posX", "_posY"];

    private _lightPoint = "#lightpoint" createvehiclelocal [_currentPosition select 0, _currentPosition select 1, 1];
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 10; _lightPoint setLightFlareMaxDistance 5000;   
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.9,0.7,0.9];
    _lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
    _lightPoint setLightBrightness 3;

    [{
            params ["_lightPoint"];
            deleteVehicle _lightPoint;
    }, [_lightPoint], 0.2] call CBA_fnc_waitAndExecute;

    
        

    private _fireflyEnd = "#particlesource" createvehiclelocal [_currentPosition select 0, _currentPosition select 1, 1];
    _fireflyEnd setParticleCircle [0,[0,0,0]];
    _fireflyEnd setParticleRandom [0,[0,0,0],[0.1,0.1,0.1],1,0,[0,0,0,0.1],1,1];
    _fireflyEnd setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,5,[0,0,0],[0,0,0],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[0,0,0,0]],[1],1,0.1,"","",_fireflyEnd, 0,true,1,[[200,200,200,10],[200,200,200,0]]];
    _fireflyEnd setDropInterval 0.1;

    [{
        params ["_fireflyEnd"];
        deleteVehicle _fireflyEnd;
    }, [_fireflyEnd], 0.2] call CBA_fnc_waitAndExecute;

    

}, [_currentPosition, _unit, _firefly]] call CBA_fnc_waitUntilAndExecute;