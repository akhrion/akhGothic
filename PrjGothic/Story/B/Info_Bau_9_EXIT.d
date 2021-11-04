
instance Info_Bau_9_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Bau_9_EXIT_Condition;
	information = Info_Bau_9_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Bau_9_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Bau_9_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Bau_9_WichtigePersonen_Condition;
	information = Info_Bau_9_WichtigePersonen_Info;
	permanent = 1;
	description = "� ��� ������, ��� ������������ ������ �� �����?";
};


func int Info_Bau_9_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_9_WichtigePersonen_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00");	//� ��� ������, ��� ������������ ������ �� �����?
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01");	//������-��, ��� ����������� �����, �� ��� �������, �� ������ � ������, ��� ������� ����� � ����� ��������.
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02");	//��, ��� � ������� ��� ��� ������������...
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_9_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Bau_9_DasLager_Condition;
	information = Info_Bau_9_DasLager_Info;
	permanent = 1;
	description = "�������� ��� �� ���� ������.";
};


func int Info_Bau_9_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_9_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_9_DasLager_15_00");	//�������� ��� �� ���� ������.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_01");	//������ ����� ������ ��������. ���� � ��� ����, � ��������� �� ���� ���� ����� �� ������.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_02");	//������ ��� ��, �� � ������������� �� ��� �� ���������.
};


instance Info_Bau_9_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Bau_9_DieLage_Condition;
	information = Info_Bau_9_DieLage_Info;
	permanent = 1;
	description = "��� ����?";
};


func int Info_Bau_9_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_9_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_9_DieLage_15_00");	//��� ����?
	AI_Output(self,other,"Info_Bau_9_DieLage_09_01");	//�� ����������� �����, ����� �������� ���� ������� ���.
};


instance Info_Bau_9_Wasser(C_Info)
{
	nr = 800;
	condition = Info_Bau_9_Wasser_Condition;
	information = Info_Bau_9_Wasser_Info;
	permanent = 1;
	description = "���� ������� �����, � ������ ���� ����.";
};


func int Info_Bau_9_Wasser_Condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void Info_Bau_9_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_9_Wasser_15_00");	//���� ������� �����, � ������ ���� ����.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		b_printtrademsg1("������ ������� ����.");
		AI_Output(self,other,"Info_Bau_9_Wasser_09_01");	//�������, ������. � �� � ��� ��� ����� ���� ���� �� ����.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00");	//� ���� �� ������ ���. �����, �����, � ������ ����.
	};
};


instance INFO_BAU_9_WASSER_NOLEFTY(C_Info)
{
	nr = 800;
	condition = info_bau_9_wasser_nolefty_condition;
	information = info_bau_9_wasser_nolefty_info;
	permanent = 1;
	description = "� ������ ���� ����.";
};


func int info_bau_9_wasser_nolefty_condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(Npc_HasItems(other,ItFo_Potion_Water_01) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_bau_9_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//� ������ ���� ����.
	b_printtrademsg1("������ ������� ����.");
	AI_Output(self,other,"SVM_9_YeahWellDone");	//�������, ������!
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,ItFo_Potion_Water_01);
};

func void B_AssignAmbientInfos_Bau_9(var C_Npc slf)
{
	Info_Bau_9_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_Wasser.npc = Hlp_GetInstanceID(slf);
	info_bau_9_wasser_nolefty.npc = Hlp_GetInstanceID(slf);
};

