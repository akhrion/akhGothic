
instance DIA_Raven_Exit(C_Info)
{
	npc = EBR_105_Raven;
	nr = 999;
	condition = DIA_Raven_Exit_Condition;
	information = DIA_Raven_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Raven_Exit_Condition()
{
	return 1;
};

func void DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raven_FirstIn(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_FirstIn_Condition;
	information = DIA_Raven_FirstIn_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Raven_FirstIn_Condition()
{
	var C_Npc wache218;
	wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if(wache218.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void DIA_Raven_FirstIn_Info()
{
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00");	//� ���� ���-������ ������� ��� ����?
};


instance DIA_Raven_Who(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Who_Condition;
	information = DIA_Raven_Who_Info;
	permanent = 0;
	description = "��� ��?";
};


func int DIA_Raven_Who_Condition()
{
	return 1;
};

func void DIA_Raven_Who_Info()
{
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Raven_Who_10_01");	//� �����, ������ �������� ������. ���, ��� ����� ����������� � ���, ������� ������� �� ����.
};


instance DIA_Raven_Krautbote(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Krautbote_Condition;
	information = DIA_Raven_Krautbote_Info;
	permanent = 0;
	description = "� �� ��� ������. � ���� ���� ������� ��������� ��� ������.";
};


func int DIA_Raven_Krautbote_Condition()
{
	if((Kalom_Krautbote == LOG_RUNNING) && (Kalom_DeliveredWeed == FALSE))
	{
		return 1;
	};
};

func void DIA_Raven_Krautbote_Info()
{
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00");	//� �� ��� ������. � ���� ���� ������� ��������� ��� ������.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01");	//�������� �� ���� � �������. ����� �� ������������� � ����������.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02");	//������� �� ������� � �������� ������ �� ����� ��� �� ����� � ������� �����.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03");	//����� ��, ������� ��, ����. � ����� ���� � ��� ����� ��� �� ����������.
	B_LogEntry(CH1_KrautBote,"�������� ��� ������ � ������ ������ �������. �� ��������� � ���� �������.");
};


instance DIA_Raven_Aufnahme(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Aufnahme_Condition;
	information = DIA_Raven_Aufnahme_Info;
	permanent = 0;
	description = "� ���� ������ ������. ����� ������, ��� � ���� ����� ���������.";
};


func int DIA_Raven_Aufnahme_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Raven_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00");	//� ���� ������ ������. ����� ������, ��� ���� ����� ����� � ��������.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01");	//�������� ���� ��� ������ �����. � �� ���� ����� ����������, ��� ���� ������� �����. �����, �� ��� ���������.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02");	//� ������ ���� � ������. ��� �� ����. ������ ������ �� ������!
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
};


instance DIA_Raven_There(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_There_Condition;
	information = DIA_Raven_There_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Raven_There_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT"))
	{
		return 1;
	};
};

func void DIA_Raven_There_Info()
{
	AI_Output(self,other,"DIA_Raven_There_10_01");	//��� ��� ����� �����. ���� �� �������� �������� ���, � ����� ����� ���� ������� �������, ����?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRESTART");
};


instance DIA_Raven_PERM(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_PERM_Condition;
	information = DIA_Raven_PERM_Info;
	permanent = 1;
	description = "��� ���� ������ ����?";
};


func int DIA_Raven_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

func void DIA_Raven_PERM_Info()
{
	AI_Output(other,self,"DIA_Raven_PERM_15_00");	//��� ���� ������ ����?
	AI_Output(self,other,"DIA_Raven_PERM_10_01");	//�������� �� ������ ����� ����������� �� �����. ��������� ���� �� �������� ���� ��� �������� �������.
};


instance DIA_Raven_BinDabei(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_BinDabei_Condition;
	information = DIA_Raven_BinDabei_Info;
	permanent = 0;
	description = "����� ������, ��� ������ � ������� �� ���.";
};


func int DIA_Raven_BinDabei_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

func void DIA_Raven_BinDabei_Info()
{
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00");	//����� ������, ��� ������ � ������� �� ���.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01");	//������. � ���� ��� ��� ���� ��� ���� ���� �������.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02");	//���� � ���� ������������� ������� �����, � ���� � ��� �� ��������� ������� �������.
	b_printtrademsg1("�������� ������ ��������.");
	CreateInvItem(self,stt_armor_m);
	B_GiveInvItems(self,hero,stt_armor_m,1);
};


