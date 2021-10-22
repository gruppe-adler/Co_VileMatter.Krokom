params ["_unit", "_currentPosition", "_destinationPositions", "_index", "_duration", "_numberStart", "_numberEnd", "_date"];

private _timeToTeleport = 1;
[_unit, _currentPosition, true, _timeToTeleport] call GRAD_VM_teleport_fnc_despawnEffect;

if (local _unit && isPlayer _unit) then {

    playsound "grad_VM_teleport2";

    diwako_dui_main_toggled_off = true;

    private _display = findDisplay 46;
    disableSerialization;
    private _mask = _display ctrlCreate ["RscText", -1];
    uiNamespace setVariable ["GRAD_VM_teleportMask", _mask];
    _mask ctrlSetPosition [safeZoneX,safeZoneY, safeZoneW,safeZoneH];
    _mask ctrlSetBackgroundColor [1,1,1,1];
    _mask ctrlSetFade 1;
    _mask ctrlCommit 0;
    _mask ctrlSetFade 0;
    _mask ctrlCommit _timeToTeleport;

    [{
        ctrlCommitted (uiNamespace getVariable ["GRAD_VM_teleportMask", controlNull])
    },{
        params ["_unit", "_index", "_duration", "_numberStart", "_numberEnd", "_date"];

        // systemChat "control";

        // park unit off map for tunnel fx
        _unit setPos [(_index * -1000), (_index * -1000), 0];
        _unit setVariable ["grad_VM_teleportDone", false];

        [_duration, _numberStart, _numberEnd, _date] call GRAD_VM_teleport_fnc_wormHole;

    }, [_unit, _index, _duration, _numberStart, _numberEnd, _date]] call CBA_fnc_waitUntilAndExecute;
};

// ONLY FOR AI TESTING
if (local _unit && !isPlayer _unit) then {
    // systemChat "control";

    // park unit off map for tunnel fx
    _unit setPos [(_index * -1000), (_index * -1000), 0];
    _unit setVariable ["grad_VM_teleportDone", false];

    [{
        params ["_unit"];
        _unit setVariable ["grad_VM_teleportDone", true];
    }, [_unit], _duration] call CBA_fnc_waitAndExecute;

};

[{
    params ["_currentPosition", "_destinationPositions", "_unit"];
    _currentPosition distance2d _unit > 200
},{
    params ["_currentPosition", "_destinationPositions", "_unit"];

    ["GRAD_VM_curatorInfo",[_unit, "teleport_start"]] call CBA_fnc_serverEvent;

    drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",1,1,[1,1,0],[0,0,0],0,9,7,0,[2,2,2,.1],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_unit];

    _currentPosition params ["_posX", "_posY"];

    private _lightPoint = "#lightpoint" createvehiclelocal [_posX, _posY, 1];
    _lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
    _lightPoint setLightFlareSize 10; _lightPoint setLightFlareMaxDistance 5000;
    _lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.9,0.7,0.9];
    _lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
    _lightPoint setLightBrightness 3;

    [{
            params ["_lightPoint"];
            deleteVehicle _lightPoint;
    }, [_lightPoint], 0.2] call CBA_fnc_waitAndExecute;

    getPos _unit params ["_posXNew", "_posYNew"];

    private _fireflyEnd = "#particlesource" createvehiclelocal [_currentPosition select 0, _currentPosition select 1, 1];
    _fireflyEnd setParticleCircle [0,[0,0,0]];
    _fireflyEnd setParticleRandom [0,[0,0,0],[0.1,0.1,0.1],1,0,[0,0,0,0.1],1,1];
    _fireflyEnd setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,5,[0,0,0],[0,0,0],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[0,0,0,0]],[1],1,0.1,"","",_fireflyEnd, 0,true,1,[[200,200,200,10],[200,200,200,0]]];
    _fireflyEnd setDropInterval 0.01;

    [{
        params ["_fireflyEnd"];
        deleteVehicle _fireflyEnd;
    }, [_fireflyEnd], 0.5] call CBA_fnc_waitAndExecute;


    if (local _unit) then {
        [{
            params ["_destinationPositions", "_unit"];
            _unit getVariable ["grad_VM_teleportDone", false]
        },{
            params ["_destinationPositions", "_unit"];

            [_unit] call grad_loadout_fnc_doLoadoutForUnit;

            private _destination = selectRandom _destinationPositions;
            private _customPosition = (_destination getPos [random 7, random 360]);
            // set correct height
            _unit setPosWorld [_customPosition#0, _customPosition#1, (_destination#2 max 0)];

            ["GRAD_VM_curatorInfo",[_unit, "teleport_end"]] call CBA_fnc_serverEvent;

            [_unit, [_customPosition#0, _customPosition#1, (_destination#2 max 0)]] call GRAD_VM_teleport_fnc_despawnEffect;
            _unit switchMove "Acts_UnconsciousStandUp_part1";
            [_unit] call zen_common_fnc_healUnit;

            // should be unnecessary but still was executed multiple times for presumingly AI :o
            if (isPlayer _unit && (call GRAD_VM_main_fnc_getCurrentPhase == 0)) then {
                [] spawn GRAD_VM_phase0_fnc_introText;
            };

        }, [_destinationPositions, _unit]] call CBA_fnc_waitUntilAndExecute;
    };


}, [_currentPosition, _destinationPositions, _unit]] call CBA_fnc_waitUntilAndExecute;
