params ["_firstPipePos", "_lastPipePos", ["_startDate", 2035], ["_endDate", 9]];

if (!canSuspend) exitWith {
    [_firstPipePos, _lastPipePos, _startDate, _endDate] execVM "USER\functions\teleport\fn_teleportCounter.sqf";
};

private _verticalCenter = safeZoneH * 0.25;
private _height = safeZoneH * 0.5;

private _display = findDisplay 46;
disableSerialization;
private _control = _display ctrlCreate ["RscStructuredText", -1];
_control ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' size='6' align='center'>%1</t>", _startDate];
_control ctrlSetFont "RobotoCondensedBold";
_control ctrlSetFontHeight 0.03;
_control ctrlSetPosition [0,_verticalCenter,1,_height];
_control ctrlSetBackgroundColor [0,0,0,0];
_control ctrlSetFade 1;
_control ctrlCommit 0;
_control ctrlSetFade 0;
_control ctrlCommit 2;


[{
    params ["_args", "_handle"];
    _args params ["_firstPipePos", "_lastPipePos", "_startDate", "_endDate", "_control"];

    private _fullDistance = (_firstPipePos distance _lastPipePos);
    private _currentDistance = (gradVM_cameraPosition distance _lastPipePos);

    // systemChat format ["%1, %2, %3, %4", _fullDistance, _currentDistance, _startDate, _endDate];

    private _dateResult = floor (linearConversion [
        _fullDistance, 
        0, 
        _currentDistance, 
        _startDate, 
        _endDate, 
        true
    ]);

    _control ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' size='6' align='center'>%1</t>", _dateResult];
    _control ctrlCommit 0;

    if (_dateResult == _endDate) exitWith {
        _control ctrlSetFade 1;
        _control ctrlCommit 5;
         [{
            ctrlDelete _this;
         }, _control, 5] call CBA_fnc_waitAndExecute;
         [_handle] call CBA_fnc_removePerFrameHandler;
        
    };

}, 0, [_firstPipePos, _lastPipePos, _startDate, _endDate, _control]] call CBA_fnc_addPerFramehandler;


/*
"VILE MATTER"
"TIME TRAVEL"
*/
