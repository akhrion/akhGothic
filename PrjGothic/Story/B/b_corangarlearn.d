
func void b_corangarlearn()
{
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,(5 * LPCOST_ATTRIBUTE_STRENGTH),OTHERCAMPLEARNPAY * 5),GUR_1202_CorAngar_Teach_STR_5);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),GUR_1202_CorAngar_Teach_STR_1);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,(5 * LPCOST_ATTRIBUTE_DEXTERITY),OTHERCAMPLEARNPAY * 5),GUR_1202_CorAngar_Teach_DEX_5);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),GUR_1202_CorAngar_Teach_DEX_1);
	}
	else
	{
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1)
	{
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0),GUR_1202_CorAngar_ZWEIHAND1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1)
	{
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0),GUR_1202_CorAngar_ZWEIHAND2);
	};
};


instance DIA_GUR_1202_CorAngar_Exit(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 999;
	condition = DIA_GUR_1202_CorAngar_Exit_Condition;
	information = DIA_GUR_1202_CorAngar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

func void DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CorAngar_LaterTrainer(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 6;
	condition = DIA_CorAngar_LaterTrainer_Condition;
	information = DIA_CorAngar_LaterTrainer_Info;
	permanent = 0;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_CorAngar_LaterTrainer_Condition()
{
	if(Npc_GetTrueGuild(hero) != GIL_TPL)
	{
		return 1;
	};
};

func void DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//������ ����� ������� ������? ��, ���� ������������� ����� ����� �������� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02");	//������. ��, � ���������, � �� ���, ��� ������ ������ ����.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03");	//� ������ ���� ���, ��� ������ � ��������� ���� �������.
};


instance DIA_CORANGAR_LATERTRAINER2(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 6;
	condition = dia_corangar_latertrainer2_condition;
	information = dia_corangar_latertrainer2_info;
	permanent = 0;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_corangar_latertrainer2_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return 1;
	};
};

func void dia_corangar_latertrainer2_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//������ ����� ������� ������? ��, ���� ������������� ����� ����� �������� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02");	//����� �������� �������� ��� � ��������� �����, ����� ������������ ���� � ��������.
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01");	//�������� � ���� - ����� ������ �������������� �����.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"��� ����� ����� ������ ��� ��������� ���� � ��������. � ����� ����� ��� �� ������������� �������� �������, �� ������ ������.");
	B_LogEntry(GE_TeacherPSI,"��� ����� ����� ������� ���� ���������� � ��������� �����. �� ��� ���������� ����� ����, ��� � ����� ��� � ���������� �������.");
};


instance DIA_CorAngar_WieTempler(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 7;
	condition = DIA_CorAngar_WieTempler_Condition;
	information = DIA_CorAngar_WieTempler_Info;
	permanent = 1;
	description = "��� ��� ����� ����� �� �������?";
};


func int DIA_CorAngar_WieTempler_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00");	//��� ��� ����� ����� �� �������?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01");	//��� ����� ���� ����� �������� ���� � ������� � ����������� ���, ���� �����������.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02");	//����� ����� ������� �� ���, � � ���� ����� ����.
	AI_StopProcessInfos(self);
};


instance GUR_1202_CorAngar_Teach(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 10;
	condition = GUR_1202_CorAngar_Teach_Condition;
	information = GUR_1202_CorAngar_Teach_Info;
	permanent = 1;
	description = "��� � ���� ��������� ���� � ��������?";
};


