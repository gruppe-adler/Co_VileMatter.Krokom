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
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    [_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

}, 2, [_unit]] call CBA_fnc_addPerFrameHandler;



_unit addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    deleteVehicle (_unit getVariable ["GRAD_VM_soundSource", objNull]);

    private _animation = selectRandom [
        "lightsaber_death_1",
        "lightsaber_death_13",
        "lightsaber_death_15",
        "lightsaber_death_17",
        "lightsaber_death_19",
        "lightsaber_death_21",
        "lightsaber_death_21",
        "lightsaber_death_3",
        "lightsaber_death_3",
        "lightsaber_death_4",
        "lightsaber_death_5"
    ];

    [_unit, _animation] remoteExec ["switchMove"]; 
}];

/*

    c5efe_AlexLoopIngame
    Acts_JetsMarshallingStop_loop

*/
