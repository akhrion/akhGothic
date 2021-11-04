
func void b_wedgelearn()
{
	Info_ClearChoices(DIA_Wedge_Lehrer);
	Info_AddChoice(DIA_Wedge_Lehrer,DIALOG_BACK,DIA_Wedge_Lehrer_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,10,0),DIA_Wedge_Lehrer_Pickpocket2);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,200),DIA_Wedge_Lehrer_Pickpocket2);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,5,0),DIA_Wedge_Lehrer_Pickpocket);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,100),DIA_Wedge_Lehrer_Pickpocket);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,10,0),DIA_Wedge_Lehrer_Lockpick2);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,200),DIA_Wedge_Lehrer_Lockpick2);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,5,0),DIA_Wedge_Lehrer_Lockpick);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,100),DIA_Wedge_Lehrer_Lockpick);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak,5,0),DIA_Wedge_Lehrer_Schleichen);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,100),DIA_Wedge_Lehrer_Schleichen);
		};
	};
};


instance DIA_Wedge_Exit(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 999;
	condition = DIA_Wedge_Exit_Condition;
	information = DIA_Wedge_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

func void DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wedge_Psst(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 1;
	condition = DIA_Wedge_Psst_Condition;
	information = DIA_Wedge_Psst_Info;
	important = 1;
	permanent = 0;
};


func int DIA_Wedge_Psst_Condition()
{
	if((Npc_GetDistToNpc(hero,self) < 900) && Wld_IsTime(8,0,23,30))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Psst_Info()
{
	AI_Output(self,other,"DIA_Wedge_Psst_05_00");	//��, ��!
	AI_Output(other,self,"DIA_Wedge_Psst_15_01");	//���?.. �?
	AI_Output(self,other,"DIA_Wedge_Psst_05_02");	//��, ��, ��... �������-�� ����!
	AI_StopProcessInfos(self);
};


instance DIA_Wedge_Hello(C_Info)
{
	npc = ORG_850_Wedge;
	condition = DIA_Wedge_Hello_Condition;
	information = DIA_Wedge_Hello_Info;
	important = 0;
	permanent = 0;
	description = "��� ���� �� ���� �����?";
};


func int DIA_Wedge_Hello_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Hello_Info()
{
	AI_Output(other,self,"DIA_Wedge_Hello_15_00");	//��� ���� �� ���� �����?
	AI_Output(self,other,"DIA_Wedge_Hello_05_01");	//�� ���� �� ��� ����� �����, ��? � ����� ��� �������.
	AI_Output(self,other,"DIA_Wedge_Hello_05_02");	//���� ����� ������ ����� � �����, ����� ������ �����. � ���� ������� ����, ���� ������.
	AI_Output(self,other,"DIA_Wedge_Hello_05_03");	//������ ����� ����� �� ���, � ��� �� ��������������. ��������, ���� - ��� ��� ��� � ������, ����� ������� ���. ������� �� ���� ��������!
};


instance DIA_Wedge_WarnsOfButch(C_Info)
{
	npc = ORG_850_Wedge;
	condition = DIA_Wedge_WarnsOfButch_Condition;
	information = DIA_Wedge_WarnsOfButch_Info;
	important = 0;
	permanent = 0;
	description = "������?";
};


func int DIA_Wedge_WarnsOfButch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};
};

func void DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00");	//������?
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01");	//���� � ���� ���� ��������� �������� - ���� ���� ��������. ��� ��� ���������� �� ���������� ��� �� �����.
};


instance DIA_Wedge_Lehrer(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 700;
	condition = DIA_Wedge_Lehrer_Condition;
	information = DIA_Wedge_Lehrer_Info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_Wedge_Lehrer_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Lehrer_Info()
{
	if(log_wedgelearn == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"��� ���� ����� ������� ���� ��������������, �������� � ��������� �����.");
		log_wedgelearn = TRUE;
	};
	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00");	//�� ������ ������� ���� ����-������?
	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) < 2) || (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0) || (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_05_01");	//������� �� ����, ��� �� ������ ������!
		b_wedgelearn();
	}
	else
	{
		AI_Output(self,other,"SVM_5_NoLearnOverMax");	//�� ������ ���, ��� �����. ���� ����� ��������� ����-������ ���.
	};
};

