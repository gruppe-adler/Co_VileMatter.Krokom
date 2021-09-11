params ["_leader"];

{
    if (_x != _leader) then {

        if (!(_x getVariable ["GRAD_VM_isRider", false]) && (!(_x getVariable ["GRAD_VM_isHorse", false]))) then {
            _x attachTo [_leader];
        };

         _x addEventHandler ["AnimDone", {
            params ["_singleUnit", "_anim"];

            private _scheduledAnim = _singleUnit getVariable ["GRAD_VM_scheduledAnim", ""];
            if (_scheduledAnim != "") then {
                _anim = _scheduledAnim;
                _singleUnit setVariable ["GRAD_VM_scheduledAnim", ""];
            };

            if (alive _singleUnit && !(_singleUnit getVariable ["GRAD_VM_isRider", false])) then {
                _singleUnit playMoveNow _anim; // repeat instantly
            };
        }];
    };
} forEach (units group _leader);

systemChat ("Added marchSoldier");


// copy animation of leader to all subordinates
_leader addEventHandler ["AnimChanged", {
    params ["_leader", "_anim"];
   
   systemChat ("Changed: " + _anim);

    {
        private _singleUnit = _x;
        if (!(_singleUnit == _leader)) then {

                if (alive _singleUnit && !(_singleUnit getVariable ["GRAD_VM_isRider", false])) then {

                    if (_singleUnit getVariable ["GRAD_VM_isHorse", false]) then {
                        if (speed _leader > 0) then {
                            _singleUnit setVariable ["GRAD_VM_scheduledAnim", "dbo_horse_walk"];
                            _singleUnit playMoveNow "dbo_horse_walk";
                        } else {
                            _singleUnit setVariable ["GRAD_VM_scheduledAnim", "dbo_horse_idle"];
                            _singleUnit playMoveNow "dbo_horse_idle";
                        };
                    } else {
                        _singleUnit setVariable ["GRAD_VM_scheduledAnim", _anim];
                        _singleUnit playMoveNow _anim;
                    };
                };
        };
    } forEach (units group _leader);
}];

systemChat ("Added animChanged to leader");

// copy animation also when done and repeating
_leader addEventHandler ["AnimDone", {
    params ["_leader", "_anim"];

    systemChat ("Done: " + _anim);
   
    {
        private _singleUnit = _x;
        if (!(_singleUnit == _leader)) then {

                if (alive _singleUnit && !(_singleUnit getVariable ["GRAD_VM_isRider", false])) then {
                    if (_singleUnit getVariable ["GRAD_VM_isHorse", false]) then {
                        if (speed _leader > 0) then {
                            _singleUnit setVariable ["GRAD_VM_scheduledAnim", "dbo_horse_walk"];
                            _singleUnit playMoveNow "dbo_horse_walk";
                        } else {
                            _singleUnit setVariable ["GRAD_VM_scheduledAnim", "dbo_horse_idle"];
                            _singleUnit playMoveNow "dbo_horse_idle";
                        };
                    } else {
                        _singleUnit setVariable ["GRAD_VM_scheduledAnim", _anim];
                        _singleUnit playMoveNow _anim;
                    };
                };
        };
    } forEach (units group _leader);
}];

systemChat ("Added animDone to leader");
