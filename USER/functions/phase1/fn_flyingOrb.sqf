// NOT USED

_orb_obj = "#lightpoint" createvehiclelocal getmarkerpos _ufo;
_orb_obj setLightDayLight true;_orb_obj setLightUseFlare true;
_orb_obj setLightFlareSize 5; _orb_obj setLightFlareMaxDistance 5000;   
_orb_obj setLightAmbient[0.5,0.5,1]; _orb_obj setLightColor[0.5,0.7,0.9];
_orb_obj setLightAttenuation [0,0,0,0,0,4000]; 
_orb_obj setLightBrightness 10;
_orbit_speed=0.02;

drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_orb_obj];
        drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj];



        while {_rand_arc>0} do {
                _poz_rel_1=_orb_reper getRelPos [_rad_lit,_moveme];
                _orb_obj setpos [_poz_rel_1#0,_poz_rel_1#1,2];
                drop [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,1,[0,0,0],[0,0,0],0,9.999,7,0,[1,5],[[0.443,0.706,0.81,0.2],[0.443,0.706,0.81,0]],[1],0,0,"","",_orb_obj];
                drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],"","Billboard",.2,0.5,[1,1,0],[0,0,0],0,9,7,0,[1,10,.5],[[0,0,0,0],[0,0,0,1],[0,0,0,0]],[1],0,0,"","",_orb_obj];
                if (_sens) then {_moveme=_moveme+1} else {_moveme=_moveme-1};
                _rand_arc=_rand_arc-1;
                sleep _orbit_speed;
        };