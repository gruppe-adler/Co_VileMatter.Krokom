/*

  ["GRAD_VM_curatorInfo",[player, "phasechange"]] call CBA_fnc_serverEvent;

*/

if (!isServer) exitWith {};


["GRAD_VM_curatorInfo", {
    params ["_unit", "_type"];

    private _message = "";
    private _color = [0,0,0,1];

    switch (_type) do {
        case ("phasechange"): {
            _message = format ["Phase changed to %1.", [] call GRAD_VM_main_fnc_getCurrentPhase];
            _color = [0.5,0,0.5,1];
        };
        case ("teleport_start"): {
            _message = format ["%1 started teleport sequence.",  [_unit, false, true] call ace_common_fnc_getName];
            _color = [0,0.5,0.5,1];
        };
        case ("teleport_end"): {
            _message = format ["%1 ended teleport sequence.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0,0.5,0.5,1];
        };
        case ("unconscious"): {
            _message = format ["%1 was knocked out.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.5,0.1,0.1,1];

            [_unit, false] remoteExec ["allowDamage", _unit];
        };
        case ("revived"): {
            _message = format ["%1 got revived.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.1,0.5,0.5,1];

             [_unit, true] remoteExec ["allowDamage", _unit];
        };
        case ("respawned"): {
            _message = format ["%1 respawned.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.1,0.5,0.1,1];
        };
        case ("killed"): {
            _message = format ["%1 killed.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.7,0.1,0.1,1];
        };
        default {};
    };

    // send message to all curators
    {
        private _playerAsZeus = getAssignedCuratorUnit _x;
        if (!isNull _playerAsZeus) then {
            [_message, _color] remoteExec ["GRAD_VM_common_fnc_curatorShowFeedbackMessage", _playerAsZeus];
        };
    } forEach allCurators;
}] call CBA_fnc_addEventHandler;
