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

fnc_SetPitchBankYaw = {
    private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY",
    "_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp","_upXTemp"];
    _object = _this select 0;
    _rotations = _this select 1;
    _aroundX = _rotations select 0;
    _aroundY = _rotations select 1;
    _aroundZ = (360 - (_rotations select 2)) - 360;
    _dirX = 0;
    _dirY = 1;
    _dirZ = 0;
    _upX = 0;
    _upY = 0;
    _upZ = 1;
    if (_aroundX != 0) then {
        _dirY = cos _aroundX;
        _dirZ = sin _aroundX;
        _upY = -sin _aroundX;
        _upZ = cos _aroundX;
    };
    if (_aroundY != 0) then {
        _dirX = _dirZ * sin _aroundY;
        _dirZ = _dirZ * cos _aroundY;
        _upX = _upZ * sin _aroundY;
        _upZ = _upZ * cos _aroundY;
    };
    if (_aroundZ != 0) then {
        _dirXTemp = _dirX;
        _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ);
        _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);
        _upXTemp = _upX;
        _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ);
        _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);
    };
    _dir = [_dirX,_dirY,_dirZ];
    _up = [_upX,_upY,_upZ];
    _object setVectorDirAndUp [_dir,_up];
};

private _startpoint = [-100,0,1000];
private _pipes = [];
private _props = [];
private _duration = 60;

for "_i" from 0 to 100 do {
    _startpoint set [1, _i*2.85];
    private _concretePipe = createSimpleObject ["Land_ConcretePipe_F", _startpoint, true];
    _pipes pushbackunique _concretePipe;   
       
    
    private _color = [random 1 max 0.3, 0, random 1 max 0.3];
    private _lightPoint = "#lightpoint" createvehiclelocal (ASLtoAGL _startpoint);
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare false;
    _lightPoint setLightAmbient _color; _lightPoint setLightColor _color;
    _lightPoint setLightAttenuation [2, 4, 4, 0, 0, 1];
    _lightPoint setLightBrightness 1;
    _lightPoint setPos (ASLtoAGL _startpoint);
    _props pushbackunique _lightPoint;
    

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
_cam camSetFov 0.7;
_cam camCommit _duration;


private _firefly = "#particlesource" createvehiclelocal _firstPipePos; 
_firefly setParticleRandom [0,[0,0,0],[1,1,0.1],1,0,[0,0,0,0.1],1,1]; 
_firefly setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,5,[0,10,0],[0,0,0],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[0,0,0,0]],[1],1,0.2,"","",_cam, 0,true,1,[[200,200,200,10],[200,200,200,0]]]; 
_firefly setDropInterval 0.01; 

private _refract = "#particlesource" createvehiclelocal _firstPipePos; 
_refract setParticleRandom [0,[0,0,0],[1,1,0],1,0,[0,0,0,0.1],1,1]; 
_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,5,[0,5,0],[0,0,0],13,1.3,1,0,[1,1],[[1,1,1,1],[0,0,0,0]],[1],1,0.1,"","",_cam]; 
_refract setDropInterval 0.5; 

private _lightPoint = "#lightpoint" createvehiclelocal _firstPipePos;
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 10; _lightPoint setLightFlareMaxDistance 5000;   
_lightPoint setLightAmbient[0.5,0.2,1]; _lightPoint setLightColor[0.5,0.2,0.9];
_lightPoint setLightAttenuation [0, 1, 1, 2, 4, 100];
_lightPoint setLightBrightness 30; 

gradVM_cameraBank = 0;
gradVM_cameraBankChange = 0.03;
[{
    params ["_args", "_handle"];
    _args params ["_pipes", "_cam", "_lightPoint", "_lastPipePos"];

    if (isNull _cam) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    {
        gradVM_cameraBank = gradVM_cameraBank + gradVM_cameraBankChange;
        [_x,[0,gradVM_cameraBank,0]] call fnc_SetPitchBankYaw; 
    } forEach _pipes;

    private _lightPos = (_cam getRelPos [20,0]);
    _lightPos set [2, _lastPipePos select 2];
    _lightPoint setPos _lightPos;

}, 0, [_pipes, _cam, _lightPoint, _lastPipePos]] call CBA_fnc_addPerFramehandler;

[_pipes, _props, _cam, _firefly, _refract, _lightPoint, _duration] spawn {
    params ["_pipes", "_props", "_cam", "_firefly", "_refract", "_lightPoint", "_duration"];
    
    sleep _duration;
    {
        deleteVehicle _x;
    } forEach (_pipes + _props);
    deleteVehicle _firefly;
    deleteVehicle _refract;
    deleteVehicle _lightPoint;
    camDestroy _cam;
    _pipes = [];
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