/*

    animates panicky civ

*/

if (!isServer) exitWith {};

params ["_unit"];

_unit disableAI "FSM";
_unit disableAI "MOVE";

_unit playMoveNow (selectRandom [
    "Acts_CivilHiding_2",
    "ApanPknlMstpSnonWnonDnon_G01",
    "ApanPknlMstpSnonWnonDnon_G02",
    "ApanPknlMstpSnonWnonDnon_G03"
]);

_unit addEventHandler ["AnimDone", {
    params ["_unit", "_anim"];

    if (isNull _unit) exitWith { _unit removeEventHandler ["AnimDone", _thisEventHandler]; };
    if (!alive _unit) exitWith { _unit removeEventHandler ["AnimDone", _thisEventHandler]; };

    if (_anim in [
        "Acts_CivilHiding_2",
        "ApanPknlMstpSnonWnonDnon_G01",
        "ApanPknlMstpSnonWnonDnon_G02",
        "ApanPknlMstpSnonWnonDnon_G03"
    ]) then {
        _unit playMoveNow _anim;
    } else {
         _unit playMoveNow (selectRandom [
        "Acts_CivilHiding_2",
        "ApanPknlMstpSnonWnonDnon_G01",
        "ApanPknlMstpSnonWnonDnon_G02",
        "ApanPknlMstpSnonWnonDnon_G03"
        ]);
    };
}];
