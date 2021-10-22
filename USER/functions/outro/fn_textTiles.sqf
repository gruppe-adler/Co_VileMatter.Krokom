/*
    Author: Karel Moricky

    Description:
    Show animated text

    Parameter(s):
    0: Content
        STRING - Picture
        STRUCTURED TEXT - Text
    1 (Optional):
        ARRAY - Position in format [x,y,w,h]
        BOOL - Use "Mission" area position (customizable in Layout options menu)
    2 (Optional): ARRAY - Tile size in format [w,h]
    3 (Optional): NUMBER - Duration in seconds (default: 5)
    4 (Optional): NUMBER - Fade in/out time (default: 0.5)
    5 (Optional): NUMBER - Tile transparency (default: 0.3)

    Returns:
    BOOL - true

    [parseText "<t font='RobotoCondensedBold' size='1'>HANDPLACED OBJECTS</t>", parseText "<t font='RobotoCondensedBold' size='4'>8920</t>", [0,0,1,1], [1,100], 3, 0.7, 0] execVM "USER\functions\outro\fn_textTiles.sqf";
*/

if (!canSuspend) exitWith { };

#include "\A3\ui_f\hpp\defineCommonGrids.inc"

disableserialization;

params
[
    ["_label", "#(argb,8,8,3)color(1,0,1,1)", ["", parsetext ""]],
    ["_value", "#(argb,8,8,3)color(1,0,1,1)", ["", parsetext ""]],
    ["_pos", [0,0,1,1]],
    ["_duration", 5],
    ["_fade", []],
    ["_maxAlpha", 0.3]
];


private _fadeIn = _fade param [0, 0.5, [0]];
private _fadeOut = _fade param [1, _fadeIn, [0]];

_pos params ["_posX", "_posY", "_posW", "_posH"];


playSound "GRAD_VM_tick";

private _display = findDisplay 46;

private _labelContent = _display ctrlCreate ["RscStructuredText", -1];
_labelContent ctrlsetstructuredtext _label;

//_color = random 0.5;
private _color = random 0.4;

//_alpha = if (random 1 > 0.1) then {0.3} else {0};
private _alpha = if (random 1 > 0.1) then {_maxAlpha} else {_maxAlpha * 0.5};

_labelContent ctrlsetbackgroundcolor [_color,_color,_color,_alpha];
_labelContent ctrlsetfade 1;
_labelContent ctrlsetposition [
    _posX,
    _posY,
    ctrlTextWidth _labelContent * 1.1,
    _posH
];
_labelContent ctrlcommit 0;

_labelContent ctrlsetfade 0;
_labelContent ctrlcommit (random _fadeIn);

sleep _duration;

playsound "GRAD_VM_teleport2";

sleep _fadeIn;

private _valueContent = _display ctrlCreate ["RscStructuredText", -1];
_valueContent ctrlsetstructuredtext _value;

//_color = random 0.5;
private _color = random 0.4;

//_alpha = if (random 1 > 0.1) then {0.3} else {0};
private _alpha = if (random 1 > 0.1) then {_maxAlpha} else {_maxAlpha * 0.5};

_valueContent ctrlsetbackgroundcolor [_color,_color,_color,_alpha];
_valueContent ctrlsetposition [
    _posX,
    _posY,
    ctrlTextWidth _valueContent * 1.1,
    _posH
];
_valueContent ctrlsetfade 1;
_valueContent ctrlcommit 0;

_valueContent ctrlsetfade 0;
_valueContent ctrlcommit (random _fadeIn/2);


sleep (_fadeIn + _fadeOut + _duration);

_labelContent ctrlsetfade 1;
_labelContent ctrlcommit (random _fadeOut);

_valueContent ctrlsetfade 1;
_valueContent ctrlcommit (random _fadeOut);

sleep _fadeOut;

ctrlDelete _labelContent;
ctrlDelete _valueContent;


true 