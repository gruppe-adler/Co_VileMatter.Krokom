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

        private _cachedSound = missionNamespace getVariable ["GRAD_VM_hitlerSoundCache", false];
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


/*


22:06:53 Server: Object 2:34486 not found (message Type_118)
22:06:55 Error in expression <etVariable ["GRAD_VM_hitlerSoundCache", !_cachedSound];

[_unit, true] remoteExe>
22:06:55   Error position: <!_cachedSound];

[_unit, true] remoteExe>
22:06:55   Error !: Type Array, expected Bool
22:06:55 File mpmissions\__cur_mp.krokom\USER\functions\phase2\fn_hitlerSpeech.sqf..., line 31
22:06:55  ➥ Context:    [] L23 (mpmissions\__cur_mp.krokom\USER\functions\phase2\fn_hitlerSpeech.sqf)
    [] L26 (mpmissions\__cur_mp.krokom\USER\functions\phase2\fn_hitlerSpeech.sqf)
    [] L31 (mpmissions\__cur_mp.krokom\USER\functions\phase2\fn_hitlerSpeech.sqf)


*/