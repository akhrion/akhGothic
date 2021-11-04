
instance DIA_BaalTondral_MuteExit(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 999;
	condition = DIA_BaalTondral_MuteExit_Condition;
	information = DIA_BaalTondral_MuteExit_Info;
	permanent = 0;
	description = "(������ �� ��������)";
};


func int DIA_BaalTondral_MuteExit_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

func void DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalTondral_Exit(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 999;
	condition = DIA_BaalTondral_Exit_Condition;
	information = DIA_BaalTondral_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalTondral_Exit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

func void DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalTondral_FanaticTeacher(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_FanaticTeacher_Condition;
	information = DIA_BaalTondral_FanaticTeacher_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalTondral_FanaticTeacher_Condition()
{
	if(Kapitel < 4)
	{
		return 1;
	};
};

func void DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_00");	//�� �� ����� �� ���, ��� ������ �������.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_01");	//�� ������ ����� �� ����, ��� ���� ���-��. � �����, �� ����� �������� ����. ����� �� �� ���������� � ���� �������� ������� ������� ����� ������ �����?
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_02");	//� ���� � ���� ��������, ��������� ������� ������������ �������. ��� ������ �� �� �������� ������, �� ��-�� ����������, ��� ��� ��� ����!
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_03");	//��� ����, ����� �������� ������ ��� ����, ��� ���� �����. �� ��� �� ������ ������� ���� ��� ����� �����.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_04");	//�� �� ���������� ��� ���������� � �������? ����������, ��� ������� ��� � ����? ��� ���������� ���� ���. �� ����� ���.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_05");	//�� ������, ��� ����������, ���� �� ����������� ��� ��������? �� ������ ����� ������ ����! ��������� ���� � ���� ����������� �������.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_06");	//������� ��������. �� ������ ���� ������! �������� ����� ����������� �������, � �� ��������� ���, � �������� ������� ��������.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_07");	//����� ��� ����� � ���� ����� ������ ���, � ���� �� ����� ����������. �� ������� �� ����� �� ���������, �� ������� ������ � ��������. ����� ������� ������.
	AI_Output(self,other,"DIA_BaalTondral_FanaticTeacher_13_08");	//�� ���� �������� ��� �������� ��� ������.
};


instance DIA_BaalTondral_YouTalked(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_YouTalked_Condition;
	information = DIA_BaalTondral_YouTalked_Info;
	permanent = 0;
	description = "�� ��������� �� ����. ������, ������ � ����� ���������� � ����?";
};


func int DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

func void DIA_BaalTondral_YouTalked_Info()
{
	AI_Output(other,self,"DIA_BaalTondral_YouTalked_15_00");	//�� ��������� �� ����. ������, ������ � ����� ���������� � ����?
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_01");	//� ����, �� ��� ����������� � ������ ���������. ��� ���������.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_02");	//� ���� ������� ������� �������� ����! � �������� ���. ��������, �� ����� ����� ������ ������ � ���� ��������.
	AI_Output(self,other,"DIA_BaalTondral_YouTalked_13_03");	//� ��������� � �����, ���� ���� ���� ���� �������� ��� ���� �����������.
};


instance DIA_BaalTondral_Loyality(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_Loyality_Condition;
	information = DIA_BaalTondral_Loyality_Info;
	permanent = 0;
	description = "��� � ����� �������� ���� �����������?";
};


func int DIA_BaalTondral_Loyality_Condition()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) && (GETNEWGUY_DUSTY_JOINED == FALSE) && (Kapitel < 4) && (GETNEWGUY_DUSTY_MOVING == FALSE))
	{
		return 1;
	};
};

func void DIA_BaalTondral_Loyality_Info()
{
	AI_Output(other,self,"DIA_BaalTondral_Loyality_15_00");	//��� � ����� �������� ���� �����������?
	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_01");	//���� �������� ��������� � ����� ��������������, ��������� ������ �������.
	AI_Output(self,other,"DIA_BaalTondral_Loyality_13_02");	//���� �� ������� ������ �� �������� �������������� � ���, �� ��������, ��� ���� ��������� ����� ����� ������ � �������� ����, ���������� ��������.
	Log_CreateTopic(CH1_RecruitDusty,LOG_MISSION);
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_RUNNING);
	B_LogEntry(CH1_RecruitDusty,"���� ������� ������ ���� � ������ ������, ����� ����� ��������, ������� ���������� �������������� � ��������. ��� �������� ����������� ��������� ��� ������������!");
	GETNEWGUY_STARTED = TRUE;
};


instance DIA_BaalTondral_NewMember(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_NewMember_Condition;
	information = DIA_BaalTondral_NewMember_Info;
	permanent = 0;
	description = "� ��� � ����� ����� ������ ��������?";
};


