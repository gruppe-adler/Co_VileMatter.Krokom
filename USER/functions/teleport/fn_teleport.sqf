params ["_unit", "_position", "_index"];


// debug
if (isPlayer _unit) then {

        [_unit, _position, _index] call GRAD_VM_teleport_fnc_teleportFX;

        [{
                params ["_unit", "_position"];

                playSound3D [getMissionPath "USER\sounds\teleport2.ogg", _unit];

        }, [_unit, _position], 1] call CBA_fnc_waitAndExecute;
};
