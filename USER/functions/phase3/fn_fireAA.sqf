if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, [0, -2] select isMultiplayer]; };

params ["_aa"];

private _target = (selectRandom (allPlayers)) getVariable ["GRAD_VM_localBattleship", GRAD_VM_Battleship];
(gunner _aa) lookAt _target;
sleep 1.5;

while {alive _aa} do {
	private _target = (selectRandom (allPlayers)) getVariable ["GRAD_VM_localBattleship", GRAD_VM_Battleship];
	private _muzzle = (_aa weaponsTurret [0])#0;
	(gunner _aa) lookAt _target;
	
	for "_i" from 0 to 15 step 1 do {
		[_aa, _muzzle] call BIS_fnc_fire;
		sleep (random 0.4);
	};
};