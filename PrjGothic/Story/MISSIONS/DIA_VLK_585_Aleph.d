
instance VLK_585_Aleph_Exit(C_Info)
{
	npc = VLK_585_Aleph;
	nr = 999;
	condition = VLK_585_Aleph_Exit_Condition;
	information = VLK_585_Aleph_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

func void VLK_585_Aleph_Exit_Info()
{
	if(!Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH))
	{
		AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01");	//����� �����!
		AI_Output(self,other,"VLK_585_Aleph_Exit_Info_05_02");	//�� ������, ��� ���� �����.
	};
	AI_StopProcessInfos(self);
};


instance VLK_585_Aleph_CLEVER(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_CLEVER_Condition;
	information = VLK_585_Aleph_CLEVER_Info;
	important = 1;
	permanent = 0;
};


func int VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void VLK_585_Aleph_CLEVER_Info()
{
	AI_Output(self,other,"VLK_585_Aleph_CLEVER_Info_05_01");	//��-��-��, ��������� ������� �� ������� ����!
};


instance VLK_585_Aleph_GUARDS(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_GUARDS_Condition;
	information = VLK_585_Aleph_GUARDS_Info;
	important = 0;
	permanent = 0;
	description = "� ��� �� ��������?";
};


func int VLK_585_Aleph_GUARDS_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_CLEVER))
	{
		return 1;
	};
};

func void VLK_585_Aleph_GUARDS_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_01");	//� ��� �� ��������?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_02");	//� ������� ������ �����, ����� ��� �������� ������� ������. ��� ��������� ����� � ��������� ������ ������.
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_03");	//�����, ��� ��� ����� ���� �����������. ����� ��� ����?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_04");	//�������, �� ����, � ������� ��� �� ���� ����, ��� ��� �����. �� ������ �� �������, ��� ��� ���������� ��������.
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_05");	//� ������ � ����� ��������� �������. ���� ���������� ����� �����������. � ���� � �����, ��������, ���� ����? ��, ������, 10 ������.
};


instance VLK_585_Aleph_INFO(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_INFO_Condition;
	information = VLK_585_Aleph_INFO_Info;
	important = 0;
	permanent = 0;
	description = "(���� 10 ������ ����)";
};


func int VLK_585_Aleph_INFO_Condition()
{
	if((Npc_HasItems(hero,ItMiNugget) >= 10) && Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void VLK_585_Aleph_INFO_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_INFO_Info_15_01");	//������, ������ ������ ������.
	b_printtrademsg1("������ ����: 10");
	B_GiveInvItems(other,self,ItMiNugget,10);
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_02");	//�������. ���� �� ��������� � ������� ����� ����� � ���������� ����, �� ������� ��� ������.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_03");	//� ����� �� ��� ����� ������ ��������. ��� �� ����� ������ �����.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_04");	//���� ���� �������, �� ������� ����� �������, �� ���� ���������, ��� ������� �������.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_05");	//���� �������� ������ ���-������ ���, ������� �� ���, �� � ����� ���� ������...
};


instance VLK_585_Aleph_ANGRY(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_ANGRY_Condition;
	information = VLK_585_Aleph_ANGRY_Info;
	important = 1;
	permanent = 0;
};


func int VLK_585_Aleph_ANGRY_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH))
	{
		return 1;
	};
};

func void VLK_585_Aleph_ANGRY_Info()
{
	AI_Output(self,other,"VLK_585_Aleph_ANGRY_Info_05_01");	//�� ��������� ��� ��������! �����, ���������!
	AI_StopProcessInfos(self);
	Npc_SetTempAttitude(self,ATT_ANGRY);
};


instance VLK_585_Aleph_KEY(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_KEY_Condition;
	information = VLK_585_Aleph_KEY_Info;
	important = 0;
	permanent = 0;
	description = "���� �����-������ �������? ����������?";
};


func int VLK_585_Aleph_KEY_Condition()
{
	if(!Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH) && Npc_KnowsInfo(hero,VLK_585_Aleph_INFO))
	{
		return 1;
	};
};

func void VLK_585_Aleph_KEY_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_KEY_Info_15_01");	//���� �����-������ �������? ����������?
	AI_Output(self,other,"VLK_585_Aleph_KEY_Info_05_02");	//� � ���� ��� ���� ����?
};


instance VLK_585_Aleph_GLEN(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_GLEN_Condition;
	information = VLK_585_Aleph_GLEN_Info;
	important = 0;
	permanent = 0;
	description = "(���� 10 ������ ����)";
};


func int VLK_585_Aleph_GLEN_Condition()
{
	if((Npc_HasItems(hero,ItMiNugget) >= 10) && Npc_KnowsInfo(hero,VLK_585_Aleph_KEY))
	{
		return 1;
	};
};

