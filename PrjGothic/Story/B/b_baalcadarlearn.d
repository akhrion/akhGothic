
func void b_baalcadarlearn()
{
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	if(Npc_KnowsInfo(hero,gur_1208_baalcadar_teach_pre))
	{
		if(DIFF_HARD == TRUE)
		{
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,(5 * LPCOST_ATTRIBUTE_MANA),OTHERCAMPLEARNPAY * 5),Gur_1208_BaalCadar_Teach_MAN_5);
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),Gur_1208_BaalCadar_Teach_MAN_1);
		}
		else if((hero.guild == GIL_NOV) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
		{
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
		}
		else
		{
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,(5 * LPCOST_ATTRIBUTE_MANA),OTHERCAMPLEARNPAY * 5),Gur_1208_BaalCadar_Teach_MAN_5);
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),Gur_1208_BaalCadar_Teach_MAN_1);
		};
	};
	if(LOG_BAALCADARRUNES == TRUE)
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0)
		{
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0),Gur_1208_BaalCadar_KREIS1);
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
		{
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0),Gur_1208_BaalCadar_KREIS2);
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
		{
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0),Gur_1208_BaalCadar_KREIS3);
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
		{
			Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0),Gur_1208_BaalCadar_KREIS4);
		};
	};
};


instance DIA_BaalCadar_Exit(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 999;
	condition = DIA_BaalCadar_Exit_Condition;
	information = DIA_BaalCadar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

func void DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int BaalCadar_Ansprechbar;
var int BaalCadar_Sakrileg;

instance DIA_BaalCadar_NoTalk(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 2;
	condition = DIA_BaalCadar_NoTalk_Condition;
	information = DIA_BaalCadar_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalCadar_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalCadar_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_BaalCadar_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalCadar_NoTalk);
	Info_AddChoice(DIA_BaalCadar_NoTalk,DIALOG_ENDE,DIA_BaalCadar_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"� ����� ��� ���������, ������?",DIA_BaalCadar_NoTalk_Imp);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"�� �������� � ����� ������!",DIA_BaalCadar_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"������! � ����� ���������!",DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Hi_15_00");	//������! � ����� ���������!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_15_00");	//�� �������� � ����� ������!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_02_01");	//
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_15_00");	//� ����� ��� ���������, ������?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Imp_02_01");	//
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalCadar_SleepSpell(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 1;
	condition = DIA_BaalCadar_SleepSpell_Condition;
	information = DIA_BaalCadar_SleepSpell_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalCadar_SleepSpell_Condition()
{
	var C_Npc Nov1336;
	var C_Npc Nov1340;
	var C_Npc Nov1345;
	Nov1336 = Hlp_GetNpc(NOV_1336_Novize);
	Nov1340 = Hlp_GetNpc(NOV_1340_Novize);
	Nov1345 = Hlp_GetNpc(NOV_1345_Novize);
	if(Npc_IsInState(Nov1336,ZS_MagicSleep) || Npc_IsInState(Nov1340,ZS_MagicSleep) || Npc_IsInState(Nov1345,ZS_MagicSleep))
	{
		return 1;
	};
};

func void DIA_BaalCadar_SleepSpell_Info()
{
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_00");	//��� �� �������? � �������� ������������ ������ � ����� ���������.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_01");	//��� ������ ���� ������������ ���������� ���� �������?
	AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02");	//�����. ��� ���� �� ������� ������.
	AI_Output(self,other,"Gur_1208_BaalCadar_Teach_Info_02_02");	//���� � ����� ������� � ���� ������ ����.
	BaalCadar_Ansprechbar = TRUE;
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
		B_LogEntry(CH1_JoinPsi,"���� ����� ������� ���� ��������� ��������!");
	};
	B_GiveXP(XP_ImpressBaalCadar);
};


instance GUR_1208_BAALCADAR_TEACH_PRE(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = gur_1208_baalcadar_teach_pre_condition;
	information = gur_1208_baalcadar_teach_pre_info;
	permanent = 0;
	description = "� ���� ��������� ���� ���������� ����.";
};


func int gur_1208_baalcadar_teach_pre_condition()
{
	if((BaalCadar_Ansprechbar == TRUE) || (Npc_GetTrueGuild(other) != GIL_None))
	{
		return TRUE;
	};
};

func void gur_1208_baalcadar_teach_pre_info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_Teach_Info_15_01");	//� ���� ��������� ���� ���������� ����.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_03");	//�����, �� ��������� ������������� � ��������. � ���� ����� ����.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"���� ����� ����� ������ ��� ��������� ��� ���������� ����.");
};


instance Gur_1208_BaalCadar_FIRSTTEST(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information = Gur_1208_BaalCadar_FIRSTTEST_Info;
	important = 0;
	permanent = 1;
	description = "����� ���� ������������ ����� ���.";
};


