
instance STT_328_Schatten(Npc_Default)
{
	name[0] = "Сэм";
	npcType = npctype_main;
	guild = GIL_STT;
	level = 5;
	voice = 19;
	id = 328;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",7,2,stt_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_Short_02);
	EquipItem(self,ItRw_Bow_Small_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = rtn_prestart_328;
};


func void rtn_prestart_328()
{
	TA_Sleep(23,55,6,0,"OCR_HUT_22");
	TA_StandAround(6,0,15,30,"OCR_ARENA_TO_SMITH");
	TA_Boss(15,30,23,55,"OCR_ARENA_01");
};

func void Rtn_start_328()
{
	TA_Sleep(23,55,7,0,"OCR_HUT_22");
	TA_SitAround(7,0,11,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_RoastScavenger(11,0,13,0,"OCR_OUTSIDE_ARENA_01");
	TA_StandAround(13,0,15,30,"OCR_ARENA_01");
	TA_Boss(15,30,23,55,"OCR_ARENA_01");
};

func void rtn_noarena_328()
{
	TA_Sleep(23,5,7,0,"OCR_HUT_22");
	TA_SitAround(7,0,11,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_RoastScavenger(11,0,17,30,"OCR_OUTSIDE_ARENA_01");
	TA_SitAround(17,30,23,5,"OCR_OUTSIDE_ARENA_HANGAROUND");
};

func void info_sam_back()
{
	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Я передумал.
	Info_ClearChoices(DIA_Scatty_WannaBet);
};


instance DIA_Scatty_WannaBet(C_Info)
{
	npc = STT_328_Schatten;
	nr = 1;
	condition = DIA_Scatty_WannaBet_Condition;
	information = DIA_Scatty_WannaBet_Info;
	permanent = 1;
	description = "Я хочу сделать ставку.";
};


func int DIA_Scatty_WannaBet_Condition()
{
	if((Kapitel < 4) && (ARENA_BET_KIRGO == FALSE) && (ARENA_BET_KHARIM == FALSE) && (ARENA_BET_GORHANIS == FALSE) && !Npc_IsDead(Tpl_1422_GorHanis) && !Npc_IsDead(GRD_251_Kirgo) && !Npc_IsDead(Sld_729_Kharim))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaBet_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00");	//Я хочу сделать ставку.
	if(ARENA_BET_DAY == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Sam_15");	//Приходи завтра вечером.
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(19,10,22,52))
	{
		Info_ClearChoices(DIA_Scatty_WannaBet);
		Info_AddChoice(DIA_Scatty_WannaBet,DIALOG_BACK,info_sam_back);
		if(Wld_IsTime(19,10,20,13))
		{
			AI_Output(self,other,"DIA_Sam_11");	//Но не более одной ставки за вечер.
			Info_AddChoice(DIA_Scatty_WannaBet,"Кирго (ставка: 50, выигрыш: 100).",dia_scatty_arenabet_kirgo);
			Info_AddChoice(DIA_Scatty_WannaBet,"Карим (ставка: 30, выигрыш: 30).",dia_scatty_arenabet_kharim);
		}
		else if(Wld_IsTime(20,20,21,35))
		{
			AI_Output(self,other,"DIA_Sam_11");	//Но не более одной ставки за вечер.
			Info_AddChoice(DIA_Scatty_WannaBet,"Кирго (ставка: 50, выигрыш: 100).",dia_scatty_arenabet_kirgo);
			Info_AddChoice(DIA_Scatty_WannaBet,"Гор Ханис (ставка: 15, выигрыш: 10).",dia_scatty_arenabet_gorhanis);
		}
		else if(Wld_IsTime(21,40,22,52))
		{
			AI_Output(self,other,"DIA_Sam_11");	//Но не более одной ставки за вечер.
			Info_AddChoice(DIA_Scatty_WannaBet,"Карим (ставка: 30, выигрыш: 30).",dia_scatty_arenabet_kharim);
			Info_AddChoice(DIA_Scatty_WannaBet,"Гор Ханис (ставка: 15, выигрыш: 10).",dia_scatty_arenabet_gorhanis);
		}
		else
		{
			AI_Output(self,other,"DIA_Sam_05");	//Приходи вечером, когда все соберутся.
		};
	}
	else if(Wld_IsTime(22,52,23,59))
	{
		AI_Output(self,other,"DIA_Sam_06");	//Сегодняшний бой уже закончился. Приходи завтра вечером.
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_05");	//Приходи вечером, когда все соберутся.
	};
};

func void dia_scatty_arenabet_kirgo()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		b_printtrademsg1("Отдано руды: 50");
		Npc_RemoveInvItems(hero,ItMiNugget,50);
		AI_Output(self,other,"DIA_Sam_10");	//Так, а теперь посмотрим, кто кого!
		AI_TurnToNPC(self,GRD_251_Kirgo);
		B_ClearImmortal(GRD_251_Kirgo);
		B_ClearImmortal(Sld_729_Kharim);
		B_ClearImmortal(Tpl_1422_GorHanis);
		Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
		Kharim = Hlp_GetNpc(Sld_729_Kharim);
		GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
		Kirgo.attribute[ATR_HITPOINTS] = 2000;
		Kirgo.attribute[ATR_HITPOINTS_MAX] = 2000;
		Kharim.attribute[ATR_HITPOINTS] = 1500;
		Kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
		GorHanis.attribute[ATR_HITPOINTS] = 1000;
		GorHanis.attribute[ATR_HITPOINTS_MAX] = 1000;
		ARENA_BET_DAY = Wld_GetDay();
		ARENA_BET_KIRGO = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_09");	//У тебя же нет столько!
	};
	Info_ClearChoices(DIA_Scatty_WannaBet);
};

func void dia_scatty_arenabet_kharim()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01");	//Предлагаю 30 кусков.
	if(Npc_HasItems(other,ItMiNugget) >= 30)
	{
		b_printtrademsg1("Отдано руды: 30");
		Npc_RemoveInvItems(hero,ItMiNugget,30);
		AI_Output(self,other,"DIA_Sam_10");	//Так, а теперь посмотрим, кто кого!
		AI_TurnToNPC(self,Sld_729_Kharim);
		B_ClearImmortal(GRD_251_Kirgo);
		B_ClearImmortal(Sld_729_Kharim);
		B_ClearImmortal(Tpl_1422_GorHanis);
		Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
		Kharim = Hlp_GetNpc(Sld_729_Kharim);
		GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
		Kirgo.attribute[ATR_HITPOINTS] = 2000;
		Kirgo.attribute[ATR_HITPOINTS_MAX] = 2000;
		Kharim.attribute[ATR_HITPOINTS] = 1500;
		Kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
		GorHanis.attribute[ATR_HITPOINTS] = 1000;
		GorHanis.attribute[ATR_HITPOINTS_MAX] = 1000;
		ARENA_BET_DAY = Wld_GetDay();
		ARENA_BET_KHARIM = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_09");	//У тебя же нет столько!
	};
	Info_ClearChoices(DIA_Scatty_WannaBet);
};

