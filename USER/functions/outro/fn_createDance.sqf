if (!canSuspend) exitWith {
    [] spawn GRAD_VM_outro_fnc_createDance;
};

if (!isServer) exitWith {};

private _singleDuration = 10;

private _group = createGroup civilian;
private _types = [
    ["Roman_praetorian_cent_IMS_red", "GreekHead_A3_13"],
    ["Barb_warrior_IMS", "WhiteHead_04"],
    ["LIB_GER_mgunner2", "WhiteHead_01"],
    ["LIB_GER_lieutenant", "adi_face"],
    ["TIOW_Comissar_Red", "GreekHead_A3_02"],
    ["TIOW_Cad_GM776th_Indep", "LivonianHead_1"]
];

private _unit = _group createUnit [_types#0#0, [0,0,0], [], 0, "CAN_COLLIDE"];
_unit setPos [0,0,0];
_unit setDir 90;
_unit setCaptive true;
_unit disableAI "ANIM";
_unit disableAI "MOVE";
[_unit, "Acts_Dance_02"] remoteExec ["switchMove"];

_unit addEventHandler ["AnimDone", {
    params ["_unit"];
    [_unit, "Acts_Dance_02"] remoteExec ["switchMove"];
}];

private _spotlight = "Land_PortableLight_double_F" createVehicleLocal [0,0,0];
_spotlight setPos (outroStatsTarget getPos [5, 90]);

[_spotlight, -45, 0, 90] call ace_common_fnc_setPitchBankYaw;

private _spotlight2 = "Land_PortableLight_double_F" createVehicleLocal [0,0,0];

_spotlight2 setPos (outroStatsTarget getPos [5, -90]);
[_spotlight2, -45, 0, -90] call ace_common_fnc_setPitchBankYaw;

sleep 3;

_unit setPos [(getpos outroStatsTarget)#0, (getpos outroStatsTarget)#1, 5.8];

sleep 1;
[(count _types * _singleDuration)] remoteExec ["GRAD_VM_outro_fnc_createDiscoBall"];
[_unit, (count _types * _singleDuration)] remoteExec ["GRAD_VM_outro_fnc_showStats"];

{
    _x params ["_loadout", "_face"];
    
    [_unit, _face] remoteExec ["setFace"];
    _unit setUnitLoadout _loadout;
    sleep _singleDuration;
} forEach _types;

sleep 1;


// cleanup
deleteVehicle _unit;
deleteVehicle _spotlight;
deleteVehicle _spotlight2;