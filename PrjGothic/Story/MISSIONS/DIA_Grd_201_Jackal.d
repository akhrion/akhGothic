
instance Info_Jackal_EXIT(C_Info)
{
	npc = Grd_201_Jackal;
	nr = 999;
	condition = Info_Jackal_EXIT_Condition;
	information = Info_Jackal_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Jackal_EXIT_Condition()
{
	return 1;
};

func void Info_Jackal_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Jackal_ProtectionPaid;
var int Jackal_PayDay;

instance Info_Jackal_Hello(C_Info)
{
	npc = Grd_201_Jackal;
	nr = 3;
	condition = Info_Jackal_Hello_Condition;
	information = Info_Jackal_Hello_Info;
	permanent = 0;
	important = 1;
};


func int Info_Jackal_Hello_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_Jackal_Hello_Info()
{
	AI_Output(self,other,"Info_Jackal_Hello_07_00");	//�! ����� ����!
	AI_Output(other,self,"Info_Jackal_Hello_15_01");	//��� ���� �� ���� �����?
	AI_Output(self,other,"Info_Jackal_Hello_07_02");	//���� ���������� ���� ���� ������. �� ����� ���������, � ����� ����� �������� � ������������... � ����� �������� ���� �� ��������� �� ��� �� ��������� ��������������.
	AI_Output(self,other,"Info_Jackal_Hello_07_03");	//����� ������ ������ ����. ��� �� ������ �������!
	Info_ClearChoices(Info_Jackal_Hello);
	Info_AddChoice(Info_Jackal_Hello,"� ���� � �������� ������� ����?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice(Info_Jackal_Hello,"� ��� �����, ����� ���� ��� � ����� �� ����?",Info_Jackal_Hello_WhatDoIGet);
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		Info_AddChoice(Info_Jackal_Hello,"���, ������ ���� ������ ������. ���� ������ ����� ��� �����������.",Info_Jackal_Hello_Pay);
	}
	else
	{
		Info_AddChoice(Info_Jackal_Hello,"������ � ���� ��� ������ ������.",info_jackal_hello_noore);
	};
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output(other,self,"Info_Jackal_Hello_Pay_15_00");	//���, ������ ���� ������ ������. ���� ������ ����� ��� �����������.
	b_printtrademsg1("������ ����: 10");
	AI_Output(self,other,"Info_Jackal_Hello_Pay_07_01");	//���� � ���� ����������, �� ������ �� ���� ������������. �� ������ ������� ����� ���� ����� ������ � ������ ��������.
	AI_Output(self,other,"Info_Jackal_Hello_Pay_07_02");	//�� �������� � ������ ������� ������ ������� � �������.
	B_GiveInvItems(other,self,ItMiNugget,10);
	Jackal_ProtectionPaid = TRUE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Jackal_Hello);
};

func void info_jackal_hello_noore()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00");	//������ � ���� ��� ������ ������.
	AI_Output(self,other,"SVM_7_YouWannaFoolMe");	//�� ��������� ���� ��������, ��?
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_00");	//� ��� �����, ����� ���� ��� � ����� �� ����?
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_01");	//���� �� ������ � ���� ������, � ���� ������������ �� �����.
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_02");	//���� �� ���� ������� ���-������ �� ������ ������, ��� �� ����������� � �����-������ ������������ �� ������ ���������, � ����� � ���� �� ������.
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_03");	//���� �� ����������� � ���-������ �� ���������, �� ������� ����, ��� ��� ������ �� ������.
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_04");	//� ���� �������� ���?
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_05");	//����� �� ����������� �� ������. �� ����� ������� ����� ����� �������.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatIf_15_00");	//� ���� � �������� ������� ����?
	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_01");	//��, �� ����� �������� ���� �������������! �� ��� �������� � ������ ���������. ������������ ������� ����, � ����� ������ �����, ��� ����� ���������!
	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_02");	//��� ����� ������� � ����� �����. ��� ������ ���� �� �� ���������, �� ����������� �� ��� ������. ��� �������?
	Info_AddChoice(Info_Jackal_Hello,"�� ��� ��������.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output(other,self,"Info_Jackal_Hello_Later_15_00");	//�� ��� ��������.
	AI_Output(self,other,"Info_Jackal_Hello_Later_07_01");	//���������� �� ����������� � ������������!
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Jackal_Hello);
};


instance Info_Jackal_Schutz(C_Info)
{
	npc = Grd_201_Jackal;
	nr = 3;
	condition = Info_Jackal_Schutz_Condition;
	information = Info_Jackal_Schutz_Info;
	permanent = 1;
	description = "� ������� ���� �����������. ��� ���� ������ ������.";
};


func int Info_Jackal_Schutz_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Jackal_Hello) && (Jackal_ProtectionPaid == FALSE) && (Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_KDF) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_Jackal_Schutz_Info()
{
	AI_Output(other,self,"Info_Jackal_Schutz_15_00");	//� ������� ���� �����������. ��� ���� ������ ������.
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		b_printtrademsg1("������ ����: 10");
		AI_Output(self,other,"Info_Jackal_Schutz_07_01");	//������� �������! ������ � ���� ���� ��������!
		B_GiveInvItems(other,self,ItMiNugget,10);
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_Schutz_NoOre_07_00");	//��, ������ �������� ���� ��������! �������, ����� � ���� ����� ����!
	};
};


