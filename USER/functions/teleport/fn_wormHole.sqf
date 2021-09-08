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
private _brightnessMultiplicator = getLighting select 1;

titleCut ["", "WHITE OUT", 2];

for "_i" from 0 to 100 do {
    _startpoint set [1, _i*2.85];
    private _concretePipe = createSimpleObject ["Land_ConcretePipe_F", _startpoint, true];
    _pipes pushbackunique _concretePipe; 

    if (_i == 100) then {
        private _endCube = createSimpleObject ["Land_VR_Shape_01_cube_1m_F", _startpoint, true];
        _endCube setObjectScale 5;
        _props pushbackunique _endCube;
    };
       
    if (_i % 2 == 0) then {
        private _color = [0, 0, random (_i/50*0.2) max (_i/50*0.5)];
        private _lightPoint = "#lightpoint" createvehiclelocal (ASLtoAGL _startpoint);
        _lightPoint setLightDayLight true;_lightPoint setLightUseFlare false;
        _lightPoint setLightAmbient _color; _lightPoint setLightColor _color;
        _lightPoint setLightAttenuation [2, 4, 4, 8, 16, 1];
        _lightPoint setLightBrightness ((random 20 max 5)*_brightnessMultiplicator);
        _lightPoint setPos (ASLtoAGL _startpoint);
        _props pushbackunique _lightPoint;
    };
    

    if (_i % 2 == 0) then {
        _startpoint params ["_helmetPosX", "_helmetPosY", "_helmetPosZ"];
        private _helmetPos = [_helmetPosX, _helmetPosY, _helmetPosZ];
        private _helmet = createSimpleObject ["JMSL_roman\helms\LegionerHelmet_3.p3d", _helmetPos, true];
        [_helmet, random 45 - 45, random 10 - 10] call BIS_fnc_setPitchBank;
        _helmet setObjectScale 3;
        _props pushbackunique _helmet;
    };
};


private _firstPipePos = getPos (_pipes select 0);
_firstPipePos set [2, (_firstPipePos select 2) - 1.5];
private _lastPipePos = getPos (_pipes select ((count _pipes) - 2));
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
_firefly setParticleParams [["\a3\data_f\proxies\muzzle_flash\muzzle_flash_rifle_gm6.p3d",1,0,1],"","SpaceObject",1,3,[0,6,0],[0,0,0],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[0,0,0,0]],[1],1,0.2,"","",_cam, 0,true,1,[[200,200,200,10],[200,200,200,0]]]; 
_firefly setDropInterval 0.001; 

private _refract = "#particlesource" createvehiclelocal _firstPipePos; 
_refract setParticleRandom [0,[0,0,0],[1,1,0],1,0,[0,0,0,0.1],1,1]; 
_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,2,[0,5,0],[0,0,0],13,1.3,1,0,[0,5,0],[[1,1,1,1],[0,0,0,0]],[1],1,0.1,"","",_cam]; 
_refract setDropInterval 0.2; 

private _lightPoint = "#lightpoint" createvehiclelocal _firstPipePos;
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 20*_brightnessMultiplicator; _lightPoint setLightFlareMaxDistance 5000;   
_lightPoint setLightAmbient[0.5,0.2,1]; _lightPoint setLightColor[0.5,0.2,0.9];
_lightPoint setLightAttenuation [0, 1, 1, 2, 4, 100];
_lightPoint setLightBrightness 30*_brightnessMultiplicator; 

private _lightPointStart = "#lightpoint" createvehiclelocal _firstPipePos;
_lightPointStart setLightDayLight true;_lightPointStart setLightUseFlare true;
_lightPointStart setLightFlareSize 200*_brightnessMultiplicator; _lightPointStart setLightFlareMaxDistance 5000;   
_lightPointStart setLightAmbient[0.1,0.2,1]; _lightPointStart setLightColor[0.1,0.2,0.9];
_lightPointStart setLightAttenuation [0, 1, 1, 2, 4, 100];
_lightPointStart setLightBrightness 100*_brightnessMultiplicator; ;
_props pushbackunique _lightPointStart;

private _lightPointEnd = "#lightpoint" createvehiclelocal _lastPipePos;
_lightPointEnd setLightDayLight true;_lightPointEnd setLightUseFlare false;
_lightPointEnd setLightFlareSize 200*_brightnessMultiplicator; _lightPointEnd setLightFlareMaxDistance 5000;   
_lightPointEnd setLightAmbient[0.5,0.2,1]; _lightPointEnd setLightColor[0.5,0.2,0.9];
_lightPointEnd setLightAttenuation [0, 1, 1, 2, 4, 100];
_lightPointEnd setLightBrightness 30*_brightnessMultiplicator; ;
_props pushbackunique _lightPointEnd;


gradVM_cameraBank = 0;
gradVM_cameraBankChange = 0.02;
[{
    params ["_args", "_handle"];
    _args params ["_pipes", "_cam", "_lightPoint", "_lastPipePos"];

    if (isNull _cam) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    {
        gradVM_cameraBank = gradVM_cameraBank + gradVM_cameraBankChange;
        [_x,[0,gradVM_cameraBank,0]] call fnc_SetPitchBankYaw; 
    } forEach _pipes;

    private _lightPos = (_cam getRelPos [10,0]);
    _lightPos set [2, _lastPipePos select 2];
    _lightPoint setPos _lightPos;

}, 0, [_pipes, _cam, _lightPoint, _lastPipePos]] call CBA_fnc_addPerFramehandler;

[_pipes, _props, _cam, _firefly, _refract, _lightPoint, _duration] spawn {
    params ["_pipes", "_props", "_cam", "_firefly", "_refract", "_lightPoint", "_duration"];
    
    sleep (_duration-2);
    titleCut ["", "WHITE IN", 1.5];
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