/*
* Hides trees around the player's phase 3 spawn position. 
*
* Arguments:
* 0: The radius around the spawn position, where trees will be hidden
*
* Return Value:
* None
*
* Example:
* [] call Grad_VM_phase3_fnc_hideTreesLocal;
*/

params ["_radius"];

private _trees = nearestTerrainObjects [teleportcenter_phase3, ["TREE"], _radius, false, true];

{
	_x hideObject true;
	_x enableSimulation false;
} foreach _trees;