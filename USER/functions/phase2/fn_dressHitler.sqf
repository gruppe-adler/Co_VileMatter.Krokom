params ["_adi"];

_adi setUnitLoadout [[],[],["LIB_P08","","","",["LIB_8Rnd_9x19_P08",8],[],""],["U_LIB_GER_Oberst",[]],["V_LIB_GER_OfficerBelt",[]],[],"H_LIB_DAK_OfficerCap","",[],["","","ItemRadio","ItemCompass","gm_watch_kosei_80",""]];

[_adi, "adi_face"] remoteExec ["setFace", 0, _adi];

_adi setVariable ["GRAD_VM_isHitler", true, true];
_adi allowDamage false;

[_adi, "adi_identity"] remoteExec ["setIdentity", 0, _adi];

[_adi] spawn GRAD_VM_phase2_fnc_hitlerSpeech;

_adi addEventHandler ["Fired", {
    params ["_adi", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    if (needReload _adi == 1) then {
        _adi addMagazine ["LIB_8Rnd_9x19_P08", 1];
    };
}];


GRAD_VM_phase2_fnc_suicideHitler = {
    _unit = _this select 0;

    objNull remoteControl _unit;     // removes the remoteControlling

    _handgun = handgunWeapon _unit;
    if (_handgun == "") exitWith {};

    private _animation = "murshun_ActsPercMstpSnonWpstDnon_suicide1B";

    [_unit, _animation] remoteExec ["switchMove"];

    _unit selectWeapon handgunWeapon _unit;
    
    sleep 3.9;

    sleep 0.5;
    _unit forceWeaponFire [handgunWeapon _unit, "Single"];
    _unit setDamage 1;
    
};


_adi addAction
[
    "Die now",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target] spawn GRAD_VM_phase2_fnc_suicideHitler;
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "_target == _this && murshun_easywayout_canSuicide && !murshun_suicideInProgress && alive _target",     // condition
    50,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];
