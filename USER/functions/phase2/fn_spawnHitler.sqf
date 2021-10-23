private _adi = (creategroup east) createUnit ["LIB_GER_gun_lieutenant", [492.579,464.512,0.73938], [], 0, "CAN_COLLIDE"];

[_adi] call GRAD_VM_phase2_fnc_dressHitler;


private _minionGroup = (creategroup civilian);

private _minion1 = _minionGroup createUnit ["LIB_GER_sapper_gefr", [492.579,463.512,0.73938], [], 0, "CAN_COLLIDE"];

_minion1 setBehaviour "CARELESS";
_minion1 disableAI "FSM";
_minion1 setUnitPosWeak "UP";
_minion1 playAction "Panic";
_minion1 disableAI "PATH";
_minion1 setCaptive true;


private _minion2 = _minionGroup createUnit ["LIB_GER_tank_lieutenant", [492.579,464.0,0.73938], [], 0, "CAN_COLLIDE"];

_minion2 setBehaviour "CARELESS";
_minion2 disableAI "FSM";
_minion2 setUnitPosWeak "UP";
_minion2 playAction "Panic";
_minion2 disableAI "PATH";
_minion2 setCaptive true;

private _minion3 = _minionGroup createUnit ["LIB_GER_hauptmann", [492.579,465.512,0.73938], [], 0, "CAN_COLLIDE"];

_minion3 setBehaviour "CARELESS";
_minion3 disableAI "FSM";
_minion3 setUnitPosWeak "UP";
_minion3 playAction "Panic";
_minion3 disableAI "PATH";
_minion3 setCaptive true;

{
  [_x] remoteExec ["GRAD_VM_phase2_fnc_minionAction", [0,-2] select isDedicated, _x];
} forEach [_minion1, _minion2, _minion3];