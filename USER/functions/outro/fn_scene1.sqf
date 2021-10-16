diwako_dui_main_toggled_off = true;
[5] call GRAD_VM_outro_fnc_fadeToBlack;
5 fadeSound 0;
5 fadeSpeech 0;
[] call ace_goggles_fnc_removeDirtEffect;

sleep 5;
_sound = player getVariable ["phase4_earthquake", objNull];
deleteVehicle _sound;