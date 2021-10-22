/*
*   Hier können eigene Sounds eingebunden werden.
*   Ist in CfgSounds included.
*/

#define VOLUME 3
#define DISTANCE 15

class teleport
{
    name = "teleport";
    sound[] = {"USER\sounds\teleport.ogg", VOLUME, 1, 500};
    titles[] = {0, ""};
};

class teleport_global
{
    name = "teleport_global";
    sound[] = {"USER\sounds\teleport_global.ogg", VOLUME, 1, 500};
    titles[] = {0, ""};
};

class teleport_flash
{
    name = "teleport_flash";
    sound[] = {"USER\sounds\teleport_flash.ogg", VOLUME, 1, 500};
    titles[] = {0, ""};
};


class GRAD_electricFence_sound_hum
{
    name = "GRAD_electricFence_sound_hum";
    sound[] = {"USER\sounds\hum.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_spark1
{
    name = "GRAD_electricFence_sound_spark1";
    sound[] = {"USER\sounds\spark1.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_spark2
{
    name = "GRAD_electricFence_sound_spark2";
    sound[] = {"USER\sounds\spark2.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_spark3
{
    name = "GRAD_electricFence_sound_spark3";
    sound[] = {"USER\sounds\spark3.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class grad_VM_drone
{
    name = "grad_VM_drone";
    sound[] = {"USER\sounds\drone.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class grad_VM_hum2
{
    name = "grad_VM_hum2";
    sound[] = {"USER\sounds\hum2.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class grad_VM_ropethump
{
    name = "grad_VM_ropethump";
    sound[] = {"USER\sounds\ropethump.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class grad_VM_crescendo
{
    name = "grad_VM_crescendo";
    sound[] = {"USER\sounds\crescendo.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class grad_VM_circus
{
    name = "grad_VM_circus";
    sound[] = {"USER\sounds\circus.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class grad_VM_teleportEnd
{
    name = "grad_VM_teleportEnd";
    sound[] = {"USER\sounds\teleport_end.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class grad_VM_teleport2
{
    name = "grad_VM_teleport2";
    sound[] = {"USER\sounds\teleport2.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class grad_VM_teleport3
{
    name = "grad_VM_teleport3";
    sound[] = {"USER\sounds\teleport3.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class Teleport_phase3
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Teleport_phase3";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Teleport_phase3.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Ship_Detected
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Ship_Detected";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Capital_Ship_Detected_normal.ogg", 2, 1, 100 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Hyperspace_Jump
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Hyperspace_Jump";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Hyperspace_Jump_Loud.ogg", VOLUME, 1, 10000 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class The_slaves_are_here
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "The_slaves_are_here";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\The_emperors_slaves_are_here.ogg", 1.5, 1, 800 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Imperial_Maggots
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Imperial_Maggots";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Imperial_Maggots.ogg", 2, 1, 800 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class There_is_no_stopping
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "There_is_no_stopping";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\There_is_no_stopping_the_dark_gods.ogg", 4, 1, 800 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Death_to_all_who_oppose_chaos
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Death_to_all_who_oppose_chaos";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Death_to_All_who_oppose_chaos.ogg", 4, 1, 800 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Charge
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Charge";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Charge.ogg", 5, 1, 2000 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class For_the_empirium_of_man
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "For_the_empirium_of_man";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\For_the_empirium_of_man.ogg", 5, 1, 2000 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class ite_lucem_angry_def
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "ite_lucem_angry_def";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\ite_lucem_angry_def.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class ite_lucem_angry_slo
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "ite_lucem_angry_slo";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\ite_lucem_angry_slo.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class ite_lucem_plead_def
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "ite_lucem_plead_def";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\ite_lucem_plead_def.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class ite_lucem_plead_slo
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "ite_lucem_plead_slo";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\ite_lucem_plead_slo.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class ite_lucem_sin_def
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "ite_lucem_sin_def";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\ite_lucem_sin_def.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class ite_lucem_sin_slo
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "ite_lucem_sin_slo";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\ite_lucem_sin_slo.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class dasisteinbefehl_default
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "dasisteinbefehl_default";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\dasisteinbefehl_default.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class dasisteinbefehl_medium
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "dasisteinbefehl_medium";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\dasisteinbefehl_medium.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class dasisteinbefehl_low
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "dasisteinbefehl_low";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\dasisteinbefehl_low.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class dasisteinbefehl2_default
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "dasisteinbefehl2_default";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\dasisteinbefehl2_default.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class dasisteinbefehl2_medium
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "dasisteinbefehl2_medium";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\dasisteinbefehl2_medium.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class dasisteinbefehl2_low
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "dasisteinbefehl2_low";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\dasisteinbefehl2_low.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class feiglinge_default
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "feiglinge_default";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\feiglinge_default.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class feiglinge_medium
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "feiglinge_medium";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\feiglinge_medium.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class feiglinge_low
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "feiglinge_low";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\feiglinge_low.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class generalitaet_default
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "generalitaet_default";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\generalitaet_default.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class generalitaet_medium
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "generalitaet_medium";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\generalitaet_medium.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class generalitaet_low
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "generalitaet_low";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\generalitaet_low.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};



class verraeterversager_default
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "verraeterversager_default";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\verraeterversager_default.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class verraeterversager_medium
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "verraeterversager_medium";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\verraeterversager_medium.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class verraeterversager_low
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "verraeterversager_low";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\verraeterversager_low.ogg", VOLUME, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class rocksFalling_1
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "rocksFalling_1";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\rocksFalling_1.ogg", 5, 1, 100 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class rocksFalling_2
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "rocksFalling_2";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\rocksFalling_2.ogg", 5, 1, 100 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class rocksFalling_3
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "rocksFalling_2";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\rocksFalling_3.ogg", 5, 1, 100 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class phase4_earthquake
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "phase4_earthquake";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\VileMatter_phase4_Earthquake.ogg", 1, 1, 100 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class steam
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "steam";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\steam.ogg", 1, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Hitler_Monolog_default
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Hitler_Monolog_default";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Hitler_Monolog_default.ogg", 5, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Hitler_Monolog_close
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Hitler_Monolog_close";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Hitler_Monolog_close.ogg", 5, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Hitler_Monolog_far
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Hitler_Monolog_far";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Hitler_Monolog_far.ogg", 5, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class lever
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "lever";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\lever.ogg", 1, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class romanhorns
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "romanhorns";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\romanhorns.ogg", 1, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class marchingsoldiers
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "marchingsoldiers";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\marchingsoldiers.ogg", 1, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class chilladi
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "chilladi";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\chilladi.ogg", 1, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class phase2_ambient
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "phase2_ambient";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Phase2_Ambient.ogg", 1, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class GRAD_VM_tick
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "GRAD_VM_tick";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\tick.ogg", 1, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class GRAD_VM_tock
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "GRAD_VM_tock";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\tock.ogg", 1, 1, 1500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};






// Space-Marine voicelines:

// class Captain_voiceLine
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "Captain_voiceLine";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\Captain_voiceLine.ogg", 4, 1, 600 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };

// class For_the_Emperor_2
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "For_the_Emperor_2";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\For_the_Emperor_2.ogg", 4, 1, 600 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };

// class Marine_Death_1
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "Marine_Death_1";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\Marine_Death_1.ogg", VOLUME, 1, 500 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };

// class Marine_Death_2
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "Marine_Death_2";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\Marine_Death_2.ogg", 3, 1, 500 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };

// class Marine_Death_3
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "Marine_Death_3";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\Marine_Death_3.ogg", 3, 1, 500 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };

// class Marine_Death_4
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "Marine_Death_4";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\Marine_Death_4.ogg", 3, 1, 500 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };

// class Marine_Death_5
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "Marine_Death_5";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\Marine_Death_5.ogg", 3, 1, 500 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };

// class Marine_Death_6
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "Marine_Death_6";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\Marine_Death_6.ogg", 3, 1, 500 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };

// class Marine_Death_7
// {
//     // how the sound is referred to in the editor (e.g. trigger effects)
//     name = "Marine_Death_7";
//     // filename, volume, pitch, distance (optional)
//     sound[] = { "sounds\Marine_Death_7.ogg", 3, 1, 500 };
//     // subtitle delay in seconds, subtitle text
//     titles[] = {  };
// };
