
instance DIA_BaalIsidro_EXIT(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 999;
	condition = DIA_BaalIsidro_EXIT_Condition;
	information = DIA_BaalIsidro_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalIsidro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalIsidro_Hello(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Hello_Condition;
	information = DIA_BaalIsidro_Hello_Info;
	permanent = 0;
	description = "�����-�� � ���� ������� �������� ���.";
};


func int DIA_BaalIsidro_Hello_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_BaalIsidro_Hello_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_00");	//�����-�� � ���� ������� �������� ���.
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_01");	//����� ��������������!
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_02");	//��� ������ ����� ���������� �� ����� ���� ���������.
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_03");	//�� �������� ������ �� ������ ���������?
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_04");	//��.
};


instance DIA_BaalIsidro_TRADE(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 800;
	condition = DIA_BaalIsidro_TRADE_Condition;
	information = DIA_BaalIsidro_TRADE_Info;
	permanent = 1;
	description = "������, ��� �� ��� ��������.";
	trade = 1;
};


func int DIA_BaalIsidro_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalIsidro_Hello) && ((Kapitel < 3) || (BaalIsidro_DealerJob == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_TRADE_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_TRADE_15_00");	//������, ��� �� ��� ��������.
	AI_Output(self,other,"DIA_BaalIsidro_TRADE_03_01");	//���...
};


instance DIA_BaalIsidro_GimmeKraut(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_GimmeKraut_Condition;
	information = DIA_BaalIsidro_GimmeKraut_Info;
	permanent = 0;
	description = "� ���� ������ ��������� ��������. �� ���� �������� ����������.";
};


func int DIA_BaalIsidro_GimmeKraut_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalIsidro_Hello) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_GimmeKraut_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_GimmeKraut_15_00");	//� ���� ������ ���� ��������� ��������. �� ���� �������� ����������.
	AI_Output(self,other,"DIA_BaalIsidro_GimmeKraut_03_01");	//���� �� ����� ���� ��������, � ��� �� ������� ����, ����� ������ ���� ��� �������� ������� ����������.
	BAALISIDRO_JOINTS_STARTED = TRUE;
	Log_CreateTopic(CH1_DealerJob,LOG_MISSION);
	Log_SetTopicStatus(CH1_DealerJob,LOG_RUNNING);
	B_LogEntry(CH1_DealerJob,"��������� ���� ������ ������ ����� ���������� � ���� �� �����. ��� ����� ������� ���� ��������, �� �� ������ �� ����� � ����� ��������. ����� ����, � ����� ��������� ��� �������� ��� ���� ���...");
};


instance DIA_BaalIsidro_Problem(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Problem_Condition;
	information = DIA_BaalIsidro_Problem_Info;
	permanent = 0;
	description = "���� ����� ����� ����� ���� ������� ���������...";
};


func int DIA_BaalIsidro_Problem_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp) && Npc_KnowsInfo(hero,DIA_BaalIsidro_GimmeKraut) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_Problem_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Problem_15_00");	//�������� ����: ���� ����� ����� ����� ���� ������� ���������. �������, ����� ���� �������� ��������.
	AI_Output(self,other,"DIA_BaalIsidro_Problem_03_01");	//���? � ������� ������! ��� �� ��� ���������� �� ���� �����...
	if(BaalIsidro_GotDrink == FALSE)
	{
		B_LogEntry(CH1_DealerJob,"���� ������ ��� ������ �������, ����� � ��������� ��� � ������ ����� ������ ����� ��� ������. �� ����� ���� ������������, ����� ��������� ���.");
	}
	else
	{
		B_LogEntry(CH1_DealerJob,"���� ������ ��� ������ �������, ����� � ��������� ��� � ������ ����� ������ ����� ��� ������.");
	};
};


var int BaalIsidro_GotDrink;

instance DIA_BaalIsidro_Drink(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Drink_Condition;
	information = DIA_BaalIsidro_Drink_Info;
	permanent = 1;
	description = "� ���� ��� �����. ���, �����.";
};


