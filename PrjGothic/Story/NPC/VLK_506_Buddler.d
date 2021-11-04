
instance VLK_506_Buddler(Npc_Default)
{
	name[0] = "Грант";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 5;
	voice = 19;
	id = 506;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",69,1,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItFoBeer);
	daily_routine = Rtn_start_506;
};


func void Rtn_start_506()
{
	TA_Sleep(23,0,6,30,"OCR_HUT_15");
	TA_StandAround(6,30,11,0,"OCR_OUTSIDE_HUT_15");
	TA_RepairHut(11,0,17,0,"OCR_HUT_15");
	TA_SitCampfire(17,0,23,0,"OCR_OUTSIDE_HUT_15");
};

func void rtn_letterwait_506()
{
	TA_Stay(23,0,6,30,"OCR_NORTHGATE_RAMP_ATOP");
	TA_Stay(6,30,23,0,"OCR_NORTHGATE_RAMP_ATOP");
};

func void rtn_guide_506()
{
	TA_GuidePC(23,0,6,30,"OC_ROUND_27");
	TA_GuidePC(6,30,23,0,"OC_ROUND_27");
};


instance INFO_VLK506_EXIT(C_Info)
{
	npc = VLK_506_Buddler;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance DIA_VLK506_HI(C_Info)
{
	npc = VLK_506_Buddler;
	nr = 1;
	condition = dia_vlk506_hi_condition;
	information = dia_vlk506_hi_info;
	permanent = 0;
	important = 1;
};


func int dia_vlk506_hi_condition()
{
	if((LETTER_TOLD > 1) && (Kapitel < 4) && !Npc_KnowsInfo(hero,dia_vlk505_hi))
	{
		return 1;
	};
};

func void dia_vlk506_hi_info()
{
	AI_Output(self,other,"DIA_LetterFight_01");	//Иди сюда! Быстрее!
	AI_Output(hero,self,"Info_Grd_212_FirstWarn_Info_15_02");	//В чем дело?
	if(Sly_LostNek == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_LetterFight_02");	//Это Нек, они нашли его! Идем за мной, я покажу!
	}
	else if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_LetterFight_03");	//Я слышал, что ты ищешь рецепт для Декстера. Я могу помочь тебе, идем за мной!
	}
	else
	{
		AI_Output(self,other,"DIA_LetterFight_04");	//Мне нужна твоя помощь! Иди за мной, пожалуйста!
	};
	Npc_ExchangeRoutine(VLK_505_Buddler,"start");
	Info_ClearChoices(dia_vlk506_hi);
	Info_AddChoice(dia_vlk506_hi,"Ладно. Пойдем.",dia_vlk506_hi_yes);
	Info_AddChoice(dia_vlk506_hi,"Мне это не нужно!",dia_vlk506_hi_no);
};

func void dia_vlk506_hi_yes()
{
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03");	//Ладно. Пойдем.
	Npc_ExchangeRoutine(self,"guide");
	AI_StopProcessInfos(self);
};

func void dia_vlk506_hi_no()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_01");	//Мне это не нужно!
	AI_Output(self,other,"DIA_LetterFight_05");	//Так, ладно... Здесь слухи расходятся быстро: я знаю, что у тебя есть письмо для магов! Отдай его мне!
	self.guild = GIL_None;
	Npc_SetTrueGuild(self,GIL_None);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_ExchangeRoutine(self,"start");
	GOPSTOPPED = TRUE;
};


instance DIA_VLK506_HI2(C_Info)
{
	npc = VLK_506_Buddler;
	nr = 1;
	condition = dia_vlk506_hi2_condition;
	information = dia_vlk506_hi2_info;
	permanent = 0;
	important = 1;
};


func int dia_vlk506_hi2_condition()
{
	if((LETTER_TOLD > 1) && (Kapitel < 4) && (Npc_GetDistToWP(self,"OC_ROUND_27") < 300) && !Npc_KnowsInfo(hero,dia_vlk505_hi))
	{
		return 1;
	};
};

func void dia_vlk506_hi2_info()
{
	AI_Output(self,other,"DIA_LetterFight_05");	//Так, ладно... Здесь слухи расходятся быстро: я знаю, что у тебя есть письмо для магов! Отдай его мне!
	self.guild = GIL_None;
	Npc_SetTrueGuild(self,GIL_None);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_ExchangeRoutine(self,"start");
	GOPSTOPPED = TRUE;
};


instance VLK506_GETLOST(C_Info)
{
	npc = VLK_506_Buddler;
	nr = 1;
	condition = vlk506_getlost_condition;
	information = vlk506_getlost_info;
	permanent = 1;
	important = 1;
};


func int vlk506_getlost_condition()
{
	if((GOPSTOPPED == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void vlk506_getlost_info()
{
	AI_Output(self,other,"SVM_19_GetOutOfHere");	//Проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_VLK506_HI_01(C_Info)
{
	npc = VLK_506_Buddler;
	nr = 2;
	condition = dia_vlk506_hi_01_condition;
	information = dia_vlk506_hi_01_info;
	permanent = 1;
	important = 0;
	description = "Что ты можешь рассказать об этом лагере?";
};


func int dia_vlk506_hi_01_condition()
{
	return TRUE;
};

func void dia_vlk506_hi_01_info()
{
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00");	//Что ты можешь рассказать об этом лагере?
	AI_Output(self,other,"SVM_2_NotNow");	//Не сейчас.
	AI_StopProcessInfos(self);
};


instance DIA_VLK506_HI_02(C_Info)
{
	npc = VLK_506_Buddler;
	nr = 3;
	condition = dia_vlk506_hi_02_condition;
	information = dia_vlk506_hi_02_info;
	permanent = 1;
	important = 0;
	description = "Как здесь живется?";
};


func int dia_vlk506_hi_02_condition()
{
	return TRUE;
};

func void dia_vlk506_hi_02_info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"SVM_2_GetOutOfHere");	//Пошел прочь!
	AI_StopProcessInfos(self);
};