func void dia_scatty_arenabet_gorhanis()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	if(Npc_HasItems(other,ItMiNugget) >= 15)
	{
		b_printtrademsg1("Отдано руды: 15");
		Npc_RemoveInvItems(hero,ItMiNugget,15);
		AI_Output(self,other,"DIA_Sam_10");	//Так, а теперь посмотрим, кто кого!
		AI_TurnToNPC(self,Tpl_1422_GorHanis);
		B_ClearImmortal(GRD_251_Kirgo);
		B_ClearImmortal(Sld_729_Kharim);
		B_ClearImmortal(Tpl_1422_GorHanis);
		Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
		Kharim = Hlp_GetNpc(Sld_729_Kharim);
		GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
		Kirgo.attribute[ATR_HITPOINTS] = 2000;
		Kirgo.attribute[ATR_HITPOINTS_MAX] = 2000;
		Kharim.attribute[ATR_HITPOINTS] = 1500;
		Kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
		GorHanis.attribute[ATR_HITPOINTS] = 1000;
		GorHanis.attribute[ATR_HITPOINTS_MAX] = 1000;
		ARENA_BET_DAY = Wld_GetDay();
		ARENA_BET_GORHANIS = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_09");	//У тебя же нет столько!
	};
	Info_ClearChoices(DIA_Scatty_WannaBet);
};


instance DIA_SCATTY_BETRESULT(C_Info)
{
	npc = STT_328_Schatten;
	nr = 1;
	condition = dia_scatty_betresult_condition;
	information = dia_scatty_betresult_info;
	permanent = 1;
	important = 1;
};