func int GUR_1202_CorAngar_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer2) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00");	//��� � ���� ��������� ���� � ��������?
	b_corangarlearn();
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_STRENGTH] < 100))
		{
			b_printtrademsg1("������ ����: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//�� ��� ����������!
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_STRENGTH] < 96))
		{
			b_printtrademsg1("������ ����: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//�� ��� ����������!
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_DEXTERITY] < 100))
		{
			b_printtrademsg1("������ ����: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//�� ��� ����������!
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_DEXTERITY] < 96))
		{
			b_printtrademsg1("������ ����: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//�� ��� ����������!
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_ZWEIHAND1()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01");	//����� ���� ����� ��� ��������� �����.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		AI_Output(self,other,"SVM_8_NoLearnYouAlreadyKnow");	//������� �� ������ ������� ������ � ������ ����� ���������� � ����� ������� �����.
		PrintScreen("��������� ���������� ����������� ������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03");	//�� ���������� � ����� ������� ������ �����, ����� ������� ��������� �� ������ ����� �����, �� � �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04");	//������ ��� ������� ����������, ������� ���� ���� � ���, �� ������� ���������� � �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05");	//���� � ����� - ������ ���������������. � ��� ���� � ��� ���������� ������ �����.
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_ZWEIHAND2()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");	//� ���� ��������� ��� ����� ���������� � ��������� �����.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02");	//�� ��� ������ ������ �������� ���� �������. ������ � ����� ���� �������, ��������� �������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03");	//���� ������ ���� ������� ���� ������������� �������� ���������� �� ����, ��� �� ������� ����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04");	//���� �� ������ ������� ����������, �� ������ ��� ���������� � ����� �����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05");	//�������� - ���� ������������. ��������, ����� �������� ���� �������� � ������������, � ����� - ������� � ��������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06");	//����� �� �������� �������� �� ����. ����� ����� ����� �������� �� ����� ���� ����.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07");	//�������� ����������� ����. �� ������� �������� ����������, ���� ������ ���� � ��� ��������� � ���������������.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08");	//��������� ���� ���� ��������� � �����: ���� ����� �����, ���� �� ��� ���� �������� ��������.
	};
	b_corangarlearn();
};


instance GUR_1202_CorAngar_WANNABETPL(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 5;
	condition = GUR_1202_CorAngar_WANNABETPL_Condition;
	information = GUR_1202_CorAngar_WANNABETPL_Info;
	important = 0;
	permanent = 1;
	description = "� ���� ����� �������!";
};


func int GUR_1202_CorAngar_WANNABETPL_Condition()
{
	if((Npc_KnowsInfo(hero,Tpl_1400_GorNaBar_VICTORY) || Npc_KnowsInfo(hero,Tpl_1415_Torwache_TEMPLERAUFNAHME) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01");	//� ���� ����� �������!
	if(CorKalom_BringMCQBalls != LOG_SUCCESS)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//�� ��� � ����� �� �����. � ����� ������� ������ �����, ����� � ���� ����� ������ �����.
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//�� ��� � ����� �� �����. � ����� ������� ������ �����, ����� � ���� ����� ������ �����.
		B_PrintGuildCondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03");	//���� ����� ������, �� ������ �������������� � ���.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04");	//�� ������ �����, ��� ����� �� ������ �������� ������ � ������� ����. �� ��������� ������ �������, ������ ����.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05");	//�� � ������ ���� ���������� ���� ���� � ���� ����. ��������� ������� ����� ����� ������ ���, ��� ���� � ��� ��������� � ��������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06");	//� ���, ��� �� ������� ����� ������� �����������, �������� �� ��� ��� ���� �������. �� ����� ���� �������� � ���� �������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//�������, ����� ���� ��� ����� � ���� ��������, �� ������ �������� ����� ������.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08");	//����� � ��� �� ���� �� ������������� ��������. �� ���� ���� ���� ����� �������.
		Npc_SetTrueGuild(hero,GIL_TPL);
		hero.guild = GIL_TPL;
		Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
		B_LogEntry(GE_BecomeTemplar,"������� ��� ����� �������� ���� �������. � ����� ����� ���� ����� ������ � ��� �� ����. ������ �� ����� �� ������������� ��������.");
	};
};


instance GUR_1202_CorAngar_SENDS(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_SENDS_Condition;
	information = GUR_1202_CorAngar_SENDS_Info;
	important = 0;
	permanent = 0;
	description = "��� �� ��� ������ ������?";
};


func int GUR_1202_CorAngar_SENDS_Condition()
{
	if((Kapitel == 3) && (CorAngar_GotoOGY == FALSE))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01");	//��� �� ��� ������ ������?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02");	//���� ������� ���� ����� �������. ��� �������� ��� ������ ��������, ��� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03");	//�� ���� ����� ����: �� ������ ���� � ������ ������. �������� ������ ���� ����������� ���� �����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04");	//������ ���� �������� ��� �������, ������� ��� ����� ���������� � ��� ��������� �����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05");	//���� ���� ����� ���� � ����� ���������� ������� � ���������� ����. ����� ����, ��� �� ������ ��, ��� �������� ������� �� ���� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06");	//��� ����� �������, ������� ������ ����� � ���, � ����� ��������� �� ��� � ���������� � ���, ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07");	//������ �� �� ������ ����� ���� ���? �� �� ������������ �������!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08");	//��� ������ - �������� �������������. � �������� ����� � ��������� � ���� �������� ���.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09");	//�� ��� ������ �������� ������ ������. � ������� ���� ������, ��� ���� ��-�� �� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10");	//������� � ����� ����, ����������� �� �������� ����� � �������� ���, ��� ������� ����� ����� �������.
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"� ��� � �� ��� ������?",GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"� ������ �� ����� ����!",GUR_1202_CorAngar_SENDS_KNOW);
};

