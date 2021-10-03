if (!isServer) exitWith {};

private _roads = [worldSize/2, worldsize/2] nearRoads (worldsize/2);

/*
"Land_DirtPatch_01_6x8_F",
    "Land_DirtPatch_05_F",
*/
private _decalTypes = [
    
    "Land_DirtPatch_03_F"
];

private _offsets = [
    [-15,-2],
    [-10,-2],
    [-5,-2],
    [0,-2],
    [5,-2],
    [10,-2],
    [15,-2],
    [-15,2],
    [-10,2],
    [-5,2],
    [0,2],
    [5,2],
    [10,2],
    [15,2]
];


{
    private _road = _x;
    // filter trails and stuff
    (getRoadInfo _x) params ["_type", "", "", "", "", "", "_begPos", "_endPos", ""];
    private _isRoad = _type == "ROAD";
    private _dir = _begPos getDir _endPos;

    if (_isRoad) then {
        {
            _x params ["_offsetX", "_offsetY"];
            private _positionOffsetX = _road getPos [_offsetX, _dir];
            private _positionOffsetXY = _positionOffsetX getPos [_offsetY, _dir];
            private _position = AGLtoASL _positionOffsetXY;
            private _decal = createSimpleObject [selectRandom _decalTypes, _position, false];
            _decal setDir (random 360);
        } forEach _offsets;
    };
    
} forEach _roads;