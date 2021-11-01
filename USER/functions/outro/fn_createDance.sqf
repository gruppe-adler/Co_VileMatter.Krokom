if (!canSuspend) exitWith {
    [] spawn GRAD_VM_outro_fnc_createDance;
};

if (!isServer) exitWith {};

private _types = [
    ["Roman_praetorian_cent_IMS_red", "GreekHead_A3_13"],
    ["Barb_warrior_IMS", "WhiteHead_04"],
    ["LIB_GER_mgunner2", "WhiteHead_01"],
    ["LIB_GER_lieutenant", "adi_face"],
    ["TIOW_Comissar_Red", "GreekHead_A3_02"],
    ["TIOW_Cad_GM776th_Indep", "LivonianHead_1"]
];

private _totalDuration = 89;
private _singleDuration = _totalDuration/(count _types);

private _group = createGroup civilian;
private _unit = _group createUnit [_types#0#0, [0,0,0], [], 0, "CAN_COLLIDE"];
_unit setPos [0,0,0];
_unit setDir 90;
_unit setCaptive true;
_unit disableAI "ANIM";
_unit disableAI "MOVE";
[_unit, "Acts_Dance_01"] remoteExec ["switchMove"];

_unit addEventHandler ["AnimDone", {
    params ["_unit", "_anim"];
    if (_anim == "Acts_Dance_01") then {
        [_unit, "Acts_Dance_02"] remoteExec ["switchMove"];
    } else {
        [_unit, "Acts_Dance_01"] remoteExec ["switchMove"];
    };
}];

private _spotlight = "Land_PortableLight_double_F" createVehicleLocal [0,0,0];
_spotlight setPos (outroStatsTarget getPos [5, 90]);

[_spotlight, -45, 0, 90] call ace_common_fnc_setPitchBankYaw;

private _spotlight2 = "Land_PortableLight_double_F" createVehicleLocal [0,0,0];

_spotlight2 setPos (outroStatsTarget getPos [5, -90]);
[_spotlight2, -45, 0, -90] call ace_common_fnc_setPitchBankYaw;

sleep 3;

private _position = [(getpos outroStatsTarget)#0, (getpos outroStatsTarget)#1, 5.8];
[_totalDuration+10] remoteExec ["GRAD_VM_outro_fnc_createDiscoBall"];
[_unit, _totalDuration] remoteExec ["GRAD_VM_outro_fnc_showStats"];
sleep 3;
_unit setPos _position;

{
    _x params ["_loadout", "_face"];

    [_unit, _face] remoteExec ["setFace"];
    _unit setUnitLoadout _loadout;
    sleep _singleDuration;
} forEach _types;

[(_unit modelToWorldVisual [0,0,0])] remoteExec ["GRAD_VM_localEffects_fnc_meatSplashEffect", [0,-2] select isDedicated];
hideObjectGlobal  _unit;

sleep 10;

// cleanup

deleteVehicle _spotlight;
deleteVehicle _spotlight2;
deleteVehicle _unit;
