
func void b_draxlearn()
{
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		Info_ClearChoices(org_819_drax_learn);
		Info_AddChoice(org_819_drax_learn,DIALOG_BACK,org_819_drax_learn_back);
		if(Knows_GetTeeth == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"������ ������ (2 ���� ��������, 50 ����)",Org_819_Drax_Creatures_Zahn);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"������ ������ (1 ���� ��������, 50 ����)",Org_819_Drax_Creatures_Zahn);
			};
		};
		if(Knows_GetFur == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"������ ���� (2 ���� ��������, 100 ����)",Org_819_Drax_Creatures_Fell);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"������ ���� (1 ���� ��������, 100 ����)",Org_819_Drax_Creatures_Fell);
			};
		};
		if(Knows_GetClaws == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"������ ������ (2 ���� ��������, 50 ����)",Org_819_Drax_Creatures_Kralle);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"������ ������ (1 ���� ��������, 50 ����)",Org_819_Drax_Creatures_Kralle);
			};
		};
		if(Knows_GetHide == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"������ ���� �������� (2 ���� ��������, 100 ����)",Org_819_Drax_Creatures_Haut);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"������ ���� �������� (1 ���� ��������, 100 ����)",Org_819_Drax_Creatures_Haut);
			};
		};
	}
	else
	{
		AI_Output(self,other,"SVM_6_NoLearnOverMax");	//�� ������ ���, ��� �����. ���� ����� ��������� ����-������ ���.
		DRAX_CAN_LEARN = FALSE;
	};
};


instance Org_819_Drax_Exit(C_Info)
{
	npc = ORG_819_Drax;
	nr = 999;
	condition = Org_819_Drax_Exit_Condition;
	information = Org_819_Drax_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_819_Drax_Exit_Condition()
{
	return 1;
};

func void Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_819_Drax_HuntHere(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_HuntHere_Condition;
	information = Org_819_Drax_HuntHere_Info;
	permanent = 0;
	description = "�� �������, ��?";
};


func int Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

func void Org_819_Drax_HuntHere_Info()
{
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_00");	//�� �������, ��?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_01");	//�������, ��... � ��� ���� �����?
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_02");	//�� ������ ���������� ���, ��� ����� ���������?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_03");	//� ���� ������� ����, �� ��� ����� ���� ����.
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_04");	//� ������ ��� ����?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_05");	//��� ������ ������� ����, � ��� ���������.
	if(!Npc_HasItems(other,ItFoBeer))
	{
		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00");	//� ���� ��� ����.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01");	//��� ���� ���. ��� ��� ��������� ���������� ����� �� �������. � ����� ��������� � �����, �������� ������� ����.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02");	//� ���� ������� ���� �������, �� �� ������� ��!
	};
};


var int drax_Lehrer_frei;

instance Org_819_Drax_Scavenger(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_Scavenger_Condition;
	information = Org_819_Drax_Scavenger_Info;
	permanent = 0;
	description = "��� ���� ����. ��� �� ���������� ��� �� �����?";
};


func int Org_819_Drax_Scavenger_Condition()
{
	if(Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (Npc_HasItems(other,ItFoBeer) > 0))
	{
		return 1;
	};
};

func void Org_819_Drax_Scavenger_Info()
{
	B_GiveInvItems(other,self,ItFoBeer,1);
	b_printtrademsg1("������ ����.");
	AI_Output(other,self,"Org_819_Drax_Scavenger_15_00");	//��� ���� ����. ��� �� ���������� ��� �� �����?
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,ItFoBeer);
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_01");	//��� ����� �������� �������� �������. �� �������� �� ������������. ��������� �� ����� ����������. �������� ���������� �� ���� ����� ��������.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_02");	//����� �� ��������� �����, ����� �������������, � ����� ������������ �������� �� ����. ����� ������ ��������.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_03");	//������ ���� ������. ��������� �����������, � � ���� ����� ����������� ������������. ����� �� � ��������� ��� ��������.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_04");	//��, � ���� �� ������ ���� ������, �����... �� ����� ����� �� ���������.
	drax_Lehrer_frei = TRUE;
};


instance Org_819_Drax_Creatures(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_Creatures_Condition;
	information = Org_819_Drax_Creatures_Info;
	permanent = 0;
	description = "�� ������ ������� ���� ��������� ����������� ������?";
};


func int Org_819_Drax_Creatures_Condition()
{
	if(drax_Lehrer_frei == TRUE)
	{
		return 1;
	};
};

