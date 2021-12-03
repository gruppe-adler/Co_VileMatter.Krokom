#include "scriptMacros.hpp"

if !(is3DEN) exitWith {};

{
	_x params ["_type", "_pos", "_upDir", "_texures"];
	
	private _entity = create3DENEntity ["Object", _type, _pos, true];
	_entity setPosWorld _pos;
	_entity setVectorDirAndUp _upDir;
	{
		_entity setObjectTexture [_forEachIndex, _x];
	} forEach _texures;
	_entity enableDynamicSimulation false;
	_entity enableSimulation false;
} forEach EXPORTED_DATA;