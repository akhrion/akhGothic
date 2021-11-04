
instance DIA_Balor_Exit(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 999;
	condition = DIA_Viran_Exit_Condition;
	information = DIA_Viran_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Balor_Exit_Condition()
{
	return 1;
};

func void DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Balor_BotenDay;

instance DIA_Balor_FetchWeed(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_FetchWeed_Condition;
	information = DIA_Balor_FetchWeed_Info;
	permanent = 0;
	description = "���� ������� ���� ���� �� ������� ���������.";
};


func int DIA_Balor_FetchWeed_Condition()
{
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Balor_FetchWeed_Info()
{
	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00");	//���� ������� ���� ���� �� ������� ���������.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01");	//������. ��� �� �������� �������� ��� ������. ���, ������ ���.
	b_printtrademsg1("������� �������� (50).");
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02");	//�� ������ ��������� � �������, �� ������ ������� ������, ���� �� � ���� ��� �� ���.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03");	//����� ��� ������� ������ ���-���� ��������� ������� ���������. ����� ��������, ��� �� �������� ��������, ����.
	B_GiveInvItems(self,other,ItMi_Plants_Swampherb_01,50);
	B_LogEntry(CH1_DeliverWeed,"����� ������� ��� ������� ������ ��������� ��� ��� ������.");
	B_GiveXP(XP_WeedFromBalor);
	if(!Npc_KnowsInfo(hero,DIA_Viran_What) && !Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		B_LogEntry(CH1_DeliverWeed,"�� ������ ������, �� ������ ������� ������ ���� ��� ���� ������ ��������� ���������. � �� ���������� ��� ������� ����� �����. ������ ��� �������� ����������� ��� ������ � ����������� �� ��������� �� ����� �����������.");
	};
	Balor_BotenDay = Wld_GetDay();
};


var int Balor_PlayerCheating;

instance DIA_Balor_SellUnder(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_SellUnder_Condition;
	information = DIA_Balor_SellUnder_Info;
	permanent = 0;
	description = "�� ��� � ����? � �����... ���� ��� ��� ������? ������� ����-��?";
};


func int DIA_Balor_SellUnder_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

