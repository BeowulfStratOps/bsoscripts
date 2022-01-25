/*
	Custom Arsenal script

	Allows you to define a list of weapons, equipment, magazines, etc, which can then be selected by a player in the arsenal.

	Define each item in the array below. There is no need for a specific order. I have labelled and split it up for ease of use.

	Place this file in your mission folder, and put the following in the init of a box/object/vehicle to allow players to open the arsenal from that object. OBJECT MUST BE COMPATIBLE WITH ACE INTERACTION.

		[this] execVM "mission\armoury.sqf";


	If the player is holding weapons/equipment when they enter the arsenal. They will be able to select that item, but if they deselect the item and then exit the arsenal. It will be lost for good.
	Players will also be able to duplicate existing items in the arsenal.

	The example below is taken from Walker's "RACS On Tour: Africa" mission.

*/



_armoury = _this select 0;

[_armoury, 
	[
		// Rifles
		"hlc_rifle_g3a3",
		"hlc_rifle_g3a3ris",
		"hlc_rifle_hk33ka3",
		"hlc_wp_m16A1",



		// Pistols
		"sp_fwa_l9a1_hipower_wood",
		"rhs_weap_rsp30_white",
		"rhs_weap_rsp30_green",
		"rhs_weap_rsp30_red",


		// Magazines
		"hlc_20rnd_762x51_b_G3",
		"hlc_20rnd_762x51_T_G3",
		"hlc_30rnd_556x45_b_HK33",
		"hlc_30rnd_556x45_t_HK33",
		"rhs_mag_30Rnd_556x45_M855_Stanag",
		"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",
		"sp_fwa_13Rnd_9mm_HiPower",


		"rhs_mag_M433_HEDP",
		"ACE_40mm_Flare_green",
		"ACE_40mm_Flare_red",
		"rhs_mag_m714_White",
		"rhs_mag_m713_Red",
		"rhs_mag_m715_Green",

		//MAG ammo
		"sp_fwa_100Rnd_762_mag",

		//SMAW
		"MRAWS_HEAT_F",
		"MRAWS_HE_F",
		
		"rhs_fim92_mag",

		//m6 mortar
		"UK3CB_BAF_1Rnd_60mm_Mo_Shells",
		"UK3CB_BAF_1Rnd_60mm_Mo_WPSmoke_White",
		"UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",
		"UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",

		// Weapon acc
		"rh_compm2l",
		"hlc_optic_stanagzf_g3",
		"hlc_optic_pvs4g3",
		"rhsusf_acc_anpvs27",
		"rh_anpvs4",
		"hlc_optic_stanagzf_g3",

		// Grenades
		"HandGrenade",
		"SmokeShell",
		"SmokeShellRed",
		"SmokeShellGreen",
		"SmokeShellBlue",
		"SmokeShellPurple",

		"ACE_HandFlare_Green",
		"ACE_HandFlare_Red",
		"ACE_HandFlare_White",
		"ACE_HandFlare_Yellow",

		"rhs_grenade_m15_mag",


		// Medical
		"ACE_salineIV_500",
		"ACE_fieldDressing",
		"ACE_elasticBandage",
		"ACE_morphine",
		"ACE_atropine",
		"ACE_epinephrine",
		"ACE_tourniquet",
		"ACE_quikclot",



		// Other
		"ACE_Flashlight_MX991",
		"ACE_MapTools",
		"ItemMap",
		"ItemCompass",
		"ACE_EntrenchingTool",
		"ACE_artilleryTable",
		"SAN_Headlamp_v1",
		"Binocular",

		// radio
		"ACRE_PRC343",
		"ACRE_PRC148",


		// uniform
		"usm_bdu_portliz",
		"usm_bdu_srl_portliz",
		"usm_bdu_srh_portliz",
		"usm_bdu_srl_portliz",
		
		// vest
		"rhsgref_alice_webbing",


		// backpack
		"UK3CB_B_TacticalPack_Oli",
		
		// Hat
		"usm_bdu_boonie_portliz",
		"H_Bandanna_khk",
		"usm_bdu_cap_portliz",
		"usm_headwrap_odg1",
		"H_Hat_Safari_olive_F",

		//Insignia
		"racs_patch"












	]] call ace_arsenal_fnc_initBox