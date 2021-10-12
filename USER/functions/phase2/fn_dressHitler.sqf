params ["_adi"];

_adi setUnitLoadout [[],[],["LIB_P08","","","",["LIB_8Rnd_9x19_P08",8],[],""],["U_LIB_GER_Oberst",[]],["V_LIB_GER_OfficerBelt",[]],[],"H_LIB_DAK_OfficerCap","",[],["","","ItemRadio","ItemCompass","gm_watch_kosei_80",""]];

[_adi, "adi_face"] remoteExec ["setFace", 0, _adi];

_adi allowDamage false;

_adi addEventHandler ["Fired", {
    params ["_adi", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    if (needReload _adi == 1) then {
        _adi addMagazine ["LIB_8Rnd_9x19_P08", 1];
    };
}];

_adi addAction
[
    "Die now",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target] spawn murshun_suicide_fnc;
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
