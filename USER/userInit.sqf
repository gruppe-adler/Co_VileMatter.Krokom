/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

setPlayerRespawnTime 1;

if !(isNil "CLib_fnc_loadModules") then { call CLib_fnc_loadModules; };