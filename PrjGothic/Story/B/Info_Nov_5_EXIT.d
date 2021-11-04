
instance Info_Nov_5_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_5_EXIT_Condition;
	information = Info_Nov_5_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Nov_5_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nov_5_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_5_EinerVonEuchWerden_Condition;
	information = Info_Nov_5_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Как мне присоединиться к этому лагерю?";
};


func int Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00");	//Как мне присоединиться к этому лагерю?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01");	//Это очень просто. Поговори с кем-нибудь из младших Гуру. Они тебе помогут.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02");	//Тебе у нас понравится, поверь мне.
};


instance Info_Nov_5_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_5_WichtigePersonen_Condition;
	information = Info_Nov_5_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь всем командует?";
};


func int Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00");	//Кто здесь всем командует?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01");	//Власть здесь принадлежит Гуру. Но если ты не будешь нарушать наших законов, они тебя не тронут.
};


instance Info_Nov_5_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_5_DasLager_Condition;
	information = Info_Nov_5_DasLager_Info;
	permanent = 1;
	description = "Ты можешь рассказать мне об этом лагере?";
};


func int Info_Nov_5_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_5_DasLager_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00");	//Ты можешь рассказать мне об этом лагере?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01");	//Таких мест, как это, ты во всей колонии не найдешь.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02");	//В нашем лагере ты сможешь ежедневно получать еду и болотник, даже если ты равнодушен к учению Спящего. Просто поговори с Фортуно.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03");	//Где я могу найти его?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04");	//В доме под лабораторией Кор Галома, рядом с нашим храмом.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_5_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_5_DieLage_Condition;
	information = Info_Nov_5_DieLage_Info;
	permanent = 1;
	description = "Как дела?";
};


func int Info_Nov_5_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00");	//Как дела?
	if((Npc_GetTrueGuild(other) == GIL_None) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		AI_Output(self,other,"Info_Nov_5_DieLage_05_01");	//Хорошо. Мне не на что жаловаться. А ты здесь новенький?
		AI_Output(other,self,"Info_Nov_5_DieLage_15_02");	//Да, совсем недавно прибыл.
	}
	else
	{
		AI_Output(self,other,"SVM_5_SectGreetings");	//Пробудись!
	};
};

func void B_AssignAmbientInfos_Nov_5(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc = Hlp_GetInstanceID(slf);
};

