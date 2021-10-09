params ["_unit"];

if (!isServer) exitWith {};

private _sounds = [
    ["dasisteinbefehl", 2.5],
    ["dasisteinbefehl2", 3.5],
    ["generalitaet", 5.5],
    ["feiglinge", 1.5],
    ["verraeterversager", 1.5]
];

while {true} do {

    if (!alive _unit) exitWith {};

    {   
        private _player = _x;
        private _distance = _player distance _unit;
        private _distanceString = if (_distance > 50) then { "low" } else { "medium" };
        _distanceString = if (_distance < 30) then { "default" } else { _distanceString };

        private _soundsCleaned = _sounds;
        private _cachedSound = missionNamespace getVariable ["GRAD_VM_hitlerSoundCache", ""];
        _soundsCleaned deleteAt (_soundsCleaned find _cachedSound);
        (selectRandom _sounds) params ["_sound", "_duration"];
        private _string = _sound + "_" + _distanceString;
        [_unit, _string] remoteExec ["say3D", _player];

        missionNamespace setVariable ["GRAD_VM_hitlerSoundCache", _sound];

        systemchat _string;

    } forEach allPlayers;

    sleep _duration;
};
