params ["_lion"];

[{
    params ["_lion"];
    lifeState _lion == "INCAPACITATED"
},{
    params ["_lion"];
    _lion setDamage 1;
}, [_lion]] call CBA_fnc_waitUntilAndExecute;
