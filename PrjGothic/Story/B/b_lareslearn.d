
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
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00");	//��� �� ����� ����, � ��� ��������� � �����?
		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01");	//�� �� ������� ���� �������������.
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02");	//��� ���� �� ���� �����?
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
	description = "� ���� ����� ����� �� ���.";
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
	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00");	//� ���� ����� ����� �� ���.
	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01");	//��? � ��� �� ������ �����?
};


instance ORG_801_Lares_BringList(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringList_Condition;
	information = ORG_801_Lares_BringList_Info;
	permanent = 0;
	description = "� ���� ���� ������ �������� ��� ������ �����.";
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
	AI_Output(other,self,"ORG_801_Lares_BringList_15_00");	//� ���� ���� ������ �������� ��� ������ �����.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_01");	//�� �� ���? ����������! � �� ������ ������, ��� � �������.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_02");	//������ ��� ���!
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//��� ��...
	b_printtrademsg1("����� ������.");
	B_UseFakeScroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_04");	//���, ���. ������, ��� �� ������ �������? �� ��� ������� ���������, � ����� �� �������� ��� � ������ ������.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05_01");	//� �����, ����� ��� �������� ����� � �����, �� ������ ������� ��� ����! ��, ���, ������ �� ��� �������...
	B_UseFakeScroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05_02");	//����! ��� � ��������. �� ������, ��� ������.
	b_printtrademsg2("������� ����������� ������.");
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem(hero,TheList);
	CreateInvItem(hero,TheListNC);
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
		B_LogEntry(CH1_JoinNC,"����, ������� ����� �����, ��� ������ �������, ����� � ������ ��� ������. �� �������� ��� � ����� ������� �����.");
	};
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_LogEntry(CH1_BringList,"� ����� ������ ������ �����, ������� �����. �� �������� ��� � ����� ������� �����.");
	}
	else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_LogEntry(THELISTFORNC,"���� �������� ���������� ���� ������ � ����� ������� ��� �����.");
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
	description = "� ������� ������ �����.";
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
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00");	//� ������� ������ �����.
	AI_Output(self,other,"ORG_801_Lares_BringListBack_11_01");	//������! � ��� ��� �������� ����� ����� � ������ �����. ��������� ������ ������ ������ ������ ���� �������� � ����.
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_LogEntry(CH1_BringList,"���� �� ����� ������ ����� �� ������ � ������ ��� ������ �����. �������, �� �� ������� ����� ����� �����������.");
		Log_SetTopicStatus(CH1_BringList,LOG_SUCCESS);
	}
	else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_LogEntry(THELISTFORNC,"���� �� ����� ������ ����� �� ������ � ������ ��� ������ �����. �������, �� �� ������� ����� ����� �����������.");
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
	description = "��� ���� �� ������� ������ ��� ��������? � ��� �� ��� ����?";
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
	AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_00");	//��� ���� �� ������� ������ ��� ��������? � ��� �� ��� ����?
	AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_01");	//��� � �����. �� ������ ���� ���� ����.
	gorn = Hlp_GetNpc(PC_Fighter);
	if(gorn.aivar[AIV_FINDABLE] == TRUE)
	{
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_02");	//� ���� �����. �� ���� �� ���������, ������� �������� �����.
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_03");	//��, ��� � ����.
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_04");	//��� �� ���� � ���� ����������?
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_05");	//�� ������� ���������. ���� ��� ����� �� ��������. ������ ��� � ���� � ������ ���� ����.
	};
	B_LogEntry(CH1_JoinNC,"������� ���� �����-�� ������� ���������� � ��������� �� ���� �� ������� ������. � ���� ����� ���� ���� � ����.");
	gorn.aivar[AIV_FINDABLE] = TRUE;
};


