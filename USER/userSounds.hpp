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