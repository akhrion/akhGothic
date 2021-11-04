
instance Org_818_Ratford_Exit(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 999;
	condition = Org_818_Ratford_Exit_Condition;
	information = Org_818_Ratford_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_818_Ratford_Exit_Condition()
{
	return 1;
};

func void Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_818_Ratford_WrongWay(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WrongWay_Condition;
	information = Org_818_Ratford_WrongWay_Info;
	permanent = 0;
	important = 1;
};


func int Org_818_Ratford_WrongWay_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Org_818_Ratford_WrongWay_Info()
{
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00");	//��, ��!
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01");	//��� ���� �����?
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//���� ������������ ����. ����� �� ���� ���������� ��������� ������.
};


instance Org_818_Ratford_WhatGame(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhatGame_Condition;
	information = Org_818_Ratford_WhatGame_Info;
	permanent = 0;
	description = "� �� ���� ����� ����� ���������?";
};


func int Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhatGame_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00");	//� �� ���� ����� ����� ���������?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//�� �����������. �� �������� ����, � ���� �� �� �� ��� �� ������ �������. ����� ������ ����� ���.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//��? � ��� ��� �������?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//������ ����� ��������� ������. �� � ���� ������� ����� �����������.
};


instance Org_818_Ratford_WhyDangerous(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhyDangerous_Condition;
	information = Org_818_Ratford_WhyDangerous_Info;
	permanent = 0;
	description = "������ ��� ����� ��������� ��������?";
};


func int Org_818_Ratford_WhyDangerous_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhatGame) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00");	//������ ��� ����� ��������� ��������?
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//�� ������ ��� ������, ��? � ������� ��� ���������� ����, ������ ��� ���� �����-�� ���������.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//�� ������� ����� �������� �� ��� ������, �� ���� ��� ���� ����� ��������� ���� ������ ��� ������, ��� ������� �� ������� ������ �������.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//� ���� �� ��� �� ��������, ���� � ���� ��� �� �������� �������, �� �������� ������.
};


instance Org_818_Ratford_WoEquipment(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoEquipment_Condition;
	information = Org_818_Ratford_WoEquipment_Info;
	permanent = 0;
	description = "��� � ���� ����� ������� ������� � ������?";
};


func int Org_818_Ratford_WoEquipment_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoEquipment_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//��� � ���� ����� ������� ������� � ������?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//� ��������� � �������. ������ �������� �� ������� ������. ��� �� ������ � ��� ����� ��� �������.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//�� � ����� ������, �� �������� �� ������, ���� ����� �� ��� ������, ����, �������, ����� ������ �����.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//���� ������� � ������ ������, ����� ��������. �� ���� �� ���. � ���� �� ������� ������ ������� ����� �� ������ ����.
	if(Mordrag_Traded == 0)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"��� ������� ������� � ������ ������ ���� ������ �� �������� �����.");
		Mordrag_Traded = 1;
	};
};


instance Org_818_Ratford_MoreLocations(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_MoreLocations_Condition;
	information = Org_818_Ratford_MoreLocations_Info;
	permanent = 0;
	description = "�������� ��� � ���, ��� ��������� � ���� �������.";
};


func int Org_818_Ratford_MoreLocations_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WoEquipment) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Org_818_Ratford_MoreLocations_Info()
{
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00");	//�������� ��� � ���, ��� ��������� � ���� �������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//����� ������ ����� ������ �� ������ ������ � �������, ����� ������ �����. ��� �� �������� ������ �������������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//� ���� � ���� ������� � ������� ����������, ������� ����� ������� �� ���������. ��� ������� � ������ �������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//������� ������ ��������. ����� �� ����� �����. ����������� �� ��� - ������ ����������, ���������� �� ������ ������ ����� � ������. ������ ����� ��������� � ��������� ��������� �����.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//������ � ����� ������ ����� ��� ��������� ����� ��� ���� ����� ������� ������. � ����� �� ����� ���� ������ ����� ��������� ��������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//� ��� ��������� �����: �� ����� ������� �� ������� �����!
};


instance Org_818_Ratford_WoKarte(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoKarte_Condition;
	information = Org_818_Ratford_WoKarte_Info;
	permanent = 0;
	description = "��� ��� ������� �����?";
};


