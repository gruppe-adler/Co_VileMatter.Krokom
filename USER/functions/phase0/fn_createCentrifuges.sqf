/*
    [position cursorObject, 20, 20, 1] execvm "USER\functions\phase0\fn_createCentrifuges.sqf";

    NOT IN USE
*/
if (!isServer) exitWith {};

params ["_object", ["_rows", 1], ["_columns", 1], ["_distance", 1]];

private _positionASL = getPosASL _object;
_positionASL params ["_xPos", "_yPos", "_zPos"];

for "_xMulti" from 1 to _rows do {

    for "_yMulti" from 1 to _columns do {

        private _position = _object getRelPos [getDir _object, (_xMulti * _distance)];
        // _position vectorAdd [0,_yMulti,1];

        _position params ["_positionX", "_positionY"];
        private _centrifugeBottom = createSimpleObject ["land_gm_euro_misc_tank_01_e", [_positionX, _positionY, _zPos+2], false];
        _centrifugeBottom setVectorUp [0,0,1];
        _centrifugeBottom setObjectScale 0.2;
    };
};
