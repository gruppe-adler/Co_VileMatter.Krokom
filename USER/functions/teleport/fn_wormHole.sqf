/*

["dummyheadgear.p3d","a3\weapons_f\dummyheadgear.p3d",false]

Headgear_H_LIB_US_Helmet_CO

TIOW_Tau_HelmetB2_VL

model = "\40k_tau\Headgear\HelmetB2.p3d";

model = "JMSL_roman\helms\LegionerHelmet_1_2.p3d";
picture = "\JMSL_roman\ico\Ico_helm_leggal.paa";
model = "JMSL_roman\helms\LegionerHelmet_1.p3d";
model = "JMSL_roman\helms\LegionerHelmet_2.p3d";
model = "JMSL_roman\helms\LegionerHelmet_3.p3d";
model = "\JMSL_roman\weapon\gladius_1.p3d";
model = "\JMSL_roman\weapon\aquila.p3d";

*/

private _startpoint = [-100,0,1000];
private _pipes = [];
private _props = [];

for "_i" from 0 to 100 do {
    _startpoint set [1, _i*2.85];
    private _concretePipe = createSimpleObject ["Land_ConcretePipe_F", _startpoint, true];
    _pipes pushbackunique _concretePipe;

    {
        _x params ["_distance", "_color"];
        if (_i == _distance) then {
            private _lightPoint = "#lightpoint" createvehiclelocal _startpoint;
            _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
            _lightPoint setLightAmbient _color; _lightPoint setLightColor _color;
            _lightPoint setLightAttenuation [4, 8, 12, 24, 36, 200];
            _lightPoint setLightBrightness 6000;
            _props pushbackunique _lightPoint;
        };
    } forEach [
        [100,[1,0,0]],
        [200,[1,0.5,0]],
        [300,[0,0.7,1]],
        [400,[0.5,0.7,1]],
        [500,[1,1,1]]
    ];

    if (_i == 350) then {
        private _helmet = createSimpleObject ["JMSL_roman\helms\LegionerHelmet_3.p3d", _startpoint, true];
        _helmet setObjectScale 5;
        [_helmet, 45, 10] call BIS_fnc_setPitchBank;
        _props pushbackunique _helmet;
    };
};


private _firstPipePos = getPos (_pipes select 0);
_firstPipePos set [2, (_firstPipePos select 2) - 1.5];
private _lastPipePos = getPos (_pipes select ((count _pipes) - 1));
_lastPipePos set [2, (_lastPipePos select 2) - 1.5];

private _cam = "camera" camCreate (ASLtoAGL _startpoint);
_cam camSetPos _firstPipePos;
_cam camSetTarget _lastPipePos;
_cam cameraEffect ["internal", "BACK"];
_cam camSetFov 8.5;
_cam camCommit 0;

_cam camCommand "inertia on";

_cam camSetPos _lastPipePos;
_cam camSetFov 0.01;
_cam camCommit 100;


private _smoke = "test_EmptyObjectForSmoke" createvehiclelocal _firstPipePos;
_smoke attachTo [_cam, [0,10,0]];
_props pushbackunique _smoke;

private _firefly = "#particlesource" createvehiclelocal _firstPipePos; 
_firefly setParticleRandom [0,[0,0,0],[1,1,0.1],1,0,[0,0,0,0.1],1,1]; 
_firefly setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,5,[0,10,0],[0,0,0],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[0,0,0,0]],[1],1,0.2,"","",_cam, 0,true,1,[[200,200,200,10],[200,200,200,0]]]; 
_firefly setDropInterval 0.01; 

private _refract = "#particlesource" createvehiclelocal _firstPipePos; 
_refract setParticleRandom [0,[0,0,0],[1,1,0],1,0,[0,0,0,0.1],1,1]; 
_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,5,[0,5,0],[0,0,0],13,1.3,1,0,[1,1],[[1,1,1,1],[0,0,0,0]],[1],1,0.1,"","",_cam]; 
_refract setDropInterval 0.5; 

private _lightPoint = "#lightpoint" createvehiclelocal _firstPipePos;
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare false;
_lightPoint setLightFlareSize 100; _lightPoint setLightFlareMaxDistance 5000;   
_lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.9,0.7,0.9];
_lightPoint setLightAttenuation [1, 2, 3, 4, 5, 100];
_lightPoint setLightBrightness 300; 

_lightPoint lightAttachObject [_cam, [0,100,0]];

gradVM_cameraBank = 0;
[{
    params ["_args", "_handle"];
    _args params ["_cam"];

    if (isNull _cam) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    _cam setVectorDirAndUp [
        [0 * 1, 1 * 1, 0],
        [[sin gradVM_cameraBank, 0, cos gradVM_cameraBank * 1], 0] call BIS_fnc_rotateVector2D;
    ];

    gradVM_cameraBank = gradVM_cameraBank + 0.1;
    

}, 0, [_cam]] call CBA_fnc_addPerFramehandler;

[_pipes, _props, _cam, _firefly, _refract, _lightPoint] spawn {
    params ["_pipes", "_props", "_cam", "_firefly", "_refract", "_lightPoint"];
    for "_i" from 0 to 10 do {
        _cam camSetFov (selectRandom [8.5, 5]);
        _cam camCommit 5;
        sleep 5;
    };
    skiptime 10;
    sleep 50;
    {
        deleteVehicle _x;
    } forEach (_pipes + _props);
    deleteVehicle _firefly;
    deleteVehicle _refract;
    deleteVehicle _lightPoint;
    camDestroy _cam;
};


// [_cam, 0, (_bank + 0.1)] call BIS_fnc_setPitchBank;

/*

private _lightPoint = "#lightpoint" createvehiclelocal (getPos player);
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare false;
_lightPoint setLightFlareSize 10; _lightPoint setLightFlareMaxDistance 5000;   
_lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.9,0.7,0.9];
_lightPoint setLightAttenuation [1, 2, 3, 4, 5, 100];
_lightPoint setLightBrightness 300;

[{
        params ["_lightPoint"];
        deleteVehicle _lightPoint;
}, [_lightPoint], 12] call CBA_fnc_waitAndExecute;

 private _vector = (getPos player) vectordiff (player getRelPos [5,0]); 
_vector vectorMultiply 1.2; 
_vector set [2, (_vector select 2) + 5]; 
 
private _position = getPos player; 
private _firefly = "#particlesource" createVehicleLocal _position; 
_firefly setParticleCircle [10, [0,0,5]]; 
_firefly setParticleRandom [0,[5,5,0],[0,0,0],0,0,[0,0,0,0],0,0]; 
_firefly setParticleParams [["JMSL_roman\helms\LegionerHelmet_3.p3d",1,0,1],"","SpaceObject",1,60,[0,0,80],[0,0,0],0,100,1,0,[1,1],[[1,1,1,1],[0,0,0,0]],[0],0,0,"","",_firefly, 1, true, 0.001]; 
_firefly setDropInterval 0.001; 

[{
        params ["_firefly"];
        deleteVehicle _firefly;
}, [_firefly], 4] call CBA_fnc_waitAndExecute;


*/