func int Org_818_Ratford_WoKarte_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_MoreLocations) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoKarte_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//��� ��� ������� �����?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//������ �� ���� ����� �� ������� ������. ��-�����, ��� ��� ���� ���������.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//�����, � ���� ���������� ������� � ���� �����-������ �����. � �����, � ���� ����� ����� � ��� ����?
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice(Org_818_Ratford_WoKarte,"���� � ���� ��������� ������� ����� ���������, �� � ������ �������, ������� ����� ������.",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"� ����� ��� ����? ����� �� �� ������� ��?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	var C_Npc Lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//���� � ���� ��������� ������� ����� ���������, �� � ������ �������, ������� ����� ������.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//� �� ��� ���������! ���� �����, �� �������� �������������� � ������ ������? ���� ������� ����, ����� �����. �� ��������� ����� �����. �����, � ���� �������� ��� ���� ������.
		Lares = Hlp_GetNpc(Org_801_Lares);
		Lares.aivar[AIV_FINDABLE] = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01");	//�� ��, ��� ��.
	};
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//� ����� ��� ����? ����� �� �� ������� ��?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//��, �� ��� �������� ������ �� ��� �� ���� ����...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};


instance Org_818_Ratford_Thanks(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 888;
	condition = Org_818_Ratford_Thanks_Condition;
	information = Org_818_Ratford_Thanks_Info;
	permanent = 0;
	description = "������� �� ������.";
};


func int Org_818_Ratford_Thanks_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_MoreLocations) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Org_818_Ratford_Thanks_Info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//������� �� ������.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//������ �� �����, ��� ����� ��� ����� ���� ������ ����!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//�������, � ������� �������� ������, �� ��������� ����� ����� ���� ������ ������, ��� �� ������������ ���� �����.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//� ��� �������.
};


instance ORG_818_RATFORD_QUEST1(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = org_818_ratford_quest1_condition;
	information = org_818_ratford_quest1_info;
	permanent = 0;
	description = "� ��� �����, ����� ���� ��� � ����� �� ����?";
};


func int org_818_ratford_quest1_condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WoKarte))
	{
		return 1;
	};
};

func void org_818_ratford_quest1_info()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_00");	//� ��� �����, ����� ���� ��� � ����� �� ����?
	AI_Output(self,other,"Info_Jackal_PermPaid_07_01");	//�� ������ ������������ �� ��� ������!
	Log_CreateTopic(RATFORDMAPS,LOG_MISSION);
	Log_SetTopicStatus(RATFORDMAPS,LOG_RUNNING);
	B_LogEntry(RATFORDMAPS,"�������� ����� ����� �������. ���� � ���� ����� ���������� ����, �� � ����� ������ �� � ������ ������. � ���� �� �����, �� � ���-������ ��������...");
};


instance ORG_818_RATFORD_QUEST2(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = org_818_ratford_quest2_condition;
	information = org_818_ratford_quest2_info;
	permanent = 1;
	description = "(������ �����)";
};


func int org_818_ratford_quest2_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_quest1) && ((Npc_HasItems(hero,ItWrWorldmap) && (RATFORD_ITWRWORLDMAP == FALSE)) || (Npc_HasItems(hero,ItWrOMMap) && (RATFORD_ITWROMMAP == FALSE)) || (Npc_HasItems(hero,ItWrFocusmapPsi) && (RATFORD_ITWRFOCUSMAPPSI == FALSE)) || Npc_HasItems(hero,ItWrFocimap)))
	{
		return 1;
	};
};

