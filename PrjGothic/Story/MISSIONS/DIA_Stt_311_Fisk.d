
instance Stt_311_Fisk_Exit(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 999;
	condition = Stt_311_Fisk_Exit_Condition;
	information = Stt_311_Fisk_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Stt_311_Fisk_First(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = Stt_311_Fisk_First_Condition;
	information = Stt_311_Fisk_First_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_First_Condition()
{
	if(!Npc_IsDead(ORG_826_Mordrag) && (MordragKO_HauAb == FALSE) && (MordragKO_StayAtNC == FALSE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_First_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_First_12_00");	//��, ������! � ����. � ������ ����� ���� ������. ���� ���� ���-�� �����������, � ���� �� ����� ������� ��� �����.
	if(GRAVO_LOG == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"������� ���� ������� ���������� ��������, �� ������� - �� ������� ������. ������� ����� ������� �� �������� �� �������� �������.");
	};
};


instance Stt_311_Fisk_Trade(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_Trade_Condition;
	information = Stt_311_Fisk_Trade_Info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int Stt_311_Fisk_Trade_Condition()
{
	if(FISK_REFUSETRADE == FALSE)
	{
		return 1;
	};
};

func void Stt_311_Fisk_Trade_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00");	//������, ��� � ���� ����.
};


instance Stt_311_Fisk_WhistlersSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = Stt_311_Fisk_WhistlersSword_Condition;
	information = Stt_311_Fisk_WhistlersSword_Info;
	permanent = 1;
	description = "��� ����� ���. �� �� �����, ��� � ����. ��������� ���.";
};


func int Stt_311_Fisk_WhistlersSword_Condition()
{
	if((FISK_REFUSETRADE == FALSE) && (Fisk_ForgetSword == FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00");	//��� ����� ���. �� �� �����, ��� � ����. ��������� ���.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01");	//� ���� ��� ��� ���� ���� �����. �� ���� ����������. ��� �������, ������� ����� ��� ������, ������ �� ��� �� ������.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02");	//�� ����� 110 ������. ������ ����������?
	Fisk_SCknows110 = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"� ������ ���.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"� ������� �������, ��� �� ����� �����...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"������, � ������� ���.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00");	//� ������ ���.
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00");	//� ������� �������, ��� �� ����� �����...
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01");	//�! ������-��... ������, � ���-�� �� �� ������. �� �� ����� ���� �����.
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02");	//���� �����?
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03");	//���, ����� ����? �����, �������� �� ������? ���� �������. ��, ������, � �������, ��� � �� ���� ��� ���������. �� ��� ������ ����������!
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//������, � ������� ���.
	if(Npc_HasItems(other,ItMiNugget) >= 110)
	{
		b_printtrademsg1("������ ����: 110");
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//������������!
		b_printtrademsg2("������� ��� ��������.");
		B_GiveInvItems(other,self,ItMiNugget,110);
		CreateInvItem(self,Whistlers_Schwert);
		B_GiveInvItems(self,other,Whistlers_Schwert,1);
		Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02");	//�����, � ���� �� ������ ����. � ��� �������� ��� ��� ����, �� ������ �������.
	};
};


instance Stt_311_Fisk_ForgetSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_ForgetSword_Condition;
	information = Stt_311_Fisk_ForgetSword_Info;
	permanent = 1;
	description = "�� ����� ���������� � ���� ��������?";
};


func int Stt_311_Fisk_ForgetSword_Condition()
{
	if((Fisk_ForgetSword == TRUE) && (Whistler_BuyMySword != LOG_OBSOLETE) && (Whistler_BuyMySword != LOG_FAILED))
	{
		return 1;
	};
};

func void Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00");	//�� ����� ���������� � ���� ��������?
	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01");	//������� ���, ��� ����� ���� ��� � ����� �� ������!
};


instance Stt_311_Fisk_MordragKO(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_MordragKO_Condition;
	information = Stt_311_Fisk_MordragKO_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_MordragKO_Condition()
{
	if(Npc_IsDead(ORG_826_Mordrag) || (MordragKO_HauAb == TRUE) || (MordragKO_StayAtNC == TRUE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_MordragKO_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00");	//��, ��!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01");	//������� ��� ����� �� ���� ������ �����������! �� ��� ��� ��������!
	FISK_REFUSETRADE = TRUE;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02");	//���� ��������� �������������� � ������ ������, � ���� ���������� ������!
	};
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"�� �������� ������, ������� ���� �������� � �������...",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"���������! ���� �����, � ������ ����?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"� �� ����� �� ��?..",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//���������! ���� �����, � ������ ����?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01");	//����� ��� �������? ����� ������ �� ������� ��� ������� ���������� �� ������ ������. ��, �����, ������ � ���� �� ������.
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02");	//��� �� ��� ����� ������ ��������?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03");	//� �� ������ ����, ��� � ���� ������ �� ������. ������ �� ��� ����������!
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_RUNNING);
	B_LogEntry(CH1_FiskNewDealer,"�������� ���� �� ������� ������ �����, ����� � ����� ��� ������ ���������� ������ ��������.");
	Fisk_GetNewHehler = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00");	//� �� ����� �� ��...
	AI_StopProcessInfos(self);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00");	//�� �������� ������, ������� ���� �������� � �������. �����, ������ ��������� ����� ������ �� ����...
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01");	//�� ������� ���� �������������!
};


