
instance DIA_Ricelord_EXIT(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 999;
	condition = DIA_Ricelord_EXIT_Condition;
	information = DIA_Ricelord_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Ricelord_EXIT_Condition()
{
	return 1;
};

func void DIA_Ricelord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ricelord_Hello(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Hello_Condition;
	information = DIA_Ricelord_Hello_Info;
	permanent = 0;
	description = "Это ты управляешь рисовыми полями, ведь так?";
};


func int DIA_Ricelord_Hello_Condition()
{
	return 1;
};

func void DIA_Ricelord_Hello_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Hello_15_00");	//Это ты управляешь рисовыми полями, ведь так?
	AI_Output(self,other,"DIA_Ricelord_Hello_12_01");	//А что? Тебе нужна работа?
};


instance DIA_Ricelord_Arbeit(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Arbeit_Condition;
	information = DIA_Ricelord_Arbeit_Info;
	permanent = 0;
	description = "А ты можешь мне что-то предложить?";
};


func int DIA_Ricelord_Arbeit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && !Npc_KnowsInfo(hero,DIA_Lefty_First) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//А ты можешь мне что-то предложить?
	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01");	//Поговори с Лефти. Думаю, ты найдешь его справа от сарая.
};


instance DIA_Ricelord_TRADE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 800;
	condition = DIA_Ricelord_TRADE_Condition;
	information = DIA_Ricelord_TRADE_Info;
	permanent = 1;
	description = "Мы могли бы сработаться...";
	trade = 1;
};


func int DIA_Ricelord_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Ricelord_TRADE_Info()
{
	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00");	//Мы могли бы сработаться...
	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01");	//Ты можешь что-то предложить?
};


var int ricelord_askedforwater_day;

instance DIA_Ricelord_LeftySentMe(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_LeftySentMe_Condition;
	information = DIA_Ricelord_LeftySentMe_Info;
	permanent = 1;
	description = "Меня послал Лефти.";
};


func int DIA_Ricelord_LeftySentMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && (Lefty_Mission == LOG_RUNNING) && (Ricelord_AskedForWater == FALSE) && (LeftyDead == FALSE) && (RICELORD_ASKEDFORWATER_DAY != (Wld_GetDay() + 1)))
	{
		return 1;
	};
};

func void DIA_Ricelord_LeftySentMe_Info()
{
	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00");	//Меня послал Лефти.
	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01");	//Да, и что он сказал?
	Ricelord_AskedForWater = TRUE;
};


instance DIA_Ricelord_GetWater(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_GetWater_Condition;
	information = DIA_Ricelord_GetWater_Info;
	permanent = 1;
	description = "Я должен отнести крестьянам воды.";
};


func int DIA_Ricelord_GetWater_Condition()
{
	if((Ricelord_AskedForWater == TRUE) && (LeftyDead == FALSE) && (Lefty_Mission == LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Ricelord_GetWater_Info()
{
	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00");	//Я должен отнести крестьянам воды.
	if(Npc_IsDead(Org_844_Lefty))
	{
		AI_Output(self,other,"SVM_12_HeKilledHim");	//Ты убиваешь людей. Теперь у тебя большие неприятности!
		Ricelord_AskedForWater = FALSE;
		AI_StopProcessInfos(self);
	}
	else if(Lefty_WorkDay == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01");	//Отлично. Держи. Дюжина бутылок с водой.
		b_printtrademsg1("Получено 12 бутылок с водой.");
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02");	//Крестьян там намного больше, так что следи, чтобы всем досталось поровну.
		CreateInvItems(self,ItFo_Potion_Water_01,12);
		B_GiveInvItems(self,other,ItFo_Potion_Water_01,12);
		RICELORD_ASKEDFORWATER_DAY = Wld_GetDay() + 1;
		Ricelord_AskedForWater = FALSE;
		B_LogEntry(CH1_CarryWater,"Лорд дал мне дюжину бутылок с водой.");
		AI_StopProcessInfos(self);
	}
	else if(Lefty_WorkDay == (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00");	//Это было вчера, парень! Лучше сходи к нему, он хочет тебе что-то сказать.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01");	//Это было несколько дней назад, парень! Лучше сходи к нему, он хочет с тобой поговорить.
		AI_StopProcessInfos(self);
	};
};

