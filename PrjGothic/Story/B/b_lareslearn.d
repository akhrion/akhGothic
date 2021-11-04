
func void b_lareslearn()
{
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,(5 * LPCOST_ATTRIBUTE_STRENGTH),OTHERCAMPLEARNPAY * 5),ORG_801_Lares_Teach_STR_5);
		Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),ORG_801_Lares_Teach_STR_1);
		Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,(5 * LPCOST_ATTRIBUTE_DEXTERITY),OTHERCAMPLEARNPAY * 5),ORG_801_Lares_Teach_DEX_5);
		Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),ORG_801_Lares_Teach_DEX_1);
	}
	else
	{
		Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
		Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
		Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
		Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
	};
};


instance ORG_801_Lares_Exit(C_Info)
{
	npc = Org_801_Lares;
	nr = 999;
	condition = ORG_801_Lares_Exit_Condition;
	information = ORG_801_Lares_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int ORG_801_Lares_Exit_Condition()
{
	return 1;
};

func void ORG_801_Lares_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Lares_vorbeigemogelt;

instance ORG_801_Lares_YouHere(C_Info)
{
	npc = Org_801_Lares;
	nr = 1;
	condition = ORG_801_Lares_YouHere_Condition;
	information = ORG_801_Lares_YouHere_Info;
	permanent = 1;
	important = 1;
};


func int ORG_801_Lares_YouHere_Condition()
{
	var C_Npc Roscoe;
	Roscoe = Hlp_GetNpc(ORG_840_Roscoe);
	if((Roscoe.aivar[AIV_PASSGATE] == FALSE) && (Lares_vorbeigemogelt == FALSE))
	{
		return 1;
	};
};

func void ORG_801_Lares_YouHere_Info()
{
	var C_Npc Roscoe;
	Roscoe = Hlp_GetNpc(ORG_840_Roscoe);
	if((Npc_IsInState(Roscoe,ZS_MagicSleep) || (Npc_GetTempAttitude(Roscoe,other) == ATT_FRIENDLY) || Npc_IsInState(Roscoe,ZS_Unconscious) || Npc_IsDead(Roscoe)) && (hero.guild != GIL_GRD) && (hero.guild != GIL_STT))
	{
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00");	//Как ты попал сюда, и что случилось с Роско?
		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01");	//Он не захотел меня останавливать.
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02");	//Что тебе от меня нужно?
		Roscoe.aivar[AIV_PASSGATE] = TRUE;
		Lares_vorbeigemogelt = TRUE;
		B_GiveXP(XP_CheatedIntoLaresHut);
	}
	else
	{
		AI_StopProcessInfos(self);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		B_IntruderAlert(self,other);
		B_SetAttackReason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	};
};


instance ORG_801_Lares_WannaJoin(C_Info)
{
	npc = Org_801_Lares;
	nr = 1;
	condition = ORG_801_Lares_WannaJoin_Condition;
	information = ORG_801_Lares_WannaJoin_Info;
	permanent = 0;
	description = "Я хочу стать одним из вас.";
};


func int ORG_801_Lares_WannaJoin_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_WannaJoin_Info()
{
	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00");	//Я хочу стать одним из вас.
	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01");	//Да? А кто ты вообще такой?
};


instance ORG_801_Lares_BringList(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringList_Condition;
	information = ORG_801_Lares_BringList_Info;
	permanent = 0;
	description = "У меня есть список припасов для Старой шахты.";
};


func int ORG_801_Lares_BringList_Condition()
{
	if(Npc_HasItems(hero,TheList) && (Npc_KnowsInfo(hero,org_801_lares_newlist) || Npc_KnowsInfo(hero,Info_Diego_BringList_Offer)) && !Npc_KnowsInfo(hero,Info_Diego_OCWARN) && !Npc_KnowsInfo(hero,Info_Milten_OCWARN))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringList_Info()
{
	AI_Output(other,self,"ORG_801_Lares_BringList_15_00");	//У меня есть список припасов для Старой шахты.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_01");	//Да ты что? Невероятно! А ты смелый парень, как я погляжу.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_02");	//Покажи его мне!
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//Вот он...
	b_printtrademsg1("Отдан список.");
	B_UseFakeScroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_04");	//Так, так. Знаешь, что мы сейчас сделаем? Мы его немного подправим, а потом ты отнесешь его в Старый лагерь.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05_01");	//А потом, когда они доставят товар в шахту, мы просто заберем его себе! Ну, вот, сейчас мы все сделаем...
	B_UseFakeScroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05_02");	//Есть! Вот и списочек. Ты знаешь, что делать.
	b_printtrademsg2("Получен дополненный список.");
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem(hero,TheList);
	CreateInvItem(hero,TheListNC);
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
		B_LogEntry(CH1_JoinNC,"Ларс, главарь шайки воров, был сильно удивлен, когда я принес ему список. Он дополнил его и велел отнести Диего.");
	};
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_LogEntry(CH1_BringList,"Я решил отдать список Ларсу, главарю воров. Он дополнил его и велел отнести Диего.");
	}
	else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_LogEntry(THELISTFORNC,"Ларс дополнил украденный мной список и велел отнести его Диего.");
	};
	B_GiveXP(XP_GiveListToLares);
};