func int dia_scatty_betresult_condition()
{
	if((Kapitel < 4) && ((ARENA_BET_KIRGO_WON == TRUE) || (ARENA_BET_KHARIM_WON == TRUE) || (ARENA_BET_GORHANIS_WON == TRUE)) && !Npc_IsDead(Tpl_1422_GorHanis) && !Npc_IsDead(GRD_251_Kirgo) && !Npc_IsDead(Sld_729_Kharim) && (ARENA_BET_DAY == Wld_GetDay()))
	{
		return 1;
	};
};

func void dia_scatty_betresult_info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	if(ARENA_BET_KIRGO == TRUE)
	{
		if(ARENA_BET_KIRGO_WON == TRUE)
		{
			AI_Output(self,other,"DIA_Sam_08");	//Хороший бой. Поздравляю, держи свой выигрыш.
			b_printtrademsg1("Получено руды: 150");
			CreateInvItems(hero,ItMiNugget,150);
		}
		else
		{
			AI_Output(self,other,"DIA_Sam_07");	//Эх, не повезло! Ничего, попробуешь завтра...
		};
	};
	if(ARENA_BET_KHARIM == TRUE)
	{
		if(ARENA_BET_KHARIM_WON == TRUE)
		{
			AI_Output(self,other,"DIA_Sam_08");	//Хороший бой. Поздравляю, держи свой выигрыш.
			b_printtrademsg1("Получено руды: 60");
			CreateInvItems(hero,ItMiNugget,60);
		}
		else
		{
			AI_Output(self,other,"DIA_Sam_07");	//Эх, не повезло! Ничего, попробуешь завтра...
		};
	};
	if(ARENA_BET_GORHANIS == TRUE)
	{
		if(ARENA_BET_GORHANIS_WON == TRUE)
		{
			AI_Output(self,other,"DIA_Sam_08");	//Хороший бой. Поздравляю, держи свой выигрыш.
			b_printtrademsg1("Получено руды: 25");
			CreateInvItems(hero,ItMiNugget,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Sam_07");	//Эх, не повезло! Ничего, попробуешь завтра...
		};
	};
	ARENA_BET_KIRGO = FALSE;
	ARENA_BET_KHARIM = FALSE;
	ARENA_BET_GORHANIS = FALSE;
	ARENA_BET_KIRGO_WON = FALSE;
	ARENA_BET_KHARIM_WON = FALSE;
	ARENA_BET_GORHANIS_WON = FALSE;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	Npc_ExchangeRoutine(Kirgo,"START");
	Npc_ExchangeRoutine(Kharim,"START");
	Npc_ExchangeRoutine(GorHanis,"START");
	Kirgo.attribute[ATR_HITPOINTS] = 2000;
	Kirgo.attribute[ATR_HITPOINTS_MAX] = 2000;
	Kirgo.flags = NPC_FLAG_IMMORTAL;
	Kharim.attribute[ATR_HITPOINTS] = 1500;
	Kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
	Kharim.flags = NPC_FLAG_IMMORTAL;
	GorHanis.attribute[ATR_HITPOINTS] = 1000;
	GorHanis.attribute[ATR_HITPOINTS_MAX] = 1000;
	GorHanis.flags = NPC_FLAG_IMMORTAL;
	if(!Npc_HasItems(Kirgo,itmw_kirgo) && !Npc_HasItems(Kirgo,ItMw_1H_Sword_01))
	{
		CreateInvItem(Kirgo,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(Kirgo);
	};
	if(!Npc_HasItems(Kharim,itmw_kharim) && !Npc_HasItems(Kharim,ItMw_1H_Sword_01))
	{
		CreateInvItem(Kharim,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(Kharim);
	};
	if(!Npc_HasItems(GorHanis,itmw_gorhanis) && !Npc_HasItems(GorHanis,ItMw_1H_Sword_01))
	{
		CreateInvItem(GorHanis,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(GorHanis);
	};
	AI_StopProcessInfos(self);
};


instance DIA_SAM_HI(C_Info)
{
	npc = STT_328_Schatten;
	nr = 1;
	condition = dia_sam_hi_condition;
	information = dia_sam_hi_info;
	permanent = 0;
	important = 1;
};


func int dia_sam_hi_condition()
{
	if((Kapitel < 4) && !Npc_IsDead(Tpl_1422_GorHanis) && !Npc_IsDead(GRD_251_Kirgo) && !Npc_IsDead(Sld_729_Kharim))
	{
		return 1;
	};
};

func void dia_sam_hi_info()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_InArena) || Npc_KnowsInfo(hero,Info_Kharim_InArena) || Npc_KnowsInfo(hero,info_gorhanis_inarena))
	{
		AI_Output(self,other,"DIA_Sam_02");	//Привет! Видел тебя в бою - неплохие движения!
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_01");	//Погоди! Я тебя здесь раньше не видел.
	};
	AI_Output(self,other,"DIA_Sam_03");	//Меня зовут Сэм. Я организую ставки.
	AI_Output(self,other,"DIA_Sam_04");	//Каждый вечер на арене устраиваются бои, а рудокопы и Призраки ставят руду на любимых бойцов. Хочешь поучаствовать?
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05");	//А что для этого нужно сделать?
	AI_Output(self,other,"DIA_Sam_12");	//Приходи вечером, когда все соберутся. Дождешься выхода своего бойца и обратишься ко мне.
	AI_Output(self,other,"DIA_Sam_13");	//Я возьму твою руду и выплачу выигрыш, если твой боец останется стоять на ногах, хехе.
	AI_Output(self,other,"DIA_Sam_14");	//Но не более одной ставки за вечер! А то были тут у нас случаи...
	Npc_ExchangeRoutine(self,"START");
	ARENA_BET_DAY = Wld_GetDay() - 1;
};


