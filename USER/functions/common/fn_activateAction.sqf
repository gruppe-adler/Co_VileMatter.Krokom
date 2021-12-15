params ["_object", ["_eventCalled", "none"]];

#define PLAYER                  ([] call CBA_fnc_currentUnit)

private _unitsNeeded = _object getVariable ["GRAD_VM_ACTION_UNITS_NEEDED", 3];
PLAYER playActionNow "PlayerStand";

GRAD_VM_ACTION_UNITS = (_object getVariable ["GRAD_VM_ACTION_UNITS", []]);
// Inform server about unflipping start
if !(PLAYER in GRAD_VM_ACTION_UNITS) exitWith {
    ["GRAD_VM_action_start", [_object, PLAYER, _eventCalled]] call CBA_fnc_serverEvent;
};

// Notify
[
    ["\a3\3den\data\attributes\loiterdirection\cw_ca.paa"],
    format ["Requiring %1 more players...", (_unitsNeeded-1)]
] call CBA_fnc_notify;

// Exec next frame, othwerwise we will crash the client
[{
    [
        "Waiting for more players...",
        15,
        {
            _this#0 params ["_object"];
            !(GRAD_VM_ACTION_UNITS isEqualTo [])
            && alive PLAYER
        },
        // onSuccess
        {
            _this#0 params ["_object"];
            ["GRAD_VM_action_stop", [_object, PLAYER]] call CBA_fnc_serverEvent;
            // Notify
            [
                ["\a3\3den\data\attributes\loiterdirection\cw_ca.paa"],
                ["Done waiting. More players needed!"]
            ] call CBA_fnc_notify;
        },
        // onFailure
        {
            params ["_args", "", "", "", "_failureCode"];
            _args params ["_object"];

            // don't stop unflipping if waiting progressBar was closed by new progressBar
            if (_failureCode != 3) then {
                ["GRAD_VM_action_stop", [_object, PLAYER]] call CBA_fnc_serverEvent;
            };
        },
        _this
    ] call CBA_fnc_progressBar;
}, _this] call CBA_fnc_execNextFrame;

nil