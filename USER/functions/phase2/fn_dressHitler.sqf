params ["_adi"];

_adi setUnitLoadout [[],[],["LIB_P08","","","",["LIB_8Rnd_9x19_P08",8],[],""],["U_LIB_GER_Oberst",[]],["V_LIB_GER_OfficerBelt",[]],[],"H_LIB_DAK_OfficerCap","",[],["","","ItemRadio","ItemCompass","gm_watch_kosei_80",""]];

[_adi, "adi_face"] remoteExec ["setFace", 0, _adi];

_adi setVariable ["GRAD_VM_isHitler", true, true];
_adi allowDamage false;

_adi setCaptive true;

[_adi, "adi_identity"] remoteExec ["setIdentity", 0, _adi];

_adi addEventHandler ["Fired", {
    params ["_adi", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    if ((weaponState _adi) select 4 == 0) then {
        _adi addMagazine "LIB_8Rnd_9x19_P08";
    };
}];

[_adi] remoteexec ["GRAD_VM_phase2_fnc_adiAction", [0,-2] select isDedicated];


[{
    params ["_args", "_handle"];
    _args params ["_adi"];

    if (!alive _adi) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    [_adi, false] remoteExec ["allowDamage", _adi];

}, 0.1, [_adi]] call CBA_fnc_addPerFrameHandler;