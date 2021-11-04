
instance STT_300_Alberto_Exit(C_Info)
{
	npc = STT_300_Alberto;
	nr = 999;
	condition = STT_300_Alberto_Exit_Condition;
	information = STT_300_Alberto_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_300_Alberto_Exit_Condition()
{
	return 1;
};

func void STT_300_Alberto_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance STT_300_Alberto_BUY(C_Info)
{
	npc = STT_300_Alberto;
	condition = STT_300_Alberto_BUY_Condition;
	information = STT_300_Alberto_BUY_Info;
	important = 0;
	permanent = 0;
	description = "Я могу что-нибудь купить у тебя?";
};


func int STT_300_Alberto_BUY_Condition()
{
	return 1;
};

func void STT_300_Alberto_BUY_Info()
{
	AI_Output(other,self,"STT_300_Alberto_BUY_Info_15_01");	//Я могу что-нибудь купить у тебя?
	AI_Output(self,other,"STT_300_Alberto_BUY_Info_12_02");	//Еще бы. Все, что захочешь. Если сможешь заплатить.
	Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
	B_LogEntry(GE_TRADEROM,"Альберто продает стрелы, зелья и прочие припасы.");
};


instance STT_300_ALBERTO_BUY2(C_Info)
{
	npc = STT_300_Alberto;
	condition = stt_300_alberto_buy2_condition;
	information = stt_300_alberto_buy2_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int stt_300_alberto_buy2_condition()
{
	if(Npc_KnowsInfo(hero,STT_300_Alberto_BUY))
	{
		return 1;
	};
};

func void stt_300_alberto_buy2_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//Покажи мне свои товары.
};

