
instance Info_Vlk_1_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_1_EXIT_Condition;
	information = Info_Vlk_1_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Vlk_1_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_1_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_1_EinerVonEuchWerden_Condition;
	information = Info_Vlk_1_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я хочу присоединиться к лагерю. Как мне это сделать?";
};


func int Info_Vlk_1_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00");	//Я хочу присоединиться к лагерю. Как мне это сделать?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01");	//Очень просто. Найди себе кирку и иди в шахту. Около половины руды тебе придется отдавать солдатам, а на оставшуюся часть можно лишь кое-как сводить концы с концами.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02");	//Цены, которые назначает Гомез за товары из внешнего мира, просто драконовские. Но это все же лучше, чем целыми днями жевать рис, как в Новом лагере.
};


instance Info_Vlk_1_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_1_WichtigePersonen_Condition;
	information = Info_Vlk_1_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int Info_Vlk_1_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01");	//Бароны. Они организуют поставки руды для короля. Чем ближе ты к ним, тем больше получаешь.
};


instance Info_Vlk_1_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_1_DasLager_Condition;
	information = Info_Vlk_1_DasLager_Info;
	permanent = 1;
	description = "Здесь есть что-нибудь интересное, кроме этих лачуг?";
};


func int Info_Vlk_1_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_1_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00");	//Здесь есть что-нибудь интересное, кроме этих лачуг?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01");	//Ну, по вечерам можно полюбоваться тем, как стражники избивают друг друга на арене.
	AI_Output(other,self,"Info_Vlk_1_DasLager_01_02");	//Понятно.
};


instance Info_Vlk_1_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_1_DieLage_Condition;
	information = Info_Vlk_1_DieLage_Info;
	permanent = 1;
	description = "Как у тебя дела?";
};


func int Info_Vlk_1_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00");	//Как у тебя дела?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01");	//Последние две недели я работал в шахте. Теперь я хочу отдохнуть, так что не мешай.
};

func void B_AssignAmbientInfos_Vlk_1(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DieLage.npc = Hlp_GetInstanceID(slf);
};

