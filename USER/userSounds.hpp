/*
*   Hier können eigene Sounds eingebunden werden.
*   Ist in CfgSounds included.
*/

#define VOLUME 5
#define DISTANCE 15

class teleport
{
    name = "teleport";
    sound[] = {"USER\sounds\teleport.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class teleport_global
{
    name = "teleport_global";
    sound[] = {"USER\sounds\teleport_global.ogg", VOLUME, 1, DISTANCE};
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

class gradVM_drone
{
    name = "gradVM_drone";
    sound[] = {"USER\sounds\drone.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class gradVM_hum2
{
    name = "gradVM_hum2";
    sound[] = {"USER\sounds\hum2.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class gradVM_ropethump
{
    name = "gradVM_ropethump";
    sound[] = {"USER\sounds\ropethump.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class gradVM_crescendo
{
    name = "gradVM_crescendo";
    sound[] = {"USER\sounds\crescendo.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class gradVM_circus
{
    name = "gradVM_circus";
    sound[] = {"USER\sounds\circus.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class gradVM_teleportEnd
{
    name = "gradVM_teleportEnd";
    sound[] = {"USER\sounds\teleportEnd.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class gradVM_teleport3
{
    name = "gradVM_teleport3";
    sound[] = {"USER\sounds\teleport4.ogg", VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class Teleport_phase3
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Teleport_phase3";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Teleport_phase3.ogg", 3, 1, 500 };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class Ship_Detected
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "Ship_Detected";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\Capital_Ship_Detected_normal.ogg", 3, 1, 100 };
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
//     sound[] = { "sounds\Marine_Death_1.ogg", 3, 1, 500 };
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