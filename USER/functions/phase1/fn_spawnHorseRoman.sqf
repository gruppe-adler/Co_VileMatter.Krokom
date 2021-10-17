params ["_position"];

private _group = createGroup east;

private _horse = _group createUnit ["dbo_horse_snow", [0,0,0], [], 0, "NONE"];
_horse setPos _position;
_horse setDir _dir;


private _rearlight = _group createUnit ["Roman_legioner_sign_red", [0,0,0], [], 0, "NONE"];
_rearlight setDir _dir;
_rearlight setPos _position;

[_rearlight, _horse] execVM "USER\functions\phase1\fn_horseMountAI.sqf";