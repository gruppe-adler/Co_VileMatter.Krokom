params ["_unit", "_duration"];

playSound "chilladi";

1 fadeSound 1;

private _cam = "camera" camCreate (getPos outroStatsCamPos);
_cam camSetPos (getPos outroStatsCamPos);
_cam camSetTarget [(getpos outroStatsTarget)#0, (getpos outroStatsTarget)#1, 6.5];
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
    ["Verbaute Objekte", "8048", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Custom Functions", "103", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Custom Sounds", "84", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Zusätzliche Mods", "15", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Gefixte Modfehler", "Dutzende", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Bauzeit", "10 Wochen", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Missionsbauer", "3", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Abgebissene Tischkanten", "1337", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Besonderen Dank an", "diwako", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["brought to you by", "Gruppe Adler", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]]
];

private _mask = (findDisplay 46) ctrlcreate ["RscPicture", -1];
_mask ctrlsetText "USER\images\outromask3.paa";
_mask ctrlSetBackgroundColor [0,0,0,0];
_mask ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
_mask ctrlCommit 0;

private _maskBlack = (findDisplay 46) ctrlcreate ["RscText", -1];
_maskBlack ctrlSetBackgroundColor [0,0,0,1];
_maskBlack ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
_maskBlack ctrlCommit 0;

// delete mask before
ctrldelete (player getVariable ["GRAD_VM_outro_currentMask", ctrlnull]);

_maskBlack ctrlSetFade 1;
_maskBlack ctrlCommit 3;

[{
    params ["_cam", "_unit"];
    _cam distance2D _unit < 200
},{
    params ["_cam", "_unit"];
    _cam camSetTarget _unit;
    _cam camCommit 0.2;
    [_unit, position _unit, true] call GRAD_VM_teleport_fnc_despawnEffect;
}, [_cam, _unit]] call CBA_fnc_waitUntilAndExecute;


sleep 5;

{
    _x params ["_label", "_value", "_position"];

    [
        parseText ("<t font='RobotoCondensedBold' color='#80ffffff' size='1' align='left'>" + _label + "</t>"), 
        parseText ("<t font='RobotoCondensedBold' size='4' align='left'>" + _value + "</t>"), 
        _position, (_duration/(count _allTexts))
    ] execVM "USER\functions\outro\fn_textTiles.sqf";

    sleep (_duration/(count _allTexts));
} forEach _allTexts;

_maskBlack ctrlSetFade 0;
_maskBlack ctrlCommit 3;

sleep 3;

call GRAD_VM_outro_fnc_endMissionLocal;

[{
    params ["_mask", "_maskBlack"];
    ctrlDelete _mask; ctrldelete _maskBlack;
}, [_mask, _maskBlack], 3] call CBA_fnc_waitAndExecute;

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