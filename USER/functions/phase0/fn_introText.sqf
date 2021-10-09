if (!canSuspend) exitWith {
    [] execVM "USER\functions\phase0\fn_introText.sqf";
};

if (call GRAD_VM_main_fnc_getCurrentPhase != 0) exitWith {};

sleep 11;

playSound "grad_VM_crescendo";

private _leftCorner = safeZoneX;
private _rightCorner = 1;
private _verticalCenter = safeZoneH * 0.2;
private _height = safeZoneH * 0.5;

private _columnWidth = 1/11;

private _stringBefore = "VILE MATTER" splitString "";
private _characters = [];

private _display = findDisplay 46; // createDisplay "RscDisplayEmpty";
{
    private _thisCharacter = _x;
    private _index = _forEachIndex;  
        
    disableSerialization;
    private _character = _display ctrlCreate ["RscStructuredText", -1];
    private _positionX = _index * _columnWidth;

    _character ctrlSetStructuredText parseText format ["<t shadow='0' color='#ffffff' size='6' align='center'>%1</t>", _thisCharacter];
    _character ctrlSetFont "RobotoCondensedBold";
	_character ctrlSetFontHeight 0.03;
	_character ctrlSetPosition [_positionX,_verticalCenter,_columnWidth,_height];
	_character ctrlSetBackgroundColor [0,0,0,0];
    _character ctrlSetFade 1;
	_character ctrlCommit 0;

    _character ctrlSetFade 0;
	_character ctrlCommit (random _index);

    _characters pushback _character;

    sleep 0.5;

} forEach _stringBefore;

sleep 8;
{
    private _character = _x;
    private _duration = 10;
    switch (_forEachIndex) do {
        // V
        case (0): {
            _character ctrlSetPosition [8 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // I
        case (1): {
            _character ctrlSetPosition [1 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // L
        case (2): {
            _character ctrlSetPosition [10 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // E
        case (3): {
            _character ctrlSetPosition [3 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // -
        case (4): {
            _character ctrlSetPosition [4 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // M
        case (5): {
            _character ctrlSetPosition [2 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // A
        case (6): {
            _character ctrlSetPosition [7 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // T
        case (7): {
            _character ctrlSetPosition [0 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // T
        case (8): {
            _character ctrlSetPosition [5 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // E
        case (9): {
            _character ctrlSetPosition [9 * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // R
        case (10): {
            _character ctrlSetPosition [6  * _columnWidth,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
    };
    
} forEach _characters;

private _verticalCenter = safeZoneH * 0.3;
private _underline = _display ctrlCreate ["RscStructuredText", -1];
// _underline ctrlSetStructuredText "";
_underline ctrlSetPosition [0,_verticalCenter,0,0.02];
_underline ctrlSetBackgroundColor [1,1,1,1];
_underline ctrlCommit 0;
_underline ctrlSetPosition [0,_verticalCenter,1,0.02];
_underline ctrlCommit 10;

sleep 9;
{
    _x ctrlSetFade 1;
    _x ctrlCommit 10;

    [{
        ctrlDelete _this;
    }, _x, 10] call CBA_fnc_waitAndExecute;
    
} forEach (_characters + [_underline]);

sleep 3;
diwako_dui_main_toggled_off = false;


/*
"VILE MATTER"
"TIME TRAVEL"
*/
