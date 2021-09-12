class vm_vilematter_phase3 {

    class AllUnits {
        uniform = "TIOW_U_Fire_Warrior_VL_B";
        vest = "TIOW_Tau_Belt_VL";
        backpack = "TIOW_Tau_Bck_Strike_VL";
        headgear = "TIOW_Tau_HelmetS_VL";
        primaryWeapon = "TIOW_pulse_rifle_VL";
        primaryWeaponMagazine = "TIOW_pulse_mag";
        primaryWeaponOptics = "TIOW_Tau_optics_ColiB_zoom";
        primaryWeaponMuzzle = "";
        primaryWeaponPointer = "";
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        handgunWeapon = "";
        handgunWeaponMagazine = "";
        binoculars = "";
        map = "";
        compass = "";
        watch = "";
        gps = "";
        radio = "";
    };

    class Type {
        //Rifleman
        class Soldier_F {
            uniform = "TIOW_U_Fire_Warrior_VL_B";
            vest = "TIOW_Tau_Belt_VL";
            backpack = "TIOW_Tau_Bck_Strike_VL";
            headgear = "TIOW_Tau_HelmetS_VL";
            primaryWeapon = "TIOW_pulse_rifle_VL";
            primaryWeaponMagazine = "TIOW_pulse_mag";
            primaryWeaponOptics = "TIOW_Tau_optics_ColiB_zoom";
            addItemsToUniform[] = {
                LIST_2("FirstAidKit"),
                LIST_7("TIOW_pulse_mag"),
                LIST_2("TIOW_tau_photon_grenade_mag")
            };
        };

        //Asst. Autorifleman
        class soldier_AAR_F: Soldier_F {};

        //Asst. Gunner (MMG) / Ammo Bearer
        class soldier_A_F: Soldier_F {};

        //Asst. Gunner (HMG/GMG)
        class support_AMG_F: Soldier_F {};

        //Asst. Missile Specialist (AA)
        class soldier_AAA_F: Soldier_F {};

        //Asst. Missile Specialist (AT)
        class soldier_AAT_F: Soldier_F {};

        //Autorifleman
        class soldier_AR_F: Soldier_F {
            uniform = "TIOW_U_Pathfinder_VL_B";
            vest = "TIOW_Tau_BeltP_Photon_VL";
            backpack = "TIOW_Tau_Bck_Phndr_Ion_VL";
            headgear = "TIOW_Tau_HelmetB2_VL";
            primaryWeapon = "TIOW_ion_rifle_VL";
            primaryWeaponMagazine = "TIOW_ionrifle_shot_mag";
            primaryWeaponOptics = "TIOW_Tau_optics_ColiB";
            addItemsToUniform[] = {
                LIST_1("FirstAidKit"),
                LIST_6("TIOW_ionrifle_shot_mag"),
                LIST_2("TIOW_tau_photon_grenade_mag"),
                LIST_2("SmokeShellYellow")
            };
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
            uniform = "TIOW_U_Pathfinder_VL_B";
            vest = "TIOW_Tau_BeltP_VL";
            backpack = "TIOW_Tau_Bck_Phndr_Rail_VL";
            headgear = "TIOW_Tau_HelmetB2_VL";
            primaryWeapon = "TIOW_rail_rifle_VL";
            primaryWeaponMagazine = "TIOW_railrifle_mag";
            primaryWeaponOptics = "TIOW_Tau_optics_Mk_zoom";
            addItemsToUniform[] = {
                LIST_1("FirstAidKit"),
                LIST_4("TIOW_railrifle_mag"),
                LIST_2("TIOW_tau_photon_grenade_mag"),
                LIST_2("SmokeShellYellow")
            };
        };

        //Explosive Specialist
        class soldier_exp_F: Soldier_F {};

        //Grenadier
        class Soldier_GL_F: Soldier_F {};

        //Heavy Gunner (MMG)
        class HeavyGunner_F: Soldier_F {};

        //Gunner (HMG/GMG)
        class support_MG_F: Soldier_F {};

        //Marksman
        class soldier_M_F: Soldier_F {};

        //Missile Specialist (AA)
        class soldier_AA_F: Soldier_F {};

        //Missile Specialist (AT)
        class soldier_AT_F: Soldier_F {};

        //Repair Specialist
        class soldier_repair_F: Soldier_F {};

        //Rifleman (AT)
        class soldier_LAT_F: Soldier_F {
            uniform = "TIOW_U_Fire_Warrior_VL_B";
            vest = "TIOW_Tau_Belt_Photon_VL";
            backpack = "TIOW_Tau_VL_Exp_Pack";
            headgear = "TIOW_Tau_HelmetS_VL";
            primaryWeapon = "TIOW_pulse_rifle_VL";
            primaryWeaponMagazine = "TIOW_pulse_mag";
            primaryWeaponOptics = "TIOW_Tau_optics_ColiB_zoom";
            addItemsToUniform[] = {
                LIST_2("FirstAidKit"),
                LIST_6("TIOW_pulse_mag"),
                LIST_2("TIOW_tau_photon_grenade_mag")
            };
            addItemsToBackpack[] = {
                LIST_1("MineDetector"),
                LIST_1("ToolKit"),
                LIST_1("TIOW_Tau_ExpBig_Remote_Mag")
            };
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            uniform = "TIOW_U_Fire_Warrior_VL_B";
            vest = "TIOW_Tau_BeltB_Shasui_VL";
            backpack = "TIOW_Tau_Bck_Strike_Shasui_VL";
            primaryWeapon = "TIOW_pulse_rifle_VL";
            primaryWeaponMagazine = "TIOW_pulse_mag";
            primaryWeaponOptics = "TIOW_Tau_optics_ColiB_zoom";
            addItemsToUniform[] = {
                LIST_2("FirstAidKit"),
                LIST_9("TIOW_pulse_mag"),
                LIST_2("TIOW_tau_photon_grenade_mag")
            };
        };

        //Team Leader
        class Soldier_TL_F: Soldier_F {
            uniform = "TIOW_U_Pathfinder_VL_B";
            vest = "TIOW_Tau_BeltP_Shasui_VL";
            backpack = "TIOW_Tau_Bck_Phndr_Shasui_VL";
            headgear = "TIOW_Tau_HelmetS_VL_sui";
            primaryWeapon = "TIOW_pulse_carbine_VL";
            primaryWeaponMagazine = "TIOW_pulse_mag";
            primaryWeaponOptics = "TIOW_Tau_optics_ColiB";
            handgunWeapon = "TIOW_pulse_pistol_VL";
            handgunWeaponMagazine = "TIOW_pulse_pistol_mag";
            addItemsToUniform[] = {
                LIST_1("FirstAidKit"),
                LIST_7("TIOW_pulse_mag"),
                LIST_2("TIOW_tau_photon_grenade_mag"),
                LIST_1("TIOW_pulse_pistol_mag"),
                LIST_2("SmokeShellYellow")
            };
        };
    };
};
