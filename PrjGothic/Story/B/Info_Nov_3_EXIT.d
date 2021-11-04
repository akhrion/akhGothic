
instance Info_Nov_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_3_EXIT_Condition;
	information = Info_Nov_3_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Nov_3_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nov_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_3_EinerVonEuchWerden_Condition;
	information = Info_Nov_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Как я могу присоединиться к этому лагерю?";
};


func int Info_Nov_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00");	//Как я могу присоединиться к этому лагерю?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01");	//Очень просто. Пройдись по лагерю, брат.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02");	//Поговори с Гуру, они смогут многое поведать тебе.
};


instance Info_Nov_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_3_WichtigePersonen_Condition;
	information = Info_Nov_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int Info_Nov_3_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Nov_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01");	//Юберион! Да пребудет с ним Спящий! Он указал нам это священное место.
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02");	//Его видения помогли нам создать наше Братство.
};


instance Info_Nov_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_3_DasLager_Condition;
	information = Info_Nov_3_DasLager_Info;
	permanent = 1;
	description = "Кто еще может рассказать мне об этом месте?";
};


func int Info_Nov_3_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_3_DasLager_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00");	//Кто еще может рассказать мне об этом месте?
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01");	//Найди Фортуно, одного из братьев. Он раздает болотник всем приверженцам нашей веры.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02");	//Его дом ты найдешь под лабораторией Кор Галома.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_3_DieLage_Condition;
	information = Info_Nov_3_DieLage_Info;
	permanent = 1;
	description = "Как жизнь?";
};


func int Info_Nov_3_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01");	//Прекрасно, просто прекрасно, брат!
};

func void B_AssignAmbientInfos_Nov_3(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