func int Gur_1208_BaalCadar_FIRSTTEST_Condition()
{
	if(((BaalCadar_Ansprechbar == TRUE) || (Npc_GetTrueGuild(other) != GIL_None)) && (LOG_BAALCADARRUNES == FALSE))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_FIRSTTEST_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01");	//����� ���� ������������ ����� ���.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02");	//������ ������� ���� ���, �� ����� �������� ���� ������� ���� �� �����.
	if(C_NpcBelongsToPsiCamp(hero))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03");	//� �������� ������� ����.
		LOG_BAALCADARRUNES = TRUE;
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"���� ����� ����� ��������� ���� � ����� ��� ������ �����.");
	};
};


instance Gur_1208_BaalCadar_Teach(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_Teach_Condition;
	information = Gur_1208_BaalCadar_Teach_Info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int Gur_1208_BaalCadar_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,gur_1208_baalcadar_teach_pre) || (LOG_BAALCADARRUNES == TRUE))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_Teach_Info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//������ ����� ������.
	b_baalcadarlearn();
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
};

func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	if(((hero.guild == GIL_NOV) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)) && (DIFF_HARD == FALSE))
	{
		B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_MANA_MAX] < 100))
		{
			b_printtrademsg1("������ ����: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	}
	else
	{
		AI_Output(self,other,"SVM_2_ShitNoOre");	//���, ���������� �������, ��������? ������ ��� ����?
	};
	b_baalcadarlearn();
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	if(((hero.guild == GIL_NOV) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)) && (DIFF_HARD == FALSE))
	{
		B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_MANA_MAX] < 96))
		{
			b_printtrademsg1("������ ����: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	}
	else
	{
		AI_Output(self,other,"SVM_2_ShitNoOre");	//���, ���������� �������, ��������? ������ ��� ����?
	};
	b_baalcadarlearn();
};

func void Gur_1208_BaalCadar_KREIS1()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS1_Info_15_01");	//� ����� �������� ������� ������� �����.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_02");	//��� ������ �� ����.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_03");	//� ������� ������� �������� ������, � ������ �� ���� ������������� �������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_04");	//����� ��������� ������������, � ������ ������� ������� �� ������� ��� ���.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_05");	//���� ������� � � ��� ��������� ��������� ���������� �� ������ ����� � �������� ��������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_06");	//� ��� ������, ����� ��� ����������� ���� �������, ��� ������ ������ ����. ����� ��� ��������� ����, ��� ���� �� ������.
	};
	b_baalcadarlearn();
};

func void Gur_1208_BaalCadar_KREIS2()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS2_Info_15_01");	//� ����� � ���������� �� ������ ����.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_02");	//��� ������ �� ���� � ���������� ������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_03");	//������ ������ �������� � ��� ������ �������� � ��� �����, ��� ��� �������� ����.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_04");	//��� ���������, �� �������� ���, ���� �� ����, ������ �� �������, ����� �� �������. ������ ���. ��� ������ � ������ ����� �������������� � ����, ������ ���� �������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_05");	//������ ��� �������� �������� �� ������ �� �������� ������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_06");	//��� ��� ������ ������ ����.
	};
	b_baalcadarlearn();
};

func void Gur_1208_BaalCadar_KREIS3()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS3_Info_15_01");	//� ����� �������� ������ �������� �����.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_02");	//�������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_03");	//������� �����������, �� �������� ���� �������� ���� ������������ ��� ����, ����� �������� �������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_04");	//������� ����� ���� �� ����, �������. �� ���������� ������� �� ����� ��������. ������ ������ ��� ����� ��������, � ������� �� ���� ������������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_05");	//� �� ����� ����� �� ������ ������� ��������� ����������, ���� ����� ����� ������� � ������� ��������� � �������� ����.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_06");	//��� ��� �������� ������ ����.
	};
	b_baalcadarlearn();
};

func void Gur_1208_BaalCadar_KREIS4()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS4_Info_15_01");	//� ����� �������� � ��������� ����.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_02");	//����� ���� ������ �� ������� ��������� ������. ������ ����������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_03");	//���� ����� �����, ���������������� � ������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_04");	//�� �� ������ ���� ����. �� �� �������� ������� �������� �������.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_05");	//��������� � ��������������� ���� �������� ��������� ����.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_06");	//������ ���� ������� ��� ������ ������� � �����. �� ��� ������� ��������.
	};
	b_baalcadarlearn();
};


instance Gur_1208_BaalCadar_SELLSTUFF(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information = Gur_1208_BaalCadar_SELLSTUFF_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int Gur_1208_BaalCadar_SELLSTUFF_Condition()
{
	if((BaalCadar_Ansprechbar == TRUE) || (Npc_GetTrueGuild(other) != GIL_None))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if(log_baalcadarsell == FALSE)
	{
		Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
		B_LogEntry(GE_TraderPSI,"���� ���� ����� ������� ����, ������, �����, ������� � ������.");
		log_baalcadarsell = TRUE;
	};
	AI_Output(other,self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01");	//� ���� ���������� ���������� ������.
};

