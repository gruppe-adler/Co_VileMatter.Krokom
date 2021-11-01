["Vile Matter - Common", "Respawn Player", {
     params ["_position", "_object"];

     if (isPlayer _object) then {
          [_object] remoteExec ["GRAD_VM_common_fnc_respawnPlayer", _object];
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Common", "Wake up Player", {
     params ["_position", "_object"];

     if (isPlayer _object) then {
          _object setUnconscious false;
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Common", "Go into Zeus TFAR Spectator", {
     params ["_position", "_object"];

     [player, true] call TFAR_fnc_forceSpectator;

}] call zen_custom_modules_fnc_register;

["Vile Matter - Common", "Leave Zeus TFAR Spectator", {
     params ["_position", "_object"];

     [player, false] call TFAR_fnc_forceSpectator;

}] call zen_custom_modules_fnc_register;


["Vile Matter - Common", "Heal Player with ZEN rightclick!", {
     params ["_position", "_object"];

     if (isPlayer _object) then {
          hint "not working, please use rightclick";
     };
}] call zen_custom_modules_fnc_register;

["Vile Matter - Common", "Fix Stuck Animation", {
     params ["_position", "_object"];

     [_object, ""] remoteExec ["switchMove"];

}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 0", "Destroy Zentrifuge Hall", {
     params ["_position", "_object"];

     [] remoteExec ["GRAD_VM_phase0_fnc_DestroyHall", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 1", "(Re)start Frog Sounds", {
     params ["_position", "_object"];

     [] remoteExec ["GRAD_VM_phase1_fnc_ambientFrogs", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 1", "(Re)start Druid Sound", {
     params ["_position", "_object"];

     [] remoteExec ["GRAD_VM_phase1_fnc_ambientDruids", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 1", "Spawn marching Roman Soldiers with Horse", {
     params ["_position", "_object"];

     [ASLtoAGL _position, 90, 3, true] remoteExec ["GRAD_VM_phase1_fnc_spawnMarchingColumn", 2];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Spawn marching Roman Soldiers", {
     params ["_position", "_object"];

     [ASLtoAGL _position, 90, 3, false] remoteExec ["GRAD_VM_phase1_fnc_spawnMarchingColumn", 2];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Spawn Roman on Horse", {
     params ["_position", "_object"];

     [ASLtoAGL _position, 90] remoteExec ["GRAD_VM_phase1_fnc_spawnHorseRoman", 2];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Marching Sound", {
     params ["_position", "_object"];

     playSound3D [getMissionPath "USER\sounds\marchingsoldiers.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Roman Horns Sound", {
     params ["_position", "_object"];

     playSound3D [getMissionPath "USER\sounds\romanhorns.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Roman Horns Sound 2", {
     params ["_position", "_object"];

     playSound3D ["Roman_props\sounds\Roman_horn_corn.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Barb Horn", {
     params ["_position", "_object"];

     playSound3D ["Roman_props\sounds\barb_horn_3.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Distant Battle Sound", {
     params ["_position", "_object"];

     playSound3D [getMissionPath "USER\sounds\phase1_battlesound_1.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Remove Formation", {
     params ["_position", "_object"];


     private _leader = (ASLtoAGL _position) nearEntities ["Roman_legioner_cent_IMS_red", 10];
     if (count _leader > 0) then {
          _leader = _leader#0;
     };
     if (!isNull _object) then {
          _leader = _object;
     };
     if (!isNull _leader && {_leader getVariable ["GRAD_VM_inFormation", false]}) then {
          _leader setVariable ["GRAD_VM_inFormation", false, true];
          hint "released leader";
     } else {
          hint "no leader found";
     };
}] call zen_custom_modules_fnc_register;

/*
["Vile Matter - Phase 1", "Add enhanced Horse Sound", {
     params ["_position", "_object"];

     [_object] call GRAD_VM_phase1_fnc_horseSound;

}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Remove enhanced Horse Sound", {
     params ["_position", "_object"];

     _object setVariable ["GRAD_VM_horseSound", false, true];

}] call zen_custom_modules_fnc_register;
*/

["Vile Matter - Phase 1", "Spawn Lion", {
     params ["_positionASL", "_object"];

     private _lion = (creategroup east) createUnit ["Edaly_Tiger", ASLtoAGL _positionASL, [], 0, "CAN_COLLIDE"];
     _lion setObjectTextureGlobal [0, "USER\images\lion_small.paa"];
     _lion setObjectTextureGlobal [2, "#(rgb,8,8,3)color(0,0,0,0)"];

     [_lion] call GRAD_VM_phase1_fnc_lionDeathHandler;

     [_lion] remoteExec ["GRAD_VM_phase1_fnc_tigerActions", [0,-2] select isDedicated];

}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "(Re)start Phase Ambient Sound", {
     params ["_position", "_object"];

     [] remoteExec ["GRAD_VM_phase2_fnc_ambientSounds", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "Spawn Bomber Formation", {
     params ["_position", "_object"];

     [] remoteExec ["GRAD_VM_phase2_fnc_bomberSpawn", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "Spawn Bomb in Sky", {
     params ["_position", "_object"];

     _position set [2, 450];

     [ASLtoAGL _position] remoteExec ["GRAD_VM_phase2_fnc_spawnBomb", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "Spawn Hitler", {
     params ["_position", "_object"];

     [] remoteExec ["GRAD_VM_phase2_fnc_spawnHitler", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "Hitler Speech Random Ranting (better call from remoteControl)", {
     params ["_position", "_object"];

     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] remoteExec ["GRAD_VM_phase2_fnc_hitlerSpeech", 2];
     };
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 2", "Hitler Speech LONG", {
     params ["_position", "_object"];

     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] remoteExec ["GRAD_VM_phase2_fnc_hitlerSpeechAlternative", 0];
     };
}] call zen_custom_modules_fnc_register;



["Vile Matter - Phase 2", "Move player into bunker", {
     params ["_position", "_object"];

     if (isPlayer _object) then {
          ((getPos bunkerEntry) getPos [random 5, random 360]) params ["_xPos", "_yPos"];
          _object setPos [_xPos, _yPos, 0.5];
     };
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 2", "Kill Hitler", {
     params ["_position", "_object"];

     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] spawn GRAD_VM_phase2_fnc_suicideHitler;
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "Start Bunker Bombardment", {
     params ["_position", "_object"];

      [] remoteExec ["GRAD_VM_phase2_fnc_bunkerBombardment", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "Stop Bunker Bombardment", {
     params ["_position", "_object"];

      GRAD_VM_phase2_bunkerBombardment = false; publicVariable "GRAD_VM_phase2_bunkerBombardment";

     [{
          GRAD_VM_phase2_bunkerBombardment = nil; publicVariable "GRAD_VM_phase2_bunkerBombardment";
     }, [], 2] call CBA_fnc_waitAndExecute;
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 2", "Ambient Bomber Flyby", {
     params ["_position", "_object"];

      [] spawn GRAD_VM_phase2_fnc_ambientBomberFlyby;
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 3", "Spawn Battleship", {
     params ["_position", "_object"];

     private _alreadyActivated = missionNamespace getVariable ["GRAD_VM_phase3_shipJumpActivated", false];
     if (_alreadyActivated) exitWith {
          systemChat "'Spawn Battleship' has already been activated!";
     };
     missionNamespace setVariable ["GRAD_VM_phase3_shipJumpActivated", true, true];
     [] remoteExec ["Grad_VM_phase3_fnc_battleshipJump", 2];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 3", "Spawn Guardsman", {
     params ["_position", "_object"];

     [_position, _object] spawn {
          params ["_position", "_object"];

          private _pad = createVehicle ["Land_HelipadEmpty_F", ASLToAGL _position, [], 0, "CAN_COLLIDE"];

          [_pad] remoteExec ["Grad_VM_phase3_fnc_guardsmenSpawnEffect", [0, -2] select isMultiplayer];
          sleep 0.15;
          private _group = createGroup independent;
          private _unit = _group createUnit [selectRandom ["TIOW_Cad_GM776th_Indep", "TIOW_Cad_SGT776th_Indep", "TIOW_Cad_VET776th_Indep"], _pad, [], 0, "NONE"];
          // _unit setDir (getDir _x);
          [_unit, ["Teleport_phase3", 500, 0.85]] remoteExec ["say3D", [0, -2] select isMultiplayer];

          [{
               deleteVehicle _this;
          }, _pad, 5] call CBA_fnc_waitAndExecute;
     };

}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 4", "Start Outro", {
     params ["_position", "_object"];

     private _alreadyActivated = missionNamespace getVariable ["GRAD_VM_outro_outroActivated", false];
     if (_alreadyActivated) exitWith {
          systemChat "'Start Outro' has already been activated!";
     };
     missionNamespace setVariable ["GRAD_VM_outro_outroActivated", true, true];
     [] remoteExec ["Grad_VM_outro_fnc_initOutro", 2];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 4", "Start Earthquake", {
     params ["_position", "_object"];

     private _alreadyActivated = missionNamespace getVariable ["GRAD_VM_phase4_earthquakeActivated", false];
     if (_alreadyActivated) exitWith {
          systemChat "'Start Earthquake' has already been activated!";
     };
     missionNamespace setVariable ["GRAD_VM_phase4_earthquakeActivated", true, true];
     [] remoteExec ["GRAD_VM_phase4_fnc_initPhase4Effects", 2];
}] call zen_custom_modules_fnc_register;

/*
["Vile Matter - Common", "Fix SetObjectScale", {
     params ["_position", "_object"];

     private _allObjects = missionNamespace getVariable ["GRAD_VM_scaledObjects", []];
   {
       _x params ["_object", "_scale"];
       _object setObjectScale _scale;
   } forEach _allObjects;

}] call zen_custom_modules_fnc_register;
*/