func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01");	//� ��� � �� ��� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02");	//���� ����� ����? ��������, � ������ � ����. �� ��� ��� ����� ����� ���� ������. ��� ��� ������ ����. ������ � ���� ���!
	b_printtrademsg1("�������� ����: 100");
	CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,hero,ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01");	//� ������ �� ����� ����!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02");	//������ ��� ��� ������. ��� ������ �������� ���� � �����!
	b_printtrademsg1("�������� ������ ���������� ����.");
	B_Story_GotoOrcGraveyard();
	CreateInvItem(self,Schutzring_Geschosse1);
	B_GiveInvItems(self,hero,Schutzring_Geschosse1,1);
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
};


instance GUR_1202_CorAngar_WHERE(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_WHERE_Condition;
	information = GUR_1202_CorAngar_WHERE_Info;
	important = 0;
	permanent = 0;
	description = "��� ��������� �������� �����?";
};


func int GUR_1202_CorAngar_WHERE_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_SENDS) && (BaalLukor_BringParchment == 0))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01");	//��� ��������� �������� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02");	//��� ��������. ��������� ����� ����� ������. �� ������� ����� ��� �� ������� ����� ������. �� ������ ���� ����.
	B_LogEntry(CH3_OrcGraveyard,"��������� ����� ������ �������� ��� ������ �� �������� �����. �� ���� ���� �� ������� ����� ������.");
};


instance GUR_1202_CorAngar_AFTER(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_AFTER_Condition;
	information = GUR_1202_CorAngar_AFTER_Info;
	important = 0;
	permanent = 0;
	description = "� ��� �� �������� �����. �� �� ������ ��� ������ �����...";
};


func int GUR_1202_CorAngar_AFTER_Condition()
{
	if(BaalLukor_BringParchment == 4)
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_AFTER_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01");	//� ��� �� �������� �����. �� �� ������ ��� ������ �����. ������� ������, ����������� �� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02");	//� ��� � ������ ������� � ��������?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03");	//��� ��� ������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04");	//������? �� ������, ��� ���� ����� ��?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05");	//� ������� ����� ����� �����. ��� ��� ����� ���� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06");	//���� ����� ���� �������� �� ���, ��, � ���������, �� ����� � ���.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07");	//�� ���� �������, ��� ������ �������� ��� ����� ����, � ��������� ��������� ���� ������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08");	//��������, ��� �� ��������� ��-�� �������� �������������. �� ��� ����� ����� ���-������ ���.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09");	//� �� ����, ��� ��� �������� ��� ������ ����� �������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10");	//������ �� �����... ����������... �������!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11");	//�������, ��� ���� ����� �� ���� ����������� ���� ���������.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12");	//������ ��� ���� ������� �� ��������.
	B_GiveXP(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};


var int yberion_day;

instance Info_CorAngar_FindHerb(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_FindHerb_Condition;
	information = Info_CorAngar_FindHerb_Info;
	permanent = 0;
	important = 0;
	description = "��� ���� � ��������?";
};


func int Info_CorAngar_FindHerb_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_AFTER))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Info()
{
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01");	//��� ���� � ��������?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02");	//��� �� �� ������ ����������. �� ������ �������. � ����, ��� ����� ��� ���������, �� ��� ����� ��� ����� ���� ������.
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//��� � ���� ��� ������?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04");	//����� ��� �������� �������� �����. ������� ��� ���� ����� ����������� �� ���.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//����� ����, ������� ������ ���� ������? �� �� �������.
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05");	//�, ����������, ����������!
	AI_StopProcessInfos(self);
	CorAngar_FindHerb = LOG_RUNNING;
	Log_CreateTopic(CH3_FindHerbs,LOG_MISSION);
	Log_SetTopicStatus(CH3_FindHerbs,LOG_RUNNING);
	B_LogEntry(CH3_FindHerbs,"������� ��� ��� ��� ��������. ��� ����� �������� ���� ����� ��� ���� ���� ������ ����� ������� �������� ����. �� ������� �� ���..?");
	YBERION_DAY = Wld_GetDay();
};


