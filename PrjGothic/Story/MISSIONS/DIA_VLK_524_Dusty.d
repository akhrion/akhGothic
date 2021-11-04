
instance DIA_Dusty_Exit(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 999;
	condition = DIA_Dusty_Exit_Condition;
	information = DIA_Dusty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Dusty_Exit_Condition()
{
	return 1;
};

func void DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dusty_Hello(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_Hello_Condition;
	information = DIA_Dusty_Hello_Info;
	permanent = 0;
	description = "������! ��� ����?";
};


func int DIA_Dusty_Hello_Condition()
{
	if(Kapitel < 4)
	{
		return 1;
	};
};

func void DIA_Dusty_Hello_Info()
{
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//������! ��� ����?
	AI_Output(self,other,"DIA_Dusty_Hello_03_01");	//��, � �� ���������! ��� ������ � ���� ����� � �����. � ��� � �������?
	AI_Output(self,other,"DIA_Dusty_Hello_03_02");	//��������� ������ ������ ����, �� ������� ���� ���������� ��� �� ������!
	AI_Output(self,other,"DIA_Dusty_Hello_03_03");	//� ������������ � ������ �������� �����. �� ��������� ��� ���-��� ���������� � ������ ���������.
	AI_Output(self,other,"DIA_Dusty_Hello_03_04");	//�����, ����� �� �������������� � ���, ��� �� ����� ����� ���� ����� ������.
};


instance DIA_Dusty_WhyNotLeave(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_WhyNotLeave_Condition;
	information = DIA_Dusty_WhyNotLeave_Info;
	permanent = 0;
	description = "���� ���� ����� �� ��������, ������ �� �� ������?";
};


func int DIA_Dusty_WhyNotLeave_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_Hello) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output(other,self,"DIA_Dusty_WhyNotLeave_15_00");	//���� ���� ����� �� ��������, ������ �� �� ������?
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_01");	//� �� ������, ��� ��� ��� ������������� ����� �����. � ���� ��� ����� ����. ��� ����� ������. ������ ����� �� ���� � ������ ���������.
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_02");	//�� � ��� ��� � ������ � ��� �� ������. ���� ��� � ������ ����� ������������, � ����� �������� �����.
	GETNEWGUY_STARTED = TRUE;
	Log_CreateTopic(CH1_RecruitDusty,LOG_MISSION);
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_RUNNING);
	B_LogEntry(CH1_RecruitDusty,"�����, ������� �� ������� ������, ��������� ����� ������. �� ����������� ��� ���, �� �������������� �� ��� � ������ ��������.");
	if(!Npc_KnowsInfo(hero,DIA_Melvin_Hello))
	{
		B_LogEntry(CH1_RecruitDusty,"��� ������� �������� ����� �����, �������. �� ���� � ������ �� ������ ������ �����.");
	};
};


instance DIA_Dusty_MetMelvin(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_MetMelvin_Condition;
	information = DIA_Dusty_MetMelvin_Info;
	permanent = 0;
	description = "� ��� � ������ ��������� � �������� ��� �������.";
};


func int DIA_Dusty_MetMelvin_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_WhyNotLeave) && Npc_KnowsInfo(hero,DIA_Melvin_Hello) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_MetMelvin_Info()
{
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_00");	//� ��� � ������ ��������� � �������� ��� �������.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_01");	//������? �� ������� ��� ���-������?
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_02");	//�������, ��� ��� ������� �����, ����� �� ������, �� ������.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_03");	//��! � �� ��� �������� ��� ����? � ���� ���� ���� �����. �� ���� �� ����� ������ ����� �� ��������.
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_04");	//��� ���? ������?
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_05");	//��������� ������ ������, ��� � ��������� ���� ������. ��� �� ������ ��� ����� ������� �� ����.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_06");	//����� ��� ���� ����������, ����� ��������� �� �� ������ 100 ������ ����.
};


