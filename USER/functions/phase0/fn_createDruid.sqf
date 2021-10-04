/*

    animates mystic guy

*/

if (!isServer) exitWith {};

params ["_unit"];
_unit setUnitLoadout [[],[],[],["U_TIOW_Cultist",[]],[],[],"JMSL_Rome_LegionerHelmet_1_5_H","G_JMSL_Beard_1_black",[],["ItemMap","","","","",""]];

[_unit, "Acts_SittingWounded_loop"] remoteExec ["switchMove"];

private _sounds = [
    "ite_lucem_plead_def",
    "ite_lucem_plead_slo",
    "ite_lucem_angry_def",
    "ite_lucem_angry_slo",
    "ite_lucem_sin_def",
    "ite_lucem_sin_slo"
];

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_sounds"];

    if (isNull _unit || !alive _unit) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    [_unit, "Acts_SittingWounded_wave"] remoteExec ["switchMove"];

    private _sound = selectRandom _sounds;

    [_unit, _sound] remoteExec ["say3d"];
    [_unit, true] remoteExec ["setRandomLip"];

    [{
        params ["_unit"];
        [_unit, false] remoteExec ["setRandomLip"];
    }, [_unit], 5] call CBA_fnc_waitAndExecute;

}, 10, [_unit, _sounds]] call CBA_fnc_addPerFramehandler;

/*

    Acts_SittingWounded_loop
    Acts_SittingWounded_wave

    Star_Wars_KaaTirs_scream
    Star_Wars_KaaTirs_idle

*/
