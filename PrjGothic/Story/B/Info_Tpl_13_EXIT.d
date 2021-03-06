
instance Info_Tpl_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_13_EXIT_Condition;
	information = Info_Tpl_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Tpl_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_13_EinerVonEuchWerden_Condition;
	information = Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я хочу быть Стражем, как ты.";
};


func int Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00");	//Я хочу быть Стражем, как ты.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01");	//Знаешь ли ты, что мне пришлось пережить, чтобы Спящий избрал меня одним из своих стражей? Тебе этого пока не понять.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02");	//Не думай, что тебя просто так, без доказательства твоей преданности, могут назначить на это почетное место.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03");	//Сначала ты должен будешь познакомиться с учением Спящего.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04");	//На это уйдет некоторое время. Это избавит тебя от глупостей, которые вертятся в твоей голове.
};


instance Info_Tpl_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_13_WichtigePersonen_Condition;
	information = Info_Tpl_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01");	//Наши Гуру, избранные Спящим! Спящий указывает нам путь дальнейшей жизни, а Гуру передают нам его слова.
};


instance Info_Tpl_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_13_DasLager_Condition;
	information = Info_Tpl_13_DasLager_Info;
	permanent = 1;
	description = "А можно зайти и посмотреть храм Спящего?";
};


func int Info_Tpl_13_DasLager_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00");	//А можно зайти и посмотреть храм Спящего?
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01");	//Это невозможно! Неверным дорога в Храм закрыта. Ты сможешь войти туда только в том случае, если изберешь служение Спящему!
};


instance Info_Tpl_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_13_DieLage_Condition;
	information = Info_Tpl_13_DieLage_Info;
	permanent = 1;
	description = "Как жизнь?";
};


func int Info_Tpl_13_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01");	//Моя жизнь очень сильно изменилась, с тех пор как я посвятил себя служению Спящему.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02");	//Звучит многозначительно...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03");	//Ты один из неверных. Тебе этого не понять.
};

func void B_AssignAmbientInfos_Tpl_13(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