instance DIA_Raven_SpySect(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpySect_Condition;
	information = DIA_Raven_SpySect_Info;
	permanent = 0;
	description = "��� � ������ �������?";
};


func int DIA_Raven_SpySect_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

func void DIA_Raven_SpySect_Info()
{
	AI_Output(other,self,"DIA_Raven_SpySect_15_00");	//��� � ������ �������?
	AI_Output(self,other,"DIA_Raven_SpySect_10_01");	//�� ����� �������� � ���������. ���, �������, �� ������, ��� �� �������� ���� �������� ������.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02");	//����� � �� ������.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03");	//����� �� ������ ���, ����� �� ����, ��� ��� ����������. ��������� ���, ��� ������� � ��������. ��� ����� ��� �����������.
	AI_Output(self,other,"DIA_Raven_SpySect_10_04");	//� ��� ������ �� �������, ��� �����. �� ������ ����������� ���������. �����, �� ���������, ��� � ���� � ����?
	AI_Output(other,self,"DIA_Raven_SpySect_15_05");	//���� �������, � ���������� �� ��������� � ����.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06");	//� ����, ��� �� ������� ���� ���������.
	Raven_SpySect = LOG_RUNNING;
	Log_CreateTopic(CH1_GoToPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_GoToPsi,LOG_RUNNING);
	B_LogEntry(CH1_GoToPsi,"����� ������ ���� � ������ �� �������. � ������ ���������, ��� ������� ����. ����� ����, � ����� ����� ���-�� �������� ��� �������.");
};


instance DIA_Raven_Equipment(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Equipment_Condition;
	information = DIA_Raven_Equipment_Info;
	permanent = 0;
	description = "��� ����� ����� ����� ������� ����������?";
};


func int DIA_Raven_Equipment_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Equipment_Info()
{
	AI_Output(other,self,"DIA_Raven_Equipment_15_00");	//��� ����� ����� ����� ������� ����������?
	AI_Output(self,other,"DIA_Raven_Equipment_10_01");	//��� � �����. �� ���� ���� ���� �� ��������. �� ����� ������� ���� ��������������� ������ � ������� �� ������.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02");	//� ��� �� ������� ������ �� ����� ������. ����� �� ����� ���� �������������.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03");	//� ���� ���� ����� ������, �������� �� ������. �� ������� ��� � ������� ����� �� ���������� ����� �����, ����� �� �����.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"� ����� ����� ����� ������� ������� ��� ���������. ���� �� ����� � ����� � �����.");
	if(!Npc_KnowsInfo(hero,DIA_Skip_First))
	{
		B_LogEntry(GE_TraderOC,"�������� ���� �� ����� ����� ������� ������. �� ������ ����� ������.");
	};
};


instance DIA_Raven_SpyBericht(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpyBericht_Condition;
	information = DIA_Raven_SpyBericht_Info;
	permanent = 1;
	description = "� �������, ��� ��� ����� �������� � ����� �������.";
};


