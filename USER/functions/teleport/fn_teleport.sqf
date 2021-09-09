params ["_unit", "_position", "_index"];


// debug
if (isPlayer _unit) then {

        [[_unit, _position, _index], "USER\functions\teleport\fn_teleportFX.sqf"] remoteExec ["BIS_fnc_execVM", 0];

        [{
                params ["_unit", "_position"];
                
                playSound3D [getMissionPath "USER\sounds\teleport2.ogg", _unit];
                
        }, [_unit, _position], 1] call CBA_fnc_waitAndExecute;
};