func int DIA_BaalIsidro_Drink_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_Drink_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Drink_15_00");	//� ���� ��� �����. ���, �����.
	if((Npc_HasItems(other,ItFoBooze) > 0) || (Npc_HasItems(other,ItFoBeer) > 0) || (Npc_HasItems(other,ItFoWine) > 0))
	{
		AI_Output(self,other,"DIA_BaalIsidro_Drink_03_01");	//������� ����! � ����� �� ���� ��������!
		if(Npc_HasItems(other,ItFoBooze))
		{
			b_printtrademsg1("����� �����.");
			B_GiveInvItems(other,self,ItFoBooze,1);
			if(C_BodyStateContains(self,BS_SIT))
			{
				AI_UseMob(self,"CHAIR",-1);
				AI_TurnToNPC(self,hero);
				C_StopLookAt(self);
			};
			AI_UseItem(self,ItFoBooze);
		}
		else if(Npc_HasItems(other,ItFoBeer))
		{
			b_printtrademsg1("������ ����.");
			B_GiveInvItems(other,self,ItFoBeer,1);
			if(C_BodyStateContains(self,BS_SIT))
			{
				AI_UseMob(self,"CHAIR",-1);
				AI_TurnToNPC(self,hero);
				C_StopLookAt(self);
			};
			AI_UseItem(self,ItFoBeer);
		}
		else if(Npc_HasItems(other,ItFoWine))
		{
			b_printtrademsg1("������ ����.");
			B_GiveInvItems(other,self,ItFoWine,1);
			if(C_BodyStateContains(self,BS_SIT))
			{
				AI_UseMob(self,"CHAIR",-1);
				AI_TurnToNPC(self,hero);
				C_StopLookAt(self);
			};
			AI_UseItem(self,ItFoWine);
		};
		BaalIsidro_GotDrink = TRUE;
		if(Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem))
		{
			B_LogEntry(CH1_DealerJob,"��� �������� ������������� ��� �����. �����, ������ ���� ������ ������ ��� �����������.");
		}
		else
		{
			B_LogEntry(CH1_DealerJob,"���� ������ � �������� ����� �� ��� ��������. ��, �������, �� ��� ��� �� �������� ������ ��� ���� ��������.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BaalIsidro_NO_Drink_03_00");	//���? ���?
	};
};


instance DIA_BaalIsidro_ThinkAgain(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_ThinkAgain_Condition;
	information = DIA_BaalIsidro_ThinkAgain_Info;
	permanent = 1;
	description = "�������, � ������ ���� ��������, � ������� �� ������� �������!";
};


func int DIA_BaalIsidro_ThinkAgain_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob != LOG_RUNNING) && (BaalIsidro_DealerJob != LOG_SUCCESS)) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_ThinkAgain_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_00");	//�������, � ������ ���� ��������, � ������� �� ������� �������!
	if((BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem))
	{
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_01");	//� ������! ��� �� � ��������� � ���� ����������. �� �� �� ������ ������� ���� ������ ������, ��?
		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_02");	//������� �����.
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_03");	//������, ��� ���� ���� ��������... �� ������ �������� �� ���� �� ������ 400 ������ ����. �� ������� �� �������. ��� ���������� �� ����, ������� �� ���. � ��� ����� ���� �����.
		b_printtrademsg1("�������� 50 �������.");
		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_04");	//�� ������, ��� ����� ����� ������ ������� ������ ���������?
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_05");	//���� �� � ����, � �� � ��� ������ � ����.
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_06");	//��, ��� ���� ��������� ����� � �������� ���� ������� �����.
		BaalIsidro_DealerJob = LOG_RUNNING;
		B_LogEntry(CH1_DealerJob,"���� ������ ������� ��� ���� ��������. � ������ ��� ������� � �������� ������� �������� ���.");
		Npc_RemoveInvItems(self,ItMiJoint_1,10);
		CreateInvItems(other,ItMiJoint_1,10);
		Npc_RemoveInvItems(self,ItMiJoint_2,20);
		CreateInvItems(other,ItMiJoint_2,20);
		Npc_RemoveInvItems(self,ItMiJoint_3,20);
		CreateInvItems(other,ItMiJoint_3,20);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00");	//���, �� �� ���. � � ��� ����� � ���� ����������...
	};
};


instance DIA_BaalIsidro_RUNNING(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_RUNNING_Condition;
	information = DIA_BaalIsidro_RUNNING_Info;
	permanent = 1;
	description = "� ������ ���� ��������.";
};


