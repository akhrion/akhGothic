
instance Info_Mine_Sld_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Sld_8_EXIT_Condition;
	information = Info_Mine_Sld_8_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Mine_Sld_8_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Sld_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Mine_Sld_8_EinerVonEuchWerden_Condition;
	information = Info_Mine_Sld_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Как мне присоединиться к вам?";
};


func int Info_Mine_Sld_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00");	//Как мне присоединиться к вам?
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01");	//Прежде чем работать у нас, ты должен доказать людям в Новом лагере, что ты чего-то стоишь.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02");	//Пойди туда и сам у них все узнай.
};


instance Info_Mine_Sld_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Sld_8_WichtigePersonen_Condition;
	information = Info_Mine_Sld_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int Info_Mine_Sld_8_WichtigePersonen_Condition()
{
	if(FMTaken == FALSE)
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01");	//Главный здесь Окил. А в лагере все находится под контролем Ли.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02");	//Поэтому тебе стоит пойти и поговорить с ними.
};


instance Info_Mine_Sld_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Mine_Sld_8_DasLager_Condition;
	information = Info_Mine_Sld_8_DasLager_Info;
	permanent = 1;
	description = "Как жизнь в лагере?";
};


func int Info_Mine_Sld_8_DasLager_Condition()
{
	if(FMTaken == FALSE)
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00");	//Как жизнь в лагере?
	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01");	//Мы здесь охраняем вход в шахту.
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02");	//И никто из посторонних зайти не может.
};


instance Info_Mine_Sld_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Sld_8_DieLage_Condition;
	information = Info_Mine_Sld_8_DieLage_Info;
	permanent = 1;
	description = "Все в порядке?";
};


func int Info_Mine_Sld_8_DieLage_Condition()
{
	if(FMTaken == FALSE)
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00");	//Все в порядке?
	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01");	//Что за вопрос? Конечно, в порядке!
};

func void B_AssignAmbientInfos_Mine_Sld_8(var C_Npc slf)
{
	Info_Mine_Sld_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DieLage.npc = Hlp_GetInstanceID(slf);
};

