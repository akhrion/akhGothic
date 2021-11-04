
instance DIA_GorNaRan_Exit(C_Info)
{
	npc = TPL_1405_GorNaRan;
	nr = 999;
	condition = DIA_GorNaRan_Exit_Condition;
	information = DIA_GorNaRan_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GorNaRan_Exit_Condition()
{
	return TRUE;
};

func void DIA_GorNaRan_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GorNaRan_Wache(C_Info)
{
	npc = TPL_1405_GorNaRan;
	nr = 1;
	condition = DIA_GorNaRan_Wache_Condition;
	information = DIA_GorNaRan_Wache_Info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int DIA_GorNaRan_Wache_Condition()
{
	if(Kapitel < 6)
	{
		return TRUE;
	};
};

func void DIA_GorNaRan_Wache_Info()
{
	AI_Output(other,self,"DIA_GorNaRan_Wache_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_01");	//� ������� ������, ������ �����������, ������� �������� ������� �� ���.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_02");	//�� ����� ����� � �� � ������ �� �������� � ���� ��������. ��� � ������������� ������������ �����.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_03");	//�� ������, �� �������� ����, ��� ������ ����� ����� ��� ������.
	AI_StopProcessInfos(self);
};


instance Info_TPL_1405_GorNaRan(C_Info)
{
	npc = tpl_1490_gornaran;
	condition = Info_TPL_1405_GorNaRan_Condition;
	information = Info_TPL_1405_GorNaRan_Info;
	permanent = 0;
	important = 1;
};


func int Info_TPL_1405_GorNaRan_Condition()
{
	return TRUE;
};

func void Info_TPL_1405_GorNaRan_Info()
{
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_01");	//���� �� ��������? ����� ������ ��������.
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_02");	//��� ����� ����������?
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_03");	//� �� ��� �����������? ������ �� ������ � ���� ������� � ��������, ������ ��� ��� ����������� � ��� �������� ��� ���� ��������. ����� ��� ������ � ���� �����.
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_04");	//� �� ������ ����� ����������.
	AI_DrawWeapon(self);
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_05");	//��, ������ �����! �� �� ������ ���������� ��� �����, ��� ������ ����������� ������� ������! � ������ ���� �������� ��� �� ������ �����������.
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_06");	//�� �� ������� ���������� ����!
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_07");	//� ��� ���, ������! �� �������!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_ExchangeRoutine(self,"HOSTILE");
};

