_layerNoise = "BIS_fnc_endMission_noise" call bis_fnc_rscLayer;
_layerInterlacing = "BIS_fnc_endMission_interlacing" call bis_fnc_rscLayer;
_layerStatic = "BIS_fnc_endMission_static" call bis_fnc_rscLayer;
_layerEnd = "BIS_fnc_endMission_end" call bis_fnc_rscLayer;
{_x cuttext ["","plain"]} foreach [_layerNoise,_layerInterlacing,_layerStatic,_layerEnd]; //--- Clear existing effects

setacctime 1;
_layerStatic cutrsc ["RscStatic","plain"];

sleep 0.3;


showhud false;
_layerEnd cutrsc ["RscMissionEnd","plain"];

sleep 2;

private _logoLayer = (findDisplay 46) ctrlcreate ["RscPictureKeepAspect", -1];
_logoLayer ctrlSetText "USER\images\logo_white.paa";
_logoLayer ctrlSetPosition [0.25,-0.15,1,1];
_logoLayer ctrlSetScale 0.5;
_logoLayer ctrlsetFade 1;
_logoLayer ctrlCommit 0;

_logoLayer ctrlsetFade 0;
_logoLayer ctrlCommit 1;

RscNoise_color = [.5,.5,1,0.5];
_layerNoise cutrsc ["RscNoise","black"];
_layerStatic cutrsc ["RscStatic","plain"];

sleep 0.5;


RscNoise_color = [1,1,1,1];
_layerInterlacing cutrsc ["RscInterlacing","plain"];

2.5 fadesound 0;
2.5 fademusic 0;

sleep 1.5;

cuttext ["","black out",2];
sleep 2;

//--- Respawn player to close all respawn menus
[] call bis_fnc_forceEnd;
endmission "END1";