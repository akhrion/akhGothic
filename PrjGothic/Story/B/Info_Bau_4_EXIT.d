
instance Info_Bau_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Bau_4_EXIT_Condition;
	information = Info_Bau_4_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Bau_4_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Bau_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Bau_4_WichtigePersonen_Condition;
	information = Info_Bau_4_WichtigePersonen_Info;
	permanent = 1;
	description = "У вас есть главный?";
};


func int Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_4_WichtigePersonen_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00");	//У вас есть главный?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01");	//Ну, здесь все подчиняются Лорду. Но большая часть людей работает на его полях из страха перед ним и его головорезами.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02");	//Но я их не боюсь. Я живу здесь уже несколько лет и мне давно надоело иметь дело с ворами из лагеря... Поэтому рисовые поля для меня как раз то, что нужно.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_4_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Bau_4_DasLager_Condition;
	information = Info_Bau_4_DasLager_Info;
	permanent = 1;
	description = "Есть что-нибудь, что я должен узнать об этом месте?";
};


func int Info_Bau_4_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00");	//Есть что-нибудь, что я должен узнать об этом месте?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01");	//Будь осторожен, в этом лагере с тобой всякое может случиться. Здесь полно головорезов, которые могут избить до полусмерти такого новичка, как ты, просто ради забавы.
};


instance Info_Bau_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Bau_4_DieLage_Condition;
	information = Info_Bau_4_DieLage_Info;
	permanent = 1;
	description = "Как идут дела?";
};


func int Info_Bau_4_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00");	//Как идут дела?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01");	//У нас здесь полно работы. Нужно много риса, чтобы прокормить всех, кто живет в лагере.
};


instance Info_Bau_4_Wasser(C_Info)
{
	nr = 800;
	condition = Info_Bau_4_Wasser_Condition;
	information = Info_Bau_4_Wasser_Info;
	permanent = 1;
	description = "Меня прислал Лефти. Я принес тебе воды.";
};


func int Info_Bau_4_Wasser_Condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void Info_Bau_4_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00");	//Меня прислал Лефти. Я принес тебе воды.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		b_printtrademsg1("Отдана бутылка воды.");
		AI_Output(self,other,"Info_Bau_4_Wasser_04_01");	//Спасибо! Мне ее так не хватало!
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
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00");	//Да, у тебя же не осталось ни капли. Ладно, я спрошу у кого-нибудь другого.
	};
};


instance INFO_BAU_4_WASSER_NOLEFTY(C_Info)
{
	nr = 800;
	condition = info_bau_4_wasser_nolefty_condition;
	information = info_bau_4_wasser_nolefty_info;
	permanent = 1;
	description = "Я принес тебе воды.";
};


func int info_bau_4_wasser_nolefty_condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(Npc_HasItems(other,ItFo_Potion_Water_01) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_bau_4_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//Я принес тебе воды.
	b_printtrademsg1("Отдана бутылка воды.");
	AI_Output(self,other,"Info_Pock_Wasser_04_01");	//Спасибо, приятель. Воды мне как раз не хватало!
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,ItFo_Potion_Water_01);
};

func void B_AssignAmbientInfos_Bau_4(var C_Npc slf)
{
	Info_Bau_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_Wasser.npc = Hlp_GetInstanceID(slf);
	info_bau_4_wasser_nolefty.npc = Hlp_GetInstanceID(slf);
};

