params ["_unit", "_position"];


// debug
if (!isPlayer _unit) then {

        [[_unit], "USER\functions\teleport\fn_teleportFX.sqf"] remoteExec ["BIS_fnc_execVM", 0];

        [{
                params ["_unit", "_position"];   


                
                playSound3D [getMissionPath "USER\sounds\teleport2.ogg", _unit];

                [{
                        params ["_unit", "_position"];   

                        _unit setPos (_position findEmptyPosition [0,10]);
                        
                }, [_unit, _position], 1.2] call CBA_fnc_waitAndExecute;
                
        }, [_unit, _position], 3] call CBA_fnc_waitAndExecute;
};
