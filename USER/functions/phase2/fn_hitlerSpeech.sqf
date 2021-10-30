params ["_unit"];

if (!isServer) exitWith {};
if (!canSuspend) exitWith {
    [_unit] spawn GRAD_VM_phase2_fnc_hitlerSpeech;
};

if (missionNameSpace getVariable ["GRAD_VM_phase2_hitlerSpeechActive", false]) exitWith {};
missionNameSpace setVariable ["GRAD_VM_phase2_hitlerSpeechActive", true, true];

private _sounds = [
    ["dasisteinbefehl", 2.5],
    ["dasisteinbefehl2", 3.5],
    ["generalitaet", 5.5]
];

private _sounds2 = [
    ["feiglinge", 1.5],
    ["verraeterversager", 1.5]
];


while {true} do {

    if (!alive _unit) exitWith {};
    if (!isGamePaused && isGameFocused) then {

        private _cachedSound = missionNamespace getVariable ["GRAD_VM_hitlerSoundCache", []];
        (selectRandom ([_sounds, _sounds2] select _cachedSound)) params ["_sound", "_duration"];

        missionNamespace setVariable ["GRAD_VM_hitlerSoundCache", !_cachedSound];

        [_unit, true] remoteExec ["setRandomLip"];

        {   
            private _player = _x;
            private _distance = _player distance _unit;
            private _distanceString = if (_distance > 50) then { "low" } else { "medium" };
            _distanceString = if (_distance < 30) then { "default" } else { _distanceString };
           
            private _string = _sound + "_" + _distanceString;
            [_unit, _string] remoteExec ["say3D", _player];

            // systemchat _string;

        } forEach allPlayers;

        sleep _duration;

        [_unit, false] remoteExec ["setRandomLip"];
    };
    sleep (random 1);
};
