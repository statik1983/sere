//AI Missions Heavy Weapons Box
private["_miscItem11","_miscItem22","_miscItems1","_miscItems2","_magazine","_weapon","_crateHeavy","_allWeapons"];
_crateHeavy = _this select 0;
 
clearWeaponCargoGlobal _crateHeavy;
clearMagazineCargoGlobal _crateHeavy;

_allWeapons = ["RH_deagle","RH_Deagleg","RH_Deagles","RH_Deaglem","RH_Deaglemz","RH_Deaglemzb","RH_anac","RH_anacg","RH_bull","RH_python","RH_browninghp","RH_p226",
"RH_p226s","RH_p38","RH_ppk","RH_mk22","RH_mk22sd","RH_mk22v","RH_mk22vsd","RH_usp","RH_uspsd","RH_uspm","RH_m1911","RH_m1911sd","RH_m1911old","RH_tt33",
"RH_mk2","RH_m93r","RH_m9","RH_m9sd","RH_m9c","RH_m9csd","RH_g18","RH_g17","RH_g17sd","RH_g19","RH_g19t","RH_vz61","RH_tec9","vil_B_HP","vil_Glock",
"vil_Glock_o","vil_USP","vil_USPSD","vil_USP45","vil_USP45SD","vil_MP5_EOTech","vil_MP5SD_EOTech","vil_uzi_c","vil_uzi","vil_uzi_SD","vil_uzimini",
"vil_uzimini_SD","RH_hk416","RH_hk416s","RH_hk416saim","RH_hk416seotech","RH_hk416sacog","RH_hk416sd","RH_hk416sdaim","RH_hk416sdeotech","RH_hk416aim",
"RH_hk416eotech","RH_hk416acog","RH_hk416gl","RH_hk416glaim","RH_hk416gleotech","RH_hk416glacog","RH_hk416sgl","RH_hk416sglaim","RH_hk416sgleotech",
"RH_hk416sglacog","RH_hk416sdgl","RH_hk416sdglaim","RH_hk416sdgleotech","RH_hk417","RH_hk417aim","RH_hk417eotech","RH_hk417acog","RH_hk417sp","RH_hk417s",
"RH_hk417saim","RH_hk417seotech","RH_hk417sacog","RH_hk417sd","RH_hk417sdaim","RH_hk417sdeotech","RH_hk417sdacog","RH_hk417sdsp","RH_hk417sgl","RH_hk417sglaim",
"RH_hk417sgleotech","RH_hk417sglacog","RH_ctar21","RH_ctar21glacog","RH_ctar21m","RH_ctar21mgl","RH_star21","RH_mas","RH_masaim","RH_maseotech","RH_masacog",
"RH_massd","RH_massdaim","RH_massdeotech","RH_massdacog","RH_masb","RH_masbaim","RH_masbeotech","RH_masbacog","RH_masbsd","RH_masbsdaim","RH_masbsdeotech",
"RH_masbsdacog","RH_m14","RH_m14acog","RH_m14aim","RH_m14eot","RH_m21","RH_sc2","RH_sc2acog","RH_sc2aim","RH_sc2eot","RH_sc2shd","RH_sc2sp","RH_m1s","RH_m1sacog",
"RH_m1saim","RH_m1seot","RH_m1sshd","RH_m1ssp","RH_m1st","RH_m1stacog","RH_m1staim","RH_m1steot","RH_m1stshd","RH_m1stsp","vil_SR25","vil_M110","vil_HK417s",
"vil_SR25SD","vil_M110sd","vil_M21G","vil_M14G","SCAR_L_CQC","SCAR_L_CQC_Holo","SCAR_L_STD_Mk4CQT","SCAR_L_STD_EGLM_RCO","SCAR_L_CQC_EGLM_Holo","SCAR_L_STD_HOLO",
"SCAR_L_CQC_CCO_SD","SCAR_H_CQC_CCO","SCAR_H_CQC_CCO_SD","SCAR_H_STD_EGLM_Spect","SCAR_H_LNG_Sniper","SCAR_H_LNG_Sniper_SD","FHQ_ACR_WDL_IRN","FHQ_ACR_WDL_IRN_F",
"FHQ_ACR_WDL_IRN_GL","FHQ_ACR_WDL_IRN_GL_F","FHQ_ACR_WDL_CCO","FHQ_ACR_WDL_CCO_F","FHQ_ACR_WDL_CCO_GL","FHQ_ACR_WDL_CCO_GL_F","FHQ_ACR_WDL_RCO","FHQ_ACR_WDL_RCO_F",
"FHQ_ACR_WDL_RCO_GL","FHQ_ACR_WDL_RCO_GL_F","FHQ_ACR_WDL_HWS","FHQ_ACR_WDL_HWS_F","FHQ_ACR_WDL_HWS_GL","FHQ_ACR_WDL_HWS_GL_F","FHQ_ACR_WDL_G33","FHQ_ACR_WDL_G33_F",
"FHQ_ACR_WDL_G33_GL","FHQ_ACR_WDL_G33_GL_F","FHQ_ACR_WDL_HAMR","FHQ_ACR_WDL_HAMR_F","FHQ_ACR_WDL_HAMR_GL","FHQ_ACR_WDL_HAMR_GL_F","FHQ_ACR_BLK_IRN","FHQ_ACR_BLK_IRN_F",
"FHQ_ACR_BLK_IRN_GL","FHQ_ACR_BLK_IRN_GL_F","FHQ_ACR_BLK_CCO","FHQ_ACR_BLK_CCO_F","FHQ_ACR_BLK_CCO_GL","FHQ_ACR_BLK_CCO_GL_F","FHQ_ACR_BLK_RCO","FHQ_ACR_BLK_RCO_F",
"FHQ_ACR_BLK_RCO_GL","FHQ_ACR_BLK_RCO_GL_F","FHQ_ACR_BLK_HWS","FHQ_ACR_BLK_HWS_F","FHQ_ACR_BLK_HWS_GL","FHQ_ACR_BLK_HWS_GL_F","FHQ_ACR_BLK_G33","FHQ_ACR_BLK_G33_F",
"FHQ_ACR_BLK_G33_GL","FHQ_ACR_BLK_G33_GL_F","FHQ_ACR_BLK_HAMR","FHQ_ACR_BLK_HAMR_F","FHQ_ACR_BLK_HAMR_GL","FHQ_ACR_BLK_HAMR_GL_F","FHQ_ACR_TAN_IRN","FHQ_ACR_TAN_IRN_F",
"FHQ_ACR_TAN_IRN_GL","FHQ_ACR_TAN_IRN_GL_F","FHQ_ACR_TAN_CCO","FHQ_ACR_TAN_CCO_F","FHQ_ACR_TAN_CCO_GL","FHQ_ACR_TAN_CCO_GL_F","FHQ_ACR_TAN_RCO","FHQ_ACR_TAN_RCO_F",
"FHQ_ACR_TAN_RCO_GL","FHQ_ACR_TAN_RCO_GL_F","FHQ_ACR_TAN_HWS","FHQ_ACR_TAN_HWS_F","FHQ_ACR_TAN_HWS_GL","FHQ_ACR_TAN_HWS_GL_F","FHQ_ACR_TAN_G33","FHQ_ACR_TAN_G33_F",
"FHQ_ACR_TAN_G33_GL","FHQ_ACR_TAN_G33_GL_F","FHQ_ACR_TAN_HAMR","FHQ_ACR_TAN_HAMR_F","FHQ_ACR_TAN_HAMR_GL","FHQ_ACR_TAN_HAMR_GL_F","FHQ_ACR_SNW_IRN","FHQ_ACR_SNW_IRN_F",
"FHQ_ACR_SNW_IRN_GL","FHQ_ACR_SNW_IRN_GL_F","FHQ_ACR_SNW_CCO","FHQ_ACR_SNW_CCO_F","FHQ_ACR_SNW_CCO_GL","FHQ_ACR_SNW_CCO_GL_F","FHQ_ACR_SNW_RCO","FHQ_ACR_SNW_RCO_F",
"FHQ_ACR_SNW_RCO_GL","FHQ_ACR_SNW_RCO_GL_F","FHQ_ACR_SNW_HWS","FHQ_ACR_SNW_HWS_F","FHQ_ACR_SNW_HWS_GL","FHQ_ACR_SNW_HWS_GL_F","FHQ_ACR_SNW_G33","FHQ_ACR_SNW_G33_F",
"FHQ_ACR_SNW_G33_GL","FHQ_ACR_SNW_G33_GL_F","FHQ_ACR_SNW_HAMR","FHQ_ACR_SNW_HAMR_F","FHQ_ACR_SNW_HAMR_GL","FHQ_ACR_SNW_HAMR_GL_F","FHQ_ACR_WDL_IRN_SD","FHQ_ACR_WDL_IRN_SD_F",
"FHQ_ACR_WDL_IRN_GL_SD","FHQ_ACR_WDL_IRN_GL_SD_F","FHQ_ACR_WDL_CCO_SD","FHQ_ACR_WDL_CCO_SD_F","FHQ_ACR_WDL_CCO_GL_SD","FHQ_ACR_WDL_CCO_GL_SD_F","FHQ_ACR_WDL_RCO_SD",
"FHQ_ACR_WDL_RCO_SD_F","FHQ_ACR_WDL_RCO_GL_SD","FHQ_ACR_WDL_RCO_GL_SD_F","FHQ_ACR_WDL_HWS_SD","FHQ_ACR_WDL_HWS_SD_F","FHQ_ACR_WDL_HWS_GL_SD","FHQ_ACR_WDL_HWS_GL_SD_F",
"FHQ_ACR_WDL_G33_SD","FHQ_ACR_WDL_G33_SD_F","FHQ_ACR_WDL_G33_GL_SD","FHQ_ACR_WDL_G33_GL_SD_F","FHQ_ACR_WDL_HAMR_SD","FHQ_ACR_WDL_HAMR_SD_F","FHQ_ACR_WDL_HAMR_GL_SD",
"FHQ_ACR_WDL_HAMR_GL_SD_F","FHQ_ACR_BLK_IRN_SD","FHQ_ACR_BLK_IRN_SD_F","FHQ_ACR_BLK_IRN_GL_SD","FHQ_ACR_BLK_IRN_GL_SD_F","FHQ_ACR_BLK_CCO_SD","FHQ_ACR_BLK_CCO_SD_F",
"FHQ_ACR_BLK_CCO_GL_SD","FHQ_ACR_BLK_CCO_GL_SD_F","FHQ_ACR_BLK_RCO_SD","FHQ_ACR_BLK_RCO_SD_F","FHQ_ACR_BLK_RCO_GL_SD","FHQ_ACR_BLK_RCO_GL_SD_F","FHQ_ACR_BLK_HWS_SD",
"FHQ_ACR_BLK_HWS_SD_F","FHQ_ACR_BLK_HWS_GL_SD","FHQ_ACR_BLK_HWS_GL_SD_F","FHQ_ACR_BLK_G33_SD","FHQ_ACR_BLK_G33_SD_F","FHQ_ACR_BLK_G33_GL_SD","FHQ_ACR_BLK_G33_GL_SD_F",
"FHQ_ACR_BLK_HAMR_SD","FHQ_ACR_BLK_HAMR_SD_F","FHQ_ACR_BLK_HAMR_GL_SD","FHQ_ACR_BLK_HAMR_GL_SD_F","FHQ_ACR_TAN_IRN_SD","FHQ_ACR_TAN_IRN_SD_F","FHQ_ACR_TAN_IRN_GL_SD",
"FHQ_ACR_TAN_IRN_GL_SD_F","FHQ_ACR_TAN_CCO_SD","FHQ_ACR_TAN_CCO_SD_F","FHQ_ACR_TAN_CCO_GL_SD","FHQ_ACR_TAN_CCO_GL_SD_F","FHQ_ACR_TAN_RCO_SD","FHQ_ACR_TAN_RCO_SD_F",
"FHQ_ACR_TAN_RCO_GL_SD","FHQ_ACR_TAN_RCO_GL_SD_F","FHQ_ACR_TAN_HWS_SD","FHQ_ACR_TAN_HWS_SD_F","FHQ_ACR_TAN_HWS_GL_SD","FHQ_ACR_TAN_HWS_GL_SD_F","FHQ_ACR_TAN_G33_SD",
"FHQ_ACR_TAN_G33_SD_F","FHQ_ACR_TAN_G33_GL_SD","FHQ_ACR_TAN_G33_GL_SD_F","FHQ_ACR_TAN_HAMR_SD","FHQ_ACR_TAN_HAMR_SD_F","FHQ_ACR_TAN_HAMR_GL_SD","FHQ_ACR_TAN_HAMR_GL_SD_F",
"FHQ_ACR_SNW_IRN_SD","FHQ_ACR_SNW_IRN_SD_F","FHQ_ACR_SNW_IRN_GL_SD","FHQ_ACR_SNW_IRN_GL_SD_F","FHQ_ACR_SNW_CCO_SD","FHQ_ACR_SNW_CCO_SD_F","FHQ_ACR_SNW_CCO_GL_SD",
"FHQ_ACR_SNW_CCO_GL_SD_F","FHQ_ACR_SNW_RCO_SD","FHQ_ACR_SNW_RCO_SD_F","FHQ_ACR_SNW_RCO_GL_SD","FHQ_ACR_SNW_RCO_GL_SD_F","FHQ_ACR_SNW_HWS_SD","FHQ_ACR_SNW_HWS_SD_F",
"FHQ_ACR_SNW_HWS_GL_SD","FHQ_ACR_SNW_HWS_GL_SD_F","FHQ_ACR_SNW_G33_SD","FHQ_ACR_SNW_G33_SD_F","FHQ_ACR_SNW_G33_GL_SD","FHQ_ACR_SNW_G33_GL_SD_F","FHQ_ACR_SNW_HAMR_SD",
"FHQ_ACR_SNW_HAMR_SD_F","FHQ_ACR_SNW_HAMR_GL_SD","FHQ_ACR_SNW_HAMR_GL_SD_F","FHQ_MSR_DESERT","FHQ_MSR_SD_DESERT","FHQ_MSR_NV_DESERT","FHQ_MSR_NV_SD_DESERT","FHQ_RSASS_TAN",
"FHQ_RSASS_SD_TAN","FHQ_XM2010_DESERT","FHQ_XM2010_SD_DESERT","FHQ_XM2010_NV_DESERT","FHQ_XM2010_NV_SD_DESERT","vil_SVD_63","vil_SVD_N","vil_SVD_S","vil_SVD_M","vil_SVD_P21",
"vil_SVDK","vil_SV_98","vil_SV_98_69","vil_SV_98_SD","gms_k98","gms_k98_rg","gms_k98_knife","gms_k98zf39","vil_G3a3","vil_G3a2","vil_G3a4","vil_G3a4b","vil_G3an","vil_G3anb",
"vil_G3ZF","vil_G3zfb","vil_G3SG1","vil_G3sg1b","vil_G3TGS","vil_G3TGSb","vil_AG3","vil_AG3EOT","vil_PKP","vil_PKP_EOT","vil_PKP_N","vil_PK","vil_zastava_m84","vil_PKM",
"vil_RPK","vil_RPK75","vil_RPK75_Romania","vil_RPK75_M72","vil_RPD","vil_RPK74","vil_RPK74M_P29","vil_RPK74M","skavil_M60","skavil_M60e3","vil_Mg3","vil_M249_Para","vil_Minimi",
"vil_FnMag","vil_M240_B","vil_MG4","vil_MG4E","vil_VAL","vil_VAL_C","vil_Vikhr","vil_9a91","vil_9a91_c","vil_9a91_csd","vil_vsk94","vil_Groza_HG","vil_Groza_SC","vil_Groza_GL",
"vil_Groza_SD","vil_AKS_47","vil_AK_47_49","vil_AK_47","vil_AKMSB","vil_AKM","vil_AKM_GL","vil_AKMS","vil_AKMS_GP25","vil_AK_47_m1","vil_AK_nato_m1","vil_M70","vil_M70B",
"vil_M64","vil_ASH82","vil_AMD","vil_AMD63","vil_PMI","vil_PMIS","vil_MPi","vil_AK_nato_m80","vil_AKs_74_u","vil_AKs_74_u45","Vil_AKS_74_UN_kobra","Vil_AKS_74_UB","vil_AK_74",
"vil_AK_74_gp","vil_AK_74_N","vil_AKS_74","vil_AKS_74_gp","vil_AKS_74p","vil_AKS_74p_45","vil_AK_74P","vil_AKS_74p_gp","vil_AK_74m","vil_AK_74M_PSO","vil_AK_74m_k",
"vil_AK_74m_EOT","vil_AK_74m_EOT_Alfa","vil_AK_74m_EOT_FSB","vil_AK_74m_EOT_FSB_45","vil_AK_74m_EOT_FSB_60","vil_AK_74m_c","vil_AK_74m_p29","vil_AK_74m_gp_29","vil_AK_74m_gp",
"vil_PMI74S","vil_AK_101","vil_AK_103","vil_AK_105","Vil_AK_105_c","vil_AK_107","Vil_AK_107_c","vil_Abakan","vil_Abakan_gp","vil_Abakan_P29","vil_ak12","vil_ak12_ap",
"vil_ak12_gp","vil_AEK1","vil_AEK2","vil_AEK_GL","vil_AeK_3","vil_AeK_23","vil_AeK_3_K","vil_G36KVA4","vil_G36KA4","vil_G36E","vil_G36a2","vil_AG36","vil_AG36A2","vil_AG36KV",
"vil_AG36KA4","vil_G36VA4","vil_G36VA4Eot","vil_G36KVZ","vil_G36KSK","vil_G36KSKdes","vil_G36KSKdesES","vil_G36CC","vil_G36KSKES","vil_G36KES","vil_G36KV3","vil_G36KV3Des",
"vil_SKS","vil_Galil","vil_Galil_arm"];

