params ["_unit", "_position"];

// debug
if (!isPlayer _unit) then {

        [[_unit], "USER\functions\teleport\fn_teleportFX.sqf"] remoteExec ["BIS_fnc_execVM", 0];
        playSound3D [getMissionPath "USER\sounds\teleport.ogg", _unit];

        [{
                params ["_unit", "_position"];   


                _unit setPos (_position findEmptyPosition [0,10]);
                
        }, [_unit, _position], 2] call CBA_fnc_waitAndExecute;
};
