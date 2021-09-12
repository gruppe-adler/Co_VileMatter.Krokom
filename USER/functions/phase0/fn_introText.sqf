if (!canSuspend) exitWith {
    [] execVM "USER\functions\phase0\fn_introText.sqf";
};

private _leftCorner = safeZoneX;
private _rightCorner = 1;
private _verticalCenter = safeZoneH * 0.4;
private _height = safeZoneH * 0.1;

private _columnWidth = (safeZoneX + safeZoneW)/11;

private _stringBefore = ["VILE MATTER"] call BIS_fnc_splitString;
private _characters = [];

private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
{
  disableSerialization;
  private _character = _display ctrlCreate ["RscStructuredText", -1];
  private _positionX = _forEachIndex * _columnWidth;

  _character ctrlSetStructuredText parseText format ["<t color='#ffffff' size='2.1'>%1</t>", _character];
  _character ctrlSetFont "EtelkaMonospacePro";
	_character ctrlSetFontHeight 0.03;
	_character ctrlSetPosition [_positionX,_verticalCenter,_columnWidth,_height];
	_character ctrlSetBackgroundColor [0,0,0,0];
  _character ctrlSetFade 1;
	_character ctrlCommit 0;

  _character ctrlSetFade 0;
	_character ctrlCommit 3;

  _characters pushback _character;

  sleep 0.1;

} forEach _stringBefore;

{
    private _character = _x;
    private _duration = 3;
    switch (_forEachIndex) do {
        // V
        case (1): {
            _character ctrlSetPosition [9 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // I
        case (2): {
            _character ctrlSetPosition [2 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // L
        case (3): {
            _character ctrlSetPosition [11 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // E
        case (4): {
            _character ctrlSetPosition [4 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // -
        case (5): {
            _character ctrlSetPosition [5 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // M
        case (6): {
            _character ctrlSetPosition [3 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // A
        case (7): {
            _character ctrlSetPosition [8 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // T
        case (8): {
            _character ctrlSetPosition [1 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // T
        case (9): {
            _character ctrlSetPosition [6 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // E
        case (10): {
            _character ctrlSetPosition [10 * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
        // R
        case (11): {
            _character ctrlSetPosition [7  * _columnWidth;,_verticalCenter,_columnWidth,_height];
          	_character ctrlCommit _duration;
        };
    };

    sleep 6;
    _character ctrlSetFade 1;
    _character ctrlCommit 3;
} forEach _characters;

/*
"VILE MATTER"
"TIME TRAVEL"
*/