func void VLK_585_Aleph_GLEN_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_GLEN_Info_15_01");	//�������, �� ��� ������ ������ �� ���������� ��� ���-������ �������.
	b_printtrademsg1("������ ����: 10");
	B_GiveInvItems(other,self,ItMiNugget,10);
	AI_Output(self,other,"VLK_585_Aleph_GLEN_Info_05_02");	//����� ����� ����� �������� ��������. ������� ����� ������ � �������� �� ����� ����. �� ������� ��� �������.
	Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
	B_LogEntry(GE_TRADEROM,"�� ��������� ����� ���� ��������� ���, ��� ������� �� ����� ���� ������� �������.");
};

func void B_Aleph_StorageShedKey()
{
	B_LogEntry(CH2_StorageShed,"���� ������ ��� ���� �� ������ �� ������!");
};


instance VLK_585_Aleph_SCHUPPEN(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_SCHUPPEN_Condition;
	information = VLK_585_Aleph_SCHUPPEN_Info;
	important = 0;
	permanent = 1;
	description = "�� ������ ���-������ � ����� � ������ �� ������?";
};


func int VLK_585_Aleph_SCHUPPEN_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk) && !Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH) && (ALEPH_KEY == FALSE) && Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01");	//�� ������ ���-������ � ����� � ������ �� ������?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02");	//��, ��� ������� ��...
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03");	//�� ����, ������� � �������?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04");	//���, �� ������ �������.
	Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,DIALOG_BACK,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"��������� 50 ������.",VLK_585_Aleph_SCHUPPEN_50);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"��������� 30 ������.",VLK_585_Aleph_SCHUPPEN_30);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"��������� 15 ������.",VLK_585_Aleph_SCHUPPEN_15);
};

func void VLK_585_Aleph_SCHUPPEN_50()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01");	//50 ������ ���� ������?
		b_printtrademsg1("������ ����: 50");
		B_GiveInvItems(other,self,ItMiNugget,50);
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02");	//���� �������� �����������! ������ ����. � ��� ������ ��� ������. ��� ���� ���� ���������� �� �������.
		b_printtrademsg2("������� ���� �� ������ � ������ ����.");
		CreateInvItems(other,ItKe_OM_03,1);
		CreateInvItems(other,Staerkering,1);
		Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
		ALEPH_KEY = TRUE;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03");	//� ���� �� ��� ����!
	};
};

func void VLK_585_Aleph_SCHUPPEN_30()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 30)
	{
		Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01");	//��������� 30 ������.
		b_printtrademsg1("������ ����: 30");
		B_GiveInvItems(other,self,ItMiNugget,30);
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02");	//������. � ���� ��� ��� ���� ����. ���������� ��������, ������.
		b_printtrademsg2("������� ���� �� ������.");
		CreateInvItem(self,ItKe_OM_03);
		B_GiveInvItems(self,other,ItKe_OM_03,1);
		ALEPH_KEY = TRUE;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03");	//�� �������� ��, ���� ���!
	};
};

func void VLK_585_Aleph_SCHUPPEN_15()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01");	//���� ������� 15 ������?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02");	//15 ������? ������� �� ����� �������� �����!
};

func void VLK_585_Aleph_SCHUPPEN_Back()
{
	Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
};


instance VLK_585_Aleph_DIRTY(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_DIRTY_Condition;
	information = VLK_585_Aleph_DIRTY_Info;
	important = 0;
	permanent = 1;
	description = "�� ������ ���-������ � ����� � ������ �� ������?";
};


func int VLK_585_Aleph_DIRTY_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk) && Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH) && (ALEPH_KEY == FALSE) && Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void VLK_585_Aleph_DIRTY_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_01");	//�� ������ ���-������ � ����� � ������ �� ������?
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_02");	//��, �� �� ������, ��� �������...
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_03");	//�� ����, ������� � �������?
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_04");	//�� ������ ��� ���������. ��� ����� 100 ������.
	Info_ClearChoices(VLK_585_Aleph_DIRTY);
	Info_AddChoice(VLK_585_Aleph_DIRTY,"(��������� 100 ������ ����)",VLK_585_Aleph_DIRTY_100);
	Info_AddChoice(VLK_585_Aleph_DIRTY,"(�� �������)",VLK_585_Aleph_DIRTY_NO);
};

func void VLK_585_Aleph_DIRTY_100()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 100)
	{
		b_printtrademsg1("������ ����: 100");
		B_GiveInvItems(hero,self,ItMiNugget,100);
		AI_Output(other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01");	//�� ���� ������ ��������. ����� �� ���� 100 ������.
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02");	//������� �����������! �� ���� ��������. ����� ���� ����.
		b_printtrademsg2("������� ���� �� ������.");
		CreateInvItem(self,ItKe_OM_03);
		B_GiveInvItems(self,other,ItKe_OM_03,1);
		Info_ClearChoices(VLK_585_Aleph_DIRTY);
		ALEPH_KEY = TRUE;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03");	//�� �� ���� ���� ����������? 100 ������ � �� ����� ������!
	};
};

func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01");	//��� ������ - �� ��� �� ����� ���������. � �� ������!
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02");	//��, � ������� �� ������� ������. ��� �� �� ��� ��� ����� ���������!..
	Info_ClearChoices(VLK_585_Aleph_DIRTY);
};