func int DIA_BaalIsidro_RUNNING_Condition()
{
	if((BaalIsidro_DealerJob == LOG_RUNNING) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_RUNNING_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_00");	//� ������ ���� ��������.
	AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_01");	//� ��� ��� 200 ������?
	if(Npc_HasItems(other,ItMiNugget) >= 200)
	{
		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_02");	//��� ���.
		b_printtrademsg1("������ ����: 200");
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_03");	//������... � ���� ���� ����� ����� ������ ��� �����!
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_04");	//������� ����� � ����� ����, ����.
		B_GiveInvItems(hero,self,ItMiNugget,200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_DealerJob,LOG_SUCCESS);
		B_LogEntry(CH1_DealerJob,"���� ������ ��� ����� ���, ��� � ������� ��� �� ���� ��������� � ������ 200 ������ ����.");
		B_GiveXP(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_NoOre_15_05");	//� ����� ����� ���� ����.
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_NoOre_03_06");	//��� ������� ��!
		AI_StopProcessInfos(self);
	};
};


instance DIA_BAALISIDRO_REVENGE(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = dia_baalisidro_revenge_condition;
	information = dia_baalisidro_revenge_info;
	permanent = 0;
	important = 1;
};


func int dia_baalisidro_revenge_condition()
{
	if((Kapitel > 2) && (BaalIsidro_DealerJob == LOG_RUNNING) && (BAALISIDRO_JOINTS_STARTED == TRUE))
	{
		return 1;
	};
};

func void dia_baalisidro_revenge_info()
{
	if(C_NpcBelongsToPsiCamp(hero))
	{
		AI_Output(self,other,"SVM_3_HeyYou");	//��, ��!
	}
	else
	{
		AI_Output(self,other,"SVM_3_YouViolatedForbiddenTerritory");	//��! ������ �� ����� ������?
	};
	AI_DrawWeapon(self);
	AI_Output(self,other,"SVM_3_YouStoleFromMe");	//�� ������� ����, ������� ���!
	BaalIsidro_DealerJob = LOG_FAILED;
	Log_SetTopicStatus(CH1_DealerJob,LOG_FAILED);
	B_LogEntry(CH1_DealerJob,"��-�� ���� ����� ������ � ������� ������� � �������� ������.");
	Info_ClearChoices(dia_baalisidro_revenge);
	if(Npc_HasItems(hero,ItMiNugget) >= 200)
	{
		Info_AddChoice(dia_baalisidro_revenge,"�����, ��� ���� ����!",dia_baalisidro_revenge_giveore);
	}
	else
	{
		Info_AddChoice(dia_baalisidro_revenge,"�� � ���� �� ��� ����� ����.",dia_baalisidro_revenge_noore);
	};
	Info_AddChoice(dia_baalisidro_revenge,"���� �� ����!",dia_baalisidro_revenge_fuckoff);
};

func void dia_baalisidro_revenge_giveore()
{
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//�����, ��� ���� ����!
	b_printtrademsg1("������ ����: 200");
	AI_Output(self,other,"SVM_3_HeDeservedIt");	//����� ���� ���� ��� �������!
	B_GiveInvItems(other,self,ItMiNugget,200);
	AI_RemoveWeapon(self);
	AI_StopProcessInfos(self);
};

func void dia_baalisidro_revenge_noore()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//�� � ���� �� ��� ����� ����.
	AI_Output(self,other,"SVM_3_ShitNoOre");	//� ���� ��� ����? �� ������� ����. ��� �� ���?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void dia_baalisidro_revenge_fuckoff()
{
	AI_Output(other,self,"DIA_Mud_GetLost_15_00");	//���� �� ����!
	AI_Output(self,other,"SVM_3_DieMonster");	//��� �� �� ��� ������, ������ � � ����� �������!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_BAALISIDRO_HELLO_CH5(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = dia_baalisidro_hello_ch5_condition;
	information = dia_baalisidro_hello_ch5_info;
	permanent = 0;
	description = "�����-�� � ���� ������� �������� ���.";
};


func int dia_baalisidro_hello_ch5_condition()
{
	if((Kapitel > 2) && (BAALISIDRO_JOINTS_STARTED == TRUE) && !Npc_KnowsInfo(hero,dia_baalisidro_revenge) && (BaalIsidro_DealerJob != LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_baalisidro_hello_ch5_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_00");	//�����-�� � ���� ������� �������� ���.
	AI_Output(self,other,"SVM_3_NotNow");	//� �����.
	BaalIsidro_DealerJob = LOG_FAILED;
	Log_SetTopicStatus(CH1_DealerJob,LOG_FAILED);
	B_LogEntry(CH1_DealerJob,"����� ������ � ������� ������� � �������� ������.");
	AI_StopProcessInfos(self);
};

