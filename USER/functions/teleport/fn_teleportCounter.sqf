if (!canSuspend) exitWith {
    [] execVM "USER\functions\phase0\fn_teleportCounter.sqf";
};

params ["_firstPipePos", "_lastPipePos", "_startDate", "_endDate"];

private _leftCorner = safeZoneX;
private _verticalCenter = safeZoneH * 0.2;
private _height = safeZoneH * 0.5;

private _display = findDisplay 46;

disableSerialization;
private _control = _display ctrlCreate ["RscStructuredText", -1];
_control ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' size='6' align='center'>%1</t>", _thisCharacter];
_control ctrlSetFont "RobotoCondensedBold";
_control ctrlSetFontHeight 0.03;
_control ctrlSetPosition [_leftCorner,_verticalCenter,1,_height];
_control ctrlSetBackgroundColor [0,0,0,0];
_control ctrlSetFade 1;
_control ctrlCommit 0;

_control ctrlSetFade 0;
_control ctrlCommit 1;

[{
    params ["_args", "_handle"];
    _args params ["_firstPipePos", "_lastPipePos", "_startDate", "_endDate", "_control"];

    private _dateResult = linearConversion [0, _firstPipePos distance _lastPipePos, gradVM_cameraPosition, _startDate, _endDate, true];
    _control ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' size='6' align='center'>%1</t>", str _dateResult];
    _control ctrlCommit 0;

    if (_dateResult == _endDate) exitWith {
         [{
            ctrlDelete _this;
         }, _control, 10] call CBA_fnc_waitAndExecute;
         [_handle] call CBA_fnc_removePerFrameHandler;
    };
    
}, 0, [_firstPipePos, _lastPipePos, _startDate, _endDate, _control]] call CBA_fnc_addPerFramehandler;


/*
"VILE MATTER"
"TIME TRAVEL"
*/
