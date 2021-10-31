private _position = getPosATL phase2_bomberStart;
private _positionTarget = getPos phase2_bomberTarget;

private _bomberParent = "LIB_Pe2_2_w" createVehicle [0,0,0];
_bomberParent setPosATL _position;
_bomberParent setDir (_bomberParent getRelDir (getPos phase2_bomberTarget));

createVehicleCrew _bomberParent;

for "_i" from 1 to 3 do {

        for "_j" from 1 to 3 do {

            private _bomber = createSimpleObject ["LIB_Pe2_2_w", [0,0,0]];
            _bomber attachTo [_bomberParent, [_i * 50, _j * 50, 0]];
            createVehicleCrew _bomber;
            _bomber engineOn true;
        };
};

for "_i" from 1 to 3 do {

        for "_j" from 1 to 3 do {
        
            private _bomber = createSimpleObject ["LIB_Pe2_2_w", [0,0,0]];
            _bomber attachTo [_bomberParent, [_i * 50, _j * 50, 0]];
            createVehicleCrew _bomber;
            _bomber engineOn true;
        };
};



_bomberParent flyInHeight 700;
_bomberParent setCaptive true;
_bomberParent disableAI "FSM";
_bomberParent disableAI "AUTOTARGET";
_bomberParent setSpeedMode "LIMITED";
_bomberParent engineOn true;
_bomberParent setVelocityModelSpace [0,150,0];
_bomberParent doMove _positionTarget;
_bomberParent setVelocityModelSpace [0,150,0];