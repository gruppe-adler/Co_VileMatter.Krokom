#include "scriptMacros.hpp"

private _isSpawner = isServer || !hasInterface;
private _obj = objNull;
{
	_x params ["_type", "_pos", "_upDir", "_texures", "_object"];
	
	_obj = createSimpleObject [_type, [0,0,0], true];
	_obj setPosWorld _pos;
	_obj setVectorDirAndUp _upDir;
	{
		_obj setObjectTexture [_forEachIndex, _x];
	} forEach _texures;
	_obj enableDynamicSimulation false;
	_obj enableSimulation _isSpawner;
} forEach EXTRACTED_OBJECTS;