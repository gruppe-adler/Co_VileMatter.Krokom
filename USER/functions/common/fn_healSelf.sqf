// must be argument local

params ["_unit"];

{ _unit setHitPointDamage [_x, 0]; } forEach ((getAllHitPointsDamage _unit)#0);