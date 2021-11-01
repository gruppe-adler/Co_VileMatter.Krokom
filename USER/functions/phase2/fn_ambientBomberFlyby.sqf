if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

for "_i" from 1 to 5 do {
	["LIB_Pe2", [4669.93,7344.9,0], false, 350, 2700, 6, 1, selectRandom [3, 4]] call zen_modules_fnc_moduleAmbientFlyby;
	sleep 8;
};