instance Info_Jackal_PermPaid(C_Info)
{
	npc = Grd_201_Jackal;
	nr = 3;
	condition = Info_Jackal_PermPaid_Condition;
	information = Info_Jackal_PermPaid_Info;
	permanent = 1;
	description = "��, ��� ����?";
};


func int Info_Jackal_PermPaid_Condition()
{
	if(Kapitel < 4)
	{
		return 1;
	};
};

func void Info_Jackal_PermPaid_Info()
{
	AI_Output(other,self,"Info_Jackal_PermPaid_15_00");	//��, ��� ����?
	if(Jackal_ProtectionPaid == TRUE)
	{
		AI_Output(self,other,"Info_Jackal_PermPaid_07_01");	//�� ������ ������������ �� ��� ������!
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_Schutz_07_02");	//�� ��� �� �������� ������ ������. �������, ����� � ���� ����� ����.
	};
};


instance GRD_201_Jackal_WELCOME(C_Info)
{
	npc = Grd_201_Jackal;
	condition = GRD_201_Jackal_WELCOME_Condition;
	information = GRD_201_Jackal_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_201_Jackal_WELCOME_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GRD) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void GRD_201_Jackal_WELCOME_Info()
{
	AI_Output(self,other,"GRD_201_Jackal_WELCOME_Info_07_01");	//�� ������ ������� ������ � ����� ������! ��� �������!
};


instance Info_Jackal_PAYDAY(C_Info)
{
	npc = Grd_201_Jackal;
	condition = Info_Jackal_PAYDAY_Condition;
	information = Info_Jackal_PAYDAY_Info;
	permanent = 0;
	important = 1;
};


func int Info_Jackal_PAYDAY_Condition()
{
	if(FMTaken)
	{
		return TRUE;
	};
};

func void Info_Jackal_PAYDAY_Info()
{
	var C_Npc gorn;
	self.flags = 0;
	if(C_NpcBelongsToNewCamp(hero))
	{
		if((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF) || (oldHeroGuild == GIL_STT))
		{
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_01");	//���, ��� ��� � ���? ���������, ������� ������� � ������ ������!
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_02");	//���� �� �� �� �������� � ����� ������������, �� �� ��� ��� ���� �������������� � ���!
		}
		else
		{
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_03");	//����������-�� �� ����! ��� �� ��� ��� �� ������ ������, ������� ��������� ��������� ��� �� �����!
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_04");	//���� �� �� � ���� ����� ������ ���������� �������, �� �� ��� ���� �� ��� - �����������!
		};
	}
	else if(C_NpcBelongsToPsiCamp(hero))
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_05");	//���, ���, ��� ��� ���? ���� �� ����������� �� ��������� ������!
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_06");	//�� ��� ����� � ���� �������, ��� ��� ���� ����� �� ���� ����������!
	};
	if(Jackal_ProtectionPaid)
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_07");	//������ �� ����, ������� �� ��� ��������, ���� �� �������.
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_08");	//���� ������ ������ ��� ���� �����, ����� � ���� ���� ����� �����������.
	};
	AI_Output(other,self,"Info_Jackal_PAYDAY_15_09");	//�� ������� ������ �����! ��� �� ����� �� �����!
	AI_Output(self,other,"Info_Jackal_PAYDAY_07_10");	//�� ��� ���������� ��� ������ �����. � ���� ��� ������ �� ������� ��������. �� ��� � �������!
	AI_Output(self,other,"Info_Jackal_PAYDAY_07_11");	//��, �� �� ������ ���� �� ��� �����!
	B_Story_JackalFight();
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if((GETNEWGUY_STARTED == TRUE) && (OC_BANNED == FALSE))
	{
		B_LogEntry(CH1_RecruitDusty,"������ � �� ����� ������� ����-���� �� ������� ������.");
		Log_SetTopicStatus(CH1_RecruitDusty,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	if(C_NpcBelongsToOldCamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_None);
		hero.guild = GIL_None;
		if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_grd238_die) && !Npc_KnowsInfo(hero,Info_Fletcher_DIE))
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"�����, ������� �������� ����������� ��������� ����� � ������� ����������, ������ ���� ���������� � ������������. ��� ���������� ���������� �� ����� �� ����!");
			B_LogEntry(CH4_BannedFromOC,"�������, ��� ������, ��� ���� �������� �� ������� ������!");
		};
	};
	if(Gorn_JoinedForFM)
	{
		gorn = Hlp_GetNpc(PC_Fighter);
		AI_SetWalkMode(gorn,NPC_RUN);
		AI_Wait(gorn,3);
		AI_GotoWP(gorn,"FMC_PATH15");
		B_ExchangeRoutine(gorn,"WaitFM");
	};
};

