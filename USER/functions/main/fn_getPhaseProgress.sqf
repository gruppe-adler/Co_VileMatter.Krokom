params [["_forcePhase", -1]];

(missionNamespace getVariable ["gradVM_portalPhase", []]) params ["_currentPhase", "_phase"];

// allow overide of current phase to read other progresses
if (_forcePhase > -1) then {
    _currentPhase = _forcePhase;
};

(_phase select _currentPhase select 0)
