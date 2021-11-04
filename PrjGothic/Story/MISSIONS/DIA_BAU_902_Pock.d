
var int Pock_ForgetAll;

instance DIA_Pock_EXIT(C_Info)
{
	npc = BAU_902_Pock;
	nr = 999;
	condition = DIA_Pock_EXIT_Condition;
	information = DIA_Pock_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Pock_EXIT_Condition()
{
	return 1;
};

func void DIA_Pock_EXIT_Info()
{
	Pock_ForgetAll = TRUE;
	AI_StopProcessInfos(self);
};


instance Info_Pock_Wasser(C_Info)
{
	npc = BAU_902_Pock;
	nr = 800;
	condition = Info_Pock_Wasser_Condition;
	information = Info_Pock_Wasser_Info;
	permanent = 1;
	description = "Я от Лефти. Принес воды.";
};


func int Info_Pock_Wasser_Condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void Info_Pock_Wasser_Info()
{
	AI_Output(other,self,"Info_Pock_Wasser_15_00");	//Я от Лефти. Принес воды.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		b_printtrademsg1("Отдана бутылка воды.");
		AI_Output(self,other,"Info_Pock_Wasser_04_01");	//Спасибо, приятель. Воды мне как раз не хватало!
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
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00");	//Но у тебя не осталось ни капли. Ладно, не волнуйся, я спрошу у кого-нибудь еще.
	};
};


instance DIA_Pock_Hello(C_Info)
{
	npc = BAU_902_Pock;
	nr = 1;
	condition = DIA_Pock_Hello_Condition;
	information = DIA_Pock_Hello_Info;
	permanent = 0;
	description = "Привет! Я новенький!";
};


func int DIA_Pock_Hello_Condition()
{
	if(Pock_ForgetAll == FALSE)
	{
		return 1;
	};
};

func void DIA_Pock_Hello_Info()
{
	AI_Output(other,self,"DIA_Pock_Hello_15_00");	//Привет! Я новенький!
	AI_Output(self,other,"DIA_Pock_Hello_04_01");	//Приятно видеть здесь новые лица.
	AI_Output(other,self,"DIA_Pock_Hello_15_02");	//Вижу, ты уже давно здесь?
	AI_Output(self,other,"DIA_Pock_Hello_04_03");	//Ты совершенно прав, приятель. Я попал сюда одним из первых.
};


instance DIA_Pock_KnowMuch(C_Info)
{
	npc = BAU_902_Pock;
	nr = 1;
	condition = DIA_Pock_KnowMuch_Condition;
	information = DIA_Pock_KnowMuch_Info;
	permanent = 0;
	description = "Тогда ты, наверняка, все знаешь об этом месте?";
};


func int DIA_Pock_KnowMuch_Condition()
{
	if((Pock_ForgetAll == FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello))
	{
		return 1;
	};
};

func void DIA_Pock_KnowMuch_Info()
{
	AI_Output(other,self,"DIA_Pock_KnowMuch_15_00");	//Тогда ты, наверняка, все знаешь об этом месте?
	AI_Output(self,other,"DIA_Pock_KnowMuch_04_01");	//Ну, как сказать... Я почти все время провожу здесь, на полях, выращиваю и собираю рис.
	AI_Output(self,other,"DIA_Pock_KnowMuch_04_02");	//Вот поэтому я прожил так долго. Мы получаем немного риса и шнапса, но нам этого хватает.
};


instance DIA_Pock_WhyJail(C_Info)
{
	npc = BAU_902_Pock;
	nr = 2;
	condition = DIA_Pock_WhyJail_Condition;
	information = DIA_Pock_WhyJail_Info;
	permanent = 0;
	description = "Как ты сюда попал?";
};


func int DIA_Pock_WhyJail_Condition()
{
	if((Pock_ForgetAll == FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello))
	{
		return 1;
	};
};

func void DIA_Pock_WhyJail_Info()
{
	AI_Output(other,self,"DIA_Pock_WhyJail_15_00");	//Как ты сюда попал?
	AI_Output(self,other,"DIA_Pock_WhyJail_04_01");	//Это все налоги, королевские налоги. Мой карман был так же пуст, как мой желудок. Я больше не мог платить.
	AI_Output(self,other,"DIA_Pock_WhyJail_04_02");	//А потому за мной пришли солдаты и привезли меня сюда. Но здесь не хуже, чем на воле. По крайней мере здесь я не умру от голода.
	AI_Output(self,other,"DIA_Pock_WhyJail_04_03");	//Много лет я исправно платил налоги. Но этому толстому борову, сидящему на троне, этого было мало!
};


instance DIA_Pock_ForgotAll(C_Info)
{
	npc = BAU_902_Pock;
	nr = 1;
	condition = DIA_Pock_ForgotAll_Condition;
	information = DIA_Pock_ForgotAll_Info;
	permanent = 1;
	description = "Как ты?";
};


func int DIA_Pock_ForgotAll_Condition()
{
	if(Pock_ForgetAll == TRUE)
	{
		return 1;
	};
};

func void DIA_Pock_ForgotAll_Info()
{
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_00");	//Как ты?
	AI_Output(self,other,"DIA_Pock_ForgotAll_04_01");	//Приятно видеть здесь новые лица.
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_02");	//Эй, мы, кажется, уже разговаривали с тобой!
	AI_Output(self,other,"DIA_Pock_ForgotAll_04_03");	//Нет! Неправда, быть того не может! Я тебя раньше здесь не видел.
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_04");	//Да, конечно...
};


instance INFO_POCK_WASSER_NOLEFTY(C_Info)
{
	npc = BAU_902_Pock;
	nr = 800;
	condition = info_pock_wasser_nolefty_condition;
	information = info_pock_wasser_nolefty_info;
	permanent = 1;
	description = "Я принес тебе воды.";
};


func int info_pock_wasser_nolefty_condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(Npc_HasItems(other,ItFo_Potion_Water_01) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_pock_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//Я принес тебе воды.
	b_printtrademsg1("Отдана бутылка воды.");
	AI_Output(self,other,"SVM_4_YeahWellDone");	//Отлично!
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,ItFo_Potion_Water_01);
};


instance DIA_POCK_HELLO2(C_Info)
{
	npc = BAU_902_Pock;
	nr = 1;
	condition = dia_pock_hello2_condition;
	information = dia_pock_hello2_info;
	permanent = 0;
	important = 1;
};


func int dia_pock_hello2_condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(Lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		return 1;
	};
};

func void dia_pock_hello2_info()
{
	AI_Output(self,other,"SVM_4_ItWasAGoodFight");	//Раньше даже сражались лучше, чем сейчас.
	AI_StopProcessInfos(self);
};

