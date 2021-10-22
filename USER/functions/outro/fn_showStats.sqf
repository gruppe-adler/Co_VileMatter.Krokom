params ["_unit", "_duration"];

playSound "chilladi";

private _cam = "camera" camCreate (getPos outroStatsCamPos);
_cam camSetPos (getPos outroStatsCamPos);
_cam camSetTarget _unit;
_cam cameraEffect ["internal", "BACK"];
_cam camsetFov 0.3;
_cam camCommit 0;

 ("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];

private _leftSide = safeZoneX+safeZoneW/4;
private _rightSide = safeZoneX+safeZoneW/1.5;
private _upperHalf = safeZoneY + safeZoneH/4;
private _lowerHalf = safeZoneY + safeZoneH/1.5;
private _centerH = safeZoneX + safeZoneW/3;
private _centerW = safeZoneY + safeZoneH/1.5;

private _allTexts = [
    ["Verbaute Objekte", "10294", [_leftSide, _upperHalf, safeZoneW, safeZoneH]],
    ["Custom Functions", "103", [_rightSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Custom Sounds", "84", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Bauzeit", "10 Wochen", [_rightSide, _upperHalf, safeZoneW, safeZoneH]],
    ["Missionsbauer", "3", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Gruppe", "ADLER", [_centerH, _centerW, safeZoneW, safeZoneH]]
];

private _mask = (findDisplay 46) ctrlcreate ["RscPicture", -1];
_mask ctrlsetText "USER\images\outromask3.paa";
_mask ctrlSetBackgroundColor [0,0,0,0];
_mask ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
_mask ctrlCommit 0;

{
    _x params ["_label", "_value", "_position"];

    [parseText ("<t font='RobotoCondensedBold' size='1' align='center'>" + _label + "</t>"), 
    parseText ("<t font='RobotoCondensedBold' size='4' align='center'>" + _value + "</t>"), 
    _position, 1, 1, 0] execVM "USER\functions\outro\fn_textTiles.sqf";

    sleep (_duration/(count _allTexts));
} forEach _allTexts;


[{
    params ["_mask"];
    ctrlDelete _mask;
}, [_mask], _duration + 1] call CBA_fnc_waitAndExecute;

/*
    
    starWars_lightsaber_style1_loop

    starWars_landRoll
    starWars_landRoll_b

    Star_Wars_KaaTirs_scream

    anim_jump_Loop
    anim_jump_FlipBackward
    anim_jump_FlipForward
    anim_hardLand

*/