instance DIA_Dusty_Offer100Ore(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_Offer100Ore_Condition;
	information = DIA_Dusty_Offer100Ore_Info;
	permanent = 0;
	description = "� ���� � ��� ���� ��� ������, �� ������� ���� �� ����� ������?";
};


func int DIA_Dusty_Offer100Ore_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_Offer100Ore_Info()
{
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_00");	//� ���� � ��� ���� ��� ������, �� ������� ���� �� ����� ������?
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_01");	//� �� �������� ���? ������?
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_02");	//��, ������ ���, �� �� ���� ����� �� ������ ���� ����� �� ������� � ������ ���������.
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_03");	//�� ������ �������, ��� �� ������� ������ �� ����?
};


instance DIA_Dusty_IWouldGo(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_IWouldGo_Condition;
	information = DIA_Dusty_IWouldGo_Info;
	permanent = 0;
	description = "� �� ������ ����, � ����� ������ � �����.";
};


func int DIA_Dusty_IWouldGo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_Offer100Ore) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_IWouldGo_Info()
{
	AI_Output(other,self,"DIA_Dusty_IWouldGo_15_00");	//� �� ������ ����, � ����� ������ � �����.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_01");	//�� ���� ���������. �� ������, ��� ������ �� ������ �����.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_02");	//�� ������ ������, ��� ����� ����������� 100 ������ ���� ��� ����������.
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_Loyality))
	{
		B_LogEntry(CH1_RecruitDusty,"� ���� ��������� �������� ����� ����� �� ���� � �������� ������. ��� �������� ��������� ����������, ����� ��� ��� ����������. ����� ����� ������� ��� ����� � ����� ��������.");
	}
	else
	{
		B_LogEntry(CH1_RecruitDusty,"� ���� ��������� �������� ����� ����� �� ���� � �������� ������. ��� �������� ��������� ����������, ����� ��� ��� ����������. ����� ����� ������� ��� ����� � �������.");
	};
	B_GiveXP(XP_DustyJoined);
};


var int Dusty_LetsGo;

instance DIA_Dusty_LetsGo(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_LetsGo_Condition;
	information = DIA_Dusty_LetsGo_Info;
	permanent = 1;
	description = "� �����. ������!";
};


func int DIA_Dusty_LetsGo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_IWouldGo) && (GETNEWGUY_DUSTY_MOVING == FALSE) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_LetsGo_Info()
{
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_00");	//� �����. ������!
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_01");	//������, �� ������ ����� ����� ������. ����� �������� ��� �� ������, ��� ��������� �� ����� ������.
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_02");	//� ����� �����, ���� ���� ���������� �� �� - � ���� ��� ����� � �������� �����.
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03");	//�����. ������.
	GETNEWGUY_DUSTY_MOVING = TRUE;
	if(GETNEWGUY_DUSTY_STOPPED == FALSE)
	{
		B_LogEntry(CH1_RecruitDusty,"����� ����������� ��� �� ������ � �������� �������. ��������� � ����� ����� ������� ����� ��������� � ����� � �����.");
	};
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
	AI_StopProcessInfos(self);
};


instance DIA_DUSTY_BYE(C_Info)
{
	npc = VLK_524_Dusty;
	condition = dia_dusty_bye_condition;
	information = dia_dusty_bye_info;
	permanent = 0;
	important = 1;
};


func int dia_dusty_bye_condition()
{
	if(Npc_GetTrueGuild(self) == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_dusty_bye_info()
{
	AI_Output(self,other,"DIA_Dusty_Hello_03_04");	//�����, ����� �� �������������� � ���, ��� �� ����� ����� ���� ����� ������.
	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01");	//����� �����!
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_DustySuccess))
	{
		Npc_ExchangeRoutine(self,"PREPARERITUAL");
	}
	else
	{
		Npc_ExchangeRoutine(self,"PREPARERITUAL2");
	};
	AI_StopProcessInfos(self);
};