instance Stt_311_Fisk_HehlerSuccess(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 10;
	condition = Stt_311_Fisk_HehlerSuccess_Condition;
	information = Stt_311_Fisk_HehlerSuccess_Info;
	permanent = 0;
	description = "� ����� ��������. �� �������� ���� ����� �����������.";
};


func int Stt_311_Fisk_HehlerSuccess_Condition()
{
	if((Fisk_GetNewHehler == LOG_RUNNING) && Npc_KnowsInfo(hero,Org_843_Sharky_Fisk))
	{
		return 1;
	};
};

func void Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00");	//� ����� �������� �� ������ ������. �� �������� ���� ����� �����������.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01");	//���, ������? ��� �� ��� ��������. �������, �� ������ ������� ���� ����� �����������...
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02");	//��� ���� ��� �������? � ��� �� ��?
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03");	//�����, ���� �� �����.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04");	//�����? �� �� �� ��� ����, ��� �������.
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05");	//��� �������� �����: ������ ������ �� �����������.
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//������������!
	};
	FISK_REFUSETRADE = FALSE;
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_SUCCESS);
	B_LogEntry(CH1_FiskNewDealer,"���� ������� ������� ���, ��� ����� ���������� �������� ��������.");
};


var int fisk_armor_l_was_bought;
var int fisk_armor_m_was_bought;

instance Stt_311_Fisk_ARMOR(C_Info)
{
	npc = Stt_311_Fisk;
	condition = Stt_311_Fisk_ARMOR_Condition;
	information = Stt_311_Fisk_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "��� ����� �����-������ ������.";
};


func int Stt_311_Fisk_ARMOR_Condition()
{
	if((FISK_REFUSETRADE == FALSE) && (Kapitel < 2) && ((FISK_ARMOR_L_WAS_BOUGHT != 1) || (FISK_ARMOR_M_WAS_BOUGHT != 1)))
	{
		return TRUE;
	};
};

func void Stt_311_Fisk_ARMOR_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01");	//��� ����� �����-������ ������.
	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02");	//��, �����, � ����� ��������� ���-������ ��� ����.
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
	Info_AddChoice(Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	if(FISK_ARMOR_M_WAS_BOUGHT != 1)
	{
		Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString("����� ��������, ������: 15/0/5/0",VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);
	};
	if(FISK_ARMOR_L_WAS_BOUGHT != 1)
	{
		Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString("������� ����� ��������, ������: 10/0/5/0",VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	};
};

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01");	//� ������ ������� ����� ��������.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_VLK_ARMOR_L)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02");	//�� �� ������� �� ������, ���� �� ������� ����!
	}
	else
	{
		b_printtrademsg1("������ ����: 250");
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_VLK_ARMOR_L);
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03");	//������� �����.
		b_printtrademsg2("�������� ������� ����� ��������.");
		CreateInvItem(self,vlk_armor_l);
		B_GiveInvItems(self,hero,vlk_armor_l,1);
		FISK_ARMOR_L_WAS_BOUGHT = 1;
		if((FISK_ARMOR_M_WAS_BOUGHT == 1) && (FISK_ARMOR_L_WAS_BOUGHT == 1))
		{
			Info_ClearChoices(Stt_311_Fisk_ARMOR);
		};
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01");	//� ������ ����� ��������.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_VLK_ARMOR_M)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02");	//�� �� ������� �� ������, ���� �� ������� ����!
	}
	else
	{
		b_printtrademsg1("������ ����: 500");
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_VLK_ARMOR_M);
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03");	//������� �����.
		b_printtrademsg2("�������� ����� ��������.");
		CreateInvItem(self,vlk_armor_m);
		B_GiveInvItems(self,hero,vlk_armor_m,1);
		FISK_ARMOR_M_WAS_BOUGHT = 1;
		if((FISK_ARMOR_M_WAS_BOUGHT == 1) && (FISK_ARMOR_L_WAS_BOUGHT == 1))
		{
			Info_ClearChoices(Stt_311_Fisk_ARMOR);
		};
	};
};


instance STT_311_FISK_LETMEHELP(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 10;
	condition = stt_311_fisk_letmehelp_condition;
	information = stt_311_fisk_letmehelp_info;
	permanent = 0;
	description = "���������! ���� �����, � ������ ����?";
};


func int stt_311_fisk_letmehelp_condition()
{
	if(Npc_KnowsInfo(hero,Stt_311_Fisk_MordragKO) && (Fisk_GetNewHehler != LOG_RUNNING) && (Fisk_GetNewHehler != LOG_SUCCESS) && (Fisk_GetNewHehler != LOG_FAILED) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void stt_311_fisk_letmehelp_info()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//���������! ���� �����, � ������ ����?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01");	//����� ��� �������? ����� ������ �� ������� ��� ������� ���������� �� ������ ������. ��, �����, ������ � ���� �� ������.
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02");	//��� �� ��� ����� ������ ��������?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03");	//� �� ������ ����, ��� � ���� ������ �� ������. ������ �� ��� ����������!
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_RUNNING);
	B_LogEntry(CH1_FiskNewDealer,"�������� ���� �� ������� ������ �����, ����� � ����� ��� ������ ���������� ������ ��������.");
	Fisk_GetNewHehler = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

