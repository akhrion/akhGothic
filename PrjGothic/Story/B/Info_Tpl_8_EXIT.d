
instance Info_Tpl_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_8_EXIT_Condition;
	information = Info_Tpl_8_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Tpl_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_8_EinerVonEuchWerden_Condition;
	information = Info_Tpl_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Вам нужны верные люди?";
};


func int Info_Tpl_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00");	//Вам нужны верные люди?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01");	//Да, такие люди нам всегда нужны. Но тебе еще нужно набраться опыта. Только усердный послушник может стать Стражем.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02");	//Это большая честь для последователя Братства Спящего.
};


instance Info_Tpl_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_8_WichtigePersonen_Condition;
	information = Info_Tpl_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_8_WichtigePersonen_Info()
{
	var C_Npc YBerion;
	var C_Npc CorKalom;
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01");	//Гуру - главные среди нас. Мы делаем то, что они нам говорят. В этом состоит наше послушание.
	if(Kapitel < 3)
	{
		AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02");	//А кто здесь Гуру?
		AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03");	//Верховный Гуру лагеря, Юберион, просвещенный. Ему помогают Кор Галом, Кор Ангари и некоторые другие.
		YBerion = Hlp_GetNpc(GUR_1200_YBerion);
		CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
		CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
		YBerion.aivar[AIV_FINDABLE] = TRUE;
		CorKalom.aivar[AIV_FINDABLE] = TRUE;
		CorAngar.aivar[AIV_FINDABLE] = TRUE;
	};
};


instance Info_Tpl_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_8_DasLager_Condition;
	information = Info_Tpl_8_DasLager_Info;
	permanent = 1;
	description = "Расскажи мне об этом лагере.";
};


func int Info_Tpl_8_DasLager_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00");	//Расскажи мне об этом лагере.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01");	//Ты здесь новичок. Тебе можно ходить везде. Для неверных закрыт лишь храм Спящего.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02");	//Поэтому лучше тебе не заходить на запретную территорию и не беспокоить наших учителей во время медитации.
};


instance Info_Tpl_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_8_DieLage_Condition;
	information = Info_Tpl_8_DieLage_Info;
	permanent = 1;
	description = "Как дела?";
};


func int Info_Tpl_8_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01");	//Не забывай, ко всем служителям Спящего нужно обращаться с уважением. А я - один из избранных защитников пророков.
};

func void B_AssignAmbientInfos_Tpl_8(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc = Hlp_GetInstanceID(slf);
};

