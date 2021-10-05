if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, [0, -2] select isMultiplayer]; };

params ["_aa"];

private _target = (selectRandom (allPlayers)) getVariable ["GRAD_VM_localBattleship", GRAD_VM_Battleship];
(gunner _aa) lookAt _target;
sleep 2;

while {alive _aa} do {
	private _target = (selectRandom (allPlayers)) getVariable ["GRAD_VM_localBattleship", GRAD_VM_Battleship];
	private _muzzle = (_aa weaponsTurret [0])#0;
	(gunner _aa) lookAt (_target modelToWorld [0,( random 1200) - 600, 0]);
	
	for "_i" from 0 to 8 step 1 do {
		[_aa, _muzzle] call BIS_fnc_fire;
		sleep (random 0.4);
	};
};