instance ORG_801_Lares_BringListBack(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringListBack_Condition;
	information = ORG_801_Lares_BringListBack_Info;
	permanent = 0;
	description = "Я передал список Диего.";
};


func int ORG_801_Lares_BringListBack_Condition()
{
	if((Lares_BringListBack == LOG_RUNNING) && (Diego_BringList == LOG_SUCCESS))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringListBack_Info()
{
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00");	//Я передал список Диего.
	AI_Output(self,other,"ORG_801_Lares_BringListBack_11_01");	//Хорошо! Я как раз направил своих людей к Старой шахте. Стражники Торуса должны сейчас лежать себе спокойно в лесу.
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_LogEntry(CH1_BringList,"Ларс со своей шайкой напал на конвой с грузом для Старой шахты. Конечно, он не захотел ждать моего возвращения.");
		Log_SetTopicStatus(CH1_BringList,LOG_SUCCESS);
	}
	else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_LogEntry(THELISTFORNC,"Ларс со своей шайкой напал на конвой с грузом для Старой шахты. Конечно, он не захотел ждать моего возвращения.");
		Log_SetTopicStatus(THELISTFORNC,LOG_SUCCESS);
	};
	Log_SetTopicStatus(THELISTFORNC,LOG_SUCCESS);
	B_GiveXP(XP_ReportListDeliveryToLares);
	if(Kapitel < 4)
	{
		B_ExchangeRoutine(grd_896_gardist,"dead2");
		B_ExchangeRoutine(grd_895_gardist,"dead2");
		B_ExchangeRoutine(grd_894_gardist,"dead2");
		B_ExchangeRoutine(grd_893_gardist,"dead2");
		B_ExchangeRoutine(grd_872_gardist,"dead2");
		B_KillNpc(grd_896_gardist);
		B_KillNpc(grd_895_gardist);
		B_KillNpc(grd_894_gardist);
		B_KillNpc(grd_893_gardist);
		B_KillNpc(grd_872_gardist);
		Npc_RemoveInvItems(grd_896_gardist,ItAmBolt,Npc_HasItems(grd_896_gardist,ItAmBolt));
		Npc_RemoveInvItems(grd_895_gardist,ItAmBolt,Npc_HasItems(grd_895_gardist,ItAmBolt));
		Npc_RemoveInvItems(grd_894_gardist,ItAmBolt,Npc_HasItems(grd_894_gardist,ItAmBolt));
		Npc_RemoveInvItems(grd_893_gardist,ItAmBolt,Npc_HasItems(grd_893_gardist,ItAmBolt));
		Npc_RemoveInvItems(grd_872_gardist,ItAmBolt,Npc_HasItems(grd_872_gardist,ItAmBolt));
		Npc_RemoveInvItem(grd_896_gardist,ItFoMutton);
		Npc_RemoveInvItem(grd_895_gardist,ItFoMutton);
		Npc_RemoveInvItem(grd_894_gardist,ItFoMutton);
		Npc_RemoveInvItem(grd_893_gardist,ItFoMutton);
		Npc_RemoveInvItem(grd_872_gardist,ItFoMutton);
		Npc_RemoveInvItem(grd_896_gardist,ItMw_1H_LightGuardsSword_03);
		Npc_RemoveInvItem(grd_895_gardist,ItMw_1H_Sword_03);
		Npc_RemoveInvItem(grd_894_gardist,ItMw_1H_Sword_03);
		Npc_RemoveInvItem(grd_893_gardist,ItMw_1H_Sword_03);
		Npc_RemoveInvItem(grd_872_gardist,ItMw_1H_Sword_03);
		Npc_RemoveInvItem(grd_896_gardist,ItRw_Crossbow_03);
		Npc_RemoveInvItem(grd_895_gardist,ItRw_Crossbow_03);
		Npc_RemoveInvItem(grd_894_gardist,ItRw_Crossbow_03);
		Npc_RemoveInvItem(grd_893_gardist,ItRw_Crossbow_03);
		Npc_RemoveInvItem(grd_872_gardist,ItRw_Crossbow_03);
		Npc_RemoveInvItem(grd_896_gardist,ItFo_Potion_Health_01);
		Npc_RemoveInvItem(grd_895_gardist,ItFo_Potion_Health_01);
		Npc_RemoveInvItem(grd_894_gardist,ItFo_Potion_Health_01);
		Npc_RemoveInvItem(grd_893_gardist,ItFo_Potion_Health_01);
		Npc_RemoveInvItem(grd_872_gardist,ItFo_Potion_Health_01);
	};
};


