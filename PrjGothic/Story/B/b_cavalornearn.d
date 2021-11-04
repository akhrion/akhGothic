
func void b_cavalornearn()
{
	Info_ClearChoices(dia_cavalorn_learn);
	Info_AddChoice(dia_cavalorn_learn,DIALOG_BACK,dia_cavalorn_learn_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1)
	{
		if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel >= 4))
		{
			Info_AddChoice(dia_cavalorn_learn,B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,0),DIA_cavalorn_Lehrer_Bow_2);
		}
		else
		{
			Info_AddChoice(dia_cavalorn_learn,B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,100),DIA_cavalorn_Lehrer_Bow_2);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0)
	{
		if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel >= 4))
		{
			Info_AddChoice(dia_cavalorn_learn,B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,0),DIA_cavalorn_Lehrer_Bow);
		}
		else
		{
			Info_AddChoice(dia_cavalorn_learn,B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50),DIA_cavalorn_Lehrer_Bow);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel >= 4))
		{
			Info_AddChoice(dia_cavalorn_learn,B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,0),DIA_cavalorn_Lehrer_Schleichen);
		}
		else
		{
			Info_AddChoice(dia_cavalorn_learn,B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,50),DIA_cavalorn_Lehrer_Schleichen);
		};
	};
};


instance DIA_Cavalorn_Exit(C_Info)
{
	npc = STT_336_Cavalorn;
	nr = 999;
	condition = DIA_Cavalorn_Exit_Condition;
	information = DIA_Cavalorn_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

func void DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_cavalorn_Hunter(C_Info)
{
	npc = STT_336_Cavalorn;
	nr = 2;
	condition = DIA_cavalorn_Hunter_Condition;
	information = DIA_cavalorn_Hunter_Info;
	permanent = 0;
	description = "��� �� �����������?";
};


func int DIA_cavalorn_Hunter_Condition()
{
	return 1;
};

func void DIA_cavalorn_Hunter_Info()
{
	AI_Output(other,self,"DIA_cavalorn_Hunter_15_00");	//��� �� �����������?
	AI_Output(self,other,"DIA_cavalorn_Hunter_12_01");	//� �������. ����� � ������� �� �����������.
};


instance DIA_cavalorn_Lehrer(C_Info)
{
	npc = STT_336_Cavalorn;
	nr = 2;
	condition = DIA_cavalorn_Lehrer_Condition;
	information = DIA_cavalorn_Lehrer_Info;
	permanent = 0;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_cavalorn_Lehrer_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_cavalorn_Hunter))
	{
		return 1;
	};
};

func void DIA_cavalorn_Lehrer_Info()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_cavalorn_Lehrer_12_01_00");	//�������� �� ���� � ���-����� ��������� ������.
	LOG_CAVALORNTRAIN_BOW = TRUE;
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"�������� - �������. � ���� ��������� � ���� �������� �� ����. �� ����� � ���� ����� ������ � ����� ��������.");
	if(LOG_CAVALORNTRAIN_SNEAK == FALSE)
	{
		Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
		B_LogEntry(GE_TeacherOW,"����� �������� ����� ������� ���� ��������������.");
		LOG_CAVALORNTRAIN_SNEAK = TRUE;
	};
};


instance DIA_CAVALORN_LEARN(C_Info)
{
	npc = STT_336_Cavalorn;
	nr = 2;
	condition = dia_cavalorn_learn_condition;
	information = dia_cavalorn_learn_info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int dia_cavalorn_learn_condition()
{
	if(LOG_CAVALORNTRAIN_BOW == TRUE)
	{
		return 1;
	};
};

func void dia_cavalorn_learn_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//������ ����� ������.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1))
	{
		AI_Output(self,other,"SVM_12_NoLearnYoureBetter");	//������ �� ������� �����!
		LOG_CAVALORNTRAIN_BOW = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_cavalorn_Lehrer_12_01");	//� ���� �� �� ����� ���������?
		b_cavalornearn();
	};
};

func void dia_cavalorn_learn_back()
{
	Info_ClearChoices(dia_cavalorn_learn);
};

func void DIA_cavalorn_Lehrer_Bow()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00");	//����� ���� �������� �� ����.
	if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel >= 4))
	{
		if(B_GiveSkill(other,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01");	//����������� ����� �������� ���������������� ���� ����������. ������� ����� - ��������� ����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02");	//���� ������ ���� ������ �����������, ���� �� ����� �����, ���� � - �������!
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03");	//������, ����� ����� ������, ���������� ��������� ������ � �������� ����� �� ����. � ������� �� ��� �� ����� ������ ����� ��� �����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04");	//�� ���� �� ������ ��������� ���� �������, ���� �������� ����� ����� �������.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(hero.lp >= LPCOST_TALENT_BOW_1)
		{
			b_printtrademsg1("������ ����: 50");
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
		if(B_GiveSkill(other,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01");	//����������� ����� �������� ���������������� ���� ����������. ������� ����� - ��������� ����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02");	//���� ������ ���� ������ �����������, ���� �� ����� �����, ���� � - �������!
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03");	//������, ����� ����� ������, ���������� ��������� ������ � �������� ����� �� ����. � ������� �� ��� �� ����� ������ ����� ��� �����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04");	//�� ���� �� ������ ��������� ���� �������, ���� �������� ����� ����� �������.
		};
	}
	else
	{
		AI_Output(self,other,"SVM_12_ShitNoOre");	//�� � ���� �� ������ ��� ����!
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1))
	{
		AI_Output(self,other,"SVM_12_NoLearnYoureBetter");	//������ �� ������� �����!
		LOG_CAVALORNTRAIN_BOW = FALSE;
		Info_ClearChoices(dia_cavalorn_learn);
	}
	else
	{
		b_cavalornearn();
	};
};

