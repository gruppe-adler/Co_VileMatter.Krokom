params ["_unit", "_position", "_index", "_duration"];


// debug
if (isPlayer _unit) then {

        [_unit, _position, _index, _duration] call GRAD_VM_teleport_fnc_teleportFX;

        [{
                params ["_unit", "_position"];

                playSound3D [getMissionPath "USER\sounds\teleport2.ogg", _unit];

        }, [_unit, _position], 1] call CBA_fnc_waitAndExecute;
};
