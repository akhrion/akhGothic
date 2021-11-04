
instance STT_335_Santino_Exit(C_Info)
{
	npc = STT_335_Santino;
	nr = 999;
	condition = STT_335_Santino_Exit_Condition;
	information = STT_335_Santino_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_335_Santino_Exit_Condition()
{
	return 1;
};

func void STT_335_Santino_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance STT_335_Santino_BUY(C_Info)
{
	npc = STT_335_Santino;
	condition = STT_335_Santino_BUY_Condition;
	information = STT_335_Santino_BUY_Info;
	important = 0;
	permanent = 0;
	description = "я могу у теб€ что-нибудь купить?";
};


func int STT_335_Santino_BUY_Condition()
{
	return 1;
};

func void STT_335_Santino_BUY_Info()
{
	AI_Output(other,self,"STT_335_Santino_BUY_Info_15_01");	//я могу у теб€ что-нибудь купить?
	AI_Output(self,other,"STT_335_Santino_BUY_Info_07_02");	//” мен€ есть все, что можно продать. ј то, чего у мен€ нет, все равно никому не нужно.
	Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
	B_LogEntry(GE_TRADEROM,"—антино продает некоторые припасы: болты, стрелы, еду.");
};


instance STT_335_SANTINO_BUY2(C_Info)
{
	npc = STT_335_Santino;
	condition = stt_335_santino_buy2_condition;
	information = stt_335_santino_buy2_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int stt_335_santino_buy2_condition()
{
	if(Npc_KnowsInfo(hero,STT_335_Santino_BUY))
	{
		return 1;
	};
};

func void stt_335_santino_buy2_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//ѕокажи мне свои товары.
};