instance DIA_SAM_WTF(C_Info)
{
	npc = STT_328_Schatten;
	nr = 1;
	condition = dia_sam_wtf_condition;
	information = dia_sam_wtf_info;
	permanent = 1;
	important = 1;
};


func int dia_sam_wtf_condition()
{
	if((Kapitel < 4) && (ARENA_BET_DAY < Wld_GetDay()) && ((ARENA_BET_KIRGO == TRUE) || (ARENA_BET_KHARIM == TRUE) || (ARENA_BET_GORHANIS == TRUE)))
	{
		return 1;
	};
};

func void dia_sam_wtf_info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(self,other,"DIA_Sam_16");	//Что же ты не дождался конца боя? Даже не думай, что я верну твою ставку!
	ARENA_BET_KIRGO = FALSE;
	ARENA_BET_KHARIM = FALSE;
	ARENA_BET_GORHANIS = FALSE;
	ARENA_BET_KIRGO_WON = FALSE;
	ARENA_BET_KHARIM_WON = FALSE;
	ARENA_BET_GORHANIS_WON = FALSE;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	B_ExchangeRoutine(Kirgo,"START");
	B_ExchangeRoutine(Kharim,"START");
	B_ExchangeRoutine(GorHanis,"START");
	Kirgo.attribute[ATR_HITPOINTS] = 2000;
	Kirgo.attribute[ATR_HITPOINTS_MAX] = 2000;
	Kirgo.flags = NPC_FLAG_IMMORTAL;
	Kharim.attribute[ATR_HITPOINTS] = 1500;
	Kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
	Kharim.flags = NPC_FLAG_IMMORTAL;
	GorHanis.attribute[ATR_HITPOINTS] = 1000;
	GorHanis.attribute[ATR_HITPOINTS_MAX] = 1000;
	GorHanis.flags = NPC_FLAG_IMMORTAL;
	if(!Npc_HasItems(Kirgo,itmw_kirgo) && !Npc_HasItems(Kirgo,ItMw_1H_Sword_01))
	{
		CreateInvItem(Kirgo,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(Kirgo);
	};
	if(!Npc_HasItems(Kharim,itmw_kharim) && !Npc_HasItems(Kharim,ItMw_1H_Sword_01))
	{
		CreateInvItem(Kharim,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(Kharim);
	};
	if(!Npc_HasItems(GorHanis,itmw_gorhanis) && !Npc_HasItems(GorHanis,ItMw_1H_Sword_01))
	{
		CreateInvItem(GorHanis,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(GorHanis);
	};
	AI_StopProcessInfos(self);
};


instance INFO_SAM_EXIT(C_Info)
{
	npc = STT_328_Schatten;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