func int DIA_BaalTondral_NewMember_Condition()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_Loyality) && (Npc_GetDistToWP(Dusty,"PSI_PLATFORM_1") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void DIA_BaalTondral_NewMember_Info()
{
	AI_Output(other,self,"DIA_BaalTondral_NewMember_15_00");	//� ��� � ����� ����� ������ ��������?
	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_01");	//� ������ ������ �� ������� ����� ���, ��� ���������� ������� ���� ����. ��, ��� ��� �����, ������ ��� ��� � ������. ��� �� ��������� �� ��������� ���������.
	AI_Output(self,other,"DIA_BaalTondral_NewMember_13_02");	//� ����� ������ ���� �� ������ ���������� ���� �������� ������. � �����, ��� �� �� ������� ������ �������.
};


instance DIA_BaalTondral_NewMember2(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_NewMember2_Condition;
	information = DIA_BaalTondral_NewMember2_Info;
	permanent = 0;
	description = "����� �������� ����� ����?";
};


func int DIA_BaalTondral_NewMember2_Condition()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_Loyality) && (Npc_GetDistToWP(Dusty,"PSI_PLATFORM_1") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void DIA_BaalTondral_NewMember2_Info()
{
	AI_Output(other,self,"DIA_BaalTondral_NewMember2_15_00");	//����� �������� ����� ����?
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_01");	//� ����� �� ������� ������ ������� ������ ������� ��������.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_02");	//����� �� ���������� � ������ ��� �������� ����, ��� ����� ���� ������, ���� �������� ����.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_03");	//������� �� ������� ������� ���������, �� ����� ������� �� ��������� ���� �����. ��� ����� ��� ����������� ����� ����� �����.
	AI_Output(self,other,"DIA_BaalTondral_NewMember2_13_04");	//���� �� ������� ������ ������, ��� �� ������� ����� ������. ������ �� ������� ����� ������ �������.
};


instance DIA_BaalTondral_DustySuccess(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_DustySuccess_Condition;
	information = DIA_BaalTondral_DustySuccess_Info;
	permanent = 0;
	description = "C� ���� ������ �������, ������� ����� ������������� � �����.";
};


func int DIA_BaalTondral_DustySuccess_Condition()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) && (Npc_GetDistToWP(Dusty,"PSI_PLATFORM_1") < 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE))
	{
		return 1;
	};
};

func void DIA_BaalTondral_DustySuccess_Info()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	Dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	Dusty.flags = 0;
	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_00");	//�������, �� ���� ������ �������, ������� ����� ������������� � �����.
	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_01");	//��� ��� � �����? �� �������?
	AI_Output(other,self,"DIA_BaalTondral_DustySuccess_15_02");	//��� ����� �������� �����������, �������.
	AI_Output(self,other,"DIA_BaalTondral_DustySuccess_13_03");	//������. � ����� ��� �� ����� ���� ��������.
	AI_TurnToNPC(self,Dusty);
	AI_Output(self,NULL,"DIA_BaalTondral_DustySuccess_13_04");	//�� ������ ������ ��������� �� ��� ������ ���� � ������� ���� ������. � ��� ���� ������ ���� ����.
	B_LogEntry(CH1_RecruitDusty,"����� ���� �������� ����� ��������. � �������� ���� �������.");
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_SUCCESS);
	B_GiveXP(XP_DeliveredDusty);
	GETNEWGUY_DUSTY_JOINED = TRUE;
	GETNEWGUY_STARTED = LOG_SUCCESS;
	Dusty.guild = GIL_NOV;
	Npc_SetTrueGuild(Dusty,GIL_NOV);
	AI_StopProcessInfos(self);
};


instance DIA_BaalTondral_SendToKalom(C_Info)
{
	npc = GUR_1203_BaalTondral;
	nr = 1;
	condition = DIA_BaalTondral_SendToKalom_Condition;
	information = DIA_BaalTondral_SendToKalom_Info;
	permanent = 0;
	description = "�������! � ���� �������� � ��������. ������ ���.";
};


func int DIA_BaalTondral_SendToKalom_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_BaalTondral_DustySuccess) || Npc_KnowsInfo(hero,dia_melvin_metdusty2)) && (Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2) && Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

func void DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output(other,self,"DIA_BaalTondral_SendToKalom_15_00");	//�������! � ���� �������� � ��������. ������ ���.
	AI_Output(self,other,"DIA_BaalTondral_SendToKalom_13_01");	//�� ������� ��� ���� �����������. ��� � ��� ������. �� ���� ���� ������� ����������.
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	B_LogEntry(CH1_JoinPsi,"� ������ ������ �������� � ������ ���������. ������ ���� ������� ������� ���� ��������� ������ ������ ����������!");
};

