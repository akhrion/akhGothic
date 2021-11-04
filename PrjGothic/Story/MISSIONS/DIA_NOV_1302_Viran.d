
instance DIA_Viran_Exit(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 999;
	condition = DIA_Viran_Exit_Condition;
	information = DIA_Viran_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Viran_Exit_Condition()
{
	return 1;
};

func void DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Viran_What(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_What_Condition;
	information = DIA_Viran_What_Info;
	permanent = 0;
	description = "��� � ���� �� ������?";
};


func int DIA_Viran_What_Condition()
{
	return 1;
};

func void DIA_Viran_What_Info()
{
	AI_Output(other,self,"DIA_Viran_What_15_00");	//��� � ���� �� ������?
	AI_Output(self,other,"DIA_Viran_What_07_01");	//������� ��������. ������ ������ ���������� ��� ������� �������, � ��� ����� ����� ������.
	AI_Output(self,other,"DIA_Viran_What_07_02");	//������ ����� ������, ����� ������� �����, ��������� ���� ��� �������, �� �������� ������ ������ �����. �� ��� ������ � �������.
	AI_Output(other,self,"DIA_Viran_What_15_03");	//������?
	AI_Output(self,other,"DIA_Viran_What_07_04");	//������ ��� ����� �� ���� ������ ������� ���� �� �����������. �� ���� ����� � ������� ������ �� ����� �������� ��������.
	AI_Output(self,other,"DIA_Viran_What_07_05");	//�� ������� ��� ������ �������, � ���� ��������� ����.
};


instance DIA_Viran_FetchWeed(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_FetchWeed_Condition;
	information = DIA_Viran_FetchWeed_Info;
	permanent = 0;
	description = "� �� ����� �����. � ������ ��������� ��� ������ ������ ���������.";
};


func int DIA_Viran_FetchWeed_Condition()
{
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Viran_FetchWeed_Info()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_15_00");	//���� ������� ���� ����. � ������ ��������� ��� ������ ������ ���������.
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_01");	//�� �������, ��� ��� ������, ��?
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_02");	//��� ����� ����� ������ � �������: '���� ������� ���� ����', � ����� �� ������� �� ���, �� ���������.
	Info_ClearChoices(DIA_Viran_FetchWeed);
	Info_AddChoice(DIA_Viran_FetchWeed,"�� ����� � ������ � ���� ���, ���� ��� �� ������!",DIA_Viran_FetchWeed_GotoHim);
	Info_AddChoice(DIA_Viran_FetchWeed,"�� ���� ������������� ������ ���� ����!",DIA_Viran_FetchWeed_Really);
};

func void DIA_Viran_FetchWeed_Really()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_Really_15_00");	//�� ���� ������������� ������ ���� ����!
	AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01");	//�� ��, ��� ��.
/*
	if(hero.attribute[ATR_STRENGTH] > 30){};//� ���� �� ������..
	if(hero.attribute[ATR_DEXTERITY] > 30){};//� ����� ��� �� ������ �� ������
*/
	
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_GotoHim_15_00");	//�� ����� � ������ � ���� ���, ���� ��� �� ������!
	AI_Output(self,other,"DIA_Viran_FetchWeed_GotoHim_07_01");	//� ���� ���� ���� �������. �� ��������, ��� ��������� �� ���, ���� ��������� ���� ��������� �������!
	Info_ClearChoices(DIA_Viran_FetchWeed);
};


var int Viran_Bloodflies;

instance DIA_Viran_Bloodflies(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Bloodflies_Condition;
	information = DIA_Viran_Bloodflies_Info;
	permanent = 0;
	description = "� ��� � ������ �������?";
};


func int DIA_Viran_Bloodflies_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

func void DIA_Viran_Bloodflies_Info()
{
	AI_Output(other,self,"DIA_Viran_Bloodflies_15_00");	//� ��� � ������ �������?
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_01");	//��� ����� ������. ��� � ��� �������, ����� ������ ��������. �� ��� ������� ������ ��� ������ ������.
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_02");	//��� ��� ��� ���� �� ������� �����! ������ ���� ��� �������?
	Viran_Bloodflies = LOG_RUNNING;
	B_LogEntry(CH1_DeliverWeed,"������ ������ ��� ������ ��������� ����� ����, ��� � ���� ���� ������� � ������.");
};


var int Viran_BotenDay;

instance DIA_Viran_Running(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Running_Condition;
	information = DIA_Viran_Running_Info;
	permanent = 1;
	description = "�� � �� ���� ����� ������� �������.";
};


