params ["_battleship"];

diwako_dui_main_toggled_off = true;

// flash start
private _colour = [173,216, 230] apply {_x / 255};
private _alpha = 0;

_battleship hideObject true;

drop [  
		     ["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1],  
		     "",  
		     "Billboard",  
		     1,  
		     2,  
		     [0,0,0],  
		     [0,0,0],  
		     0,  
		     9,  
		     7,  
		      0,  
		      [100, 1000, 100],  
		      [[0,0,0,1],  
		      [0,0,0,.5],  
		      [0,0,0,0]],  
		      [1],  
		      0, 0,  
		      "",  
		      "",  
		      _battleship  
		 ];	

private _position = _battleship modelToWorld [200,400,100];
private _lightPoint = "#lightpoint" createvehiclelocal _position;
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 2; _lightPoint setLightFlareMaxDistance 10000;
_lightPoint setLightAmbient[1,1,1]; _lightPoint setLightColor[1,1,1];
_lightPoint setLightAttenuation [2, 4, 4, 0, 1000, 10000];// [0,0,0,0,0,4000];
_lightPoint setLightBrightness 0;

flareShrinking = false;
[{
	params ["_lightPoint", "_position", "_battleship"];

	[{
		params ["_args", "_handle"];
		_args params ["_lightPoint", "_position", "_battleship"];

		private _flareSize = _battleship getVariable ["flareSize", 0];
		_flareSize = if (!flareShrinking) then {  _flareSize+1000 } else {  _flareSize-1000 };
		_battleship setVariable ["flareSize", _flareSize];
		_lightPoint setLightFlareSize _flareSize;
		_lightPoint setLightBrightness _flareSize/10;

		if (_flareSize > 20000) then {
			_battleship hideObject false;
			flareShrinking = true;

			//  private _light = createSimpleObject ["\A3\data_f\VolumeLight", _position, true];
		    // [_light, -90, 0] call BIS_fnc_setPitchBank;
		    // _light setObjectScale 300;

				drop [  
			     ["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1],  
			     "",  
			     "Billboard",  
			     1,  
			     2,  
			     [0,0,0],  
			     [0,0,0],  
			     0,  
			     9,  
			     7,  
			      0,  
			      [100, 3000, 100],  
			      [[0,0,0,1],  
			      [0,0,0,.5],  
			      [0,0,0,0]],  
			      [1],  
			      0, 0,  
			      "",  
			      "",  
			      _battleship  
			 ];
		};

		if (_flareSize < 100) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler; 

			deleteVehicle _lightPoint;
			enableCamShake true;
			addCamShake [10, 3, 35];			

			drop [  
				["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1],  
				"",  
				"Billboard",  
				1,  
				2,  
				[0,0,0],  
				[0,0,0],  
				0,  
				9,  
				7,  
				0,  
				[100, 3000, 100],  
				[[0,0,0,1],  
				[0,0,0,.5],  
				[0,0,0,0]],  
				[1],  
				0, 0,  
				"",  
				"",  
				_battleship  
			];
			diwako_dui_main_toggled_off = false;
		};
		
	}, 0, [_lightPoint, _position, _battleship]] call CBA_fnc_addPerFrameHandler;

}, [_lightPoint, _position, _battleship], 1] call CBA_fnc_waitAndExecute;



/*
drop [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1],
"",
"Billboard",
.2,
3,
_position,
[0,0,0],
0,
9,
7,
0,
[1000,1000,1000],
[[0,0,0,0],
[0,0,0,1],
[0,0,0,0]],
[1],
0,
0,
"",
"",
GRAD_VM_Battleship];
*/