instance ORG_801_Lares_BringListAnteil(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringListAnteil_Condition;
	information = ORG_801_Lares_BringListAnteil_Info;
	permanent = 0;
	description = "Так груз из Старого лагеря уже захвачен? А как же моя доля?";
};


func int ORG_801_Lares_BringListAnteil_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringListAnteil_Info()
{
	var C_Npc gorn;
	AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_00");	//Так груз из Старого лагеря уже захвачен? А как же моя доля?
	AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_01");	//Иди к Горну. Он отдаст тебе твою долю.
	gorn = Hlp_GetNpc(PC_Fighter);
	if(gorn.aivar[AIV_FINDABLE] == TRUE)
	{
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_02");	//Я знаю Горна. Он один из наемников, которые охраняют магов.
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_03");	//Да, так и есть.
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_04");	//Так он тоже в этом участвовал?
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_05");	//Ты слишком любопытен. Тебе это знать не положено. Просто иди к нему и возьми свою долю.
	};
	B_LogEntry(CH1_JoinNC,"Наемник Горн каким-то образом участвовал в нападении на груз из Старого лагеря. Я могу взять свою долю у него.");
	gorn.aivar[AIV_FINDABLE] = TRUE;
};


instance ORG_801_Lares_MordragSentMe(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_MordragSentMe_Condition;
	information = ORG_801_Lares_MordragSentMe_Info;
	permanent = 0;
	description = "Меня прислал Мордраг. Он передал тебе это кольцо.";
};


func int ORG_801_Lares_MordragSentMe_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && Npc_HasItems(hero,MordragsRing) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_MordragSentMe_Info()
{
	B_GiveInvItems(other,self,MordragsRing,1);
	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00");	//Меня прислал Мордраг. Он передал тебе это кольцо.
	b_printtrademsg1("Отдано кольцо Мордрага.");
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01");	//Хорошая вещица! У нас так принято: взял что-то, поделись с главарем шайки.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02");	//Но то, что он доверил это кольцо тебе, говорит в твою пользу.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03");	//Я хочу, чтобы ты сходил к нему и передал ему кое-что от меня.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04");	//Скажи ему, что нам нужно заслать в Лагерь сектантов своего человека. Я хочу знать, что они там затевают.
	Lares_InformMordrag = LOG_RUNNING;
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
		B_LogEntry(CH1_JoinNC,"Ларс послал меня к Мордрагу. Я должен сказать ему, что в Лагерь сектантов нужно послать шпиона. Необходимо разузнать, что готовят братья.");
	};
	B_GiveXP(XP_GiveRingToLares);
	Points_NC = Points_NC + 10;
};


instance ORG_801_Lares_Vorbeigemogelt(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_Vorbeigemogelt_Condition;
	information = ORG_801_Lares_Vorbeigemogelt_Info;
	permanent = 0;
	description = "Но я же смог пройти мимо твоих охранников.";
};


