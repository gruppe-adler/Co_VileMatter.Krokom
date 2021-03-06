params [["_fenceParts",[]]];

// find out all used fence types
private _classnames = [];
{
  _classnames pushBackUnique (typeOf _x);
} forEach _fenceParts;

/*
systemChat str _classnames;
diag_log str _classnames;
*/

if (count _fenceParts < 1) exitWith { diag_log "no fence parts found"; };

[{
    params ["_args", "_handle"];
    _args params ["_fenceParts", "_classnames"];

        if ([] call GRAD_VM_main_fnc_getCurrentPhase != 0) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };
        if (random 1 > 0.97) exitWith {};
        // get all fences in range of any player
        private _fences = [];
        {
            private _nearestFences = nearestObjects [_x, _classnames, 200];
            if (count _nearestFences > 0) then {

                // take randomly one of the 100m near a player
                private _nearestFence = selectRandom _nearestFences;

                // check if actually part of the fence
                if ((_fenceParts find _nearestFence) > -1) then {
                    _fences pushBackUnique _nearestFence;
                };
            };
        } forEach playableUnits + switchableUnits;


        // if any fences found, select one randomly
        if (count _fences > 0) then {

            // systemChat str (_fences + _classnames);
            private _fence = selectRandom _fences;
            // systemChat str _fence;
            // diag_log str _fence;
            private _position = [_fence] call grad_VM_phase0_fnc_sparksGetPos;

            // systemChat format ["position is %1", _position];
            // diag_log format ["position is %1", _position];
            // send spark position to clients
            ["GRAD_electricFence_sparkSmall", [_fence, _position]] call CBA_fnc_globalEvent;
        };

}, 0.2, [_fenceParts, _classnames]] call CBA_fnc_addPerFrameHandler;