instance ORG_801_Lares_MordragSentMe(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_MordragSentMe_Condition;
	information = ORG_801_Lares_MordragSentMe_Info;
	permanent = 0;
	description = "���� ������� �������. �� ������� ���� ��� ������.";
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
	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00");	//���� ������� �������. �� ������� ���� ��� ������.
	b_printtrademsg1("������ ������ ��������.");
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01");	//������� ������! � ��� ��� �������: ���� ���-��, �������� � �������� �����.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02");	//�� ��, ��� �� ������� ��� ������ ����, ������� � ���� ������.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03");	//� ����, ����� �� ������ � ���� � ������� ��� ���-��� �� ����.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04");	//����� ���, ��� ��� ����� ������� � ������ ��������� ������ ��������. � ���� �����, ��� ��� ��� ��������.
	Lares_InformMordrag = LOG_RUNNING;
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
		B_LogEntry(CH1_JoinNC,"���� ������ ���� � ��������. � ������ ������� ���, ��� � ������ ��������� ����� ������� ������. ���������� ���������, ��� ������� ������.");
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
	description = "�� � �� ���� ������ ���� ����� ����������.";
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
	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00");	//�� � �� ���� ������ ���� ����� ����������.
	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01");	//�� ����. �� ����� ������������.
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
	description = "� ��� ��� ����� �������?";
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
	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00");	//� ��� ��� ����� �������?
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01");	//� ����� ������ �� ������ ��������� ���� ����� �� ��������� ������ ����. � ����, ����� �� ������ � ���� ��� �����. ��� �������, ����� �������.
	if((BaalIsidro_DealerJob == LOG_RUNNING) || (BaalIsidro_DealerJob == LOG_SUCCESS))
	{
		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02");	//������-��, � ���� ��� ���� �� ���� ���������, � ������� �� ��������.
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03");	//��, ����� �� ������!
	};
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04");	//���� ���, �� ������ � ������� ��� ��������� ������ ����.
	Lares_Get400Ore = LOG_RUNNING;
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05");	//����� ����� ����� ���������� � ����� ������ � ���� �����.
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
		B_LogEntry(CH1_JoinNC,"� ������ ����� �������� � ����� ������ � ������� ��� �� 400 ������ ����, ������� ����� �������� �����.");
	};
};


instance ORG_801_Lares_400Ore(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_400Ore_Condition;
	information = ORG_801_Lares_400Ore_Info;
	permanent = 1;
	description = "� ���� ���� ��������� ������ ����.";
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
	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00");	//� ���� ���� ��������� ������ ����.
	if(Npc_HasItems(other,ItMiNugget) >= 400)
	{
		b_printtrademsg1("������ ����: 400");
		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01");	//�������! �������, ��� ����� ��� ����������.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		B_GiveInvItems(other,self,ItMiNugget,400);
		if(BaalIsidro_DealerJob == LOG_RUNNING)
		{
			B_LogEntry(CH1_JoinNC,"���� ��� ����� ������� ���, ��� � ������ ��� 400 ������ ����, ���������� �� �������� ����� ������.");
		}
		else
		{
			B_LogEntry(CH1_JoinNC,"���� ��� ����� ������� ���, ��� � ������ ��� 400 ������ ����.");
		};
		B_GiveXP(XP_BaalIsidroPayLares);
	}
	else
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00");	//����������-�� ��� ���, ��� �� ���� �� �����.
	};
};


