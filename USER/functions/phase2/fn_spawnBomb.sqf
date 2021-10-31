params ["_spawnPos"];

private _type = selectRandom ["LIB_FAB500_Bomb", "LIB_OF471_HE_Arty"];
private _bomb = _type createVehicle _spawnPos; 
_bomb setVelocity [0,0,10];


/*

    LIB_SC250_Bomb
    LIB_SC50_Bomb
    LIB_SC500_Bomb
    LIB_Sh_82_HE
    LIB_FAB500_Bomb
    LIB_FAB250_Bomb
    LIB_ExplosionEffects_base
    LIB_Crocodile_FlameProjector_Ammo
    LIB_US_500lb_Bomb
    LIB_OF471_HE_Arty

*/