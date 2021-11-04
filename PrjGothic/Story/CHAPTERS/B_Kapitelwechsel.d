
func void B_Kapitelwechsel(var int neues_Kapitel)
{
	var C_Npc YBerion;
	var C_Npc Templer;
	var C_Npc Templer_1;
	var C_Npc Novize;
	var C_Npc Novize_1;
	var C_Npc CorKalom;
	var C_Npc CorAngar;
	var C_Npc chani;
	var C_Npc natalia;
	var C_Npc guard;
	var C_Npc bloodwyn;
	Kapitel = neues_Kapitel;
	if(neues_Kapitel == 1)
	{
		PrintDebugNpc(PD_MISSION,"---=== ГЛАВА ПЕРВАЯ ===---");
		b_give_skipchapter1weapons();
		IntroduceChapter("Глава 1","Мир обреченных","chapter1.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 2)
	{
		PrintDebugNpc(PD_MISSION,"---=== ГЛАВА ВТОРАЯ ===---");
		B_Give_FiskChapter2Weapons();
		B_Give_DarrionChapter2Weapons();
		B_Give_SharkyChapter2Weapons();
		B_Give_BaalCadarChapter2Runes();
		B_Give_TorrezChapter2Runes();
		B_Give_CronosChapter2Runes();
		B_GiveRiordianChapter2Potions();
		B_Give_CavalornChapter2Weapons();
		B_Give_WolfChapter2Weapons();
		B_Give_SkipChapter2Weapons();
		b_give_fortunochapter2herbs();
		if(!Npc_IsDead(ORG_826_Mordrag))
		{
			b_give_mordragchapter2crap();
		};
		if(Npc_HasItems(KDW_604_Cronos,ItArScrollSleep))
		{
			Npc_RemoveInvItems(KDW_604_Cronos,ItArScrollSleep,1);
		};
		b_give_silaschapter2food();
		b_give_cipherchapter2crap();
		b_give_gornchapter2crap();
		b_give_bartholochapter2food();
		B_Story_RespawnOW();
		B_InsertInExtremo();
		B_ExchangeRoutine(VLK_572_Gravo,"WATCH");
		IntroduceChapter("Глава 2","Логово ползунов","chapter2.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 3)
	{
		PrintDebugNpc(PD_MISSION,"---=== ГЛАВА ТРЕТЬЯ ===---");
		YBerion = Hlp_GetNpc(GUR_1200_YBerion);
		AI_Teleport(YBerion,"PSI_TEST");
		Npc_ExchangeRoutine(YBerion,"DEAD");
		AI_ContinueRoutine(YBerion);
		YBerion.flags = 0;
		Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,-YBerion.attribute[ATR_HITPOINTS_MAX] + 201);
		YBerion.flags = NPC_FLAG_IMMORTAL;
		B_InExtremoStopMusic();
		B_KillInExtremo();
		B_ExchangeRoutine(VLK_572_Gravo,"START");
		B_ExchangeRoutine(gur_999_baallukor,"remove");
		B_ExchangeRoutine(TPL_1418_Templer,"remove");
		B_ExchangeRoutine(TPL_1412_Templer,"remove");
		B_ExchangeRoutine(TPL_1411_Templer,"remove");
		B_ExchangeRoutine(TPL_1414_Templer,"remove");
		B_ExchangeRoutine(TPL_1419_Templer,"remove");
		B_ExchangeRoutine(TPL_1402_GorNaToth,"train");
		if(Ghorim_KickHarlok == LOG_SUCCESS)
		{
			B_ExchangeRoutine(NOV_1358_Harlok,"ch2");
			B_ExchangeRoutine(NOV_1310_Ghorim,"ch2");
		};
		YBerion_BringFocus = LOG_SUCCESS;
		CorKalom_BringMCQBalls = LOG_SUCCESS;
		CorKalom_BringBook = LOG_SUCCESS;
		Log_CreateTopic(CH3_OrcGraveyard,LOG_MISSION);
		Log_SetTopicStatus(CH3_OrcGraveyard,LOG_RUNNING);
		B_LogEntry(CH3_OrcGraveyard,"Великая Церемония вызова Спящего прошла не так, как планировали Гуру. Мы увидели лишь нечеткое изображение орка и какой-то пещеры. Юберион, духовный Учитель Братства, не выдержал напряжения и потерял сознание! Сейчас он пытается прийти в себя в своих покоях, Кор Галом и Кор Ангар присматривают за ним.");
		B_Give_FiskChapter3Weapons();
		B_Give_DarrionChapter3Weapons();
		B_Give_SharkyChapter3Weapons();
		B_Give_BaalCadarChapter3Runes();
		B_Give_TorrezChapter3Runes();
		B_Give_CronosChapter3Runes();
		B_GiveRiordianChapter3Potions();
		B_Give_CavalornChapter3Weapons();
		B_Give_WolfChapter3Weapons();
		B_Give_SkipChapter3Weapons();
		b_give_fortunochapter3herbs();
		if(!Npc_IsDead(ORG_826_Mordrag))
		{
			b_give_mordragchapter3crap();
		};
		b_give_silaschapter3food();
		b_give_cipherchapter3crap();
		b_give_gornchapter3crap();
		b_give_bartholochapter3food();
		HANIS_CHARGED = FALSE;
		B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		if(!Npc_IsDead(Vlk_580_Grim))
		{
			Wld_InsertNpc(stt_594_grim,"OCR_HUT_2");
			B_ExchangeRoutine(Vlk_580_Grim,"REMOVE");
		};
		PlayVideo("GREATPRAYER.BIK");
		CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
		CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
		chani = Hlp_GetNpc(Gur_1205_Chani);
		natalia = Hlp_GetNpc(Gur_1207_Natalia);
		guard = Hlp_GetNpc(TPL_1406_Templer);
		AI_SetWalkMode(CorKalom,NPC_RUN);
		AI_SetWalkMode(CorAngar,NPC_RUN);
		AI_GotoWP(CorKalom,"PSI_TEMPLE_ROOMS_IN_02");
		AI_Wait(CorAngar,2);
		AI_GotoWP(CorAngar,"PSI_TEMPLE_ROOMS_IN_02");
		AI_Teleport(guard,"PSI_TEMPLE_ROOMS_03");
		Npc_ExchangeRoutine(guard,"CARE");
		AI_ContinueRoutine(guard);
		Npc_ExchangeRoutine(CorKalom,"CARE");
		Npc_ExchangeRoutine(CorAngar,"CARE");
		Npc_ExchangeRoutine(chani,"DEAD");
		Npc_ExchangeRoutine(natalia,"DEAD");
		AI_ContinueRoutine(CorKalom);
		AI_ContinueRoutine(CorAngar);
		AI_ContinueRoutine(chani);
		AI_ContinueRoutine(natalia);
		Templer = Hlp_GetNpc(TPL_1431_Templer);
		Templer.senses = hero.senses;
		Templer_1 = Hlp_GetNpc(TPL_1430_Templer);
		Templer_1.senses = hero.senses;
		Novize = Hlp_GetNpc(NOV_1319_Novize);
		Novize.senses = hero.senses;
		Novize_1 = Hlp_GetNpc(NOV_1320_Novize);
		Novize_1.senses = hero.senses;
		B_Story_RespawnOW();
		if(BaalIsidro_DealerJob != LOG_SUCCESS)
		{
			B_ExchangeRoutine(NOV_1333_BaalIsidro,"ch5");
			B_ExchangeRoutine(NOV_1308_Novize,"ch5");
			B_ExchangeRoutine(NOV_1332_BaalKagan,"ch5");
			B_ExchangeRoutine(ORG_806_Organisator,"ch5");
		};
		IntroduceChapter("Глава 3","Артефакты древней силы","chapter3.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 4)
	{
		PrintDebugNpc(PD_MISSION,"---=== ГЛАВА ЧЕТВЕРТАЯ ===---");
		B_ChangeGuild(VLK_511_Herek,GIL_VLK);
		B_ChangeGuild(STT_336_Cavalorn,GIL_None);
		B_Give_ScorpioChapter4Weapons();
		B_Give_DarrionChapter4Weapons();
		B_Give_SharkyChapter4Weapons();
		B_Give_BaalCadarChapter4Runes();
		B_Give_CronosChapter4Runes();
		B_GiveRiordianChapter4Potions();
		B_Give_CavalornChapter4Weapons();
		B_Give_WolfChapter4Weapons();
		b_give_fortunochapter4herbs();
		if(!Npc_IsDead(ORG_826_Mordrag))
		{
			b_give_mordragchapter4crap();
		};
		b_give_silaschapter4food();
		b_give_cipherchapter4crap();
		b_give_gornchapter4crap();
		Saturas_BringFoci = 5;
		CreateInvItem(hero,itarrune_1_4_teleport2);
		Log_CreateTopic(CH4_Firemages,LOG_MISSION);
		Log_SetTopicStatus(CH4_Firemages,LOG_RUNNING);
		B_LogEntry(CH4_Firemages,"Сатурас, глава магов Круга Воды, попросил меня о последней услуге. Чтобы взорвать рудную гору, ему потребуется помощь магов Огня из Старого лагеря. Я не знаю, удастся ли мне убедить их помочь Сатурасу, ведь им не выгодно разрушать Барьер. Так они потеряют всю свою власть. Но я постараюсь что-нибудь придумать.");
		B_ExchangeRoutine(Sld_700_Lee,"DAMNPAST");
		B_ExchangeRoutine(BAU_935_Homer,"DAMNPAST");
		B_ExchangeRoutine(BAU_924_Bauer,"START");
		B_ExchangeRoutine(BAU_928_Bauer,"START");
		B_ExchangeRoutine(BAU_929_Bauer,"START");
		B_ExchangeRoutine(BAU_930_Bauer,"START");
		oldHeroGuild = Npc_GetTrueGuild(hero);
		B_ExchangeRoutine(GRD_228_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_230_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_280_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_281_Gardist,"FMTaken");
		if(!Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack))
		{
			B_ExchangeRoutine(grd_896_gardist,"FMTaken");
			B_ExchangeRoutine(grd_895_gardist,"FMTaken");
			B_ExchangeRoutine(grd_894_gardist,"FMTaken");
			B_ExchangeRoutine(grd_893_gardist,"FMTaken");
			B_ExchangeRoutine(grd_872_gardist,"dead");
			B_KillNpc(grd_872_gardist);
		};
		B_ClearImmortal(GRD_228_Gardist);
		B_ClearImmortal(GRD_230_Gardist);
		B_ClearImmortal(GRD_280_Gardist);
		B_ClearImmortal(grd_998_gardist);
		B_ClearImmortal(GRD_251_Kirgo);
		B_KillNpc(KDF_400_Rodriguez);
		B_KillNpc(KDF_401_Damarok);
		B_KillNpc(Kdf_402_Corristo);
		B_KillNpc(KDF_403_Drago);
		Wld_InsertNpc(kdf_4051_torrez,"OC1");
		Npc_ChangeAttribute(kdf_4051_torrez,ATR_HITPOINTS,-111);
		B_ExchangeRoutine(GRD_224_Pacho,"fmtaken");
		B_ExchangeRoutine(VLK_520_Buddler,"fmtaken");
		B_ExchangeRoutine(VLK_534_Buddler,"fmtaken");
		B_ExchangeRoutine(KDF_400_Rodriguez,"dead");
		B_ExchangeRoutine(KDF_401_Damarok,"dead");
		B_ExchangeRoutine(Kdf_402_Corristo,"dead");
		B_ExchangeRoutine(KDF_403_Drago,"dead");
		B_ExchangeRoutine(KDF_405_Torrez,"dead");
		B_ExchangeRoutine(VLK_513_Buddler,"noarena");
		B_ExchangeRoutine(VLK_514_Buddler,"noarena");
		B_ExchangeRoutine(VLK_515_Buddler,"noarena");
		B_ExchangeRoutine(VLK_530_Guy,"noarena");
		B_ExchangeRoutine(STT_306_Schatten,"noarena");
		B_ExchangeRoutine(STT_316_Schatten,"noarena");
		B_ExchangeRoutine(STT_328_Schatten,"noarena");
		B_KillNpc(Nov_1330_BaalParvez);
		B_KillNpc(Nov_1331_BaalTaran);
		B_KillNpc(Tpl_1422_GorHanis);
		B_KillNpc(Sld_729_Kharim);
		B_ExchangeRoutine(Nov_1330_BaalParvez,"dead");
		B_ExchangeRoutine(Nov_1331_BaalTaran,"dead");
		B_ExchangeRoutine(Tpl_1422_GorHanis,"dead");
		B_ExchangeRoutine(Sld_729_Kharim,"dead");
		B_ExchangeRoutine(GRD_251_Kirgo,"FMTaken");
		B_ExchangeRoutine(grd_998_gardist,"aopen");
		if(!Npc_IsDead(Nov_1330_BaalParvez))
		{
			Npc_RemoveInvItems(Nov_1330_BaalParvez,ItMiNugget,Npc_HasItems(Nov_1330_BaalParvez,ItMiNugget));
			Npc_RemoveInvItem(Nov_1330_BaalParvez,ItMw_1H_Mace_04);
		};
		if(!Npc_IsDead(Nov_1331_BaalTaran))
		{
			Npc_RemoveInvItems(Nov_1331_BaalTaran,ItMiNugget,Npc_HasItems(Nov_1331_BaalTaran,ItMiNugget));
			Npc_RemoveInvItem(Nov_1331_BaalTaran,ItMw_1H_Axe_Old_01);
		};
		if(!Npc_IsDead(Tpl_1422_GorHanis))
		{
			Npc_RemoveInvItems(Tpl_1422_GorHanis,ItMiNugget,Npc_HasItems(Tpl_1422_GorHanis,ItMiNugget));
			Npc_RemoveInvItem(Tpl_1422_GorHanis,itmw_gorhanis);
		};
		if(!Npc_IsDead(Sld_729_Kharim))
		{
			Npc_RemoveInvItems(Sld_729_Kharim,ItMiNugget,Npc_HasItems(Sld_729_Kharim,ItMiNugget));
			Npc_RemoveInvItem(Sld_729_Kharim,itmw_kharim);
		};
		B_ExchangeRoutine(PC_Thief,"OCWait");
		B_ExchangeRoutine(PC_Mage,"OCWait");
		B_ExchangeRoutine(ORG_826_Mordrag,"START");
		B_ExchangeRoutine(EBR_105_Raven,"FLEE");
		B_ExchangeRoutine(GRD_200_Thorus,"FLEE");
		B_ExchangeRoutine(EBR_108_Velaya,"FLEE");
		B_ExchangeRoutine(EBR_109_Syra,"FLEE");
		B_ExchangeRoutine(EBR_110_Seraphia,"FLEE");
		B_ExchangeRoutine(STT_329_Dexter,"FLEE");
		B_ExchangeRoutine(Stt_311_Fisk,"FLEE");
		B_ExchangeRoutine(VLK_538_Huno,"FLEE");
		B_ExchangeRoutine(bloodwyn,"FLEE");
		B_ChangeGuild(PC_Thief,GIL_KDF);
		B_SetPermAttitude(PC_Thief,ATT_FRIENDLY);
		B_SetPermAttitude(PC_Mage,ATT_FRIENDLY);
		B_InitMonsterAttitudes();
		B_ExchangeRoutine(GRD_255_Fletcher,"FMTaken");
		B_ExchangeRoutine(GRD_252_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_253_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_244_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_214_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_215_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_208_Cutter,"FMTaken");
		B_ExchangeRoutine(GRD_232_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_229_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_216_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_217_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_275_Brueckenwache,"FMTaken");
		B_ExchangeRoutine(GRD_276_Brueckenwache,"FMTaken");
		B_ExchangeRoutine(ORG_818_Ratford,"FMTaken");
		B_ExchangeRoutine(ORG_819_Drax,"FMTaken");
		if(GATE_D04_STATE == 0)
		{
			Wld_SendTrigger("AM_GATE");
			GATE_D04_STATE = 1;
		};
		if(GATE_01_STATE == 0)
		{
			Wld_SendTrigger("EVT_OW_STARTLOCKOUT_MOVER");
			GATE_01_STATE = 1;
		};
		if(GATE_02_STATE == 0)
		{
			Wld_SendTrigger("EVT_OC_MAINGATE01_01");
			GATE_02_STATE = 1;
		};
		if(GATE_03_STATE == 0)
		{
			Wld_SendTrigger("EVT_OC_MAINGATE02_02");
			GATE_03_STATE = 1;
		};
		if(GATE_04_STATE == 0)
		{
			Wld_SendTrigger("EVT_OC_INNERMAINGATE");
			GATE_04_STATE = 1;
		};
		if(GATE_07_STATE == 0)
		{
			Wld_SendTrigger("EVT_AM_LOB_GATE_BIG");
			GATE_07_STATE = 1;
		};
		if(!Npc_IsDead(VLK_582_Melvin))
		{
			Wld_InsertNpc(nov_1373_melvin,"PSI_12_HUT_EX_TEACH");
			B_ExchangeRoutine(VLK_582_Melvin,"REMOVE");
		};
		if((GETNEWGUY_DUSTY_JOINED == TRUE) && !Npc_IsDead(VLK_524_Dusty))
		{
			Wld_InsertNpc(nov_1372_dusty,"PSI_25_HUT_IN");
			B_ExchangeRoutine(VLK_524_Dusty,"REMOVE");
		}
		else
		{
			B_KillNpc(VLK_524_Dusty);
			B_ExchangeRoutine(VLK_524_Dusty,"dead");
		};
		B_Story_RespawnOW();
		B_ExchangeRoutine(Gur_1205_Chani,"wash");
		B_ExchangeRoutine(Gur_1207_Natalia,"wash");
		IntroduceChapter("Глава 4","Ксардас","chapter4.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 5)
	{
		PrintDebugNpc(PD_MISSION,"---=== ГЛАВА ПЯТАЯ ===---");
		B_Give_ScorpioChapter5Weapons();
		B_Give_DarrionChapter5Weapons();
		B_Give_SharkyChapter5Weapons();
		B_Give_XardasChapter5Runes();
		B_Give_CavalornChapter5Weapons();
		B_Give_WolfChapter5Weapons();
		B_Give_CronosChapter5Runes();
		b_give_fortunochapter5herbs();
		if(!Npc_IsDead(ORG_826_Mordrag))
		{
			b_give_mordragchapter5crap();
		};
		b_give_silaschapter5food();
		b_give_cipherchapter5crap();
		B_GiveRiordianChapter5Potions();
		b_give_gornchapter5crap();
		B_ExchangeRoutine(TPL_1405_GorNaRan,"Remove");
		B_LogEntry(CH4_EnterTemple,"Горн сомневается, что Улу-Мулу поможет мне пройти в город орков. Так или иначе, скоро я узнаю насколько он прав!");
		B_Story_RespawnOW();
		IntroduceChapter("Глава 5","Хранители порталов","chapter5.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 6)
	{
		PrintDebugNpc(PD_MISSION,"---=== ГЛАВА ШЕСТАЯ ===---");
		B_Give_ScorpioChapter6Weapons();
		B_Give_DarrionChapter6Weapons();
		B_Give_SharkyChapter6Weapons();
		B_Give_CavalornChapter6Weapons();
		B_Give_WolfChapter6Weapons();
		PlayVideo("OREHEAP.BIK");
		Npc_RemoveInvItem(hero,Mythrilklinge01);
		CreateInvItem(hero,Mythrilklinge02);
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Haste_01,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Haste_01));
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Haste_02,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Haste_02));
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Haste_03,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Haste_03));
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Health_01,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Health_01));
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Health_02,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Health_02));
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Health_03,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Health_03));
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Mana_01,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Mana_01));
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Mana_02,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Mana_02));
		Npc_RemoveInvItems(KDW_604_Cronos,ItFo_Potion_Mana_03,Npc_HasItems(KDW_604_Cronos,ItFo_Potion_Mana_03));
		Npc_RemoveInvItems(KDW_604_Cronos,ItMiNugget,Npc_HasItems(KDW_604_Cronos,ItMiNugget));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Haste_01,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Haste_01));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Haste_02,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Haste_02));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Haste_03,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Haste_03));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Health_01,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Health_01));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Health_02,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Health_02));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Health_03,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Health_03));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Mana_01,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Mana_01));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Mana_02,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Mana_02));
		Npc_RemoveInvItems(KDW_605_Riordian,ItFo_Potion_Mana_03,Npc_HasItems(KDW_605_Riordian,ItFo_Potion_Mana_03));
		Npc_RemoveInvItems(KDW_605_Riordian,ItMiNugget,Npc_HasItems(KDW_605_Riordian,ItMiNugget));
		IntroduceChapter("Глава 6","Храм Спящего","chapter6.tga","levelup.wav",6000);
	};
};

func int C_IsChapter(var int chapter)
{
	if(Kapitel == chapter)
	{
		return TRUE;
	};
	return 0;
};

