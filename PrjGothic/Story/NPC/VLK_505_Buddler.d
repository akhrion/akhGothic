
instance VLK_505_Buddler(Npc_Default)
{
	name[0] = "Марус";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 5;
	voice = 19;
	id = 505;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_FatBald",0,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_505;
};


func void Rtn_start_505()
{
	TA_Sleep(22,0,7,0,"OCR_HUT_7");
	TA_Smalltalk(7,0,11,0,"OCR_OUTSIDE_HUT_7");
	TA_RoastScavenger(11,0,20,0,"OCR_COOK_AT_HUT_10");
	TA_Smalltalk(20,0,22,0,"OCR_OUTSIDE_HUT_7");
};

func void rtn_letterwait_505()
{
	TA_Stay(23,0,6,30,"OCR_MAINGATE_INSIDE");
	TA_Stay(6,30,23,0,"OCR_MAINGATE_INSIDE");
};

func void rtn_guide_505()
{
	TA_GuidePC(23,0,6,30,"OC_MOAT_25");
	TA_GuidePC(6,30,23,0,"OC_MOAT_25");
};


instance INFO_VLK505_EXIT(C_Info)
{
	npc = VLK_505_Buddler;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance DIA_VLK505_HI(C_Info)
{
	npc = VLK_505_Buddler;
	nr = 1;
	condition = dia_vlk505_hi_condition;
	information = dia_vlk505_hi_info;
	permanent = 0;
	important = 1;
};


func int dia_vlk505_hi_condition()
{
	if((LETTER_TOLD > 1) && (Kapitel < 4) && !Npc_KnowsInfo(hero,dia_vlk506_hi))
	{
		return 1;
	};
};

func void dia_vlk505_hi_info()
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
	Npc_ExchangeRoutine(VLK_506_Buddler,"start");
	Info_ClearChoices(dia_vlk505_hi);
	Info_AddChoice(dia_vlk505_hi,"Ладно. Пойдем.",dia_vlk505_hi_yes);
	Info_AddChoice(dia_vlk505_hi,"Мне это не нужно!",dia_vlk505_hi_no);
};

func void dia_vlk505_hi_yes()
{
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03");	//Ладно. Пойдем.
	Npc_ExchangeRoutine(self,"guide");
	AI_StopProcessInfos(self);
};

func void dia_vlk505_hi_no()
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


instance DIA_VLK505_HI2(C_Info)
{
	npc = VLK_505_Buddler;
	nr = 1;
	condition = dia_vlk505_hi2_condition;
	information = dia_vlk505_hi2_info;
	permanent = 0;
	important = 1;
};


func int dia_vlk505_hi2_condition()
{
	if((LETTER_TOLD > 1) && (Kapitel < 4) && (Npc_GetDistToWP(self,"OC_MOAT_25") < 300) && !Npc_KnowsInfo(hero,dia_vlk506_hi))
	{
		return 1;
	};
};

func void dia_vlk505_hi2_info()
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


instance VLK505_GETLOST(C_Info)
{
	npc = VLK_505_Buddler;
	nr = 1;
	condition = vlk505_getlost_condition;
	information = vlk505_getlost_info;
	permanent = 1;
	important = 1;
};


func int vlk505_getlost_condition()
{
	if((GOPSTOPPED == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void vlk505_getlost_info()
{
	AI_Output(self,other,"SVM_19_GetOutOfHere");	//Проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_VLK505_HI_01(C_Info)
{
	npc = VLK_505_Buddler;
	nr = 2;
	condition = dia_vlk505_hi_01_condition;
	information = dia_vlk505_hi_01_info;
	permanent = 1;
	important = 0;
	description = "Привет!";
};


func int dia_vlk505_hi_01_condition()
{
	return TRUE;
};

func void dia_vlk505_hi_01_info()
{
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00");	//Привет!
	AI_Output(self,other,"SVM_2_WhatsThisSupposedToBe");	//Что ты здесь шатаешься?
	AI_StopProcessInfos(self);
};


instance DIA_VLK505_HI_02(C_Info)
{
	npc = VLK_505_Buddler;
	nr = 3;
	condition = dia_vlk505_hi_02_condition;
	information = dia_vlk505_hi_02_info;
	permanent = 1;
	important = 0;
	description = "Как дела?";
};


func int dia_vlk505_hi_02_condition()
{
	return TRUE;
};

func void dia_vlk505_hi_02_info()
{
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"SVM_2_YouDeafOrWhat");	//Убирайся. Иначе тебе не поздоровится.
	AI_StopProcessInfos(self);
};

