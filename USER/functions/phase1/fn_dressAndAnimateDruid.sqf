/*

    animates mystic guy at stonehenge

*/

if (!isServer) exitWith {};

params ["_position", "_group"];
private _unit = _group createUnit ["B_RangeMaster_F", _position, [], 0, "CAN_COLLIDE"];
_unit setUnitLoadout [[],[],[],["U_TIOW_Cultist",[]],[],[],"JMSL_Rome_LegionerHelmet_1_5_H","G_JMSL_Beard_1_black",[],["ItemMap","","","","",""]];

_unit setDir (_unit getDir phase1_pedestal);

[_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

_unit disableAI "FSM";
_unit disableAI "MOVE";
_unit setCaptive true;
_unit disableAI "autoTarget";
_unit disableAI "ANIM";
_unit setCaptive true;

private _sounds = [
    "phase1_ambient_trance_1_source",
    "phase1_ambient_trance_2_source"
];

private _source = createSoundSource [selectRandom _sounds, position _unit, [], 0];
_unit setVariable ["GRAD_VM_soundSource", _source];

private _pfh = [{
    params ["_args", "_handle"];

    if (!alive _unit || lifeState _unit == "INCAPACITATED") exitWith {
        _unit setDamage 1;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    [_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

}, 2, [_unit]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_unit"];
    lifeState _unit == "INCAPACITATED" || !alive _unit
},{
    params ["_unit"];
    deleteVehicle (_unit getVariable ["GRAD_VM_soundSource", objNull]);
}, [_unit]] call CBA_fnc_waitUntilAndExecute;


/*

    c5efe_AlexLoopIngame
    Acts_JetsMarshallingStop_loop

*/
