
instance DIA_Skip_Exit(C_Info)
{
	npc = Grd_211_Skip;
	nr = 999;
	condition = DIA_Skip_Exit_Condition;
	information = DIA_Skip_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Skip_Exit_Condition()
{
	return 1;
};

func void DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Skip_TradeFree;

instance DIA_Skip_First(C_Info)
{
	npc = Grd_211_Skip;
	nr = 1;
	condition = DIA_Skip_First_Condition;
	information = DIA_Skip_First_Info;
	permanent = 0;
	description = "Что ты делаешь?";
};


func int DIA_Skip_First_Condition()
{
	if(!(Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF))
	{
		return 1;
	};
};

func void DIA_Skip_First_Info()
{
	AI_Output(other,self,"DIA_Skip_First_15_00");	//Что ты делаешь?
	AI_Output(self,other,"DIA_Skip_First_12_01");	//Моя работа - это оружие для стражников.
	AI_Output(other,self,"DIA_Skip_First_15_02");	//Ты продаешь оружие?
	AI_Output(self,other,"DIA_Skip_First_12_03");	//Да, Гомезу и его людям.
	if(!Npc_KnowsInfo(hero,DIA_Raven_Equipment))
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Стражник Скип во внутреннем дворе замка продает оружие. Но купить его могут только люди Гомеза.");
	};
	Info_ClearChoices(DIA_Skip_First);
	Info_AddChoice(DIA_Skip_First,"Понятно. До встречи!",DIA_Skip_First_BACK);
	Info_AddChoice(DIA_Skip_First,"Торус сказал, что ты сможешь подобрать мне оружие.",DIA_Skip_First_Thorus);
	Info_AddChoice(DIA_Skip_First,"Гомез прислал меня к тебе. Я должен подобрать себе снаряжение.",DIA_Skip_First_Gomez);
};

func void DIA_Skip_First_Gomez()
{
	AI_Output(other,self,"DIA_Skip_First_Gomez_15_00");	//Гомез прислал меня к тебе. Я должен подобрать себе снаряжение.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_01");	//Как обычно, да? Новые доспехи и лучшее оружие из того, что у меня есть.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_02");	//Убирайся отсюда, пока я не разозлился!
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_15_00");	//Торус отправил меня к тебе. Сказал, что ты сможешь подобрать мне оружие.
	AI_Output(self,other,"DIA_Skip_First_Thorus_12_01");	//Даже так?
	Info_ClearChoices(DIA_Skip_First);
	Info_AddChoice(DIA_Skip_First,"А ты сам у него спроси.",DIA_Skip_First_Thorus_AskHim);
	Info_AddChoice(DIA_Skip_First,"Он сказал, что если ты не выдашь мне оружие, я могу у тебя его отобрать.",DIA_Skip_First_Thorus_KickAss);
	Info_AddChoice(DIA_Skip_First,"Я должен выполнить одно его задание...",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output(other,self,"DIA_Skip_First_BACK_15_00");	//Понятно. До встречи!
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_Stranger_15_00");	//Я должен выполнить одно его задание. Никто из вас не сможет его сделать.
	AI_Output(self,other,"DIA_Skip_First_Thorus_Stranger_12_01");	//Да? И он первым делом решил отправить тебя ко мне, верно?
	Info_ClearChoices(DIA_Skip_First);
	Info_AddChoice(DIA_Skip_First,"А ты сам у него спроси.",DIA_Skip_First_Thorus_AskHim);
	Info_AddChoice(DIA_Skip_First,"Он велел пинать твою задницу, пока ты не выдашь мне оружие.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAss_15_00");	//Он велел пинать твою тощую задницу до тех пор, пока ты не выдашь мне оружие.
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAss_12_01");	//В самом деле? Мне кажется, если ты не уберешься отсюда достаточно быстро, то я буду пинать твою задницу.
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_AskHim_15_00");	//А ты сам у него спроси.
	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_01");	//Именно это я и сделаю, только попозже. Уверен, что он захочет услышать все, что ты говорил о нем.
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_02");	//Не знаю, кто тебя впустил, но на твоем месте я бы поскорее убрался отсюда!
	};
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00");	//Он сказал, что если ты не выдашь мне оружие, я могу у тебя его отобрать.
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01");	//Хорошо, приятель. Что тебе нужно?
	Info_ClearChoices(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};


instance DIA_Skip_VERPATZT(C_Info)
{
	npc = Grd_211_Skip;
	nr = 1;
	condition = DIA_Skip_VERPATZT_Condition;
	information = DIA_Skip_VERPATZT_Info;
	permanent = 1;
	description = "Я подумал, что неплохо было поговорить с тобой о снаряжении.";
};


func int DIA_Skip_VERPATZT_Condition()
{
	if(!((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF)) && (Npc_KnowsInfo(hero,DIA_Skip_First) && (Skip_TradeFree == FALSE)))
	{
		return 1;
	};
};

func void DIA_Skip_VERPATZT_Info()
{
	AI_Output(other,self,"DIA_Skip_VERPATZT_15_00");	//Я просто подумал, что неплохо было бы поговорить с тобой о снаряжении.
	AI_Output(self,other,"DIA_Skip_VERPATZT_12_01");	//Убирайся отсюда!
};


instance GRD_211_Skip_TRADE(C_Info)
{
	npc = Grd_211_Skip;
	condition = GRD_211_Skip_TRADE_Condition;
	information = GRD_211_Skip_TRADE_Info;
	permanent = 1;
	description = "Я подумал, что неплохо было поговорить с тобой о снаряжении.";
	trade = 1;
};


func int GRD_211_Skip_TRADE_Condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF) || (Skip_TradeFree == TRUE))
	{
		return TRUE;
	};
};

func void GRD_211_Skip_TRADE_Info()
{
	AI_Output(other,self,"GRD_211_Skip_TRADE_Info_15_01");	//Я просто подумал, что неплохо было бы поговорить с тобой о снаряжении.
	AI_Output(self,other,"GRD_211_Skip_TRADE_Info_12_02");	//Если надо, могу кое-что продать.
};


instance GRD_211_Skip_WELCOME(C_Info)
{
	npc = Grd_211_Skip;
	condition = GRD_211_Skip_WELCOME_Condition;
	information = GRD_211_Skip_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_211_Skip_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_211_Skip_WELCOME_Info()
{
	AI_Output(self,other,"GRD_211_Skip_WELCOME_Info_12_01");	//Эй, ты не плохо тут разошелся для новичка.
};

