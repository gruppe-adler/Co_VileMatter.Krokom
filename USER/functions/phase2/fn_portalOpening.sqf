// JIP check
if ([2] call GRAD_VM_main_fnc_getPhaseProgress == [2] call GRAD_VM_main_fnc_getPhaseMaxProgress) exitWith {};

params ["_stoneHengeCenter"];

// reset
_stoneHengeCenter setVariable ["grad_VM_zPos", -3];

private _stoneCircle = nearestObjects [_stoneHengeCenter, ["Land_Device_assembled_F"], 30];
private _effectDuration = 5;
private _stoneTips = [];
private _stoneHengeCenterTop = getPosWorld _stoneHengeCenter;
_stoneHengeCenterTop set [2,1.5];


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
    _lightPoint setLightFlareSize 3; _lightPoint setLightFlareMaxDistance 5000;
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
        private _position = (_lightPoint getPos [0.05, (_lightpoint getRelDir _stoneHengeCenterTop)]);
        _position set [2, 1.5];

        _lightpoint setPos _position;

        drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,2,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (_lightpoint distance2d _stoneHengeCenterTop < 0.2) exitWith {
            diag_log "success phase1 star";
            // first player sends signal
            private _currentPhaseProgress = [2] call GRAD_VM_main_fnc_getPhaseProgress;
            if (_currentPhaseProgress < 3) then {
                ["grad_VM_phaseControl", [2, 3]] call CBA_fnc_serverEvent;
            };

            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    } forEach _lightPoints;


}, 0.01, [_lightPoints, _stoneHengeCenterTop]] call CBA_fnc_addPerFrameHandler;





[{
  // JIP proof execution
  private _currentPhaseProgress = [2] call GRAD_VM_main_fnc_getPhaseProgress;
  _currentPhaseProgress >= 1},
{
    params ["_stoneHengeCenter", "_stoneHengeCenterTop"];
    private _lightPoint = "#lightpoint" createvehiclelocal _stoneHengeCenterTop;
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 5; _lightPoint setLightFlareMaxDistance 5000;
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
    _lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
    _lightPoint setLightBrightness 10;
    
    _lightPoint say3D "grad_VM_hum2";
    _lightPoint say3d "teleport_flash";
    playSound "grad_VM_drone";
    // lightpoint moving in center of stoneHenge

    [{
        params ["_args", "_handle"];
        _args params ["_lightPoint", "_stoneHengeCenter"];

        private _lightFlareSize = _stoneHengeCenter getVariable ["grad_VM_lightFlareSize", 5];
        private _lightFlareExpanding = _stoneHengeCenter getVariable ["grad_VM_lightFlareExpanding", true];

        if (isNull _lightPoint) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

        private _maxSize = 200;
        private _minSize = 150;
        private _distanceToPoint = player distance _lightPoint;
        private _currentMaxSize = (_maxSize * ((1/_distanceToPoint) min 1));
        private _currentMinSize = (_minSize * ((1/_distanceToPoint) min 1));

        if (_lightFlareSize > _currentMaxSize) then {
            _lightFlareExpanding = false;
            _stoneHengeCenter setVariable ["grad_VM_lightFlareExpanding", _lightFlareExpanding];
        };

        if (_lightFlareSize < _currentMinSize) then {
            _lightFlareExpanding = true;
            _stoneHengeCenter setVariable ["grad_VM_lightFlareExpanding", _lightFlareExpanding];
        };

        if (_lightFlareExpanding) then {
            _lightFlareSize = _lightFlareSize + random 0.5;
            _lightPoint setLightFlareSize _lightFlareSize;
        } else {
            _lightFlareSize = _lightFlareSize - random 0.5;
            _lightPoint setLightFlareSize _lightFlareSize;
        };



        _stoneHengeCenter setVariable ["grad_VM_lightFlareSize", _lightFlareSize];

        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[1,4,1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];
        // systemChat str _currentMaxSize;


    }, 0.02, [_lightPoint, _stoneHengeCenter]] call CBA_fnc_addPerFrameHandler;


    private _beams = [];
    private _zPos = _stoneHengeCenter getVariable ["grad_VM_zPos", -3];
    for "_i" from 1 to 30 do {

       _zPos = _zPos + 3;
       _stoneHengeCenter setVariable ["grad_VM_zPos", _zPos];

       private _pos = getPosWorld _stoneHengeCenter;
       private _dir = random 360;
       _pos set [2, ((_pos select 2) + _zPos)];

       private _beam = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", _pos, true];

       _beam setDir _dir;
       [_beam, -90, 0] call BIS_fnc_setPitchBank;

       _beams pushBack _beam;
    };

    // clean up
    [{[2] call GRAD_VM_main_fnc_getPhaseProgress == [2] call GRAD_VM_main_fnc_getPhaseMaxProgress},{
      params ["_beams", "_lightPoint"];
      { deleteVehicle _x; } forEach _beams;
      deleteVehicle _lightPoint;
    }, [_beams, _lightPoint]] call CBA_fnc_waitUntilAndExecute;


}, [_stoneHengeCenter, _stoneHengeCenterTop]] call CBA_fnc_waitUntilAndExecute;
