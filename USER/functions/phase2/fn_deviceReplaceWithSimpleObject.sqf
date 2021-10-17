/*
    Author: Jiri Wainar

    Description:
    Replaces object with simple object. Object must not contain any crew and must be placed on ground.

    Remarks:
    * Useful if you do not have access to simple object adjustment data - e.g. in case of unsupported/discontinued asset.
    * All official assets have the adjustment data defined in config.
    * Use with caution as this technique is not very clean - should not be used for many objects and definatelly not in MP games.

    Parameter(s):
    0: OBJECT - object that will be replaced by simple object
    1: BOOL - force super-simple object (default: false); true: super-simple object will be force, no type info or re-texturing is available, false: super-simple object is used unless re-texturing is possible

    Returns:
    OBJECT - simple object that replaced the simulated object

    Example:
    [_object:object] call BIS_fnc_replaceWithSimpleObject;

    See also:
    * bis_fnc_createSimpleObject
    * bis_fnc_replaceWithSimpleObject
    * bis_fnc_simpleObjectData
    * bis_fnc_exportCfgVehiclesSimpleObjectData
    * bis_fnc_diagMacrosSimpleObjectData
*/

params
[
    ["_template",objNull,[objNull]],
    ["_forceSuperSimple",false,[true]]
];

if (isNull _template || {count crew _template > 0}) exitWith {["[x] Template object (%1) must not be NULL and must not contain any crew!",_template] call bis_fnc_error;};

if (isSimpleObject _template) exitWith {["[x] Function was executed on simple object!"] call bis_fnc_error;};

private _class = typeOf _template;

if (_class == "") exitWith {["[x] Cannot retrieve classname!"] call bis_fnc_error;};

//get world position, dir and vector up

private _posASL = getPosASL _template;
private _vectorDir = VectorDir _template;
private _vectorUp = vectorUp _template;

private _data = [_template] call BIS_fnc_simpleObjectData;

//get world position, dir and vector up
//private _pos = getPosASL _template; _pos set [2, (_pos select 2) - (_data select 3)];
_posASL set [2, (_posASL select 2) - ((_data select 3)/2)];

//hide simulated object
hideObjectGlobal _template;

//create simple object
private _object = createSimpleObject [_class, _posASL];

//set position (to negate built-in auto-adjusting)
_object setPosASL _posASL;

//set vector up
_object setVectorDirAndUp [_vectorDir, _vectorUp];


_object