func void DIA_cavalorn_Lehrer_Bow_2()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00");	//����� ���� �������� �� ����.
	if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel >= 4))
	{
		if(B_GiveSkill(other,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02");	//�� ��� ���� ������� ���������. ������ �� ������ ������ ����� �������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03");	//�� ������ ��������� ��������� ��������������, �� ���������� ��� ���, ��� ������ � ��������� ������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04");	//������� ����� ��������: ������������� ���������� �� ����, �������� ������, ���� ��������� ������ - � ������ ����� � ����. ���� ������ ����������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05");	//������� �� ����� ������ ������. ������ ������� ����� ��������� ���� ������ �� ��������.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 100)
	{
		if(hero.lp >= LPCOST_TALENT_BOW_2)
		{
			b_printtrademsg1("������ ����: 100");
			B_GiveInvItems(hero,self,ItMiNugget,100);
		};
		if(B_GiveSkill(other,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02");	//�� ��� ���� ������� ���������. ������ �� ������ ������ ����� �������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03");	//�� ������ ��������� ��������� ��������������, �� ���������� ��� ���, ��� ������ � ��������� ������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04");	//������� ����� ��������: ������������� ���������� �� ����, �������� ������, ���� ��������� ������ - � ������ ����� � ����. ���� ������ ����������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05");	//������� �� ����� ������ ������. ������ ������� ����� ��������� ���� ������ �� ��������.
		};
	}
	else
	{
		AI_Output(self,other,"SVM_12_ShitNoOre");	//�� � ���� �� ������ ��� ����!
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1))
	{
		AI_Output(self,other,"SVM_12_NoLearnYoureBetter");	//������ �� ������� �����!
		LOG_CAVALORNTRAIN_BOW = FALSE;
		Info_ClearChoices(dia_cavalorn_learn);
	}
	else
	{
		b_cavalornearn();
	};
};

func void DIA_cavalorn_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Schleichen_15_00");	//� ���� ��������� ��������������.
	if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel >= 4))
	{
		if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
		{
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01");	//������� �����. ��� ������ ���������� ����, ��� ����� ��������� ���������� � ����� ��� � ������� ������� ��������.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02");	//���� �� ������� ���������, ���� ����� ����� �������������� ���� � ������, ���� ������� ���� ����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03");	//����� ���� ������������: ����� �� ���������, ��� ���������� ����� ��������. ����������, ����� ���� �� ��������.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04");	//������� ��� � ������� �� ���������.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(hero.lp >= LPCOST_TALENT_SNEAK)
		{
			b_printtrademsg1("������ ����: 50");
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
		if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
		{
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01");	//������� �����. ��� ������ ���������� ����, ��� ����� ��������� ���������� � ����� ��� � ������� ������� ��������.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02");	//���� �� ������� ���������, ���� ����� ����� �������������� ���� � ������, ���� ������� ���� ����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03");	//����� ���� ������������: ����� �� ���������, ��� ���������� ����� ��������. ����������, ����� ���� �� ��������.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04");	//������� ��� � ������� �� ���������.
		};
	}
	else
	{
		AI_Output(self,other,"SVM_12_ShitNoOre");	//�� � ���� �� ������ ��� ����!
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1))
	{
		AI_Output(self,other,"SVM_12_NoLearnYoureBetter");	//������ �� ������� �����!
		LOG_CAVALORNTRAIN_BOW = FALSE;
		Info_ClearChoices(dia_cavalorn_learn);
	}
	else
	{
		b_cavalornearn();
	};
};


instance STT_336_cavalorn_SELLBOW(C_Info)
{
	npc = STT_336_Cavalorn;
	condition = STT_336_cavalorn_SELLBOW_Condition;
	information = STT_336_cavalorn_SELLBOW_Info;
	important = 0;
	permanent = 0;
	description = "� ���� � ���� ������ ������� ���?";
};


func int STT_336_cavalorn_SELLBOW_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};
};

func void STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output(other,self,"STT_336_cavalorn_SELLBOW_Info_15_01");	//� ���� � ���� ������ ������� ���?
	AI_Output(self,other,"STT_336_cavalorn_SELLBOW_Info_12_02");	//� ����. ������ ����� �� � ������ ������ �� � ���� �� �������.
	Log_CreateTopic(GE_TraderOW,LOG_NOTE);
	B_LogEntry(GE_TraderOW,"�������� ������� ���� � ������. �� ����� � ���������� ������ ����� ������ � ����� ��������.");
};


instance STT_336_cavalorn_TRADE(C_Info)
{
	npc = STT_336_Cavalorn;
	condition = STT_336_cavalorn_TRADE_Condition;
	information = STT_336_cavalorn_TRADE_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int STT_336_cavalorn_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};
};

func void STT_336_cavalorn_TRADE_Info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//������ ��� ���� ������.
};

