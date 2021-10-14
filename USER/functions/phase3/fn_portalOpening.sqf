// JIP check
if ([3] call GRAD_VM_main_fnc_getPhaseProgress == [3] call GRAD_VM_main_fnc_getPhaseMaxProgress) exitWith {};

params ["_crystal"];

// reset
_crystal setVariable ["grad_VM_zPos", -3];

private _cannons = ["GRAD_VM_cannonPos_1", "GRAD_VM_cannonPos_2", "GRAD_VM_cannonPos_3", "GRAD_VM_cannonPos_4"];
private _effectDuration = 5;
private _cannonPositions = [];
private _crystalTop = getPosWorld _crystal;
_crystalTop set [2,10];


{
    private _ship = player getVariable "GRAD_VM_localBattleship";
    private _position = _ship modelToWorld (GRAD_VM_battleship getVariable _cannon);

    _cannonPositions pushBackUnique _position;
} forEach _cannons;


private _lightPoints = [];
{
    _x params ["_xPos", "_yPos", "_zPos"];

    private _lightPoint = "#lightpoint" createvehiclelocal _x;
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 3; _lightPoint setLightFlareMaxDistance 5000;
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
    _lightPoint setLightAttenuation [2, 4, 4, 0, 9, 10];// [0,0,0,0,0,4000];
    _lightPoint setLightBrightness .1;

    _lightPoints pushBackUnique _lightPoint;

} forEach _cannonPositions;

// lightpoints moving to center
private _handle = [{
    params ["_args", "_handle"];
    _args params ["_lightPoints", "_crystalTop"];

    {
        private _lightpoint = _x;
        private _position = (_lightPoint getPos [15, (_lightpoint getRelDir _crystalTop)]);
        _position set [2, 1.5];

        _lightpoint setPos _position;

        drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_lightpoint];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[.1,2,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];


        if (_lightpoint distance2d _crystalTop < 0.2) exitWith {
            diag_log "success phase3 star";
            // first player sends signal
            private _currentPhaseProgress = [3] call GRAD_VM_main_fnc_getPhaseProgress;
            if (_currentPhaseProgress < 3) then {
                ["grad_VM_phaseControl", [3, 3]] call CBA_fnc_serverEvent;
            };

            { deleteVehicle _x; } forEach _lightPoints;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    } forEach _lightPoints;


}, 0.01, [_lightPoints, _crystalTop]] call CBA_fnc_addPerFrameHandler;





[{
  // JIP proof execution
  private _currentPhaseProgress = [3] call GRAD_VM_main_fnc_getPhaseProgress;
  _currentPhaseProgress >= 1},
{
    params ["_crystal", "_crystalTop"];
    private _lightPoint = "#lightpoint" createvehiclelocal _crystalTop;
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
        _args params ["_lightPoint", "_crystal"];

        private _lightFlareSize = _crystal getVariable ["grad_VM_lightFlareSize", 5];
        private _lightFlareExpanding = _crystal getVariable ["grad_VM_lightFlareExpanding", true];

        if (isNull _lightPoint) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

        private _maxSize = 200;
        private _minSize = 150;
        private _distanceToPoint = player distance _lightPoint;
        private _currentMaxSize = (_maxSize * ((1/_distanceToPoint) min 1));
        private _currentMinSize = (_minSize * ((1/_distanceToPoint) min 1));

        if (_lightFlareSize > _currentMaxSize) then {
            _lightFlareExpanding = false;
            _crystal setVariable ["grad_VM_lightFlareExpanding", _lightFlareExpanding];
        };

        if (_lightFlareSize < _currentMinSize) then {
            _lightFlareExpanding = true;
            _crystal setVariable ["grad_VM_lightFlareExpanding", _lightFlareExpanding];
        };

        if (_lightFlareExpanding) then {
            _lightFlareSize = _lightFlareSize + random 0.5;
            _lightPoint setLightFlareSize _lightFlareSize;
        } else {
            _lightFlareSize = _lightFlareSize - random 0.5;
            _lightPoint setLightFlareSize _lightFlareSize;
        };



        _crystal setVariable ["grad_VM_lightFlareSize", _lightFlareSize];

        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[1,4,1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_lightpoint];
        // systemChat str _currentMaxSize;


    }, 0.02, [_lightPoint, _crystal]] call CBA_fnc_addPerFrameHandler;


    private _beams = [];
    private _zPos = _crystal getVariable ["grad_VM_zPos", -3];
    for "_i" from 1 to 30 do {

       _zPos = _zPos + 3;
       _crystal setVariable ["grad_VM_zPos", _zPos];

       private _pos = getPosWorld _crystal;
       private _dir = random 360;
       _pos set [2, ((_pos select 2) + _zPos)];

       private _beam = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", _pos, true];

       _beam setDir _dir;
       [_beam, -90, 0] call BIS_fnc_setPitchBank;

       _beams pushBack _beam;
    };

    // clean up
    [{[3] call GRAD_VM_main_fnc_getPhaseProgress == [3] call GRAD_VM_main_fnc_getPhaseMaxProgress},{
      params ["_beams", "_lightPoint"];
      { deleteVehicle _x; } forEach _beams;
      deleteVehicle _lightPoint;
    }, [_beams, _lightPoint]] call CBA_fnc_waitUntilAndExecute;


}, [_crystal, _crystalTop]] call CBA_fnc_waitUntilAndExecute;
