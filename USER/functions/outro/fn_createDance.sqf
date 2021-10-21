if (!canSuspend) exitWith {
    [] spawn GRAD_VM_outro_fnc_createDance;
};

private _group = createGroup civilian;
private _types = [
    "Roman_praetorian_cent_IMS_red",
    "Barb_warrior_IMS",
    "LIB_GER_mgunner2",
    "LIB_GER_lieutenant",
    "TIOW_Comissar_Red",
    "TIOW_Cad_GM776th_Indep"
];

private _units = [];

{
    private _unit = _group createUnit [_x, [0,0,0], [], 0, "CAN_COLLIDE"];
    _unit setPos [0,0,0];
    _unit setDir 90;

    _unit playMoveNow "Acts_Dance_01";

    _unit addEventHandler ["AnimDone", {
        params ["_unit"];
        _unit playMoveNow "Acts_Dance_01";
    }];

    _units pushBackUnique _unit;
} forEach _types;


{
    private _unit = _x;

    private _formerUnit = missionNamespace getVariable ["GRAD_VM_formerUnit", objNull];

    if (!isNull _formerUnit) then {
        _formerUnit setPos [0,0,0];
    };
    _unit setPos (getPos outroStatsCamPos);
    missionNamespace setVariable ["GRAD_VM_formerUnit", _unit];

    sleep 10;
} forEach _units;

// cleanup
{
    deleteVehicle _x;
} forEach _units;