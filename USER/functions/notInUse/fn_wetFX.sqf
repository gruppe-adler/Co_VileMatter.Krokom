private _teleportFX = ppEffectCreate ["WetDistortion", 1000];
 _teleportFX ppEffectEnable true; 
// default
_teleportFX ppEffectAdjust [
    1,
    1, 1,
    4.10, 3.70, 2.50, 1.85,
    0.0054, 0.0041, 0.0090, 0.0070,
    0.5, 0.3, 10.0, 6.0
];


_teleportFX ppEffectAdjust [-100000, 0, 0, 10, 10, 10, 10, 0.0041, 0.0041, 0.0070, 0.0070, 1, 1, 1, 1];
_teleportFX ppEffectCommit 10; 

("TAsdfr" call BIS_fnc_rscLayer) cutRsc ["binocular",   "WHITE IN" , 10];
sleep 10;

_teleportFX ppEffectAdjust [1, 0, 0, 4.10, 3.70, 2.50, 1.85, 0.0041, 0.0041, 0.0070, 0.0070, 1, 1, 1, 1];
_teleportFX ppEffectCommit 10; 
sleep 10;
_teleportFX ppEffectEnable false; 
ppEffectDestroy _teleportFX;
