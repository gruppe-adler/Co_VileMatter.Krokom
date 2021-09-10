params ["_unit"];

private _position = getPos _unit;
private _firefly = "#particlesource" createVehicleLocal _position;
_firefly setParticleCircle [.5,[0,0,0]];
_firefly setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],1,0];
_firefly setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,1,[0,0,0],[0,0,2],3,1.3,1,0,[0.1,0.1],[[1,1,1,1],[0,0,0,0]],[0],0,0,"","",_firefly, 0,true,0,[[255,255,255,10],[255,0,0,0]],[0,1,0]];
_firefly setDropInterval 0.001;
_firefly attachTo [_unit, [0,0,-1]];


[{
        params ["_firefly"];
        deleteVehicle _firefly;
}, [_firefly], 4] call CBA_fnc_waitAndExecute;