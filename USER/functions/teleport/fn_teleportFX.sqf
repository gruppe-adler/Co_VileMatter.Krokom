params ["_unit"];

private _currentPosition = getPos _unit;

drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,5,[1,1,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_unit];

 private _firefly = "#particlesource" createVehicleLocal _currentPosition;
_firefly setParticleCircle [0,[0,0,0]];
_firefly setParticleRandom [0,[0,0,0],[0.1,0.1,0.1],1,0,[0,0,0,0.1],1,1];
_firefly setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,5,[0,0,0],[0,0,-1],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[0,0,0,0]],[1],1,0.1,"","",_firefly, 0,true,1,[[200,200,200,10],[200,200,200,0]]];
_firefly setDropInterval 0.1;
_firefly attachTo [_unit, [0,0,0], "head"];

[{
    params ["_currentPosition", "_unit"];
    _currentPosition distance2d _unit > 200
},{
    params ["_currentPosition", "_unit", "_firefly"];

    deleteVehicle _firefly;

    drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,5,[1,1,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_unit];

    _currentPosition params ["_posX", "_posY"];

    {
        private _position = _x;

        private _fireflyEnd = "#particlesource" createVehicleLocal _position;
        _fireflyEnd setParticleCircle [0,[0,0,0]];
        _fireflyEnd setParticleRandom [0,[0,0,0],[0.1,0.1,0.1],1,0,[0,0,0,0.1],1,1];
        _fireflyEnd setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,5,[0,0,0],[0,0,0],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[0,0,0,0]],[1],1,0.1,"","",_fireflyEnd, 0,true,1,[[200,200,200,10],[200,200,200,0]]];
        _fireflyEnd setDropInterval 0.1;
        _fireflyEnd attachTo [_unit, [0,0,0], "head"];

        [{
            params ["_fireflyEnd"];
            deleteVehicle _fireflyEnd;
        }, [_fireflyEnd], 0.2] call CBA_fnc_waitAndExecute;

    } forEach 
    [
        [_posX, _posY, 0],
        [_posX, _posY, 0.1],
        [_posX, _posY, 0.2],
        [_posX, _posY, 0.3],
        [_posX, _posY, 0.4],
        [_posX, _posY, 0.5],
        [_posX, _posY, 0.6],
        [_posX, _posY, 0.7],
        [_posX, _posY, 0.8],
        [_posX, _posY, 0.9],
        [_posX, _posY, 1],
        [_posX, _posY, 1.1],
        [_posX, _posY, 1.2],
        [_posX, _posY, 1.3],
        [_posX, _posY, 1.4],
        [_posX, _posY, 1.5],
        [_posX, _posY, 1.6],
        [_posX, _posY, 1.7],
        [_posX, _posY, 1.8]
    ];

}, [_currentPosition, _unit, _firefly]] call CBA_fnc_waitUntilAndExecute;