instance Info_CorAngar_FindHerb_WHERE(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_WHERE_Condition;
	information = Info_CorAngar_FindHerb_WHERE_Info;
	permanent = 0;
	important = 0;
	description = "� ��� ������ ��� �����?";
};


func int Info_CorAngar_FindHerb_WHERE_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01");	//� ��� ������ ��� �����?
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02");	//����� � ������� �� �������. ��� ������ ���������� ������ ������, �� ���� ���������, ��� ���� ����� ��������� ����������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03");	//�� ����� ������ �������. ��� ��!
	AI_StopProcessInfos(self);
	B_LogEntry(CH3_FindHerbs,"��� ����� � ����� ����� ������ �� ������� �� ������� ��������. ��� ������� ������� ����������. � ������ ���� ����� ���������.");
};


instance Info_CorAngar_FindHerb_LOOK(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_LOOK_Condition;
	information = Info_CorAngar_FindHerb_LOOK_Info;
	permanent = 0;
	important = 0;
	description = "��� ��� ������ �� �����, ������� ������� ��������?";
};


func int Info_CorAngar_FindHerb_LOOK_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//��� ��� ������ �� �����, ������� ������� ��������?
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02");	//��� ������ �� ������ �� ������ ������� � ��������� �����-�������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03");	//� ������ ���.
	AI_StopProcessInfos(self);
	B_LogEntry(CH3_FindHerbs,"�������� ����� ������ �� ������ �� ������� ������� � ������� ��������� �������.");
};


instance Info_CorAngar_FindHerb_Running(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_Running_Condition;
	information = Info_CorAngar_FindHerb_Running_Info;
	permanent = 1;
	important = 0;
	description = "��� ����, ������� � �����, ����� ������������.";
};


func int Info_CorAngar_FindHerb_Running_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5) && (Npc_HasItems(other,ItFo_Plants_Herb_03) > 0) && Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE) && Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Running_Info()
{
	var C_Npc fortuno;
	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");	//��� ����, ������� � �����, ����� ������������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//����� ����, ������� ������ ���� ������? �� �� �������.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");	//���� ����� ����������. ������� ���� ������. ������� �� ����� ����� �� ������.
	AI_StopProcessInfos(self);
	if(!Fortuno_HasYBerionHerbs)
	{
		fortuno = Hlp_GetNpc(NOV_1357_Fortuno);
		CreateInvItems(fortuno,ItFo_Plants_Herb_03,5);
		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry(CH3_FindHerbs,"����� ����� ����� ���� ��������� � �������.");
	};
};


instance Info_CorAngar_FindHerb_Success(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_Success_Condition;
	information = Info_CorAngar_FindHerb_Success_Info;
	permanent = 0;
	important = 0;
	description = "(������ �������� �����)";
};


