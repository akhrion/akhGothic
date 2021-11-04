
instance DIA_Gilbert_EXIT(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 999;
	condition = DIA_Gilbert_EXIT_Condition;
	information = DIA_Gilbert_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

func void DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gilbert_First(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_First_Condition;
	information = DIA_Gilbert_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Gilbert_First_Condition()
{
	return 1;
};

func void DIA_Gilbert_First_Info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//��� �� ����� �������? ����� ��� ������� �� ��� ����, ��-��!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//���� ������� ����� ��� �������, ��� �� ������ ��� ����.
	Npc_ExchangeRoutine(self,"start2");
	B_GiveXP(XP_GilbertFound);
};


instance DIA_Gilbert_Hallo(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_Hallo_Condition;
	information = DIA_Gilbert_Hallo_Info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

func void DIA_Gilbert_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//������ ������ ��� ����� ������. � ��� ������ ����������� � ������ ������. ��� ����� ��� ��� ��������...
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_02");	//������ ��� ���, ��������, ����� � �� ������. �� � ��� ����� �������� �����. � ������ ������ ����� ������� ����� ��������.
};


instance DIA_GILBERT_HALLO2(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_hallo2_condition;
	information = dia_gilbert_hallo2_info;
	permanent = 0;
	description = "(����������� �������� �����)";
};


func int dia_gilbert_hallo2_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gilbert_Hallo) && Npc_KnowsInfo(hero,quentin_dia33) && !Npc_HasItems(hero,itke_gilbert))
	{
		return TRUE;
	};
};

func void dia_gilbert_hallo2_info()
{
	if(hero.level < 6)
	{
		AI_Output(self,other,"SVM_4_GetOutOfHere");	//�������� ������!
		AI_StopProcessInfos(self);
		B_SetAttackReason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,hero);
		AI_StartState(self,ZS_Attack,1,"");
		B_LogEntry(QUENTIN_GANG,"������� ������� ���������� �� ����. ���������, ����� ���� �������� ��� ����� ��������?");
	}
	else
	{
		AI_Output(self,other,"SVM_4_LookAway");	//�� ����, �� ����� � ������ ������ �� �����...
		b_printtrademsg1("������� �������� �����.");
		B_GiveXP(100);
		B_GiveInvItems(self,hero,itke_gilbert,1);
		AI_StopProcessInfos(self);
		AI_StartState(self,ZS_Flee,1,"");
		B_LogEntry(QUENTIN_GANG,"������� ������ ��� ����� ����� � �������� ������. ���������, ����� ��� ��� ����� ��������?");
	};
	Npc_ExchangeRoutine(self,"hide");
};

