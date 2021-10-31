/*

    animates mystic guy at stonehenge

*/

if (!isServer) exitWith {};

params ["_unit"];
_unit setUnitLoadout [[],[],[],["U_TIOW_Cultist",[]],[],[],"JMSL_Rome_LegionerHelmet_1_5_H","G_JMSL_Beard_1_black",[],["ItemMap","","","","",""]];

_unit setDir (_unit getDir phase1_pedestal);

[_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

_unit disableAI "FSM";
_unit disableAI "MOVE";
_unit setCaptive true;


private _sounds = [
    "phase1_trance_1",
    "phase1_trance_2"
];

private _source = createSoundSource [selectRandom _sounds, position _unit, [], 0];


_unit addEventHandler ["AnimDone", {
    params ["_unit"];

    [_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];
}];


[{
    params ["_unit"];
    !alive _unit || lifeState _unit == "INCAPACITATED"
},{
    params ["_unit", "_source"];
    deleteVehicle _source;
    _unit removeAllEventHandlers "AnimDone";
}, [_unit, _source]] call CBA_fnc_waitUntilAndExecute;

/*

    c5efe_AlexLoopIngame
    Acts_JetsMarshallingStop_loop

*/