func int DIA_Viran_Running_Condition()
{
	if(Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Viran_Running_Info()
{
	AI_Output(other,self,"DIA_Viran_Running_15_00");	//�� � �� ���� ����� ������� �������.
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,Bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self,other) < 2000))
	{
		AI_Output(self,hero,"DIA_Viran_Running_07_00");	//��, ��� ������ � ������� ������ �� ���. ��� ��������!
		AI_Output(self,hero,"DIA_Viran_Running_07_01");	//������ ��� �� �� �����������!
	}
	else
	{
		AI_Output(self,hero,"DIA_Viran_Running_07_02");	//�, ������� ������ ����� �� �����. ������� ������!
		AI_Output(self,hero,"DIA_Viran_Running_07_03");	//�� ���� �� ������� ���� ������ �����, ���� ���� �� ���.
		AI_Output(self,hero,"DIA_Viran_Running_07_04");	//� ������ �� ������ ���, ����� �������� ����, � ����?
		AI_Output(self,hero,"DIA_Viran_Running_07_05");	//���, ������ ������ � ������ ��� ��� ������.
		b_printtrademsg1("������� �������� (50).");
		AI_Output(self,hero,"DIA_Viran_Running_07_06");	//���� �� ������, ��� ����� ������� ����, �������� ��� ������ ����������� ���������� �����, �����-�� �� ������, ��� ��� ��������� ��������.
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
		if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
		{
			B_LogEntry(CH1_DeliverWeed,"������ ����� ��� ������ �������� ������ ���������. ���������, ��� ������ �� ��� ��� �����.");
		}
		else
		{
			B_LogEntry(CH1_DeliverWeed,"������ ��� ��� ������ ���������. ��� ��������� ������� ����. ��� �������, �� ��� ��� ������ ��������.");
		};
		B_GiveXP(XP_WeedFromViran);
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Viran_Perm(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Perm_Condition;
	information = DIA_Viran_Perm_Info;
	permanent = 1;
	description = "��� ���� ���� ������?";
};


func int DIA_Viran_Perm_Condition()
{
	if(Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Viran_Perm_Info()
{
	AI_Output(other,self,"DIA_Viran_Perm_15_00");	//��� ���� ���� ������?
	AI_Output(self,other,"DIA_Viran_Perm_07_01");	//��, ��, ��������. ������, ��� ���� �������� ���� ������ �������, ��� � ���.
	AI_Output(self,other,"DIA_Viran_Perm_07_02");	//��, �-�� ��� ����� �� ��� ����� ��� �����. ��� ����� ���� '������'.
};


instance DIA_Viran_RipOff(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 5;
	condition = DIA_Viran_RipOff_Condition;
	information = DIA_Viran_RipOff_Info;
	permanent = 1;
	description = "� ����� ������ �� ������� ��� ��� ������.";
};


func int DIA_Viran_RipOff_Condition()
{
	if((Viran_BotenDay <= (Wld_GetDay() - 1)) && (Viran_Bloodflies == LOG_SUCCESS) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_Viran_RipOff_Info()
{
	if(Viran_BotenDay <= (Wld_GetDay() - 1))
	{
		var int amount; amount = Hlp_Random(50);
		AI_Output(other,self,"DIA_Viran_RipOff_15_00");	//� ����� ���. ��� ��� �������� ���?
		AI_Output(self,other,"asd");	//��� ����? �� ������ ������� ���� �����.
		b_printtrademsg1(
			ConcatStrings(
				ConcatStrings(
					"������� �������� (",
					IntToString(amount)
				),
				")."
			)
		);
		CreateInvItems(self,ItMi_Plants_Swampherb_01, amount);
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,amount);
	} else {
		AI_Output(other,self,"DIA_Viran_RipOff_15_00");	//� ����� ������ �� ������� ��� ��� ������.
		AI_Output(self,other,"DIA_Viran_RipOff_07_01");	//���, �����?
		AI_Output(other,self,"DIA_Viran_RipOff_15_02");	//������ �� ������ ���, ��� ������ ����� ��������� ���� ����������� � ������, ����� �������� ����, ��� ��� ������. � ���� ��� �������.
		AI_Output(self,other,"DIA_Viran_RipOff_07_03");	//��, �����! ������� �� ���� ������ ��������!
		b_printtrademsg1("������� �������� (50).");
		CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
	};
	Viran_BotenDay = Wld_GetDay();
};