func void org_818_ratford_quest2_info()
{
	Info_ClearChoices(org_818_ratford_quest2);
	Info_AddChoice(org_818_ratford_quest2,DIALOG_BACK,org_818_ratford_back);
	if(Npc_HasItems(hero,ItWrWorldmap) && (RATFORD_ITWRWORLDMAP == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...�������.",org_818_ratford_itwrworldmap);
	};
	if(Npc_HasItems(hero,ItWrOMMap) && (RATFORD_ITWROMMAP == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...������ � ������ �����.",org_818_ratford_itwrommap);
	};
	if(Npc_HasItems(hero,ItWrFocusmapPsi) && (RATFORD_ITWRFOCUSMAPPSI == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...��������.",org_818_ratford_itwrfocusmappsi);
	};
	if(Npc_HasItems(hero,ItWrFocimap))
	{
		Info_AddChoice(org_818_ratford_quest2,"...��������.",org_818_ratford_itwrfocimap);
	};
};

func void org_818_ratford_back()
{
	Info_ClearChoices(org_818_ratford_quest2);
	Npc_RemoveInvItem(self,ItWrWorldmap);
	Npc_RemoveInvItem(self,ItWrOMMap);
	Npc_RemoveInvItem(self,ItWrFocusmapPsi);
	Npc_RemoveInvItem(self,ItWrFocimap);
};

func void org_818_ratford_itwrworldmap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
	b_printtrademsg1("������ ����� �������.");
	CreateInvItem(self,ItWrWorldmap);
	AI_UseItemToState(self,ItWrWorldmap,1);
	AI_Wait(self,2);
	AI_UseItemToState(self,ItWrWorldmap,-1);
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//������, �� �������� ��.
	b_printtrademsg2("�������� 4 ������� �����.");
	B_GiveInvItems(other,self,ItWrWorldmap,1);
	CreateInvItems(self,ItAt_Wolf_01,4);
	B_GiveInvItems(self,other,ItAt_Wolf_01,4);
	B_LogEntry(RATFORDMAPS,"� ����� �������� ����� �������, � ������ ������� ��������� ������� ����.");
	Log_SetTopicStatus(RATFORDMAPS,LOG_SUCCESS);
	RATFORD_ITWRWORLDMAP = TRUE;
	B_GiveXP(200);
	Npc_RemoveInvItem(self,ItWrWorldmap);
};

func void org_818_ratford_itwrommap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
	b_printtrademsg1("������ ����� ������ � ������ �����.");
	CreateInvItem(self,ItWrOMMap);
	AI_UseItemToState(self,ItWrOMMap,1);
	AI_Wait(self,1);
	AI_UseItemToState(self,ItWrOMMap,-1);
	AI_Output(self,other,"SVM_7_OkayKeepIt");	//������, ������! ������ ����!
	b_printtrademsg2("�������� ����� ������ � ������ �����.");
	B_LogEntry(RATFORDMAPS,"����� ������ � ������ ����� ������� ����.");
	RATFORD_ITWROMMAP = TRUE;
	B_GiveXP(40);
};

func void org_818_ratford_itwrfocusmappsi()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
	b_printtrademsg1("������ ����� ��������.");
	CreateInvItem(self,ItWrFocusmapPsi);
	AI_UseItemToState(self,ItWrFocusmapPsi,1);
	AI_Wait(self,1);
	AI_UseItemToState(self,ItWrFocusmapPsi,-1);
	AI_Output(self,other,"SVM_7_YouCanKeeptheCrap");	//��, �����, ������ ����! � � ����� ���� ���-�� ������.
	b_printtrademsg2("�������� ����� ��������.");
	B_LogEntry(RATFORDMAPS,"����� �������� �� �������� ��� �����.");
	RATFORD_ITWRFOCUSMAPPSI = TRUE;
	B_GiveXP(40);
};

func void org_818_ratford_itwrfocimap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
	b_printtrademsg1("������ ����� ��������.");
	CreateInvItem(self,ItWrFocimap);
	AI_UseItemToState(self,ItWrFocimap,1);
	AI_Wait(self,2);
	AI_UseItemToState(self,ItWrFocimap,-1);
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//������, �� �������� ��.
	b_printtrademsg2("�������� 4 ������� �����.");
	B_GiveInvItems(other,self,ItWrFocimap,1);
	CreateInvItems(self,ItAt_Wolf_01,4);
	B_GiveInvItems(self,other,ItAt_Wolf_01,4);
	B_LogEntry(RATFORDMAPS,"���� ����� �������� � �������� ������, �� �������� ��� ����� ����� �������.");
	Log_SetTopicStatus(RATFORDMAPS,LOG_SUCCESS);
	B_GiveXP(200);
	Npc_RemoveInvItem(self,ItWrFocimap);
};
