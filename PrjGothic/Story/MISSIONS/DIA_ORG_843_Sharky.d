
instance Org_843_Sharky_Exit(C_Info)
{
	npc = ORG_843_Sharky;
	nr = 999;
	condition = Org_843_Sharky_Exit_Condition;
	information = Org_843_Sharky_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_843_Sharky_Exit_Condition()
{
	return 1;
};

func void Org_843_Sharky_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_843_Sharky_Fisk(C_Info)
{
	npc = ORG_843_Sharky;
	nr = 2;
	condition = Org_843_Sharky_Fisk_Condition;
	information = Org_843_Sharky_Fisk_Info;
	permanent = 0;
	description = "Фиску из Старого лагеря нужен помощник.";
};


func int Org_843_Sharky_Fisk_Condition()
{
	if(Fisk_GetNewHehler == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Org_843_Sharky_Fisk_Info()
{
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_00");	//Фиску из Старого лагеря нужен помощник.
	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_01");	//И зачем ты рассказываешь это мне?
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_02");	//Я подумал, что ты захочешь заработать немного руды.
	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_03");	//Хм, почему бы и нет... Скажи Фиску, что он может рассчитывать на меня.
	B_LogEntry(CH1_FiskNewDealer,"Шарки согласился работать с Фиском.");
};


instance Org_843_Sharky_TRADE(C_Info)
{
	npc = ORG_843_Sharky;
	condition = Org_843_Sharky_TRADE_Condition;
	information = Org_843_Sharky_TRADE_Info;
	important = 0;
	permanent = 1;
	description = "Мне бы не помешала пара вещей...";
	trade = 1;
};


func int Org_843_Sharky_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,Org_843_Sharky_GREET))
	{
		return TRUE;
	};
};

func void Org_843_Sharky_TRADE_Info()
{
	AI_Output(other,self,"Org_843_Sharky_TRADE_Info_15_01");	//Мне бы не помешала пара вещей...
};


instance Org_843_Sharky_GREET(C_Info)
{
	npc = ORG_843_Sharky;
	condition = Org_843_Sharky_GREET_Condition;
	information = Org_843_Sharky_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Эй, как дела?";
};


func int Org_843_Sharky_GREET_Condition()
{
	return TRUE;
};

func void Org_843_Sharky_GREET_Info()
{
	AI_Output(other,self,"Org_843_Sharky_GREET_Info_15_01");	//Эй, как дела?
	AI_Output(self,other,"Org_843_Sharky_GREET_Info_10_02");	//Хочешь что-нибудь купить?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Вор Шарки продает оружие и другие товары. Его можно найти в Новом лагере.");
};