func int Info_CorAngar_FindHerb_Success_Condition()
{
	if((Npc_HasItems(other,ItFo_Plants_Herb_03) >= 5) && (CorAngar_FindHerb == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void Info_CorAngar_FindHerb_Success_Info()
{
	var C_Npc YBerion;
	var C_Npc angar;
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	angar = Hlp_GetNpc(GUR_1202_CorAngar);
	B_GiveInvItems(other,self,ItFo_Plants_Herb_03,5);
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_01");	//� ����� �������� ����� ��� ��������.
	b_printtrademsg1("������ 5 �������� ������.");
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02");	//�������. ����� �� ������, ������� ������� ���������.
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//�� ���-������ ������?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//��, �� ������, ��� ������ �� ����� ���� �� �������� ���, ��� �� � ��� ������. �� �� ������ �������� ��������� ���.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//������ ��� �������� ��������� �� ��, ��� �������� ����� ��������.
	Yberion_dead = LOG_RUNNING;
	B_GiveXP(XP_FindHerbs);
	B_LogEntry(CH3_FindHerbs,"� ������� ��� ������ �������� �����, �� ��� �� ������� ��������... ����� �������� ����...");
	CorAngar_FindHerb = LOG_FAILED;
	Log_SetTopicStatus(CH3_FindHerbs,LOG_FAILED);
	YBERION_DIED = TRUE;
	AI_Wait(self,0.5);
	AI_GotoWP(self,"PSI_TEMPLE_ROOMS_IN_02");
	AI_SetWalkMode(self,NPC_RUN);
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,YBerion);
	YBerion.flags = 0;
	Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,-YBerion.attribute[ATR_HITPOINTS_MAX]);
	AI_UseItemToState(self,ItFo_Plants_Herb_03,0);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//������� ����. ��� �������� ������� ������� ���!
	AI_UseItemToState(self,ItFo_Plants_Herb_03,-1);
	AI_TurnToNPC(self,other);
	AI_TurnToNPC(other,self);
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01");	//���� ���� ������ �� ������ ��������� �� ���� ������!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//��� �� ������ �����, ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//� ������ ������� ��������. ����� ������� �� ������ ���, ��� ������ ��� �������� ��������� ������ �� ����� ����.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//������, ��� ����� ������ ����� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//��, �� ����� ����� ������ � ��������. � ��, � ������ ��������� � ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//� ��� ������ ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07");	//����� ���� �������� �� ������ ����������� � ���������� ��� ������ ���� � �������, ���� � ����� ���������� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//��� �� �� ������ ������ ������� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//� �����, �� ������� ������ � ����� � ����� �����������. ��� ���� ���� �� ��� �������.
	b_printtrademsg2("������� ���� �� �����������.");
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,Stab_des_Lichts);
	if(YBERION_KEY_STOLEN == FALSE)
	{
		CreateInvItem(self,itke_yberion);
	};
	CreateInvItem(self,itke_psi_kalom_01);
	B_GiveInvItems(self,other,itke_psi_kalom_01,1);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	if(C_NpcBelongsToPsiCamp(hero))
	{
		B_LogEntry(CH3_EscapePlanNC,"���� �������, �������� ���� ��������! �� ��������� �� � �����! ����� ������� �� ������� ���� ����: ������ ������ ������ ����� ���� ����������� �� ����. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������, ��� �������� ����� ����������� ����� ����.");
	}
	else
	{
		B_LogEntry(CH3_EscapePlanNC,"� ������������ ����� ����� � ����� ������, ����� ������ ����� ���� ��������� ������. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������ ��� �������� ����� ����������� ����� ����. ");
	};
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		BaalOrun_FetchWeed = LOG_FAILED;
		B_LogEntry(CH1_DeliverWeed,"��� ����� ������� ������, � �� ����� ������ ��� ������ ���������.");
		Log_SetTopicStatus(CH1_DeliverWeed,LOG_FAILED);
	};
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		Kalom_Krautbote = LOG_FAILED;
		B_LogEntry(CH1_KrautBote,"��� ����� ������, ������ � �� ����� ������ ��� ���� �� ��������.");
		Log_SetTopicStatus(CH1_KrautBote,LOG_FAILED);
	};
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		Kalom_DrugMonopol = LOG_FAILED;
		B_LogEntry(CH1_DrugMonopol,"� �� ����� �������� ������� �� ���������� �����������, ��� ����� ���� �� ������.");
		Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	};
	CorAngar_SendToNC = TRUE;
};


instance Info_CorAngar_TELEPORT(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_TELEPORT_Condition;
	information = Info_CorAngar_TELEPORT_Info;
	permanent = 0;
	important = 1;
};


func int Info_CorAngar_TELEPORT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success) || Npc_KnowsInfo(hero,info_corangar_yberion_died) || Npc_KnowsInfo(hero,info_corangar_healthwater))
	{
		return TRUE;
	};
};

func void Info_CorAngar_TELEPORT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//�������!
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02");	//� ��� ����?
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//������ ��� ���� � ���� ����� ������������� �� ���� ������.
	b_printtrademsg1("�������� ���� ������������ � �������� ������.");
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04");	//��� ���� ���� ����������� ������ ����������� �� ������� ����� ����� ������.
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//������� ����!
	if(YBERION_DIED == TRUE)
	{
		Npc_ExchangeRoutine(self,"AFTER");
		B_ExchangeRoutine(Gur_1207_Natalia,"AFTER");
		B_ExchangeRoutine(Gur_1205_Chani,"AFTER");
	}
	else if(YBERION_HEALED == TRUE)
	{
		Npc_ExchangeRoutine(self,"guru");
	};
	B_Story_SentToNC();
};