func int ORG_801_Lares_Vorbeigemogelt_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && (Lares_vorbeigemogelt == TRUE))
	{
		return 1;
	};
};

func void ORG_801_Lares_Vorbeigemogelt_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00");	//Но я же смог пройти мимо твоих охранников.
	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01");	//Ты прав. Но этого недостаточно.
	Points_NC = Points_NC + 10;
};


var int Lares_Get400Ore;

instance ORG_801_Lares_GetKraut(C_Info)
{
	npc = Org_801_Lares;
	nr = 10;
	condition = ORG_801_Lares_GetKraut_Condition;
	information = ORG_801_Lares_GetKraut_Info;
	permanent = 0;
	description = "А что еще нужно сделать?";
};


func int ORG_801_Lares_GetKraut_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_BringList) || Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_Vorbeigemogelt))
	{
		return 1;
	};
};

func void ORG_801_Lares_GetKraut_Info()
{
	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00");	//А что еще нужно сделать?
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01");	//У Идола Исидро из лагеря сектантов есть трава на четыреста кусков руды. Я хочу, чтобы ты забрал у него эту траву. Мне неважно, каким образом.
	if((BaalIsidro_DealerJob == LOG_RUNNING) || (BaalIsidro_DealerJob == LOG_SUCCESS))
	{
		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02");	//Вообще-то, у меня уже есть та куча болотника, о которой ты говоришь.
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03");	//Да, умный ты парень!
	};
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04");	//Если так, то продай и принеси мне четыреста кусков руды.
	Lares_Get400Ore = LOG_RUNNING;
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05");	//Тогда можно будет поговорить о твоем приеме в нашу шайку.
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
		B_LogEntry(CH1_JoinNC,"Я должен взять болотник у Идола Исидро и продать его за 400 кусков руды, которые нужно принести Ларсу.");
	};
};


instance ORG_801_Lares_400Ore(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_400Ore_Condition;
	information = ORG_801_Lares_400Ore_Info;
	permanent = 1;
	description = "У меня есть четыреста кусков руды.";
};


