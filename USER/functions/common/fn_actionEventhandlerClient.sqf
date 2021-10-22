#define PLAYER                  ([] call CBA_fnc_currentUnit)

["GRAD_VM_ACTION_start_client", {
    diag_log text "[GRAD ACTION] Starting action";
    _this call GRAD_VM_common_fnc_activateAction;
}] call CBA_fnc_addEventHandler;

["GRAD_VM_action_ready", {

    diag_log text "GRAD VM Action Ready";

    // Spawn new progressbar for unflip action time
    [{
        // TODO animation
        [
            "Führe durch...",
            // time
            _this#2,
            // condition
            {
                params ["_args", "", "_elapsedTime"];
                _args params ["_vehicle", "_requiredUnits"];

                // don't check before 1s elapsed to wait for publicVariable synchronization
                _elapsedTime < 1 ||
                {count (_vehicle getVariable ["GRAD_VM_ACTION_UNITS", []]) >= _requiredUnits}
            },
            // onSuccess
            {},
            // onFailure
            {
                params ["_args", "", "", "", "_failureCode"];
                _args params ["_vehicle", "", "", "_event"];

                // user hit ESC
                if (_failureCode == 1) then {
                    ["GRAD_VM_action_stop", [_vehicle, PLAYER]] call CBA_fnc_serverEvent;

                // user did not hit ESC --> other reason for failure
                } else {
                    // if user is in unflippingUnits --> enter wait mode again
                    // if not --> server has completed unflipping and reset the array
                    if (PLAYER in (_vehicle getVariable ["GRAD_VM_ACTION_UNITS", []])) then {
                        [_vehicle, _event] call GRAD_VM_common_fnc_activateAction;
                    };
                };
            },
            // args
            _this,
            true, // block mouse
            true, // block keys
            true // allow close (esc)
        ] call CBA_fnc_progressBar;
    }, _this] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;