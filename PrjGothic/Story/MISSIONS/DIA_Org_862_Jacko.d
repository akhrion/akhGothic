
instance Info_Jacko_EXIT(C_Info)
{
	npc = Org_862_Jacko;
	nr = 999;
	condition = Info_Jacko_EXIT_Condition;
	information = Info_Jacko_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Jacko_EXIT_Condition()
{
	return 1;
};

func void Info_Jacko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_862_Jacko_GoAway(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GoAway_Condition;
	information = ORG_862_Jacko_GoAway_Info;
	permanent = 1;
	important = 1;
};


func int ORG_862_Jacko_GoAway_Condition()
{
	if((Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN") < 500) && (Kalom_DrugMonopol != LOG_RUNNING) && (Kalom_DrugMonopol != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GoAway_Info()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00");	//Что тебе здесь нужно?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,0,"");
	Npc_SetPermAttitude(Killian,ATT_HOSTILE);
	Npc_SetTempAttitude(Killian,ATT_HOSTILE);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Npc_SetTarget(Renyu,hero);
	AI_StartState(Renyu,ZS_Attack,0,"");
	Npc_SetPermAttitude(Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(Renyu,ATT_HOSTILE);
};


instance ORG_862_Jacko_GUARD(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GUARD_Condition;
	information = ORG_862_Jacko_GUARD_Info;
	permanent = 0;
	important = 1;
};


func int ORG_862_Jacko_GUARD_Condition()
{
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GUARD_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00");	//Ты что, заблудился?
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01");	//Кор Галом уже знает, что у вас тут творится.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02");	//Что? А откуда ты это знаешь?
	B_LogEntry(CH1_DrugMonopol,"Я нашел место подпольного производства болотника. Над этим работают Джеко и два других вора.");
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Кор Галом послал сюда пятерых Стражей...",ORG_862_Jacko_GUARD_Templer);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Интересно, насколько ценным может быть то, что я скажу.",ORG_862_Jacko_GUARD_InfoWert);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Я хочу прикрыть это дело.",ORG_862_Jacko_GUARD_Angriff);
};

func void ORG_862_Jacko_GUARD_Templer()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00");	//Кор Галом послал сюда пятерых Стражей. Ему не нравится то, чем вы здесь занимаетесь.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01");	//Нет! Этого не может быть!
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02");	//Они будут здесь очень скоро.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03");	//Черт! Нам нужно уходить отсюда!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	B_LogEntry(CH1_DrugMonopol,"Несколько имен несуществующих Стражей Братства обратили этих трусов в бегство. Проблему можно считать решенной.");
	B_GiveXP(XP_JackoRetired);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00");	//Интересно, насколько ценным может быть то, что я скажу.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01");	//Ах, вот в чем дело... Ладно. Ты помог мне. У меня есть немного руды. Забирай ее.
	b_printtrademsg1("Получено руды: 95");
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02");	//А нам пора уходить. Думаю, тебе тоже не стоит здесь задерживаться.
	B_GiveInvItems(self,other,ItMiNugget,95);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	B_LogEntry(CH1_DrugMonopol,"Я сумел решить проблему, воспользовавшись своим даром убеждения. Джеко бросил свое дело и сбежал.");
	B_GiveXP(XP_JackoRetired);
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00");	//Я хочу прикрыть это дело.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01");	//Эй, парни! Идите-ка сюда на минутку!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,0,"");
	Npc_SetPermAttitude(Killian,ATT_HOSTILE);
	Npc_SetTempAttitude(Killian,ATT_HOSTILE);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Npc_SetTarget(Renyu,hero);
	AI_StartState(Renyu,ZS_Attack,0,"");
	Npc_SetPermAttitude(Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(Renyu,ATT_HOSTILE);
};


instance ORG_862_Jacko_Banditencamp(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_Banditencamp_Condition;
	information = ORG_862_Jacko_Banditencamp_Info;
	permanent = 1;
	description = "А, вот вы где спрятались.";
};


func int ORG_862_Jacko_Banditencamp_Condition()
{
	if((Kalom_DrugMonopol == LOG_SUCCESS) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_Banditencamp_Info()
{
	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00");	//А, вот вы где спрятались.
	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01");	//Да, мы были на волосок от смерти. Стражи из секты не стали бы долго раздумывать.
	AI_StopProcessInfos(self);
};

