// [] execVM "USER\functions\phase0\fn_introText.sqf";

if (!canSuspend) exitWith {
    [] execVM "USER\functions\phase0\fn_introText.sqf";
};

_string_1 = "<t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99999999'>V I L E</t><t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99999999'> </t><t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99000000'>M A T T E R</t>";
_string_2 = "<t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99999999'>T I M E</t><t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99999999'> </t><t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99000000'>T R A V E L</t>";

private _array_1 = _string_1 splitString " ";
private _array_2 = _string_2 splitString " ";


private _array_1_length = count _array_1;
private _array_2_length = count _array_2;

private _empty_array = [];

private _ctrl = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
_ctrl ctrlSetPosition [
    safeZoneX + safeZoneW/2 - safeZoneW/2,
    (safezoneY + safeZoneH)/3,
    safezoneWAbs,
    safeZoneH/16
];

_ctrl ctrlSetBackgroundColor [0, 0, 0, 0];
_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 0;

[_ctrl, 1.2, 30] spawn BIS_fnc_ctrlSetScale;

_ctrl ctrlSetFade 0;
_ctrl ctrlCommit 3;

{

    private _string = _x;
    private _string2 = "<t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#3399999'>" + _string + "</t>";


    _ctrl ctrlSetFade 0.5;
    _ctrl ctrlCommit 0.3;

    sleep 0.3;

    _ctrl ctrlSetStructuredText parseText _string2;

    _ctrl ctrlSetFade 0;
    _ctrl ctrlCommit 0.7;

    if (_forEachIndex == 0) then {
        sleep 5;
    } else {
        sleep 1;
    };
} forEach
[
"V I L E  M A T T E R",
"T I L E  M A T T E R",
"T I M E  M A T T E R",
"T I M E  T A T T E R",
"T I M E  T R T T E R",
"T I M E  T R A T E R",
"T I M E  T R A T E R",
"T I M E  T R A V E R",
"T I M E  T R A V E L"];




sleep 2;
0 cutText ["", "PLAIN"];

ctrlDelete _ctrl;