func int ORG_801_Lares_400Ore_Condition()
{
	if((Lares_Get400Ore == LOG_RUNNING) && ((BaalIsidro_DealerJob == LOG_RUNNING) || (BaalIsidro_DealerJob == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void ORG_801_Lares_400Ore_Info()
{
	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00");	//У меня есть четыреста кусков руды.
	if(Npc_HasItems(other,ItMiNugget) >= 400)
	{
		b_printtrademsg1("Отдано руды: 400");
		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01");	//Отлично! Конечно, это более чем достаточно.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		B_GiveInvItems(other,self,ItMiNugget,400);
		if(BaalIsidro_DealerJob == LOG_RUNNING)
		{
			B_LogEntry(CH1_JoinNC,"Ларс был очень доволен тем, что я принес ему 400 кусков руды, вырученные за болотник Идола Исидро.");
		}
		else
		{
			B_LogEntry(CH1_JoinNC,"Ларс был очень доволен тем, что я принес ему 400 кусков руды.");
		};
		B_GiveXP(XP_BaalIsidroPayLares);
	}
	else
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00");	//Пересчитай-ка еще раз, вся ли руда не месте.
	};
};


instance ORG_801_Lares_Reicht(C_Info)
{
	npc = Org_801_Lares;
	nr = 5;
	condition = ORG_801_Lares_Reicht_Condition;
	information = ORG_801_Lares_Reicht_Info;
	permanent = 1;
	description = "Этого достаточно, чтобы меня приняли в шайку?";
};


func int ORG_801_Lares_Reicht_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && (Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_BringList) || (Lares_Get400Ore == LOG_SUCCESS)) && (Npc_GetTrueGuild(other) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_Reicht_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00");	//Этого достаточно, чтобы меня приняли в шайку?
	if((Points_NC >= 30) && (hero.level >= 5))
	{
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00");	//Думаю, да.
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01");	//Я даже приготовил тебе подарок - доспех, если быть точным. Подарок, конечно, небольшой, но заслуженный.
		b_printtrademsg1("Получен легкий доспех вора.");
		CreateInvItem(hero,org_armor_l);
		Npc_SetTrueGuild(hero,GIL_ORG);
		hero.guild = GIL_ORG;
		B_GiveXP(XP_BecomeBandit);
		B_LogEntry(CH1_JoinNC,"Ларс принял меня в свою шайку. Отныне Новый лагерь будет моим домом!");
		Log_SetTopicStatus(CH1_JoinNC,LOG_SUCCESS);
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_FAILED);
		B_LogEntry(CH1_JoinOC,"Как один из людей Ларса я не могу быть принят в Старый лагерь.");
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_FAILED);
		B_LogEntry(CH1_JoinPsi,"Братство не примет меня, так как я уже стал членом Нового лагеря.");
		if(DIFF_HARD == FALSE)
		{
			Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
			B_LogEntry(GE_TeacherNC,"Я вступил в Новый лагерь и теперь некоторые учителя будут согласны учить меня бесплатно.");
			FREELEARN_NC = TRUE;
		};
		if(BaalOrun_FetchWeed == LOG_RUNNING)
		{
			B_LogEntry(CH1_DeliverWeed,"Члену шайки Ларса не пристало быть на побегушках у сектантов. Думаю, у них и без меня найдется, кому таскать тюки с травой.");
			Log_SetTopicStatus(CH1_DeliverWeed,LOG_FAILED);
			BaalOrun_FetchWeed = LOG_FAILED;
		};
		if(Thorus_MordragKo == LOG_RUNNING)
		{
			Thorus_MordragKo = LOG_FAILED;
			Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
			B_LogEntry(CH1_MordragKO,"Теперь я с ворами, а наш Мордраг может делать в Старом лагере все, что захочет!");
		};
		if((Kirgo_Charged == TRUE) && (KIRGO_CHARGED_END == FALSE))
		{
			Kirgo_Charged = FALSE;
			B_ExchangeRoutine(GRD_251_Kirgo,"START");
		};
		if((Kharim_Charged == TRUE) && (KHARIM_CHARGED_END == FALSE))
		{
			Kharim_Charged = FALSE;
			B_ExchangeRoutine(Sld_729_Kharim,"START");
		};
		B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
	}
	else
	{
		if(Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02");	//Мордраг рассказал мне о тебе.
		};
		if(Npc_KnowsInfo(hero,ORG_801_Lares_BringList))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03");	//Ты доказал свою преданность нам, когда принес список.
		};
		if(Lares_Get400Ore == LOG_SUCCESS)
		{
			AI_Output(self,other,"SVM_11_ITookYourOre");	//Как хорошо, что ты поделился со мной этой рудой!
		};
		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04");	//Но ты еще не готов. Иди, выполняй другие поручения.
		if(hero.level < 5)
		{
			B_PrintGuildCondition(5);
		};
	};
};


instance ORG_801_Lares_GotoKalom(C_Info)
{
	npc = Org_801_Lares;
	nr = 10;
	condition = ORG_801_Lares_GotoKalom_Condition;
	information = ORG_801_Lares_GotoKalom_Info;
	permanent = 0;
	description = "И что же мне теперь делать?";
};


func int ORG_801_Lares_GotoKalom_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		return 1;
	};
};

func void ORG_801_Lares_GotoKalom_Info()
{
	var C_Npc Mordrag;
	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00");	//И что же мне теперь делать?
	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01");	//Теперь ты один из нас. При этом мы не посягаем на твою свободу. Делай все, что захочешь.
	Log_CreateTopic(CH1_GotoPsiCamp,LOG_MISSION);
	Log_SetTopicStatus(CH1_GotoPsiCamp,LOG_RUNNING);
	B_LogEntry(CH1_GotoPsiCamp,"Братья из Болотного лагеря к чему-то готовятся. Ларс, главарь банды воров, хочет знать, к чему именно.");
	if(Lares_InformMordrag == LOG_RUNNING)
	{
		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02");	//Если ты действительно хочешь быть нам полезен, иди к Мордрагу и помоги ему справиться с делом сектантов.
		B_LogEntry(CH1_GotoPsiCamp,"Я должен помочь Мордрагу разузнать, что там происходит!");
	}
	else
	{
		Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
		if(Npc_IsDead(Mordrag))
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03");	//Один из наших людей из Старого лагеря, Мордраг, был убит. Перед смертью он направил нам послание. В Лагере сектантов затевается что-то серьезное.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04");	//Сходи в лагерь Братства и выясни, что они замышляют.
			B_LogEntry(CH1_GotoPsiCamp,"Он направил меня прямо в лагерь Братства.");
		}
		else
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05");	//Мордраг, один из наших людей в Старом лагере, вернулся недавно.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06");	//Иди и поговори с ним. Скажи ему, что у нас уже есть свой человек в Лагере сектантов. Братство затевает что-то серьезное. Я хочу знать, что именно.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07");	//Помоги ему.
			B_LogEntry(CH1_GotoPsiCamp,"Это дело было возложено на вора по имени Мордраг. Я могу найти его в баре на озере, в Новом лагере.");
			B_ExchangeRoutine(ORG_826_Mordrag,"START");
			Lares_InformMordrag = LOG_RUNNING;
		};
	};
};


