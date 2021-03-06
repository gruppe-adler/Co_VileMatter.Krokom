timeMultiplier = 1;                                                             // Geschwindigkeitsfaktor für ingame Zeit - Wert von 1 bedeutet 1h im Spiel == 1h in echt

ambientLife = 0;                                                                // zufällig generierte Hasen, Schlangen, Schmetterlinge, etc. (0/1) - aus Performancegründen standardmäßig aus
ambientSound = 0;                                                               // zufällig generierte Umgebungsgeräusche (0/1)

sideChannel = 0;                                                                // Sidechannel aktiv (0/1) - standardmäßig aus, damit Spieler Marker immer zeussichtbar in Global setzen können

artilleryComputer = 0;                                                          // Artilleriecomputer (0/1) - wenn ausgeschaltet, benutzt KI Mörser nicht mehr für indirekten Beschuss

showLogo = 0;                                                                   // Adlerlogo mit Missionsnamen anzeigen (0/1) - alternativ kann hier eine Wartebedingung festgelegt werden (siehe Wiki)

class CfgIdentities
{
    class adi_identity
    {
        face = "adi_face";
        glasses = "";
        name = "Adolf";
        nameSound = "Adolf";
        pitch = 1.0;
        speaker = "Male01ENG";
    };
};

class CfgVehicles
{
    class GRAD_VM_soundOwl // class name to be used with createSoundSource
    {
        sound = "OwlSfx"; // reference to CfgSFX class
    };

    class GRAD_VM_soundFrog
    {
        sound = "FrogSfx";
    };

    class GRAD_VM_soundFrogs
    {
        sound = "FrogsSfx";
    };

    class GRAD_VM_soundWolf
    {
        sound = "WolfSfx";
    };

    class GRAD_VM_soundCrow
    {
        sound = "CrowSfx";
    };

    class GRAD_VM_soundNightingale
    {
        sound = "nightingale";
    };

    class GRAD_VM_soundCrickets
    {
        sound = "CricketSfx";
    };    
    
};