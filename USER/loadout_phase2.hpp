class vm_vilematter_phase2 {

    class AllUnits {
        uniform[] = {"U_LIB_US_Private"};
        vest[] = {"V_LIB_US_Vest_Garand"};
        backpack = "B_LIB_US_Backpack";
        headgear = "H_LIB_US_Helmet";
        primaryWeapon = "LIB_M1_Garand";
        primaryWeaponMagazine = "LIB_8Rnd_762x63";
        primaryWeaponMuzzle = "";
        primaryWeaponPointer = "";
        primaryWeaponOptics = "";
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
            addItemsToUniform[] = {
                LIST_1("LIB_ACC_M1_Bayo"),
                LIST_1("FirstAidKit"),
                LIST_5("LIB_8Rnd_762x63")
            };
            addItemsToVest[] = {
                LIST_2("LIB_8Rnd_762x63"),
                LIST_2("LIB_US_Mk_2")
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
            uniform = "U_LIB_US_Private_1st";
            primaryWeapon = "LIB_M1918A2_BAR";
            primaryWeaponMagazine= "LIB_20Rnd_762x63";
            handgunWeapon = "JMSL_W_Melee_Celt_sword_1";
            vest = "V_LIB_US_Vest_Bar";
            backpack = "";
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
            uniform = "U_LIB_US_Med";
            vest = "V_LIB_US_Vest_Medic";
            backpack = "B_LIB_US_MedicBackpack";
            headgear = "H_LIB_US_Helmet_Med";
            primaryWeapon = "LIB_M1_Garand";
            primaryWeaponMagazine = "LIB_8Rnd_762x63";
            addItemsToUniform[] = {
                LIST_1("FirstAidKit"),
                LIST_7("LIB_8Rnd_762x63")
            };
            addItemsToBackpack[] = {
                LIST_1("Medikit"),
                LIST_7("LIB_8Rnd_762x63"),
                LIST_5("FirstAidKit")
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
            primaryWeapon = "LIB_M1_Carbine";
            primaryWeaponMagazine = "LIB_15Rnd_762x33";
            headgear = "H_LIB_US_Helmet";
            uniform = "U_LIB_US_Private_1st";
            vest = "V_LIB_US_Vest_Carbine";
            backpack = "B_LIB_US_Backpack_RocketBag";
            secondaryWeapon = "LIB_M1A1_Bazooka";
            secondaryWeaponMagazine = "LIB_1Rnd_60mm_M6";
            addItemsToUniform[] = {
                LIST_1("FirstAidKit"),
                LIST_10("LIB_15Rnd_762x33")
            };
            addItemsToBackpack[] = {
                LIST_3("LIB_1Rnd_60mm_M6")
            };
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            handgunWeapon = "LIB_FLARE_PISTOL";
            handgunWeaponMagazine = "LIB_1Rnd_flare_white";
            primaryWeapon = "LIB_M1_Carbine";
            primaryWeaponMagazine= "LIB_15Rnd_762x33";
            vest = "V_LIB_US_Vest_Carbine_nco";
            backpack = "";
            headgear = "U_LIB_US_Cap";
            addItemsToUniform[] = {
                LIST_7("LIB_15Rnd_762x33")
            };
            addItemsToBackpack[] = {
                LIST_1("Medikit"),
                LIST_7("LIB_15Rnd_762x33"),
                LIST_5("FirstAidKit"),
                LIST_1("LIB_US_Mk_2"),
                LIST_3("LIB_1Rnd_flare_red")
            };
        };

        //Team Leader
        class Soldier_TL_F: Soldier_F {
            primaryWeapon = "LIB_M1A1_Thompson";
            primaryWeaponMagazine= "LIB_30Rnd_45ACP";
            handgunWeapon = "LIB_FLARE_PISTOL";
            handgunWeaponMagazine = "LIB_1Rnd_flare_white";
            vest = "V_LIB_US_Vest_Thompson_nco";
            backpack = "";
            uniform = "U_LIB_US_Off";
            headgear = "H_LIB_US_Helmet_Second_lieutenant";
            addItemsToUniform[] = {
                LIST_7("LIB_30Rnd_45ACP")
            };
            addItemsToBackpack[] = {
                LIST_1("Medikit"),
                LIST_7("LIB_30Rnd_45ACP"),
                LIST_5("FirstAidKit"),
                LIST_1("LIB_US_Mk_2"),
                LIST_3("LIB_1Rnd_flare_red")
            };
        };
    };
};
