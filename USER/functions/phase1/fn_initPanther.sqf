if (!isServer) exitWith {};

params ["_panther"];

_panther setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,1)"]; 
_panther setObjectTextureGlobal [2, "#(rgb,8,8,3)color(0,0,0,0)"];

_panther playMoveNow "TigerLyingIdle";