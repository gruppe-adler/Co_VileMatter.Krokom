// [position player, 0] execVM "USER\functions\phase1\fn_spawnMarchingColumn.sqf";


params ["_position", "_dir", ["_rows", 3]];

private _group = createGroup EAST;
private _leader = _group createUnit ["Roman_legioner_cent_IMS_red", _position, [], 0, "NONE"];
_leader setDir _dir;

_leader setVariable ["GRAD_VM_isRoman", true, true];

_group setFormDir _dir;

_leader addWeapon "RM_Fire_torch";
_leader addHandgunItem "RM_torch_fluid";
_leader removeWeapon "JMSL_W_Melee_Gladius_1";
_leader selectWeapon "RM_Fire_torch";

[_leader] execVM "USER\functions\phase1\fn_addTorch.sqf";


for "_i" from 1 to _rows do {
    {
        _x params ["_xPos", "_yPos", "_zPos"];
        private _soldier = _group createUnit ["Roman_legioner_troop_IMS_red", [0,0,0], [], 0, "NONE"];
        _soldier setPos (_leader modelToWorld [_xPos, _yPos, 0]);
        _soldier setDir _dir;
    } forEach [
        [-1,-_i,0],
        [0,-_i,0],
        [1,-_i,0]
    ];
};

private _horse = _group createUnit ["dbo_horse_snow", [0,0,0], [], 0, "NONE"];
_horse setPos (_leader modelToWorld [0, -(_rows+5), 0]);
_horse setDir _dir;


private _rearlight = _group createUnit ["Roman_legioner_sign_red", [0,0,0], [], 0, "NONE"];
_rearlight setPos (_leader modelToWorld [0, -(_rows+5), 0]);
_rearlight setDir _dir;

[_rearlight, _horse] execVM "USER\functions\phase1\fn_horseMountAI.sqf";

[_leader] execVM "USER\functions\phase1\fn_marchSoldier.sqf";