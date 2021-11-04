
instance Info_Stt_10_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Stt_10_EXIT_Condition;
	information = Info_Stt_10_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Stt_10_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_10_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Stt_10_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Stt_10_EinerVonEuchWerden_Condition;
	information = Info_Stt_10_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я бы хотел стать Призраком.";
};


func int Info_Stt_10_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Stt_10_EinerVonEuchWerden_Info()
{
	var C_Npc diego;
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00");	//Я бы хотел стать Призраком.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01");	//Да? А ты уже поговорил с Диего?
	diego = Hlp_GetNpc(PC_Thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Еще нет.",Info_Stt_10_EinerVonEuchWerden_Nein);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Я подойду к нему.",Info_Stt_10_EinerVonEuchWerden_Ja);
};

func void Info_Stt_10_EinerVonEuchWerden_Nein()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00");	//Еще нет.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01");	//Так поговори. Ты найдешь его перед воротами замка.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

func void Info_Stt_10_EinerVonEuchWerden_Ja()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00");	//Я подойду к нему.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01");	//Хорошо. Делай то, что он тебе скажет. Мне это никак не повредит. Но кто знает...
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};


instance Info_Stt_10_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Stt_10_WichtigePersonen_Condition;
	information = Info_Stt_10_WichtigePersonen_Info;
	permanent = 1;
	description = "Есть еще кто-нибудь, кто может быть мне полезен?";
};


func int Info_Stt_10_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_10_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00");	//Есть еще кто-нибудь, кто может быть мне полезен?
	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01");	//Если ты испортишь отношения с кем-нибудь из лагеря, обратись к Граво. Он сидит возле купальни рядом с воротами замка. Он помогает людям улаживать их проблемы. А проблемы чаще всего возникают у таких новичков, как ты.
};


instance Info_Stt_10_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Stt_10_DasLager_Condition;
	information = Info_Stt_10_DasLager_Info;
	permanent = 1;
	description = "Что ты можешь рассказать об этом лагере?";
};


func int Info_Stt_10_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_10_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00");	//Что ты можешь рассказать об этом лагере?
	AI_Output(self,other,"Info_Stt_10_DasLager_10_01");	//По-моему, самое интересное место в лагере - рынок. Там продается почти все. Так что заходи туда, если что-нибудь понадобится.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_02");	//Он находится под большой крышей на Внешнем Кольце, к югу от замка.
};


instance Info_Stt_10_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Stt_10_DieLage_Condition;
	information = Info_Stt_10_DieLage_Info;
	permanent = 1;
	description = "Привет!";
};


func int Info_Stt_10_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_10_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00");	//Привет!
	AI_Output(self,other,"Info_Stt_10_DieLage_10_01");	//Что тебе нужно?
};

func void B_AssignAmbientInfos_Stt_10(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Stt_10_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_DieLage.npc = Hlp_GetInstanceID(slf);
};