func void Org_819_Drax_Creatures_Info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_15_00");	//�� ������ ������� ���� ��������� ����������� ������?
	AI_Output(self,other,"Org_819_Drax_Creatures_06_01");	//�������, ����, �� �� ���� ��� �� ����� �� �����������.
	AI_Output(self,other,"Org_819_Drax_Creatures_06_02");	//� ������� ����� ����� �������� �����, ����� � �����, ���� �����, ��� ��� ��������. �� �� ��� ������ �������� ���������.
	AI_Output(self,other,"Org_819_Drax_Creatures_06_03");	//��������� ������ ������ ������ �������.
	DRAX_CAN_LEARN = TRUE;
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
		B_LogEntry(GE_TeacherOW,"��� ����� ��������� ��� ��������� ����������� ������, ���� ��� ��� ����� �� �������. ������ �� �������� ����� ������ ������� � ������ ������.");
	};
};


instance ORG_819_DRAX_TOOMUCH(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = org_819_drax_toomuch_condition;
	information = org_819_drax_toomuch_info;
	permanent = 0;
	description = "�� ������� ������� �����.";
};


func int org_819_drax_toomuch_condition()
{
	if(DRAX_CAN_LEARN == TRUE)
	{
		return 1;
	};
};

func void org_819_drax_toomuch_info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00");	//�� ������� ������� �����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01");	//�������, ���� ����� - ������� ������ ���������� ����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02");	//���� �� �� ������, ��� ��������� ����������� ������, �� ��� ������ ����� ����� ������ ������ ��� ������.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03");	//� �� �������� ����������� ���������� �������, ������ �� �����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04");	//�� ����� ����� � ���������� �� ��������� ��������� ��� ����� �������.
};


instance ORG_819_DRAX_LEARN(C_Info)
{
	npc = ORG_819_Drax;
	nr = 990;
	condition = org_819_drax_learn_condition;
	information = org_819_drax_learn_info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int org_819_drax_learn_condition()
{
	if(DRAX_CAN_LEARN == TRUE)
	{
		return 1;
	};
};

func void org_819_drax_learn_info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//� ���� ��������� ��������� ����������� ������.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"SVM_6_WhatDoYouWant");	//� ���� ������ ����?
	};
	b_draxlearn();
};

func void org_819_drax_learn_back()
{
	Info_ClearChoices(org_819_drax_learn);
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00");	//��� �������� �����?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("������ ����: 50");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			B_GiveInvItems(other,self,ItMiNugget,50);
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01");	//�� ������ ������� �� ���, ����� ����� �� ���������. ����� ����� ��������, ��������� ����� ������ ���, ��� �����.
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02");	//����� ������, ������� � ���������� ������� ���� �����.
			b_learn_trophies_teeth();
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_00");	//�� ������ ��������� �����, ����� �� ������ �� ������� ���������.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00");	//� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00");	//��� ������� �����?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("������ ����: 100");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			B_GiveInvItems(other,self,ItMiNugget,100);
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_01");	//����� �����, ��� �������� ����������� ���� ������� � ������. ����� ����� ������ �������, ������� ������� �� ��������� �� ��� ������.
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_02");	//�� ���� ������ � ���������� ���� ������� ������. � ��������� � ���� ������ ������ ������������, ������� �� ��� ���� ����� �� ������ ��� ���.
			b_learn_trophies_fur();
		}
		else
		{
			AI_Output(self,other,"SVM_6_NoLearnNoPoints");	//� ������ �� ����� ������� ����, ���� �� ������� �����.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01");	//� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00");	//����� ���� �������� �����.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("������ ����: 50");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			B_GiveInvItems(other,self,ItMiNugget,50);
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_01");	//��� �����, ��� ������� �� ������ ������. ����� �������� ������ ������, �� ��� ���� �� �������� ��� ��������� � �� �������� �����.
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_02");	//�������, ��������� ����� ����� ������ �� � ������� �����. ������ � ���� ���� ����� ������.
			b_learn_trophies_claws();
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_02");	//������ ����� ������������, ����� ��������������� ���� �������.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03");	//������� ������� ���. ��� ��������� - ����� ���� ����.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00");	//��� ����� ������, ����� ������� ����� � ��������?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("������ ����: 100");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			B_GiveInvItems(other,self,ItMiNugget,100);
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_01");	//��� ����� �������� �� ��� ��������, � ���� ����� � ����������.
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_02");	//���� �� ��������� ����� �� �����, �� �� ������� ����� �� �����. ������ �� ������� ����� ����������� � ���� �������.
			b_learn_trophies_reptilefur();
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_03");	//�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03");	//������� ������� ���. ��� ��������� - ����� ���� ����.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

