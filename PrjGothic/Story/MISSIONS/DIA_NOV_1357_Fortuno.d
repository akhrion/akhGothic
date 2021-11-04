
instance DIA_Fortuno_EXIT(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 999;
	condition = DIA_Fortuno_EXIT_Condition;
	information = DIA_Fortuno_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

func void DIA_Fortuno_EXIT_Info()
{
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Fortuno_Greet(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = DIA_Fortuno_Greet_Condition;
	information = DIA_Fortuno_Greet_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Fortuno_Greet_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Fortuno_Greet_Info()
{
	AI_Output(self,other,"DIA_Fortuno_Greet_05_00");	//���-�� ����. � �� ������ ������� �� �������� ��� �������.
};


var int Fortuno_RationDay;

instance DIA_Fortuno_GetGeschenk(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = DIA_Fortuno_GetGeschenk_Condition;
	information = DIA_Fortuno_GetGeschenk_Info;
	permanent = 0;
	description = "��� ��� �� �������?";
};


func int DIA_Fortuno_GetGeschenk_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fortuno_Greet) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_Fortuno_GetGeschenk_Info()
{
	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00");	//��� ��� �� �������?
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01");	//���, ������ ���� ��������. ��� '�������� ������'. �������� ����!
	b_printtrademsg1("�������� 3 '�������� ������'.");
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02");	//������ ���� � ���� ������ ���� ������� ���������, �� ���� ���� ����� ������, ��� ��� ��������, �� ������ ������ ���������.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03");	//���� ������� �����-������ ����� ��� �����, ������ �� ���. � � ������������� ����� �� � ����.
	CreateInvItems(self,ItMiJoint_2,3);
	B_GiveInvItems(self,other,ItMiJoint_2,3);
	Fortuno_RationDay = Wld_GetDay();
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"������� ������� ������� � ������������� ����������������. ��� ��� ��������� ��� ������������ ��� ������.");
};


instance DIA_Fortuno_DailyRation(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 3;
	condition = DIA_Fortuno_DailyRation_Condition;
	information = DIA_Fortuno_DailyRation_Info;
	permanent = 1;
	description = "� ���� ����� ������� ������ ���������.";
};


func int DIA_Fortuno_DailyRation_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_Fortuno_DailyRation_Info()
{
	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00");	//� ���� ����� ������� ������ ���������.
	if(Fortuno_RationDay != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01");	//���, ������. ��� '�������� ������'. ������ �� ����� ������ �� ��� �����!
		b_printtrademsg1("�������� 3 '�������� ������'.");
		CreateInvItems(self,ItMiJoint_2,3);
		B_GiveInvItems(self,other,ItMiJoint_2,3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02");	//���� ������� ������ �� ��� �������. ���� ���� ����� ������, ������� �����, ��� ���� ������.
	};
};


instance DIA_Fortuno_BuyJoints(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 4;
	condition = DIA_Fortuno_BuyJoints_Condition;
	information = DIA_Fortuno_BuyJoints_Info;
	permanent = 0;
	description = "����� ��������.";
	trade = 1;
};


func int DIA_Fortuno_BuyJoints_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk) || (Kapitel > 2))
	{
		return 1;
	};
};

func void DIA_Fortuno_BuyJoints_Info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//����� ��������.
	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01");	//��� �� �� ���� ������? ���� �����, ���-������ ������?
};


instance DIA_FORTUNO_BUYJOINTS2(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 4;
	condition = dia_fortuno_buyjoints2_condition;
	information = dia_fortuno_buyjoints2_info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int dia_fortuno_buyjoints2_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fortuno_BuyJoints))
	{
		return 1;
	};
};

func void dia_fortuno_buyjoints2_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//����� ��������.
};


instance DIA_FORTUNO_HELP(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = dia_fortuno_help_condition;
	information = dia_fortuno_help_info;
	permanent = 0;
	description = "��� ��� ������ �� �����, ������� ������� ��������?";
};


func int dia_fortuno_help_condition()
{
	if(CorAngar_FindHerb == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_fortuno_help_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//��� ��� ������ �� �����, ������� ������� ��������?
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_01");	//�� ����� ����� ��� ��������? ���� ������� ��� �����?
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//��.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_02");	//� �� ������� ���� �������� ��� �����-�� �������� ������? �, ������, ��� �� �������! � �������� ������� ���������� ������!
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_03");	//��������, � ������ ������ � ������� ��� ������ ����� ��� �����... �������, �������� ����� ������.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_04");	//� ���������� ������ ������� ��������� �����, ������� ������� ��� ���. �� ����� ����������� ��� �����, ��� �� ������� ������ ����� ������� ����������...
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_05");	//��� �������� ���������� ������� ����. � �������, � ���� ��� ��� ����� �����.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_06");	//���� �� ������� ����, ������� ������������� ��������� � ������ ������, ��������� ����� � ���������� ������. ����� ������ ���, �� �������.
	AI_Output(other,self,"Info_FreemineOrc_OFFER_15_01");	//� ���������� ����� ��� ����!
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_07");	//���� ������� ����� � ��� ���, �� ���� ���� �� ������ ����. ����������, � ��� ����� ���� �������!
	B_LogEntry(CH3_FindHerbs,"������� ��������� ������ ����: ����� ������ �������� � ���������� ����� �� ����� � ������� �� ���� �������� �����.");
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_FORTUNO_DEADLEAFFOUND(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = dia_fortuno_deadleaffound_condition;
	information = dia_fortuno_deadleaffound_info;
	permanent = 0;
	description = "���, ������ ���. ��� �� � ������.";
};


func int dia_fortuno_deadleaffound_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_help) && Npc_HasItems(other,itfo_plants_deadleaf) && (CorAngar_FindHerb == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_fortuno_deadleaffound_info()
{
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//���, ������ ���. ��� �� � ������.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_08");	//�������! ��� ������! �����, �� ������ � ��������?
	if(ALCHEMYACTIVE == TRUE)
	{
		AI_Output(other,self,"Info_Milten_SHWAIT_15_03");	//���, ��������...
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_09");	//���� ���� �� ����, � ���������� ������ �� ����, ��� ����. ����� ������ � ������� �����, � ����� ������ ������ ��� ��� ������!
		b_printtrademsg1("������� ������ � ������ �����.");
		if(!Npc_HasItems(hero,ItMiFlask))
		{
			CreateInvItem(hero,ItMiFlask);
		};
		CreateInvItem(hero,SpecialWater);
		CreateInvItem(hero,alchemy_fortuno);
		B_LogEntry(CH3_FindHerbs,"������� ��� ��� ������ � ������ �����, ����� ������ ����������� ��� � ������� � ���� ��� ������.");
	}
	else
	{
		AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//��� ���.
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_10");	//��, ����� � ��� ���������� �����... �������...
		b_printtrademsg1("����� ������� ����.");
		Npc_RemoveInvItems(hero,itfo_plants_deadleaf,1);
		AI_UseMob(self,"LAB",1);
		AI_Wait(self,13);
		AI_UseMob(self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_11");	//���, ������� ������ ��� ��� ������! ��������!
		b_printtrademsg2("�������� �������� ����� �������.");
		CreateInvItem(hero,HealthWater);
		B_LogEntry(CH3_FindHerbs,"�������� ����� ������! ������ ����� ������� ������� ��� � ���� � ������ ��� ������.");
	};
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};