instance ORG_801_Lares_WhereLearn(C_Info)
{
	npc = Org_801_Lares;
	nr = 20;
	condition = ORG_801_Lares_WhereLearn_Condition;
	information = ORG_801_Lares_WhereLearn_Info;
	permanent = 0;
	description = "Кто здесь может меня чему-нибудь научить?";
};


func int ORG_801_Lares_WhereLearn_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		return 1;
	};
};

func void ORG_801_Lares_WhereLearn_Info()
{
	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01");	//Кто здесь может меня чему-нибудь научить?
	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02");	//Я могу научить тебя, как стать более сильным и ловким.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Ларс может помочь мне увеличить силу и ловкость.");
};


instance ORG_801_Lares_Teach(C_Info)
{
	npc = Org_801_Lares;
	nr = 20;
	condition = ORG_801_Lares_Teach_Condition;
	information = ORG_801_Lares_Teach_Info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int ORG_801_Lares_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WhereLearn))
	{
		return TRUE;
	};
};

func void ORG_801_Lares_Teach_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Я хочу улучшить свои навыки.
	b_lareslearn();
};

func void ORG_801_Lares_Teach_BACK()
{
	Info_ClearChoices(ORG_801_Lares_Teach);
};

func void ORG_801_Lares_Teach_STR_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_STRENGTH] < 100))
		{
			b_printtrademsg1("Отдано руды: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_lareslearn();
};

func void ORG_801_Lares_Teach_STR_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_STRENGTH] < 96))
		{
			b_printtrademsg1("Отдано руды: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_lareslearn();
};

func void ORG_801_Lares_Teach_DEX_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_DEXTERITY] < 100))
		{
			b_printtrademsg1("Отдано руды: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_lareslearn();
};

func void ORG_801_Lares_Teach_DEX_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_DEXTERITY] < 96))
		{
			b_printtrademsg1("Отдано руды: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_lareslearn();
};


instance ORG_801_LARES_NEWLIST(C_Info)
{
	npc = Org_801_Lares;
	nr = 1;
	condition = org_801_lares_newlist_condition;
	information = org_801_lares_newlist_info;
	permanent = 0;
	description = "У тебя есть для меня еще какое-нибудь задание?";
};


func int org_801_lares_newlist_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_ORG) && Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Success) && !Npc_KnowsInfo(hero,ORG_801_Lares_BringList) && (Kapitel < 4))
	{
		return 1;
	};
};

func void org_801_lares_newlist_info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//У тебя есть для меня еще какое-нибудь задание?
	AI_Output(self,other,"ORG_801_Lares_NewList_01");	//В Старой шахте всем заправляет Призрак по имени Ян. Он отвечает за поставки и каждые несколько недель пишет список нужных припасов.
	AI_Output(self,other,"ORG_801_Lares_NewList_02");	//Я хочу, чтобы ты отправился туда, выкрал у Яна этот список и принес его мне. Обратись к Веджу в нашем лагере, он бесплатно обучит тебя всему необходимому.
	if(!Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		Log_CreateTopic(THELISTFORNC,LOG_MISSION);
		Log_SetTopicStatus(THELISTFORNC,LOG_RUNNING);
		B_LogEntry(THELISTFORNC,"Ларсу нужен список припасов, который я выкраду у Яна в Старой шахте.");
	}
	else
	{
		B_LogEntry(CH1_BringList,"Ларс предложил перехитрить людей Гомеза и принести список из шахты не Диего, а ему.");
	};
};

