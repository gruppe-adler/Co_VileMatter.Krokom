params ["_leader"];

if (_leader getVariable ["GRAD_VM_isRider", false]) exitWith {};

// copy animation of leader to all subordinates
_leader addEventHandler ["AnimStateChanged", {
    params ["_leader", "_anim"];
   
    {
        private _singleUnit = _x;
        if (!(_singleUnit == _leader)) then {

                if (alive _singleUnit && !(_singleUnit getVariable ["GRAD_VM_isRider", false])) then {
                    resetSubgroupDirection _singleUnit;
                    _singleUnit playMoveNow _anim;
                    // systemChat _anim;
                };
        };
    } forEach (units group _leader);
}];

// copy animation also when done and repeating
_leader addEventHandler ["AnimDone", {
    params ["_leader", "_anim"];
   
    {
        private _singleUnit = _x;
        if (!(_singleUnit == _leader)) then {

                if (alive _singleUnit && !(_singleUnit getVariable ["GRAD_VM_isRider", false])) then {
                    resetSubgroupDirection _singleUnit;
                    _singleUnit playMoveNow _anim;
                    systemChat _anim;
                };
        };
    } forEach (units group _leader);
}];


[{ 
    params ["_args", "_handle"];
    _args params ["_leader"];

    if (!alive _leader || isNull _leader) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    {
        private _singleUnit = _x;  

        if  (alive _singleUnit && !(_singleUnit getVariable ["GRAD_VM_isRider", false])) then {

            if (round (getDir _leader) != round (getDir _singleUnit)) then {
                _singleUnit setDir (getDir _leader);
            };
        };
    } forEach (units group _leader);
    
}, 0, [_leader]] call CBA_fnc_addPerFramehandler;
