
[] spawn {
    
private _leftSide = safeZoneX+safeZoneW/4;
private _rightSide = safeZoneX+safeZoneW/1.5;
private _upperHalf = safeZoneY + safeZoneH/4;
private _lowerHalf = safeZoneY + safeZoneH/1.5;
private _centerH = safeZoneX + safeZoneW/2;
private _centerW = safeZoneY + safeZoneH/2;

private _allTexts = [
    ["Verbaute Objekte", "10294", [_leftSide, _upperHalf, safeZoneW, safeZoneH]],
    ["Custom Functions", "103", [_rightSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Custom Sounds", "84", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Bauzeit", "10 Wochen", [_rightSide, _upperHalf, safeZoneW, safeZoneH]],
    ["Missionsbauer", "3", [_leftSide, _lowerHalf, safeZoneW, safeZoneH]],
    ["Gruppe", "ADLER", [_centerH, _centerW, safeZoneW, safeZoneH]]
];

private _group = createGroup civilian;
private _types = [
    "Roman_praetorian_cent_IMS_red",
    "Barb_warrior_IMS",
    "LIB_GER_mgunner2",
    "LIB_GER_lieutenant",
    "TIOW_Comissar_Red",
    "TIOW_Cad_GM776th_Indep"
];

{
    _x params ["_label", "_value", "_position"];

    private _unit = _group createUnit [_x, [0,0,0], [], 0, "CAN_COLLIDE"];
    _unit setPos (getPos outroStatsCamPos);

    _unit playMoveNow "anim_jump_Loop";

    _unit addEventHandler ["AnimDone", {
        params ["_unit"];
        _unit playMoveNow "anim_jump_Loop";
    }];

    [parseText ("<t font='RobotoCondensedBold' size='1' align='center'>" + _label + "</t>"), 
    parseText ("<t font='RobotoCondensedBold' size='4' align='center'>" + _value + "</t>"), 
    _position, 1, 1, 0] execVM "USER\functions\outro\fn_textTiles.sqf";

    sleep 6;

    deleteVehicle _unit;
} forEach _allTexts;




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