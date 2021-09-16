params ["_position", ["_rows", 1], ["_columns", 1], ["_distance", 1]];

_position params ["_xPos", "_yPos"];

for "_xMulti" from 1 to _rows do {

    for "_yMulti" from 1 to _columns do {


        private _positionX = _xPos + (_xMulti * _distance);
        private _positionY = _yPos + (_yMulti * _distance);
        private _centrifugeBottom = createVehicle ["land_gm_euro_misc_tank_01_e", [_positionX, _positionY, 1], [], 0, "NONE"];
        _centrifugeBottom setObjectScale 0.2;

        private _centrifugeTop = createVehicle ["land_gm_euro_misc_tank_01_e", [_positionX, _positionY, 2.5], [], 0, "NONE"];
        _centrifugeTop setObjectScale 0.2;
    };
};