func void DIA_Balor_SellUnder_Info()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_15_00");	//�� ��� � ����? � �����... ���� ��� ��� ������? ������� ����-��?
	AI_Output(self,other,"DIA_Balor_SellUnder_01_01");	//�, � ��������� ���� ������� ����, ��?
	Info_ClearChoices(DIA_Balor_SellUnder);
	Info_AddChoice(DIA_Balor_SellUnder,"������, ��� ���� ������ �����.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice(DIA_Balor_SellUnder,"���� �� �� ���� ����, ��� ��� ��� ������, �� �������� �� �������.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice(DIA_Balor_SellUnder,"���, ������ �����, ��� ��.",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00");	//������, ��� ���� ������ �����.
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00");	//���� �� �� ���� ����, ��� ��� �� ��� ������, �� ����� �� �������� ������� �������.
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01");	//��, ���� � ����� ������ �������, �������� ��� �� �������������� ���� ���������...
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02");	//�� ���� ���� ������ �� ����, ��� ������� ���� �����������! ��� ��� � ������ �� ����, ����?!
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00");	//���, ������ �����, ��� ��.
	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01");	//���, ���� �������! ��, ��� ��� � ���� �����: ���� ��� ����� �� ������� �����, ���������� ��� �����! � ��� ����� �� ������.
};


instance DIA_Balor_TellDealer(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_TellDealer_Condition;
	information = DIA_Balor_TellDealer_Info;
	permanent = 1;
	description = "� ����. ��� ���� � ����� ������ ����� ������� ��������?";
};


func int DIA_Balor_TellDealer_Condition()
{
	if((Balor_PlayerCheating == TRUE) && (Balor_TellsNCDealer == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void DIA_Balor_TellDealer_Info()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_15_00");	//� ����. ��� ���� � ����� ������ ����� ������� ��������?
	AI_Output(self,other,"DIA_Balor_TellDealer_01_01");	//�������, � ������ ���� ����� ��������, � �� ������� � ����� ������. ���� �� �������!
	AI_Output(self,other,"DIA_Balor_TellDealer_01_02");	//��� ����� �������, ��������� ������ ����. ����� � ���������.
	Info_ClearChoices(DIA_Balor_TellDealer);
	Info_AddChoice(DIA_Balor_TellDealer,"������ �� ����.",DIA_Balor_TellDealer_ForgetIt);
	Info_AddChoice(DIA_Balor_TellDealer,"��������� ������? ������, �����.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00");	//��������� ������? ������, �����.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		b_printtrademsg1("������ ����: 50");
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01");	//��� �... ������. ��� ����� ������. �� ����� ��� ����� ����� � ���� �� �����.
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02");	//�� ���� � ��� ���������. ������, ����� �� ���� �� �������.
		b_printtrademsg2("������� ����� � ������.");
		Info_ClearChoices(DIA_Balor_TellDealer);
		Npc_RemoveInvItems(other,ItMiNugget,50);
		Npc_RemoveInvItems(other,ItMi_Plants_Swampherb_01,50);
		CreateInvItems(other,weedpack,1);
		Balor_TellsNCDealer = TRUE;
		B_LogEntry(CH1_DeliverWeed,"����� ������ ��� �������� �� ������ ������. ��� ����� ������. � ����� ����� ��� � ���� �� �����. ���� ����� ����� ����������, ���� � ������ �������� �� �������.");
		B_GiveXP(XP_BalorNamedCipher);
		Log_CreateTopic(GE_TraderNC,LOG_NOTE);
		B_LogEntry(GE_TraderNC,"������ ������� � �������� ������ ������. �� ������������ �������� �������� ���������. ��� ����� ����� � ���� �� ����� ����� ������ ������.");
		B_LogEntry(GE_TraderNC,"� ����������� � �������. ������ ��������� ���� �� ����� �������� ��� ���� ����� � ������� ���������, ������� � ����� ������� ������� �������.");
		Balor_BotenDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//� �� ���� ����. ��������� ������ � �� ������ ������, �����?
		Info_ClearChoices(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//������ �� ����.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01");	//�� �����, ��� ����� ��� ��� ������ ��������� � ����� ������ � ������� ���� �������� ������� ����������! ���� �� ������ ������� ��������, � ���� ������ �� ������.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02");	//�� ������ ���������� ��� �� ���� ��������, � � ���� ��� �������.
	Info_ClearChoices(DIA_Balor_TellDealer);
};


instance DIA_Balor_RipOff(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 5;
	condition = DIA_Balor_RipOff_Condition;
	information = DIA_Balor_RipOff_Info;
	permanent = 1;
	description = "��� ����� �. ��� ����� ������� ��������� ������.";
};


func int DIA_Balor_RipOff_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed) && (BALOR_CAN_GIVE == TRUE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void DIA_Balor_RipOff_Info()
{
	AI_Output(other,self,"DIA_Balor_RipOff_15_00");	//��� ����� �. ��� ����� ������� ��������� ������.
	if(Balor_BotenDay <= (Wld_GetDay() - 2))
	{
		if(Balor_TellsNCDealer == TRUE)
		{
			AI_Output(self,other,"DIA_Balor_RipOff_01_01");	//��� ��! ����� ����� ������� ��� � ����� ������.
			AI_Output(self,other,"DIA_Balor_RipOff_01_02");	//��� ��� �������: ��������� ������ ����.
			Info_ClearChoices(DIA_Balor_RipOff);
			Info_AddChoice(DIA_Balor_RipOff,"������ �� ����.",dia_balor_telldealer_forgetit2);
			Info_AddChoice(DIA_Balor_RipOff,"�����, ��� ���� ����!",dia_balor_telldealer_pay2);
		}
		else
		{
			AI_Output(self,other,"DIA_Balor_RipOff_01_03");	//�, ��� ����� ��? �����, ����, �� ������ �� ������� ��� ��������!
			b_printtrademsg1("������� �������� (50).");
			AI_Output(other,self,"DIA_Balor_RipOff_15_04");	//�� ��� ��, � � �� ���������.
			CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
			B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
			BALOR_CAN_GIVE = FALSE;
			Balor_BotenDay = Wld_GetDay();
		};
	}
	else
	{
		if(Balor_TellsNCDealer == TRUE)
		{
			AI_PlayAni(self,"T_SEARCH");
		};
		AI_Output(self,other,"SVM_1_NotNow");	//� �����!
		AI_StopProcessInfos(self);
	};
};

func void dia_balor_telldealer_pay2()
{
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//�����, ��� ���� ����!
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		b_printtrademsg1("������ ����: 50");
		b_printtrademsg2("������� ����� � ������.");
		Info_ClearChoices(DIA_Balor_RipOff);
		Npc_RemoveInvItems(other,ItMiNugget,50);
		Npc_RemoveInvItems(other,ItMi_Plants_Swampherb_01,50);
		CreateInvItems(other,weedpack,1);
		Balor_BotenDay = Wld_GetDay();
		BALOR_CAN_GIVE = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//� �� ���� ����. ��������� ������ � �� ������ ������, �����?
		Info_ClearChoices(DIA_Balor_RipOff);
	};
};

func void dia_balor_telldealer_forgetit2()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//������ �� ����.
	AI_Output(self,other,"SVM_1_OkayKeepIt");	//������, ��� ������! ������ ����!
	Info_ClearChoices(DIA_Balor_RipOff);
};


instance DIA_Balor_Perm(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_Perm_Condition;
	information = DIA_Balor_Perm_Info;
	permanent = 1;
	description = "��� �, ������� ������.";
};


func int DIA_Balor_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

func void DIA_Balor_Perm_Info()
{
	AI_Output(other,self,"DIA_Balor_Perm_15_00");	//��� �, ������� ������.
	AI_Output(self,other,"DIA_Balor_Perm_01_01");	//�������, � ��� ���, ��-������, ����� �����? ������� � ������?
};


instance BALOR_GETLOST(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = balor_getlost_condition;
	information = balor_getlost_info;
	permanent = 1;
	important = 1;
};


func int balor_getlost_condition()
{
	if(((BALOR_TRADE_COUNT >= 5) || (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void balor_getlost_info()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		AI_Output(self,other,"SVM_1_YouDefeatedNOV_Guard");	//�� ���� ����� ���� ������������. ��� ������ �� ����� ������������!
	}
	else
	{
		AI_Output(self,other,"SVM_1_SuckerDefeatedNov_Guard");	//�������, �� ������ ������������ ������� ����� �����������?
	};
	AI_StopProcessInfos(self);
};

