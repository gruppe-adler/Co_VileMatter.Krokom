private _position = getPosATL phase2_bomberStart;
private _positionTarget = getPos phase2_bomberTarget;

private _bomberParent = "LIB_Pe2_2_w" createVehicle [0,0,0];
_bomberParent setPosATL _position;
_bomberParent setDir (_bomberParent getRelDir (getPos phase2_bomberTarget));

createVehicleCrew _bomberParent;

for "_i" from 1 to 6 do {

        for "_j" from 1 to 5 do {

            private _bomber = createSimpleObject ["LIB_Pe2_2_w", [0,0,0]];
            _bomber attachTo [_bomberParent, [_i * 50, _j * 50, 0]];
            createVehicleCrew _bomber;
            _bomber engineOn true;
        };
};

for "_i" from 1 to 6 do {

        for "_j" from 1 to 5 do {

            private _bomber = createSimpleObject ["LIB_Pe2_2_w", [0,0,0]];
            _bomber attachTo [_bomberParent, [_i * 50, _j * 50, 0]];
            createVehicleCrew _bomber;
            _bomber engineOn true;
        };
};



_bomberParent flyinheightASL [700, 700, 700];
_bomberParent setCaptive true;
_bomberParent disableAI "FSM";
_bomberParent disableAI "AUTOTARGET";
_bomberParent setSpeedMode "LIMITED";
_bomberParent engineOn true;
_bomberParent setVelocityModelSpace [0,300,0];
_bomberParent doMove _positionTarget;
_bomberParent allowDamage  false;


[] call GRAD_VM_phase2_fnc_bunkerBombardment;


// fix initial skydrop
[{
    _this setVelocityModelSpace [0,300,0];
}, _bomberParent, 1] call CBA_fnc_waitAndExecute;

// delete completely
[{
    params ["_bomberParent", "_positionTarget"];
    _bomberParent distance2d _positionTarget < 200
},{
    params ["_bomberParent", "_positionTarget"];

    private _attachedPlanes = attachedObjects _bomberParent;
    { deleteVehicleCrew _x; } forEach (_attachedPlanes + [_bomberParent]);
    { deleteVehicle _x; } forEach (_attachedPlanes);
    deleteVehicle _bomberParent;

}, [_bomberParent, _positionTarget]] call CBA_fnc_waitUntilAndExecute;