_miscItems1 = ["1Rnd_SmokeGreen_M203","1Rnd_SmokeRed_M203","1Rnd_Smoke_M203","1Rnd_SmokeYellow_M203","FlareWhite_M203","1Rnd_SmokeRed_GP25","FlareGreen_GP25",
				"FlareWhite_GP25","FlareRed_GP25","FlareYellow_GP25","1Rnd_Smoke_GP25","1Rnd_SmokeGreen_GP25","1Rnd_SmokeYellow_GP25","FlareGreen_M203","FlareRed_M203",
				"FlareYellow_M203","HandGrenade","HandGrenade_west","HandRoadFlare","PipeBomb","M136","5Rnd_127x99_AS50","ItemDomeTent"];

_miscItems2 = ["Binocular","Binocular_Vector","NVGoggles","ItemCompass","ItemMachete","ItemRadio","Laserdesignator","ItemGps","ItemWatch","ItemKnife","ItemMatchbox","ItemEtool"];
				
	// Random 6 weapons, 1 of each with 4 magazines each
	for "_x" from 0 to 5 do {
		_weapon = _allWeapons call BIS_fnc_selectRandom;
		if (_weapon !="") then
		{
			_magazine = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
			_crateHeavy addWeaponCargoGlobal [_weapon, 1];			
			_crateHeavy addMagazineCargoGlobal [_magazine, 4];
		};
	};
	// Random 4 items, 3 of each
	for "_x" from 0 to 3 do {
		_miscItem11 = _miscItems1 call BIS_fnc_selectRandom;
		_crateHeavy addMagazineCargoGlobal [_miscItem11, 3];
	};	
	// Random 2 items, 1 of each
		for "_x" from 0 to 1 do {
		_miscItem22 = _miscItems2 call BIS_fnc_selectRandom;
		_crateHeavy addWeaponCargoGlobal [_miscItem22, 1];
	};