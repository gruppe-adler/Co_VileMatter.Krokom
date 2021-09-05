params ["_unit", "_position"];


// debug
if (!isPlayer _unit) then {

        [[_unit], "USER\functions\teleport\fn_teleportFX.sqf"] remoteExec ["BIS_fnc_execVM", 0];

        [{
                params ["_unit", "_position"];   


                
                playSound3D [getMissionPath "USER\sounds\teleport2.ogg", _unit];

                if (isPlayer _unit) then {
                        [1, "WHITE", 1.1, 1] remoteExec ["BIS_fnc_fadeEffect", _unit]; // mask to player
                };

                [{
                        params ["_unit", "_position"];   

                        _unit setPos (_position findEmptyPosition [0,10]);
                        [_unit, "Acts_UnconsciousStandUp_part1"] remoteExecCall ["switchMove", 0];

                        if (isPlayer _unit) then {
                                [0, "WHITE", 1.1, 1] remoteExec ["BIS_fnc_fadeEffect", _unit]; // unmask to player
                        };
                        
                }, [_unit, _position], 1.2] call CBA_fnc_waitAndExecute;
                
        }, [_unit, _position], 1] call CBA_fnc_waitAndExecute;
};
