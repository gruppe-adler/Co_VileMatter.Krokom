params ["_unit"];

private _sounds = [
    ["dasisteinbefehl", 2.5],
    ["dasisteinbefehl2", 3.5],
    ["generalitaet", 5.5],
    ["feiglinge", 1.5],
    ["verraeterversager", 1.5]
];

while {true} do {

    if (!alive _unit) exitWith {};

    private _distance = player distance _unit;
    private _distanceString = if (_distance > 50) then { "low" } else { "medium" };
    _distanceString = if (_distance < 30) then { "default" } else { _distanceString };

    (selectRandom _sounds) params ["_sound", "_duration"];
    private _string = _sound + "_" + _distanceString;
    systemchat _string;
    _unit say3D [_string, 500];

    sleep _duration;
};