instance CORANGAR_STEALKEY(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 990;
	condition = corangar_stealkey_condition;
	information = corangar_stealkey_info;
	important = 0;
	permanent = 0;
	description = "(������� ����)";
};


func int corangar_stealkey_condition()
{
	if(Npc_HasItems(self,itke_yberion) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1))
	{
		return TRUE;
	};
};

func void corangar_stealkey_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01");	//���� �����-������ ������ ������ ����� �� ��������?
	AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//�������, ����� ���� ��� ����� � ���� ��������, �� ������ �������� ����� ������.
	AI_DrawWeapon(self);
	AI_PlayAni(other,"T_STAND_2_IGET");
	AI_PlayAni(other,"T_IGET_2_STAND");
	AI_PlayAni(self,"T_1HSFREE");
	AI_RemoveWeapon(self);
	PrintScreen("������� ����.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,itke_yberion);
	Npc_RemoveInvItem(self,itke_yberion);
	AI_StopProcessInfos(self);
};


instance INFO_CORANGAR_YBERION_DIED(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = info_corangar_yberion_died_condition;
	information = info_corangar_yberion_died_info;
	permanent = 0;
	important = 1;
};


func int info_corangar_yberion_died_condition()
{
	if((YBERION_DAY <= (Wld_GetDay() - 2)) && (CorAngar_FindHerb == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_corangar_yberion_died_info()
{
	var C_Npc YBerion;
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	YBerion.flags = 0;
	Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,-YBerion.attribute[ATR_HITPOINTS_MAX]);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,Stab_des_Lichts);
	CreateInvItem(self,itke_yberion);
	CreateInvItem(self,itke_psi_kalom_01);
	B_GiveInvItems(self,other,itke_psi_kalom_01,1);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	if(C_NpcBelongsToPsiCamp(hero))
	{
		B_LogEntry(CH3_EscapePlanNC,"���� �������, �������� ���� ��������! �� ��������� �� � �����! ����� ������� �� ������� ���� ����: ������ ������ ������ ����� ���� ����������� �� ����. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������, ��� �������� ����� ����������� ����� ����.");
	}
	else
	{
		B_LogEntry(CH3_EscapePlanNC,"� ������������ ����� ����� � ����� ������, ����� ������ ����� ���� ��������� ������. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������ ��� �������� ����� ����������� ����� ����. ");
	};
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		BaalOrun_FetchWeed = LOG_FAILED;
		B_LogEntry(CH1_DeliverWeed,"��� ����� ������� ������, � �� ����� ������ ��� ������ ���������.");
		Log_SetTopicStatus(CH1_DeliverWeed,LOG_FAILED);
	};
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		Kalom_Krautbote = LOG_FAILED;
		B_LogEntry(CH1_KrautBote,"��� ����� ������, ������ � �� ����� ������ ��� ���� �� ��������.");
		Log_SetTopicStatus(CH1_KrautBote,LOG_FAILED);
	};
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		Kalom_DrugMonopol = LOG_FAILED;
		B_LogEntry(CH1_DrugMonopol,"� �� ����� �������� ������� �� ���������� �����������, ��� ����� ���� �� ������.");
		Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	};
	CorAngar_SendToNC = TRUE;
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//������� ����. ��� �������� ������� ������� ���!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//��� �� ������ �����, ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//� ������ ������� ��������. ����� ������� �� ������ ���, ��� ������ ��� �������� ��������� ������ �� ����� ����.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//������, ��� ����� ������ ����� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//��, �� ����� ����� ������ � ��������. � ��, � ������ ��������� � ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//� ��� ������ ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07_New");	//���������� ��� ������ ���� � �������, ���� � ����� ���������� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//��� �� �� ������ ������ ������� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//� �����, �� ������� ������ � ����� � ����� �����������. ��� ���� ���� �� ��� �������.
	b_printtrademsg1("������� ���� �� �����������.");
	B_LogEntry(CH3_FindHerbs,"� �� ����� �������� �������� �������� �����... ����� �������� ����...");
	CorAngar_FindHerb = LOG_FAILED;
	Log_SetTopicStatus(CH3_FindHerbs,LOG_FAILED);
	YBERION_DIED = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_CORANGAR_HEALTHWATER(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 2;
	condition = info_corangar_healthwater_condition;
	information = info_corangar_healthwater_info;
	permanent = 0;
	important = 0;
	description = "(������ ����� �������)";
};