instance ORG_801_Lares_Reicht(C_Info)
{
	npc = Org_801_Lares;
	nr = 5;
	condition = ORG_801_Lares_Reicht_Condition;
	information = ORG_801_Lares_Reicht_Info;
	permanent = 1;
	description = "����� ����������, ����� ���� ������� � �����?";
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
	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00");	//����� ����������, ����� ���� ������� � �����?
	if((Points_NC >= 30) && (hero.level >= 5))
	{
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00");	//�����, ��.
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01");	//� ���� ���������� ���� ������� - ������, ���� ���� ������. �������, �������, ���������, �� �����������.
		b_printtrademsg1("������� ������ ������ ����.");
		CreateInvItem(hero,org_armor_l);
		Npc_SetTrueGuild(hero,GIL_ORG);
		hero.guild = GIL_ORG;
		B_GiveXP(XP_BecomeBandit);
		B_LogEntry(CH1_JoinNC,"���� ������ ���� � ���� �����. ������ ����� ������ ����� ���� �����!");
		Log_SetTopicStatus(CH1_JoinNC,LOG_SUCCESS);
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_FAILED);
		B_LogEntry(CH1_JoinOC,"��� ���� �� ����� ����� � �� ���� ���� ������ � ������ ������.");
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_FAILED);
		B_LogEntry(CH1_JoinPsi,"�������� �� ������ ����, ��� ��� � ��� ���� ������ ������ ������.");
		if(DIFF_HARD == FALSE)
		{
			Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
			B_LogEntry(GE_TeacherNC,"� ������� � ����� ������ � ������ ��������� ������� ����� �������� ����� ���� ���������.");
			FREELEARN_NC = TRUE;
		};
		if(BaalOrun_FetchWeed == LOG_RUNNING)
		{
			B_LogEntry(CH1_DeliverWeed,"����� ����� ����� �� �������� ���� �� ���������� � ���������. �����, � ��� � ��� ���� ��������, ���� ������� ���� � ������.");
			Log_SetTopicStatus(CH1_DeliverWeed,LOG_FAILED);
			BaalOrun_FetchWeed = LOG_FAILED;
		};
		if(Thorus_MordragKo == LOG_RUNNING)
		{
			Thorus_MordragKo = LOG_FAILED;
			Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
			B_LogEntry(CH1_MordragKO,"������ � � ������, � ��� ������� ����� ������ � ������ ������ ���, ��� �������!");
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
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02");	//������� ��������� ��� � ����.
		};
		if(Npc_KnowsInfo(hero,ORG_801_Lares_BringList))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03");	//�� ������� ���� ����������� ���, ����� ������ ������.
		};
		if(Lares_Get400Ore == LOG_SUCCESS)
		{
			AI_Output(self,other,"SVM_11_ITookYourOre");	//��� ������, ��� �� ��������� �� ���� ���� �����!
		};
		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04");	//�� �� ��� �� �����. ���, �������� ������ ���������.
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
	description = "� ��� �� ��� ������ ������?";
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
	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00");	//� ��� �� ��� ������ ������?
	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01");	//������ �� ���� �� ���. ��� ���� �� �� �������� �� ���� �������. ����� ���, ��� ��������.
	Log_CreateTopic(CH1_GotoPsiCamp,LOG_MISSION);
	Log_SetTopicStatus(CH1_GotoPsiCamp,LOG_RUNNING);
	B_LogEntry(CH1_GotoPsiCamp,"������ �� ��������� ������ � ����-�� ���������. ����, ������� ����� �����, ����� �����, � ���� ������.");
	if(Lares_InformMordrag == LOG_RUNNING)
	{
		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02");	//���� �� ������������� ������ ���� ��� �������, ��� � �������� � ������ ��� ���������� � ����� ���������.
		B_LogEntry(CH1_GotoPsiCamp,"� ������ ������ �������� ���������, ��� ��� ����������!");
	}
	else
	{
		Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
		if(Npc_IsDead(Mordrag))
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03");	//���� �� ����� ����� �� ������� ������, �������, ��� ����. ����� ������� �� �������� ��� ��������. � ������ ��������� ���������� ���-�� ���������.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04");	//����� � ������ �������� � ������, ��� ��� ���������.
			B_LogEntry(CH1_GotoPsiCamp,"�� �������� ���� ����� � ������ ��������.");
		}
		else
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05");	//�������, ���� �� ����� ����� � ������ ������, �������� �������.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06");	//��� � �������� � ���. ����� ���, ��� � ��� ��� ���� ���� ������� � ������ ���������. �������� �������� ���-�� ���������. � ���� �����, ��� ������.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07");	//������ ���.
			B_LogEntry(CH1_GotoPsiCamp,"��� ���� ���� ��������� �� ���� �� ����� �������. � ���� ����� ��� � ���� �� �����, � ����� ������.");
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
	description = "��� ����� ����� ���� ����-������ �������?";
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
	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01");	//��� ����� ����� ���� ����-������ �������?
	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02");	//� ���� ������� ����, ��� ����� ����� ������� � ������.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"���� ����� ������ ��� ��������� ���� � ��������.");
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
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//� ���� �������� ���� ������.
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
			b_printtrademsg1("������ ����: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//�� ���� �� ����!
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
			b_printtrademsg1("������ ����: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//�� ���� �� ����!
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
			b_printtrademsg1("������ ����: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//�� ���� �� ����!
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
			b_printtrademsg1("������ ����: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//�� ���� �� ����!
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
	description = "� ���� ���� ��� ���� ��� �����-������ �������?";
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
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//� ���� ���� ��� ���� ��� �����-������ �������?
	AI_Output(self,other,"ORG_801_Lares_NewList_01");	//� ������ ����� ���� ���������� ������� �� ����� ��. �� �������� �� �������� � ������ ��������� ������ ����� ������ ������ ��������.
	AI_Output(self,other,"ORG_801_Lares_NewList_02");	//� ����, ����� �� ���������� ����, ������ � ��� ���� ������ � ������ ��� ���. �������� � ����� � ����� ������, �� ��������� ������ ���� ����� ������������.
	if(!Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		Log_CreateTopic(THELISTFORNC,LOG_MISSION);
		Log_SetTopicStatus(THELISTFORNC,LOG_RUNNING);
		B_LogEntry(THELISTFORNC,"����� ����� ������ ��������, ������� � ������� � ��� � ������ �����.");
	}
	else
	{
		B_LogEntry(CH1_BringList,"���� ��������� ����������� ����� ������ � �������� ������ �� ����� �� �����, � ���.");
	};
};

