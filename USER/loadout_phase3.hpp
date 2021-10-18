class vm_vilematter_phase3 {

    class AllUnits {
        uniform = "TIOW_U_Fire_Warrior_VL_B";
        vest = "TIOW_Tau_BeltB_VL";
        backpack = "TIOW_Tau_Bck_Strike_VL";
        headgear = "GRAD_Tau_HelmetS_VL";
        primaryWeapon = "DMCLS_pulse_burster_VL";
        primaryWeaponMagazine = "DMCLS_pulse_mag_36";
        primaryWeaponOptics[] = {"dmcls_tau_coli_1_vl", "dmcls_tau_coli_2_vl"};
        primaryWeaponMuzzle = "";
        primaryWeaponPointer = "";
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "TIOW_pulse_pistol_VL";
        secondaryWeaponMagazine = "TIOW_pulse_pistol_mag";
        handgunWeapon = "";
        handgunWeaponMagazine = "";
        binoculars = "";
        map = "";
        compass = "";
        watch = "";
        gps = "";
        radio = "TFAR_anprc152";
        addItemsToUniform[] = {
            LIST_2("FirstAidKit")
        };
        // addItemsToVest[] = {            
        //     LIST_5("TIOW_pulse_pistol_mag"),
        //     LIST_12("DMCLS_pulse_mag_36"),
        // };        
    };

    class Type {
        //Rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_2("FirstAidKit")
            };
            addItemsToVest[] = {            
                LIST_5("TIOW_pulse_pistol_mag"),
                LIST_12("DMCLS_pulse_mag_36"),
            };
        };

        class B_soldier_exp_F: Soldier_F {

        };

        //Asst. Autorifleman
        class soldier_AAR_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_8("DMCLS_pulse_mag_54"),
            };               
        };

        //Asst. Gunner (MMG) / Ammo Bearer
        class soldier_A_F: Soldier_F {};

        //Asst. Gunner (HMG/GMG)
        class support_AMG_F: Soldier_F {};

        //Asst. Missile Specialist (AA)
        class soldier_AAA_F: Soldier_F {};

        //Asst. Missile Specialist (AT)
        class soldier_AAT_F: Soldier_F {};

        //Autorifleman
        class soldier_AR_F {
            primaryWeaponMagazine = "DMCLS_pulse_mag_54";
            addItemsToVest[] = {
                LIST_5("DMCLS_pulse_mag_54"),
            };
            addItemsToBackpack[] = {
                LIST_5("TIOW_pulse_pistol_mag"),
                LIST_5("DMCLS_pulse_mag_54")
            };            
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_20("FirstAidKit"),
                LIST_1("Medikit")
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
        class soldier_LAT_F {
            primaryWeapon = "DMCLS_ion_rifle_VL";
            primaryWeaponMagazine = "DMCLS_pulse_mag_25";
            primaryWeaponUnderbarrelMagazine = "DMCLS_ion_rifle_overcharge_mag";
            primaryWeaponOptics = "";
            addItemsToVest[] = {
                LIST_15("DMCLS_pulse_mag_25")
            };
            addItemsToBackpack[] = {
                LIST_5("DMCLS_ion_rifle_overcharge_mag")
            };
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            backpack = "TIOW_Tau_Bck_Breacher_Shasui_VL";
            headgear = "GRAD_Tau_HelmetS_VL_sui";
            primaryWeapon = "DMCLS_pulse_carbine_VL";
            primaryWeaponUnderbarrelMagazine = "DMCLS_tau_fusion_grenade_uglmag";
            addItemsToBackpack[] = {
                LIST_5("DMCLS_tau_fusion_grenade_uglmag"),
                LIST_5("DMCLS_tau_smoke_grenade_uglmag")
            };            
        };

        //Team Leader
        class Soldier_TL_F: Soldier_F {};
    };
};