func int DIA_Raven_SpyBericht_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_SpyBericht_Info()
{
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00");	//� �������, ��� ��� ����� �������� � ����� �������.
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01");	//������. ��� ����� ����� ���, ��� ���������� ������.
	if((Npc_HasItems(other,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS))
	{
		if(Kapitel >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//��� ������� ������� ���������.
		}
		else
		{
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02");	//�� ����� ���� ��������, ����� �������� ������ �����. � ��� ������� ��� ����� �������� ���� ���� � ������� �������. � ����� ���� � �������� ��������.
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_03");	//���������. �������� �� ������, ��������� �� ��� ���. ������ ���� � ����.
		};
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//�� ������ ���������.
		Npc_ExchangeRoutine(self,"START");
		Raven_SpySect = LOG_SUCCESS;
		B_GiveXP(XP_ReportToRaven);
		Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
		B_LogEntry(CH1_GoToPsi,"����� ������������ ���� �� ������! ������ ������, � ���� ��������� ���� ������� � �������������. ������ � ���� ����������� ������ �� ������ ����������.");
	}
	else
	{
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05");	//� ��� �� ����, ��� ��� ��� ���������� ������.
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06");	//��� ����� �� �� ���� ����������?
	};
};


instance DIA_RAVEN_QUENTIN(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = dia_raven_quentin_condition;
	information = dia_raven_quentin_info;
	permanent = 0;
	description = "� ���� ���� ��� ���� ��� �����-������ �������?";
};


func int dia_raven_quentin_condition()
{
	if(Raven_SpySect == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_raven_quentin_info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//� ���� ���� ��� ���� ��� �����-������ �������?
	AI_Output(self,other,"DIA_Quentin_Raven_01");	//����. ������� ��������� ����� ���������. ������, ��� ����� �������� ���� ������ ��������.
	AI_Output(self,other,"DIA_Quentin_Raven_02");	//�� ������� ��������� � ������� � ������ ���� �������� �����������. ��������� ���� �� ������ ������ ������������� � ����.
	AI_Output(self,other,"DIA_Quentin_Raven_03");	//����� �� ������� � ��������� � ���� ���������. ��������!
	QUENTIN_GANG_QUEST_STARTED = LOG_RUNNING;
	Log_CreateTopic(QUENTIN_GANG,LOG_MISSION);
	Log_SetTopicStatus(QUENTIN_GANG,LOG_RUNNING);
	B_LogEntry(QUENTIN_GANG,"����� ��� ��� ����� �������: ����� ������ �������� �������� � ����������� � ����. ������ ���������� ������, ��� ������...");
	AI_StopProcessInfos(self);
};


instance DIA_RAVEN_QUENTIN_DONE(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = dia_raven_quentin_done_condition;
	information = dia_raven_quentin_done_info;
	permanent = 0;
	description = "� ��������� ���������!";
};


func int dia_raven_quentin_done_condition()
{
	if(Npc_IsDead(Org_858_Quentin) && Npc_KnowsInfo(hero,dia_raven_quentin))
	{
		return 1;
	};
};

func void dia_raven_quentin_done_info()
{
	AI_Output(other,self,"DIA_Quentin_Raven_04");	//� ��������� ���������!
	AI_Output(other,self,"DIA_Quentin_Raven_05");	//�� ����� ��������� ������������� ���� � ����� �������� �� ����� ������.
	AI_Output(other,self,"DIA_Quentin_Raven_06");	//��� ������� ������� ������ ���� �����, � ���������� ����� ��� ������������ ��� ����� ��� ������.
	AI_Output(self,other,"DIA_Quentin_Raven_07");	//���������... � �������� ���� ����� �����. ������ ��� ���� ����!
	if(Npc_KnowsInfo(hero,dia_vlk595_quentin_done))
	{
		AI_Output(self,other,"DIA_Quentin_Raven_08");	//� ��� � ������ ����������?
		AI_Output(other,self,"DIA_Quentin_Raven_09");	//��������� � ������.
		B_ClearImmortal(vlk_595_buddler);
		B_ClearImmortal(vlk_596_buddler);
		B_ClearImmortal(vlk_597_buddler);
	};
	AI_Output(self,other,"DIA_Quentin_Raven_10");	//����� ����� � ������ ��������!
	AI_Output(self,other,"DIA_Quentin_Raven_11");	//�� ���, ������, ������... � ������� ��� ��� ������� ���.
	AI_Output(self,other,"DIA_Quentin_Raven_12");	//� �� ������ ������� ������ ������� ������ � ������. ������, ��� ��������.
	b_printtrademsg1("�������� ����: 500");
	CAN_BUY_GRD_ARMOR_H = TRUE;
	B_GiveXP(1000);
	B_GiveInvItems(self,other,ItMiNugget,500);
	QUENTIN_GANG_QUEST_STARTED = LOG_SUCCESS;
	Log_SetTopicStatus(QUENTIN_GANG,LOG_SUCCESS);
	B_LogEntry(QUENTIN_GANG,"������� ���������, ����� ������������ ���� �����. ��, ������, ����� �� ������ � ���� ��������.");
	b_clearquentincamp();
	AI_StopProcessInfos(self);
};

