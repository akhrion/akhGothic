
instance Info_Mine_Sld_11_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Sld_11_EXIT_Condition;
	information = Info_Mine_Sld_11_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Mine_Sld_11_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Sld_11_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Mine_Sld_11_EinerVonEuchWerden_Condition;
	information = Info_Mine_Sld_11_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Как мне присоединиться к вам?";
};


func int Info_Mine_Sld_11_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00");	//Как мне присоединиться к вам?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01");	//Если хочешь стать одним из нас, ты должен показать, на что ты способен.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02");	//Покажи себя с лучшей стороны, и тогда мы, быть может, позволим тебе работать здесь.
};


instance Info_Mine_Sld_11_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Sld_11_WichtigePersonen_Condition;
	information = Info_Mine_Sld_11_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int Info_Mine_Sld_11_WichtigePersonen_Condition()
{
	if(FMTaken == FALSE)
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01");	//Здесь всем заправляет Окил. У него есть связи со всеми важными людьми лагеря.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02");	//Так что если ты здесь сделаешь что-то не то, то об этом тут же узнают маги Воды.
};


instance Info_Mine_Sld_11_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Mine_Sld_11_DasLager_Condition;
	information = Info_Mine_Sld_11_DasLager_Info;
	permanent = 1;
	description = "Что-нибудь еще?";
};


func int Info_Mine_Sld_11_DasLager_Condition()
{
	if(FMTaken == FALSE)
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00");	//Что-нибудь еще?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01");	//Постарайся не делать глупостей, и с тобой все будет в порядке.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02");	//Ах, да, не стоит пытаться войти в шахту без разрешения. Ты же не хочешь неприятностей, верно?
};


instance Info_Mine_Sld_11_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Sld_11_DieLage_Condition;
	information = Info_Mine_Sld_11_DieLage_Info;
	permanent = 1;
	description = "Как дела?";
};


func int Info_Mine_Sld_11_DieLage_Condition()
{
	if(FMTaken == FALSE)
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01");	//Здесь тихо, слишком тихо на мой взгляд.
};

func void B_AssignAmbientInfos_Mine_Sld_11(var C_Npc slf)
{
	Info_Mine_Sld_11_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DieLage.npc = Hlp_GetInstanceID(slf);
};

