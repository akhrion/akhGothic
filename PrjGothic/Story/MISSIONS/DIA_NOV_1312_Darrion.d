
instance DIA_Darrion_Exit(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 999;
	condition = DIA_Darrion_Exit_Condition;
	information = DIA_Darrion_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Darrion_Exit_Condition()
{
	return 1;
};

func void DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Darrion_Hello(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = DIA_Darrion_Hello_Condition;
	information = DIA_Darrion_Hello_Info;
	permanent = 0;
	description = "������! � ����� ������� � ����� �� ������������ � �������.";
};


func int DIA_Darrion_Hello_Condition()
{
	return 1;
};

func void DIA_Darrion_Hello_Info()
{
	AI_Output(other,self,"DIA_Darrion_Hello_15_00");	//������! � ����� ������� � ����� �� ������������ � �������.
	AI_Output(self,other,"DIA_Darrion_Hello_11_01");	//�� ������ �� ������ ����, ���� �����. ������ ��������� � �����, � � ��� �� �� ��� ��� �������.
	AI_Output(self,other,"DIA_Darrion_Hello_11_02");	//� �� ���� ����������� ���� �������. �� ����� ���, ���� �� ������ ������ � ���� ���-������.
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"��������� ������� ������� ������. ������� ����� ������� �� �������� � �������.");
};


instance DIA_Darrion_Trade(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 800;
	condition = DIA_Darrion_Trade_Condition;
	information = DIA_Darrion_Trade_Info;
	permanent = 0;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int DIA_Darrion_Trade_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Darrion_Hello))
	{
		return TRUE;
	};
};

func void DIA_Darrion_Trade_Info()
{
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordrawhot,Npc_HasItems(self,ItMiSwordrawhot));
	};
	if(Npc_HasItems(self,ItMiSwordblade) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
	};
	if(!Npc_HasItems(self,ItMw_1H_Sledgehammer_01) && !Npc_HasItems(other,ItMw_1H_Sledgehammer_01))
	{
		CreateInvItem(self,ItMw_1H_Sledgehammer_01);
	};
	AI_Output(other,self,"DIA_Darrion_Trade_15_00");	//������ ��� ���� ������.
	AI_Output(self,other,"DIA_Darrion_Trade_11_01");	//� ����� ���� ���� ��������. ��� ���, ��� � ������.
};


instance DIA_DARRION_TRADE2(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 800;
	condition = dia_darrion_trade2_condition;
	information = dia_darrion_trade2_info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int dia_darrion_trade2_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Darrion_Trade))
	{
		return TRUE;
	};
};

func void dia_darrion_trade2_info()
{
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordrawhot,Npc_HasItems(self,ItMiSwordrawhot));
	};
	if(Npc_HasItems(self,ItMiSwordblade) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
	};
	if(!Npc_HasItems(self,ItMw_1H_Sledgehammer_01) && !Npc_HasItems(other,ItMw_1H_Sledgehammer_01))
	{
		CreateInvItem(self,ItMw_1H_Sledgehammer_01);
	};
	AI_Output(other,self,"DIA_Darrion_Trade_15_00");	//������ ��� ���� ������.
};

