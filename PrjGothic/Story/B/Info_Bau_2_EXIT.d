
instance Info_Bau_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Bau_2_EXIT_Condition;
	information = Info_Bau_2_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Bau_2_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Bau_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Bau_2_WichtigePersonen_Condition;
	information = Info_Bau_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Ты добровольно работаешь на рисовых полях?";
};


func int Info_Bau_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_2_WichtigePersonen_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00");	//Ты добровольно работаешь на рисовых полях?
	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01");	//Да, верно. Лучше работать здесь по доброй воле, чем под присмотром головорезов Лорда.
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02");	//Ясно.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Bau_2_DasLager_Condition;
	information = Info_Bau_2_DasLager_Info;
	permanent = 1;
	description = "Что ты можешь рассказать о лагере?";
};


func int Info_Bau_2_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_2_DasLager_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Bau_2_DasLager_15_00");	//Что ты можешь рассказать о лагере?
	AI_Output(self,other,"Info_Bau_2_DasLager_02_01");	//Там довольно опасно. Наемники Ли и маги еще ничего, но берегись воров!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Bau_2_DieLage_Condition;
	information = Info_Bau_2_DieLage_Info;
	permanent = 1;
	description = "Ты в порядке?";
};


func int Info_Bau_2_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_2_DieLage_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_2_DieLage_15_00");	//Ты в порядке?
	AI_Output(self,other,"Info_Bau_2_DieLage_02_01");	//Что тебе нужно? Тебя послал Лорд? Я и так уже работаю изо всех сил!
	AI_Output(other,self,"Info_Bau_2_DieLage_15_02");	//Никто меня к тебе не посылал, просто хочу поговорить с тобой.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_Wasser(C_Info)
{
	nr = 800;
	condition = Info_Bau_2_Wasser_Condition;
	information = Info_Bau_2_Wasser_Info;
	permanent = 1;
	description = "Меня Лефти послал. Я принес воды.";
};


func int Info_Bau_2_Wasser_Condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void Info_Bau_2_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_2_Wasser_15_00");	//Меня Лефти послал. Я принес воды.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		b_printtrademsg1("Отдана бутылка воды.");
		AI_Output(self,other,"Info_Bau_2_Wasser_02_01");	//Спасибо, парень. Я умираю от жажды.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00");	//Вода! Эй, парень! Здесь совсем ничего не осталось! Только не говори мне, что воду опять получили все, кроме меня!
	};
};


instance INFO_BAU_2_WASSER_NOLEFTY(C_Info)
{
	nr = 800;
	condition = info_bau_2_wasser_nolefty_condition;
	information = info_bau_2_wasser_nolefty_info;
	permanent = 1;
	description = "Я принес тебе воды.";
};


func int info_bau_2_wasser_nolefty_condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(Npc_HasItems(other,ItFo_Potion_Water_01) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_bau_2_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//Я принес тебе воды.
	b_printtrademsg1("Отдана бутылка воды.");
	AI_Output(self,other,"Info_Bau_2_Wasser_02_01");	//Спасибо, парень. Я умираю от жажды.
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,ItFo_Potion_Water_01);
};

func void B_AssignAmbientInfos_Bau_2(var C_Npc slf)
{
	Info_Bau_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_Wasser.npc = Hlp_GetInstanceID(slf);
	info_bau_2_wasser_nolefty.npc = Hlp_GetInstanceID(slf);
};

