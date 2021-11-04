
instance DIA_BaalOrun_Exit(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 999;
	condition = DIA_BaalOrun_Exit_Condition;
	information = DIA_BaalOrun_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalOrun_Exit_Condition()
{
	return 1;
};

func void DIA_BaalOrun_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int BaalOrun_Ansprechbar;
var int BaalOrun_Sakrileg;

instance DIA_BaalOrun_NoTalk(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_NoTalk_Condition;
	information = DIA_BaalOrun_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalOrun_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalOrun_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalOrun_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalOrun_NoTalk);
	Info_AddChoice(DIA_BaalOrun_NoTalk,DIALOG_ENDE,DIA_BaalOrun_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"С тобой все нормально, приятель?",DIA_BaalOrun_NoTalk_Imp);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Да пребудет с тобой Спящий!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Привет! Я здесь новенький!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00");	//Привет! Я здесь новенький!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00");	//С тобой все нормально, приятель?
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalOrun_FirstTalk(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_FirstTalk_Condition;
	information = DIA_BaalOrun_FirstTalk_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalOrun_FirstTalk_Condition()
{
	if((Ghorim_KickHarlok == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		BaalOrun_Ansprechbar = TRUE;
		return 1;
	};
};

func void DIA_BaalOrun_FirstTalk_Info()
{
	var C_Npc harlok;
	harlok = Hlp_GetNpc(NOV_1358_Harlok);
	harlok.attribute[ATR_HITPOINTS] = harlok.attribute[ATR_HITPOINTS_MAX];
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00");	//Горим сказал мне, что ты очень помог братьям нашим - это мудрый поступок.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01");	//Именно поэтому тебя выбрали для выполнения особого задания.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02");	//Кор Галом постоянно экспериментирует и ему нужен болотник.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03");	//Наши сборщики трудятся не покладая рук. Иди к ним и принеси в лабораторию Галома весь их дневной сбор.
	B_GiveXP(XP_BaalOrunTalks);
	B_LogEntry(CH1_GhorimsRelief,"Харлок сменил Горима. Да, бывают в жизни чудеса...");
	Log_SetTopicStatus(CH1_GhorimsRelief,LOG_SUCCESS);
	Log_CreateTopic(CH1_DeliverWeed,LOG_MISSION);
	Log_SetTopicStatus(CH1_DeliverWeed,LOG_RUNNING);
	B_LogEntry(CH1_DeliverWeed,"Я сумел уговорить Харлока, и это произвело хорошее впечатление на Идола Орана. Теперь я должен отнести весь урожай болотника Кор Галому.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"(ничего не говорить)",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Где я могу найти этих сборщиков?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00");	//Где я могу найти этих сборщиков?
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01");	//Я еще не позволял тебе задавать вопросы!
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02");	//Молись Спящему, дабы он простил твой святотатственный поступок! И ступай. Твоя миссия очень важна для всех нас.
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

func void DIA_BaalOrun_FirstTalk_MuteEnde()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};


instance DIA_BaalOrun_GotWeed(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_GotWeed_Condition;
	information = DIA_BaalOrun_GotWeed_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalOrun_GotWeed_Condition()
{
	if(Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_GotWeed_Info()
{
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00");	//Ты спас наших сборщиков...
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01");	//Это не просто любопытство к нам, это проявление веры в Спящего.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02");	//Я вижу, ты достоин носить робу послушника.
	BaalOrun_Ansprechbar = TRUE;
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
		B_LogEntry(CH1_JoinPsi,"Идол Оран назвал меня верным последователем Спящего, так как я смог избавить сборщиков болотника от шершней.");
	};
	B_GiveXP(XP_ImpressedBaalOrun);
};


instance DIA_BaalOrun_WeedAtKaloms(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_WeedAtKaloms_Condition;
	information = DIA_BaalOrun_WeedAtKaloms_Info;
	permanent = 0;
	description = "Я доставил болотник Кор Галому.";
};


func int DIA_BaalOrun_WeedAtKaloms_Condition()
{
	if(BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_WeedAtKaloms_Info()
{
	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00");	//Я доставил болотник Кор Галому.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01");	//Неплохо поработал. Вот тебе за это небольшая награда.
	b_printtrademsg1("Получен свиток сна.");
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02");	//Это магическое заклинание Сна. Ты сможешь воспользоваться им только один раз, но я надеюсь, что оно сослужит тебе хорошую службу.
	BaalOrun_Ansprechbar = TRUE;
	B_GiveXP(XP_ReportToBaalOrun);
	CreateInvItem(self,ItArScrollSleep);
	B_GiveInvItems(self,other,ItArScrollSleep,1);
};


instance DIA_BaalOrun_Perm(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_Perm_Condition;
	information = DIA_BaalOrun_Perm_Info;
	permanent = 1;
	description = "Как идет сбор урожая?";
};


func int DIA_BaalOrun_Perm_Condition()
{
	if(BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_Perm_Info()
{
	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00");	//Как идет сбор урожая?
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01");	//Мы со всем усердием трудимся день и ночь, поэтому у нас много болотника. И себе хватает и на продажу в другие лагеря.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02");	//Это жертва, которую наши послушники с готовностью приносят Спящему.
};


instance DIA_BAALORUN_HARLOKDEAD(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = dia_baalorun_harlokdead_condition;
	information = dia_baalorun_harlokdead_info;
	permanent = 0;
	important = 1;
};


func int dia_baalorun_harlokdead_condition()
{
	if(Npc_IsDead(NOV_1358_Harlok) && !Npc_KnowsInfo(hero,DIA_Harlok_SendHarlok) && (Ghorim_KickHarlok == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_baalorun_harlokdead_info()
{
	AI_Output(self,other,"SVM_12_YouKilledPSIfolk");	//Убит один из последователей Братства. Кто-то говорит, что ты принимал в этом участие.
	AI_Output(self,other,"SVM_12_GetThingsRight");	//Ты не сможешь уйти от ответственности!
	B_LogEntry(CH1_GhorimsRelief,"Я перегнул палку, Харлок погиб. Теперь у меня проблемы...");
	Log_SetTopicStatus(CH1_GhorimsRelief,LOG_FAILED);
	Ghorim_KickHarlok = LOG_FAILED;
	AI_StopProcessInfos(self);
};