func int info_corangar_healthwater_condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && Npc_HasItems(other,HealthWater))
	{
		return 1;
	};
};

func void info_corangar_healthwater_info()
{
	var C_Npc YBerion;
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,Stab_des_Lichts);
	CreateInvItem(self,itke_yberion);
	CreateInvItem(self,itke_psi_kalom_01);
	B_GiveInvItems(self,other,itke_psi_kalom_01,1);
	B_GiveInvItems(other,self,HealthWater,1);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	B_GiveXP(2000);
	if(C_NpcBelongsToPsiCamp(hero))
	{
		B_LogEntry(CH3_EscapePlanNC,"������� ��������� ������� � ������� ���� ����: ������ ������ ������ ����� ���� ����������� �� ����. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������, ��� �������� ����� ����������� ����� ����.");
	}
	else
	{
		B_LogEntry(CH3_EscapePlanNC,"� ������������ ����� ����� � ����� ������, ����� ������ ����� ���� ��������� ������. ��� ����� ������� ��� ���� �� ������� �� ����������� ��� ������. � ��� ��������� �������� � ������, ������� � �������� ��� ��������. �� ������ ��� ������, ��� �������� ����� ����������� ����� ����.");
	};
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		BaalOrun_FetchWeed = LOG_FAILED;
		B_LogEntry(CH1_DeliverWeed,"��� ����� ������� ������, � �� ����� ������ ��� ������ ���������.");
		Log_SetTopicStatus(CH1_DeliverWeed,LOG_FAILED);
	};
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		Kalom_Krautbote = LOG_FAILED;
		B_LogEntry(CH1_KrautBote,"��� ����� ������, ������ � �� ����� ������ ��� ���� �� ��������.");
		Log_SetTopicStatus(CH1_KrautBote,LOG_FAILED);
	};
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		Kalom_DrugMonopol = LOG_FAILED;
		B_LogEntry(CH1_DrugMonopol,"� �� ����� �������� ������� �� ���������� �����������, ��� ����� ���� �� ������.");
		Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	};
	CorAngar_SendToNC = TRUE;
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01_New");	//���, ����� ����, ��� �������.
	b_printtrademsg1("������ �������� ����� �������.");
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//������ ��� �������� ��������� �� ��, ��� �������� ����� ��������.
	AI_Wait(self,0.5);
	AI_GotoWP(self,"PSI_TEMPLE_ROOMS_IN_02");
	AI_SetWalkMode(self,NPC_RUN);
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,YBerion);
	AI_UseItemToState(self,HealthWater,0);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Wait(self,3);
	AI_UseItemToState(self,HealthWater,-1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02_New");	//�������. ������� ������� ���������.
	AI_TurnToNPC(other,self);
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//�� ���-������ ������?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//��, �� ������, ��� ������ �� ����� ���� �� �������� ���, ��� �� � ��� ������. �� �� ������ �������� ��������� ���.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//��� �� ������ �����, ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03_New");	//� ������ ������� ��������. �� ������ ���, ��� ������ ��� �������� ��������� ������ �� ����� ����.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//������, ��� ����� ������ ����� ����.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//��, �� ����� ����� ������ � ��������. � ��, � ������ ��������� � ��� ������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//� ��� ������ ��� �����?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07_New");	//���������� ��� ������ ���� � �������, ���� � ����� ���������� �������.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//��� �� �� ������ ������ ������� ������?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//� �����, �� ������� ������ � ����� � ����� �����������. ��� ���� ���� �� ��� �������.
	b_printtrademsg2("������� ���� �� �����������.");
	B_LogEntry(CH3_FindHerbs,"����� ������� ���������! ������� ������ � ���� � ����� ������� ���������� � ��� �������, ������ ��� ������� ��������. �� ��� ��� ����, �� ��� �� ��� ������. �������, �� ����������.");
	CorAngar_FindHerb = LOG_SUCCESS;
	Log_SetTopicStatus(CH3_FindHerbs,LOG_SUCCESS);
	YBERION_HEALED = TRUE;
	AI_StopProcessInfos(self);
};

