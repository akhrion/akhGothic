
func void PC_Sleep(var int t)
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if(Wld_IsTime(0,0,t,0))
	{
		Wld_SetTime(t,0);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t,0);
	};
	PrintScreen("Ты хорошо выспался!",-1,-1,"font_old_20_white.tga",3);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	PrintGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
	B_SayOverlay(hero,NULL,"SVM_15_Awake");
	PLAYER_MOBSI_PRODUCTION = MOBSI_SLEEPABITEND;
	if((Kirgo_Charged == TRUE) && (KIRGO_CHARGED_END == FALSE) && (Kapitel < 4) && !Npc_IsDead(GRD_251_Kirgo))
	{
		Kirgo_Charged = FALSE;
		B_ExchangeRoutine(GRD_251_Kirgo,"START");
	};
	if((Kharim_Charged == TRUE) && (KHARIM_CHARGED_END == FALSE) && (Kapitel < 4) && !Npc_IsDead(Sld_729_Kharim))
	{
		Kharim_Charged = FALSE;
		B_ExchangeRoutine(Sld_729_Kharim,"START");
	};
	if((HANIS_CHARGED == TRUE) && (HANIS_CHARGED_END == FALSE) && (Kapitel < 4) && !Npc_IsDead(Tpl_1422_GorHanis))
	{
		HANIS_CHARGED = FALSE;
		B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
	};
	if(Npc_HasItems(hero,ItMiSwordbladehot) >= 1)
	{
		CreateInvItems(hero,ItMiSwordblade,Npc_HasItems(hero,ItMiSwordbladehot));
		Npc_RemoveInvItems(hero,ItMiSwordbladehot,Npc_HasItems(hero,ItMiSwordbladehot));
	};
	if(Npc_HasItems(hero,ItMiSwordrawhot) >= 1)
	{
		CreateInvItems(hero,ItMiSwordraw,Npc_HasItems(hero,ItMiSwordrawhot));
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,Npc_HasItems(hero,ItMiSwordrawhot));
	};
};

func void sleepabit_s1()
{
	var C_Npc her;
	var C_Npc rock;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		if(Npc_RefuseTalk(self) == TRUE)
		{
			PrintScreen("Сейчас здесь нельзя спать...",-1,-1,"font_old_20_white.tga",3);
			self.aivar[AIV_INVINCIBLE] = FALSE;
		};
		AI_ProcessInfos(her);
		PLAYER_MOBSI_PRODUCTION = MOBSI_SLEEPABIT;
	};
};


instance PC_NoSleep(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_NoSleep_Condition;
	information = PC_NoSleep_Info;
	important = 0;
	permanent = 1;
	description = STR_INFO_TRADE_EXIT;
};


func int PC_NoSleep_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return TRUE;
	};
};

func void PC_NoSleep_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SleepTime_Morning(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_SleepTime_Morning_Condition;
	information = PC_SleepTime_Morning_Info;
	important = 0;
	permanent = 1;
	description = "Спать до утра.";
};


func int PC_SleepTime_Morning_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT))
	{
		return 1;
	};
};

func void PC_SleepTime_Morning_Info()
{
	PC_Sleep(6);
};

instance PC_SleepTime_Day(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_SleepTime_Day_Condition;
	information = PC_SleepTime_Day_Info;
	important = 0;
	permanent = 1;
	description = "Спать до дня.";
};


func int PC_SleepTime_Day_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT))
	{
		return 1;
	};
};

func void PC_SleepTime_Day_Info()
{
	PC_Sleep(9);
};


instance PC_SleepTime_Noon(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_SleepTime_Noon_Condition;
	information = PC_SleepTime_Noon_Info;
	important = 0;
	permanent = 1;
	description = "Спать до полудня.";
};


func int PC_SleepTime_Noon_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT))
	{
		return 1;
	};
};

func void PC_SleepTime_Noon_Info()
{
	PC_Sleep(12);
};


instance PC_SleepTime_Evening(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = PC_SleepTime_Evening_Condition;
	information = PC_SleepTime_Evening_Info;
	important = 0;
	permanent = 1;
	description = "Спать до вечера.";
};


func int PC_SleepTime_Evening_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT))
	{
		return 1;
	};
};

func void PC_SleepTime_Evening_Info()
{
	PC_Sleep(18);
};

instance PC_SleepTime_Twilight(C_Info)
{
	npc = PC_Hero;
	nr = 8;
	condition = PC_SleepTime_Twilight_Condition;
	information = PC_SleepTime_Twilight_Info;
	important = 0;
	permanent = 1;
	description = "Спать до сумерек.";
};


func int PC_SleepTime_Twilight_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT))
	{
		return 1;
	};
};

func void PC_SleepTime_Twilight_Info()
{
	PC_Sleep(18);
};

instance PC_SleepTime_Night(C_Info)
{
	npc = PC_Hero;
	nr = 9;
	condition = PC_SleepTime_Night_Condition;
	information = PC_SleepTime_Night_Info;
	important = 0;
	permanent = 1;
	description = "Спать до ночи.";
};


func int PC_SleepTime_Night_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT))
	{
		return 1;
	};
};

func void PC_SleepTime_Night_Info()
{
	PC_Sleep(21);
};


instance PC_SleepTime_Midnight(C_Info)
{
	npc = PC_Hero;
	nr = 10;
	condition = PC_SleepTime_Midnight_Condition;
	information = PC_SleepTime_Midnight_Info;
	important = 0;
	permanent = 1;
	description = "Спать до полуночи.";
};


func int PC_SleepTime_Midnight_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT))
	{
		return 1;
	};
};

func void PC_SleepTime_Midnight_Info()
{
	PC_Sleep(0);
};