func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00");	//� ���� ��������� ��������������.
	if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,5))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//��� ������ ���� ������ ��������� ����������. ��� �� ����������� �������������� ���� �������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//���������� ������ ������ ��������, ��� ������� ����� �� ������ �������� ����� �����.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 100)
	{
		if(hero.lp >= LPCOST_TALENT_SNEAK)
		{
			b_printtrademsg1("������ ����: 100");
			B_GiveInvItems(other,self,ItMiNugget,100);
		};
		if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//��� ������ ���� ������ ��������� ����������. ��� �� ����������� �������������� ���� �������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//���������� ������ ������ ��������, ��� ������� ����� �� ������ �������� ����� �����.
		};
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_5_NotNow");	//� ���� ��� �������.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00");	//� ���� ��������� ��������� ��������� �����.
	if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//�� ���� ����� �� ��� ������, ��? ��������� ����� �� ����� ������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//����� ����� ������� �� ���, ����� � ���� �� ��������� �������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//���� �� ������ ����������� ����� ���������, �� ��������, ��� �� ������ ������� ���� �� ����������� ������ ����� �������.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 100)
	{
		if(hero.lp >= LPCOST_TALENT_PICKLOCK_1)
		{
			b_printtrademsg1("������ ����: 100");
			B_GiveInvItems(other,self,ItMiNugget,100);
		};
		if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//�� ���� ����� �� ��� ������, ��? ��������� ����� �� ����� ������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//����� ����� ������� �� ���, ����� � ���� �� ��������� �������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//���� �� ������ ����������� ����� ���������, �� ��������, ��� �� ������ ������� ���� �� ����������� ������ ����� �������.
		};
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_5_NotNow");	//� ���� ��� �������.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00");	//� ���� ����� �������� ������ ������.
	if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//����� ������� ���������������, � �� ��� � ��������� ������ ������������ ������, ����� ������� ������ ���-��� ���������. ��� ���� �� �������� ������ ����.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//� ������ � ���� ������ ������ ��������� ������ � ����� ��� �������� �������. ��� ���� �� ������ ������ �� ������� ����.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//���������� ������������� ����� ������� ������� �����, �� ������ �� ����� �������.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 200)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
		{
			if(hero.lp >= LPCOST_TALENT_PICKLOCK_2)
			{
				b_printtrademsg1("������ ����: 200");
				B_GiveInvItems(other,self,ItMiNugget,200);
			};
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//����� ������� ���������������, � �� ��� � ��������� ������ ������������ ������, ����� ������� ������ ���-��� ���������. ��� ���� �� �������� ������ ����.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//� ������ � ���� ������ ������ ��������� ������ � ����� ��� �������� �������. ��� ���� �� ������ ������ �� ������� ����.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//���������� ������������� ����� ������� ������� �����, �� ������ �� ����� �������.
		};
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_5_NotNow");	//� ���� ��� �������.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00");	//� ���� ����� ������� �����������.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
			{
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//��� �� ������ ��������� �������� ������� �������, ��? ��� �.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//� ����� ���� �����, �� � ���� ������ ���� ��������� ���� ���� ����������� �� ����� ������������.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//���� ����� �������� ������ � ��� ������, ���� �� ��������� ���� �� ���� �� ����� �������.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//�� ������ ���������������� ��� ����� ���������� ��������� �������� ���-������ ������ �� ������� ������������� ���������!
			};
		}
		else if(Npc_HasItems(hero,ItMiNugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_PICKPOCKET_1)
			{
				b_printtrademsg1("������ ����: 100");
				B_GiveInvItems(other,self,ItMiNugget,100);
			};
			if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
			{
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//��� �� ������ ��������� �������� ������� �������, ��? ��� �.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//� ����� ���� �����, �� � ���� ������ ���� ��������� ���� ���� ����������� �� ����� ������������.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//���� ����� �������� ������ � ��� ������, ���� �� ��������� ���� �� ���� �� ����� �������.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//�� ������ ���������������� ��� ����� ���������� ��������� �������� ���-������ ������ �� ������� ������������� ���������!
			};
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
			AI_Output(self,other,"SVM_5_NotNow");	//� ���� ��� �������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05");	//���� �� ����� �� ����! ���, ��� �� ����� ��������������, ������� �� ������ �����.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00");	//� ���� ����� ��������-�����������.
	if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//�����, �� ��� ����� � ����, ����� � �������� ���� � ������� ���������� ����������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//�� ����, ��� ���� ������ ����� ���� ����� ������� �� ����� ������������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//���� ���������.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 200)
	{
		if(hero.lp >= LPCOST_TALENT_PICKPOCKET_2)
		{
			b_printtrademsg1("������ ����: 200");
			B_GiveInvItems(other,self,ItMiNugget,200);
		};
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//�����, �� ��� ����� � ����, ����� � �������� ���� � ������� ���������� ����������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//�� ����, ��� ���� ������ ����� ���� ����� ������� �� ����� ������������.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//���� ���������.
		};
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_5_NotNow");	//� ���� ��� �������.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Wedge_Lehrer);
};

