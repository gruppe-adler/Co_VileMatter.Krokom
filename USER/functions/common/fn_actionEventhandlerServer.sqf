#define GRAD_VM_ACTION_CHECK_WAITTIME       4
#define GRAD_VM_ACTION_FORCEFACTOR_STEP     0.2
#define GRAD_VM_ACTION_FORCEFACTOR_MAX      5
#define GRAD_VM_ACTION_ACTIONTIME           1

["GRAD_VM_ACTION_start", {
    params ["_object", "_player", "_event"];

    diag_log text format ["[GRAD VM ACTION] Player '%1', started unflipping '%2', event %3", _player, _object, _event];

    private _actionUnits = _object getVariable ["GRAD_VM_ACTION_UNITS", []];
    _actionUnits pushBackUnique _player;
    _object setVariable ["GRAD_VM_ACTION_UNITS", _actionUnits, true];

    private _unitsNeeded = _object getVariable ["GRAD_VM_ACTION_UNITS_NEEDED", 1];
    // Enough people, exit and unflip Object
    if (_unitsNeeded <= count _actionUnits) exitWith {
        diag_log text format ["[GRAD VM ACTION] Object '%1', enough people to do action (%2)", _object, _unitsNeeded];

        // Schedule unflip
        [
            // condition
            {
                params ["_object", "_unitsNeeded"];
                count (_object getVariable ["GRAD_VM_ACTION_UNITS", []]) < _unitsNeeded
            },
            // statement (failure)
            {},
            // args
            [_object, _unitsNeeded, _event],
            // timeout
            GRAD_VM_ACTION_ACTIONTIME,
            // onTimeout (success)
            {
                params ["_object", "", "_event"];
                [_event, [_object]] call CBA_fnc_serverEvent;

                _object setVariable ["GRAD_VM_ACTION_UNITS", [], true];
            }
        ] call CBA_fnc_waitUntilAndExecute;

        // Inform clients that unflip is ready and force them into action wait time
        ["GRAD_VM_ACTION_ready", [_object, _unitsNeeded, GRAD_VM_ACTION_ACTIONTIME, _event], _actionUnits] call CBA_fnc_targetEvent;
    };

    diag_log text format ["[GRAD VM ACTION] Object '%1', not enough people to unflip (%2)", _object, _unitsNeeded];
    ["GRAD_VM_ACTION_start_client", _object, _player] call CBA_fnc_targetEvent;

}] call CBA_fnc_addEventHandler;

["GRAD_VM_ACTION_stop", {
    params ["_object", "_player"];
    diag_log text format ["[GRAD VM ACTION] Player '%1', stopped action '%2'", _player, _object];

    private _actionUnits = _object getVariable ["GRAD_VM_ACTION_UNITS", []];
    _object setVariable ["GRAD_VM_ACTION_UNITS", _actionUnits - [_player], true];
}] call CBA_fnc_addEventHandler;