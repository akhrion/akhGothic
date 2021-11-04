
instance DIA_Milten_EXIT(C_Info)
{
	npc = PC_Mage;
	nr = 999;
	condition = DIA_Milten_EXIT_Condition;
	information = DIA_Milten_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Milten_EXIT_Condition()
{
	return 1;
};

func void DIA_Milten_EXIT_Info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"DIA_Milten_EXIT_02_00");	//����.
	}
	else
	{
		AI_Output(self,hero,"DIA_Milten_EXIT_02_01");	//��������.
	};
	if(Npc_HasItems(hero,demourizel))
	{
		Npc_RemoveInvItem(hero,demourizel);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Milten_First(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_First_Condition;
	information = DIA_Milten_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Milten_First_Condition()
{
	if((CorKalom_BringMCQBalls != LOG_SUCCESS) && !Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Milten_First_Info()
{
	AI_Output(self,other,"DIA_Milten_First_02_00");	//�� �� ������ ����������� ���� ����� �� ��� ���, ���� �� �������� ���������� �� ��������� ��������.
};


instance DIA_Milten_Hello(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_Hello_Condition;
	information = DIA_Milten_Hello_Info;
	permanent = 0;
	description = "� ��� ���������� ���� ����� ����.";
};


func int DIA_Milten_Hello_Condition()
{
	if((Saturas_BringFoci == FALSE) && !Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func void DIA_Milten_Hello_Info()
{
	AI_Output(other,self,"DIA_Milten_Hello_15_00");	//� ��� ���������� ���� ����� ����.
	AI_Output(self,other,"DIA_Milten_Hello_02_01");	//��� ��������. ����� �� ���� �����?
};


instance DIA_Milten_GotoCorristo(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_GotoCorristo_Condition;
	information = DIA_Milten_GotoCorristo_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Milten_GotoCorristo_Condition()
{
	if(((CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return 1;
	};
};

func void DIA_Milten_GotoCorristo_Info()
{
	var C_Npc Corristo;
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_01");	//�� ������� � ����� �������� � ������ �����. ��� �������� ������ ���� ���� ������� ���������.
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_02");	//�������� ���� ������ � ����. �� ����� ���������� � �����. ��� � ����.
	if((Npc_HasItems(other,ItWr_Fire_Letter_01) >= 1) || (Npc_HasItems(other,ItWr_Fire_Letter_02) >= 1))
	{
		AI_Output(other,self,"DIA_Milten_Letter_15_00");	//� ���� ���� ������ ��� ���������� ���� ����� ����.
		AI_Output(self,other,"DIA_Milten_Letter_02_03");	//������ ��� ��� ������.
		AI_Output(other,self,"DIA_Milten_Letter_Give_15_00");	//��� ���.
		if(Npc_HasItems(other,ItWr_Fire_Letter_01))
		{
			b_printtrademsg1("������ ������������ ������.");
			B_GiveXP(XP_XardasLetter);
			Npc_RemoveInvItem(other,ItWr_Fire_Letter_01);
		}
		else if(Npc_HasItems(other,ItWr_Fire_Letter_02))
		{
			b_printtrademsg1("������ �������� ������.");
			B_GiveXP(XP_XardasLetterOPEN);
			Npc_RemoveInvItem(other,ItWr_Fire_Letter_02);
		};
		B_UseFakeScroll();
		Corristo = Hlp_GetNpc(Kdf_402_Corristo);
		CreateInvItem(Corristo,ItWr_Fire_Letter_02);
		AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//� � �� �������� �������?
		AI_Output(self,hero,"Info_Milten_SHSEAL_02_05");	//� ���� ������ ��� �������������.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			B_LogEntry(KDFLETTER,"� �������� ������ �����. ������� � ��� ��������, �� ������� �� �������, ����.");
			Log_SetTopicStatus(KDFLETTER,LOG_SUCCESS);
			PYROCAR_MESSENGER = LOG_SUCCESS;
		};
	};
};


var int milten_HasLetter;

instance DIA_Milten_Letter(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_Letter_Condition;
	information = DIA_Milten_Letter_Info;
	permanent = 0;
	description = "� ���� ���� ������ ��� ���������� ���� ����� ����.";
};


func int DIA_Milten_Letter_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_Hello) && ((Npc_HasItems(other,ItWr_Fire_Letter_01) >= 1) || (Npc_HasItems(other,ItWr_Fire_Letter_02) >= 1)) && (Kapitel < 4) && (Saturas_BringFoci == FALSE))
	{
		return 1;
	};
};

func void DIA_Milten_Letter_Info()
{
	AI_Output(other,self,"DIA_Milten_Letter_15_00");	//� ���� ���� ������ ��� ���������� ���� ����� ����.
	AI_Output(self,other,"DIA_Milten_Letter_02_01");	//�� ����� �� �������� ����?
	AI_Output(other,self,"DIA_Milten_Letter_15_02");	//��, ���� ��� ������� ��� ������, ����� ��� ��� ���� ��������� � �������.
	AI_Output(self,other,"DIA_Milten_Letter_02_03");	//������ ��� ��� ������.
	Info_ClearChoices(DIA_Milten_Letter);
	Info_AddChoice(DIA_Milten_Letter,"������� � ���� �������� �������.",DIA_Milten_Letter_NO);
	Info_AddChoice(DIA_Milten_Letter,"��� ���.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	var C_Npc Corristo;
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_00");	//��� ���.
	if(Npc_HasItems(other,ItWr_Fire_Letter_01))
	{
		b_printtrademsg1("������ ������������ ������.");
		B_GiveXP(XP_XardasLetter);
		Npc_RemoveInvItem(other,ItWr_Fire_Letter_01);
	}
	else if(Npc_HasItems(other,ItWr_Fire_Letter_02))
	{
		b_printtrademsg1("������ �������� ������.");
		B_GiveXP(XP_XardasLetterOPEN);
		Npc_RemoveInvItem(other,ItWr_Fire_Letter_02);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_03");	//��� ������ ���������� ��������!
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_04");	//� ��� � ���� ����������?
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_05");	//������� ������� �������� ������ ����� ��� �����. �� ���� ������ � �������� ���� ����� ������ �����.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_06");	//�� ����� � ����� � ������ ������ ����� � ���������� ������ ������ ��������������.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_07");	//�� ������, ��� ������� ���, ��� ����� �� ��� ��� ���������� �������.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_08");	//��� �����. � ����� �������.
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP(self,"OCC_CHAPEL_ENTRANCE");
	Corristo = Hlp_GetNpc(Kdf_402_Corristo);
	CreateInvItem(Corristo,ItWr_Fire_Letter_02);
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output(other,self,"DIA_Milten_Letter_NO_15_00");	//������� � ���� �������� �������.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_01");	//�������� �������� ������� ������ �� ����, ��� ������ ������� ������.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_02");	//� ��������� ������, � ������� �� ���. ������ �� ������ ������ ��� ������.
	Info_ClearChoices(DIA_Milten_Letter);
	Info_AddChoice(DIA_Milten_Letter,"���, � �� ��� ����� ������ ��� ������ �������.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice(DIA_Milten_Letter,"��� ���.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_00");	//���, � �� ��� ����� ������ ��� ������ �������.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_01");	//����� �� � ���� �����������?
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_02");	//���. ������� � ���� �������� �������.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_03");	//������. ���� �� ����� ������. ��� �����.
	Info_ClearChoices(DIA_Milten_Letter);
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP(self,"OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};


instance DIA_Milten_ComesBack(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_ComesBack_Condition;
	information = DIA_Milten_ComesBack_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Milten_ComesBack_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_Letter) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3))
	{
		return true;
	};
	return false;
};

func void DIA_Milten_ComesBack_Info()
{
	if(milten_HasLetter == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_ComesBack_02_00");	//�������� �������� �������� � ���, ��� �� �� ��������� ���������� ������.
		AI_Output(self,other,"DIA_Milten_ComesBack_02_01");	//�� �� �������� ���� ����������� � �������� � �������� ������� �������.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			B_LogEntry(KDFLETTER,"������� �������� ���� � �������. � �� ����� ����� ������ �������� ������ ���, ������� ��� ����� �������!");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_ComesBack_02_02");	//�������� ��� � ������ ��������. �� ������, ��� �� ������ ����������� � �������� � ������� ���� �������.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			B_LogEntry(KDFLETTER,"������� ����� ������ ���������� ����, ��������. ��� ���������� ������� �� ��������, ������ ����� ���������� � ��������.");
		};
	};
};


instance DIA_Milten_WoTorrez(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_WoTorrez_Condition;
	information = DIA_Milten_WoTorrez_Info;
	permanent = 0;
	description = "��� ����� �������?";
};


func int DIA_Milten_WoTorrez_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE))
	{
		return 1;
	};
};

func void DIA_Milten_WoTorrez_Info()
{
	AI_Output(other,self,"DIA_Milten_WoTorrez_15_00");	//��� ����� �������?
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_01");	//���� ���� �� ����� ����� ������.
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_02");	//���� �� �� �������� � ����� �����. ��������� ���� ���� ����� ����� � ����, ���� �������� ���������� � ��� ����.
};


instance DIA_Milten_NochEinBrief(C_Info)
{
	npc = PC_Mage;
	nr = 2;
	condition = DIA_Milten_NochEinBrief_Condition;
	information = DIA_Milten_NochEinBrief_Info;
	permanent = 0;
	description = "� ���� ���� ������ �� ����� ����.";
};


func int DIA_Milten_NochEinBrief_Condition()
{
	if((Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) && (Npc_HasItems(hero,Cronos_Brief) >= 1))
	{
		return 1;
	};
};

func void DIA_Milten_NochEinBrief_Info()
{
	var C_Npc Corristo;
	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00");	//� ���� ���� ������ �� ����� ����.
	b_printtrademsg1("������ ������ �������.");
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_01");	//�! ����� ������! � ������� ��� ��������.
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_02");	//����� ��������� � ����� ������, ���� ���� ����������� ���� �� �����.
	B_LogEntry(KDWLETTER,"������� ������� ������ ����� ����, ����� �������� �� ������ �������.");
	Npc_RemoveInvItem(other,Cronos_Brief);
	Corristo = Hlp_GetNpc(Kdf_402_Corristo);
	CreateInvItem(Corristo,Cronos_Brief);
};


instance DIA_Milten_PERM(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_PERM_Condition;
	information = DIA_Milten_PERM_Info;
	permanent = 0;
	description = "�������� ��� ���-������ � ����� ����.";
};


func int DIA_Milten_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void DIA_Milten_PERM_Info()
{
	AI_Output(other,self,"DIA_Milten_PERM_15_00");	//�������� ��� ���-������ � ����� ����.
	AI_Output(self,other,"DIA_Milten_PERM_02_01");	//���� ���� �������� ���� ���� � ������������� ������. ��� ����� � ������ ���������� ���.
	AI_Output(self,other,"DIA_Milten_PERM_02_02");	//���� ������� ���� ����������, �� � �� ���� ��������� ��������� ��������������.
	AI_Output(self,other,"DIA_Milten_PERM_02_03");	//��� �������, ��� ���� �������. �������� ������ ���� ����� ��������. ��-�����, �� ������ ����� ������� ����������.
	AI_Output(self,other,"DIA_Milten_PERM_02_04");	//� ��� ��� � ��������� ������������� ���� ���������� ������, ����� ���� ���������� � ��������� ����.
};


instance DIA_Milten_WannaMage(C_Info)
{
	npc = PC_Mage;
	nr = 2;
	condition = DIA_Milten_WannaMage_Condition;
	information = DIA_Milten_WannaMage_Info;
	permanent = 1;
	description = "� ���� ���� ����� �������� ����. �����, ��� ��.";
};


func int DIA_Milten_WannaMage_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_KDF))
	{
		return 1;
	};
};

func void DIA_Milten_WannaMage_Info()
{
	AI_Output(other,self,"DIA_Milten_WannaMage_15_00");	//� ���� ���� ����� �������� ����. �����, ��� ��.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_01");	//�������� ������ ����, ������ ��� � ������� �������.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_02");	//�� ��� ���, ���� �� �� �������� ���-������ ��������������, �� � ������������� �� ������� � ����� ��������.
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		AI_Output(self,other,"DIA_Milten_WannaMage_02_03");	//������ �����, �� ������ ������������ � ������� ������. ����������, ��� �������� ������� ���� � ������� �������� �� ������ ����� �������.
	};
};


instance Info_Milten_SHWAIT(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHWAIT_Condition;
	information = Info_Milten_SHWAIT_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_SHWAIT_Condition()
{
	if((Npc_GetDistToWP(hero,"OW_PATH_274") < 1000) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return 1;
	};
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_01");	//�����������! ��� ���� ������ �� ��������� ������ ��������� ��� � ����.
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_02");	//� �������. �� ���� ����� �������.
	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03");	//���, ��������...
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_04");	//��, ��. ��� ������ �������, ��?
};


instance Info_Milten_SHGORN(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHGORN_Condition;
	information = Info_Milten_SHGORN_Info;
	important = 0;
	permanent = 0;
	description = "� ����� �����.";
};


func int Info_Milten_SHGORN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHWAIT) && Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output(hero,self,"Info_Milten_SHGORN_15_01");	//� ����� �����.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_02");	//� ����� ����? � ���?
	AI_Output(hero,self,"Info_Milten_SHGORN_15_03");	//� ������ ��������� � ����. �� ������ ��� ���������.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_04");	//������, ��� �� ��������� ��� ��� ����, ����� �� ���������� �����.
};


instance Info_Milten_SHLESTER(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHLESTER_Condition;
	information = Info_Milten_SHLESTER_Info;
	important = 0;
	permanent = 0;
	description = "�� � �������� ����������� ���� � �����.";
};


func int Info_Milten_SHLESTER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHWAIT) && Npc_KnowsInfo(hero,PC_Psionic_FINISH))
	{
		return TRUE;
	};
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_01");	//�� � �������� ����������� ���� � �����.
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_02");	//�� ������� ��� �� ����. �����, ���� ����� ��������.
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_03");	//��� ��� �� �� ����������� �� �����?
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_04");	//�, ����� � ��� - � ����� ������ ������.
};


instance Info_Milten_SHYOU(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHYOU_Condition;
	information = Info_Milten_SHYOU_Info;
	important = 0;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int Info_Milten_SHYOU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHWAIT))
	{
		return 1;
	};
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output(hero,self,"Info_Milten_SHYOU_15_01");	//��� �� ����� �������?
	AI_Output(self,hero,"Info_Milten_SHYOU_02_02");	//���������� ������ ��������� ������� �������� ������, � ������ �������� ���� ���� � ����������.
	AI_Output(hero,self,"Info_Milten_SHYOU_15_03");	//���-�� ����� ������?
	AI_Output(self,hero,"Info_Milten_SHYOU_02_04");	//��, ���-�� �����.
	AI_Output(self,hero,"Info_Milten_SHYOU_02_05");	//��� ����� ���-��� ������ �� ����� ������.
};


instance Info_Milten_SHME(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHME_Condition;
	information = Info_Milten_SHME_Info;
	important = 0;
	permanent = 0;
	description = "� ��� ������. �� ������ ���� ���-�� �����.";
};


func int Info_Milten_SHME_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHWAIT) && !Npc_KnowsInfo(hero,Info_Milten_SHACCEPT))
	{
		return 1;
	};
};

func void Info_Milten_SHME_Info()
{
	AI_Output(hero,self,"Info_Milten_SHME_15_01");	//� ��� ������. �� ������ ���� ���-�� �����.
	AI_Output(self,hero,"Info_Milten_SHME_02_02");	//������, ��� ����� ����� ������� � ���� � �� �� �����.
};


instance Info_Milten_SHPROBLEM(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHPROBLEM_Condition;
	information = Info_Milten_SHPROBLEM_Info;
	important = 0;
	permanent = 0;
	description = "������ �� ��� �� ������ ����� � ����� � ����� ��, ��� ���� �����?";
};


func int Info_Milten_SHPROBLEM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHYOU))
	{
		return TRUE;
	};
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_01");	//� ������ �� ��� �� ������ ����� � ����� � ����� ��� ��, ��� ���� �����?
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_02");	//�, ������ �������. ������� ������ �������� ������������, ����� ���������.
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_03");	//��������, � �� ���������!
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_04");	//������! ����� ���������� ����������� �������, ������������� ���� ���...
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_05");	//...���� �� ����� ����� ��� ���������� ��������.
};


instance Info_Milten_SHFOCUS(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHFOCUS_Condition;
	information = Info_Milten_SHFOCUS_Info;
	important = 0;
	permanent = 0;
	description = "�� �������� �� ����� �� ������-��������?";
};


func int Info_Milten_SHFOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_01");	//�� �������� �� ����� �� ������-��������?
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_02");	//�����! ��� �� ��� ������ ������� �� ���� ���� ������?
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_03");	//�����, � �� ����, ��������, �� �� �������� ������?
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_04");	//���, ������ ��� �� �����, �� ���� � ��� �������� �����.
};


instance Info_Milten_SHSEAL(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSEAL_Condition;
	information = Info_Milten_SHSEAL_Info;
	important = 0;
	permanent = 0;
	description = "� ���� �������� ��������� � ������?";
};


func int Info_Milten_SHSEAL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_01");	//� ���� �������� ��������� � ������?
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_02");	//��. ��� �������� �������������� �����. ������ �� �����, ��� ���������� ������� ������...
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_03");	//...����� ������� � ������� � ������ ������ �������� �������� �� ������ �����... �����.
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_04");	//� �� ����� ������ ��� ��������?
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_05");	//� ���� ������ ��� �������������.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_06");	//��������� ��� ����� ���� �� �������, �������������� ������ �� �����, ����� ��������� � ��������.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_07");	//� ������ �� �������� ��� ���������.
};


instance Info_Milten_SHTALISMAN(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHTALISMAN_Condition;
	information = Info_Milten_SHTALISMAN_Info;
	important = 0;
	permanent = 0;
	description = "� ��� ��� �� ��������?";
};


func int Info_Milten_SHTALISMAN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHFOCUS))
	{
		return TRUE;
	};
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output(hero,self,"Info_Milten_SHTALISMAN_15_01");	//� ��� ��� �� ��������?
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_02");	//� �����, ��������� �������� ����������� ��� ��� ������ �� ������� �����.
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_03");	//���� � ����, ���� �������� ����� ��������� ����� ��������.
};


instance Info_Milten_SHOFFER(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHOFFER_Condition;
	information = Info_Milten_SHOFFER_Info;
	important = 0;
	permanent = 0;
	description = "��� ����� ��������� ��������. �� ������� ��������, � � - ������.";
};


func int Info_Milten_SHOFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHSEAL) && Npc_KnowsInfo(hero,Info_Milten_SHTALISMAN))
	{
		return TRUE;
	};
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_01");	//��� ����� ������ ��������� ��� ��������. �� ������� ��������, � � - ������.
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_02");	//��� ��� ������, �� ���� ���� ��������...
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_03");	//��������?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_04");	//��. ���, ��� �������� ��� ��������.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_05");	//� ����� ��� ������ ������ �������� �� �����?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_06");	//��� �� ���-�� ������. �������, �� �� ������ ��������� �������� ������.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_07");	//��� �������, ��� �� ��� ���-�� ��������. � ���� ���� ����?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_08");	//��... ��... ����-�� ����, �� ������ ��� �� ����������.
};


instance Info_Milten_SHOFFER2(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHOFFER2_Condition;
	information = Info_Milten_SHOFFER2_Info;
	important = 0;
	permanent = 0;
	description = "��, � ����� � ���� ����?";
};


func int Info_Milten_SHOFFER2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHOFFER))
	{
		return TRUE;
	};
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_01");	//��, � ����� � ���� ����?
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_02");	//� ���� ���� ������ � ����� ������ �����������.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_03");	//��� �������� ���������� ����� ������.
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_04");	//�� ����� ��������� �������� ����� ����� ��������!
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_05");	//��... �� ������. � ��������� ��� ��� ������� �� ������ �����.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_06");	//��� �� ���������, ��� ���� ����� ����, ��������� ����� �� ����������.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_07");	//� ��� ���� ��� ��������� ���� � ���� �� �����. ������ ��� �� ����������.
};


instance Info_Milten_SHACCEPT(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHACCEPT_Condition;
	information = Info_Milten_SHACCEPT_Info;
	important = 0;
	permanent = 0;
	description = "��� ��� ���� ������, � �� ������ ���� ������!";
};


func int Info_Milten_SHACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHOFFER2))
	{
		return TRUE;
	};
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_01");	//��� ��� ���� ������, � �� ������ ���� ������!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_02");	//������! � ��������, ��� �� ��� �������!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_03");	//�� � ��� ����� ���� ������. ���������� ��������� ��� ��� ������.
	b_printtrademsg1("������� ������ ����������� ������.");
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_04");	//� ��������� ������� �������� ��������� ������� �������.
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_05");	//�������. ��� ������ � ����� ������?
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06");	//��� �� ����.
	Log_CreateTopic(CH3_Stonehenge,LOG_MISSION);
	Log_SetTopicStatus(CH3_Stonehenge,LOG_RUNNING);
	B_LogEntry(CH3_Stonehenge,"�������� �� ����� ������ � �������� ���� ���� ��������. �� ������ ���, ��� ������, ������� � ���, ��������� � ������ ��� ���� �����������.");
	B_LogEntry(CH3_Stonehenge,"������� ��� ��� ������, � ������� �������� ����� �������� ������ ������. �� ������ ������ ��������� ��� ���������.");
	CreateInvItem(self,ItArScrollDestroyUndead);
	B_GiveInvItems(self,hero,ItArScrollDestroyUndead,1);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHGuide");
	AI_StopProcessInfos(self);
};


instance Info_Milten_SHARRIVED(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHARRIVED_Condition;
	information = Info_Milten_SHARRIVED_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_SHARRIVED_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") < 500) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHARRIVED_02_01");	//��� �� � ������. ���� ������� ����� ����� � ��������.
	AI_Output(hero,self,"Info_Milten_SHARRIVED_15_02");	//����� ������, �������� ����� ������!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};


instance Info_Milten_SHHEAL(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHHEAL_Condition;
	information = Info_Milten_SHHEAL_Info;
	important = 0;
	permanent = 1;
	description = "� �����. ������ ���!";
};


func int Info_Milten_SHHEAL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) && (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (MILTEN_HEAL < 4))
	{
		return TRUE;
	};
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output(hero,self,"Info_Milten_SHHEAL_15_01");	//� �����. ������ ���!
	if(MILTEN_HEAL == 0)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//������ �������� �������.
		b_printtrademsg1("������� �������� ���������.");
		B_GiveInvItems(self,hero,ItFo_Potion_Health_02,1);
		MILTEN_HEAL = 1;
	}
	else if(MILTEN_HEAL == 1)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//������ �������� �������.
		b_printtrademsg1("������� �������� ���������.");
		B_GiveInvItems(self,hero,ItFo_Potion_Health_02,1);
		MILTEN_HEAL = 2;
	}
	else if(MILTEN_HEAL == 2)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//������ �������� �������.
		b_printtrademsg1("������� �������� ���������.");
		B_GiveInvItems(self,hero,ItFo_Potion_Health_02,1);
		MILTEN_HEAL = 3;
	}
	else
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_03");	//� ���� ������ ��� �������� ���������.
		MILTEN_HEAL = 4;
	};
	AI_StopProcessInfos(self);
};


instance Info_Milten_SHRUNNING(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHRUNNING_Condition;
	information = Info_Milten_SHRUNNING_Info;
	important = 0;
	permanent = 1;
	description = "����� ��� ��� ���!";
};


func int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self,ZombieTheKeeper,NOFUNC,-1);
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && (keeperFound && !Npc_IsDead(other)))
	{
		return TRUE;
	};
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output(hero,self,"Info_Milten_SHRUNNING_15_01");	//����� ��� ��� ���!
	AI_Output(self,hero,"Info_Milten_SHRUNNING_02_02");	//��� �������� ���, �������� ������ � �����������!
};


instance Info_Milten_SHSCROLL(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSCROLL_Condition;
	information = Info_Milten_SHSCROLL_Info;
	important = 0;
	permanent = 0;
	description = "� ����������� ������... �� � �� ���� ������!";
};


func int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self,ZombieTheKeeper,NOFUNC,-1);
	if(keeperFound && !Npc_IsDead(other) && Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && (Npc_HasItems(hero,ItArScrollDestroyUndead) == 0) && (Npc_HasItems(hero,itarrune_6_1_destroyundead) == 0))
	{
		return TRUE;
	};
};

func void Info_Milten_SHSCROLL_Info()
{
	var C_Npc npc;
	AI_Output(hero,self,"Info_Milten_SHSCROLL_15_01");	//� ����������� ������... �� � �� ���� ������!
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_02");	//������ �� ���! ��������, ��� ��� ����� �������� ���!
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_03");	//����� ����, �� ������ ������ ��� ���� ������ ��� �����-������ ���� � ����� �� �������?
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_04");	//� ���� ����� ���� ���, ��� �� ����������� � ������� ���.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHWait");
	if(C_NpcBelongsToOldCamp(hero))
	{
		npc = Hlp_GetNpc(KDF_405_Torrez);
		CreateInvItem(npc,ItArScrollDestroyUndead);
	}
	else if(C_NpcBelongsToNewCamp(hero))
	{
		npc = Hlp_GetNpc(KDW_604_Cronos);
		CreateInvItem(npc,ItArScrollDestroyUndead);
	}
	else
	{
		npc = Hlp_GetNpc(GUR_1208_BaalCadar);
		CreateInvItem(npc,ItArScrollDestroyUndead);
	};
};


instance Info_Milten_SHNEWSCROLL(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHNEWSCROLL_Condition;
	information = Info_Milten_SHNEWSCROLL_Info;
	important = 0;
	permanent = 0;
	description = "� ���� ������ ���� ���������� '���������� ������'!";
};


func int Info_Milten_SHNEWSCROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHSCROLL) && !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) && ((Npc_HasItems(hero,ItArScrollDestroyUndead) > 0) || (Npc_HasItems(hero,itarrune_6_1_destroyundead) > 0)))
	{
		return TRUE;
	};
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output(hero,self,"Info_Milten_SHNEWSCROLL_15_01");	//� ���� ������ ���� ���������� '���������� ������'!
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_02");	//������. ������, �� ����� ��� ��� ���������� � ����� � ������.
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_03");	//��� ������, � ����� �� �����.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHFollow");
};


instance Info_Milten_SHLEAVE(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHLEAVE_Condition;
	information = Info_Milten_SHLEAVE_Info;
	important = 1;
	permanent = 1;
};


func int Info_Milten_SHLEAVE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") > 10000) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_01");	//������, �������� ���� ������ �� ����������.
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_02");	//���� ���-���� �����������, �� ������ ����� ���� ���, ��� �� ����������� � ����� � ������� ���.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"SHWait");
	AI_StopProcessInfos(self);
};


instance Info_Milten_SHCONTINUE(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHCONTINUE_Condition;
	information = Info_Milten_SHCONTINUE_Info;
	important = 0;
	permanent = 1;
	description = "������� ��� ��� ���� ������?";
};


func int Info_Milten_SHCONTINUE_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") < 9000) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(hero,self,"Info_Milten_SHCONTINUE_15_01");	//������� ��� ��� ���� ������?
	AI_Output(self,hero,"Info_Milten_SHCONTINUE_02_02");	//� �����. ��� ������, � ����� ������.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};


var int orctalismanisfound;

instance Info_Milten_SHSUCCESS(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSUCCESS_Condition;
	information = Info_Milten_SHSUCCESS_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_SHSUCCESS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && Npc_HasItems(hero,ItMi_OrcTalisman) && (C_BodyStateContains(hero,BS_RUN) || C_BodyStateContains(hero,BS_WALK) || C_BodyStateContains(hero,BS_JUMP) || (ORCTALISMANISFOUND == 1) || Npc_HasReadiedWeapon(hero)) && (Npc_GetDistToPlayer(self) < 1000))
	{
		ORCTALISMANISFOUND = 1;
		return TRUE;
	};
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_UnreadySpell(hero);
	AI_RemoveWeapon(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_01");	//������. ������ � ���� ���� ��������.
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//���, ������ ���. ��� �� � ������.
	b_printtrademsg1("����� �������� �����.");
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_03");	//�������, ����. � ������� �� ������� ���, ��� ����� ���.
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_04");	//� ����������� � ������ ������. ����� ����, �� ��� ��� ����������.
	B_GiveInvItems(hero,self,ItMi_OrcTalisman,1);
	B_LogEntry(CH3_Stonehenge,"������ �� ������ �������� ������ ������. ������� ����� ��, ��� �����, � ����� ��������� � ������ ������.");
	B_LogEntry(CH3_Stonehenge,"������� ����������, ����� � ������� ��� ������, ������� ����� �����!");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"ReturnToOC");
	AI_StopProcessInfos(self);
};


instance Info_Milten_OCWARN(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCWARN_Condition;
	information = Info_Milten_OCWARN_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_OCWARN_Condition()
{
	if((Kapitel == 4) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_OCWARN_02_01");	//���... ��� ��� ������... ��� ������. � �� ��� �� ������... � ���... ���� ��� �� ����... �...
	if(Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		AI_Output(hero,self,"Info_Milten_OCWARN_15_02");	//�� ��������, �������, � ������ ��� ������� � �����. �� �������� �� ������ ������� ������.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_03");	//����� �� ������ �����... ��� ������ �����?
		AI_Output(hero,self,"Info_Milten_OCWARN_15_04");	//���� � ������� ����� � �������, � ����� ��, ��� �� ����� ������ �� �� ����� ������� �����.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_05");	//�����! ���� ���������!
		B_LogEntry(CH4_Firemages,"������� �������� �������� �� ������� ������, ��� � �����. �� ������������� �� ��������� ����, ��� ������� ����� � ������.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(hero,self,"Info_Milten_OCWARN_15_06");	//���������, �������, ��� ���������?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_07");	//��� ���� ���� ������! ���, ����� ����, � � ���� ��� �� ������� �� ������.
		AI_Output(hero,self,"Info_Milten_OCWARN_15_08");	//����� �������� ��� ��� �� �������.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_09");	//�����. ��������, �������, ��������...
		AI_Output(self,hero,"Info_Milten_OCWARN_02_10");	//��� �������� � ����, ��� ���������� ������ �����...
		AI_Output(hero,self,"Info_Milten_OCWARN_15_11");	//������ ����� ����������?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_12");	//��. ��� ��������� ����� ������. ����� �� ������.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_13");	//���� � ����� ����������� ���������.
		b_failch4quests();
	};
};


instance Info_Milten_OCMINE(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCMINE_Condition;
	information = Info_Milten_OCMINE_Info;
	important = 0;
	permanent = 0;
	description = "��� �� ��� ����� ����������?";
};


func int Info_Milten_OCMINE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return TRUE;
	};
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output(hero,self,"Info_Milten_OCMINE_15_01");	//��� �� ��� ����� ����������?
	AI_Output(self,hero,"Info_Milten_OCMINE_02_02");	//������� �� ����. �� �� ���������, ��� ��� � ��� ������ � �����, ����� ��������, ��� �������� ���-�� ����� �������������, � ����� �� ������� ��������� �������� ������ ����.
	AI_Output(hero,self,"Info_Milten_OCMINE_15_03");	//�� ��� ���?
	AI_Output(self,hero,"Info_Milten_OCMINE_02_04");	//��. ��� � � �����, ��� ����� ����������.
};


instance Info_Milten_OCKDW(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCKDW_Condition;
	information = Info_Milten_OCKDW_Info;
	important = 0;
	permanent = 0;
	description = "�� ������� ���-�� � ����� ����.";
};


func int Info_Milten_OCKDW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return TRUE;
	};
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output(hero,self,"Info_Milten_OCKDW_15_01");	//�� ������� ���-�� � ����� ����.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_02");	//� ���� ������ ��, ��� ������ ����� ����, ��� ����� ����������, �� ���� ����� ������.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_03");	//����� � �������� �� ��������, ��������� � ����� �������� ������ �� ����.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_04");	//��� �������� ���� ����������. ��� ���� ������� ����.
};


instance Info_Milten_OCWHY(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCWHY_Condition;
	information = Info_Milten_OCWHY_Info;
	important = 0;
	permanent = 0;
	description = "����� ������� ����� ���� ����� �����? ��� �� �����...";
};


func int Info_Milten_OCWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCKDW))
	{
		return TRUE;
	};
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output(hero,self,"Info_Milten_OCWHY_15_01");	//����� ������� ����� ���� ������� �����? ��� �� �����!
	AI_Output(self,hero,"Info_Milten_OCWHY_02_02");	//�� ����. �� � ���� �� ���� ����� �������� �� ���� � ����������. ��� ����� �� ������� �� ����.
	AI_Output(self,hero,"Info_Milten_OCWHY_02_03");	//��������, ����� ���-�� �����. ��� ��� � �� ����� �� ��� � ������.
};


instance Info_Milten_OCYOU(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCYOU_Condition;
	information = Info_Milten_OCYOU_Info;
	important = 0;
	permanent = 0;
	description = "�� ������ ���������� ���, ��� ��� �� ������ ���� �����.";
};


func int Info_Milten_OCYOU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCKDW))
	{
		return TRUE;
	};
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output(hero,self,"Info_Milten_OCYOU_15_01");	//�� ������ ���������� ���, ��� ��� �� ������ ���� �����.
	AI_Output(self,hero,"Info_Milten_OCYOU_02_02");	//���. �� � ����� ������������ ������������ �� �������� � ������������� ����� ������ �� ������ �������. ��� ���� ������ �� �����������!
	if(!Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		AI_Output(self,hero,"Info_Milten_OCYOU_02_03");	//����������, �������� � ���!
	}
	else
	{
		B_LogEntry(CH4_Firemages,"����� ����, ��� ����� ��������� ��� � �������� � ������ ������, � �������� ��������. �������, ���� ������ �� ������ �� �����.");
	};
};


instance Info_Milten_OCDIEGO(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCDIEGO_Condition;
	information = Info_Milten_OCDIEGO_Info;
	important = 0;
	permanent = 0;
	description = "��� � ���� ����� �����?";
};


func int Info_Milten_OCDIEGO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCWHY) && Npc_KnowsInfo(hero,Info_Milten_OCYOU) && !Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return TRUE;
	};
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output(hero,self,"Info_Milten_OCDIEGO_15_01");	//��� � ���� ����� �����?
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_02");	//�� ���������� � ������ �����, �� ������ ����� ������.
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_03");	//����������, �������� � ���!
	B_LogEntry(CH4_Firemages,"�������� �� ������� ������ ���� �������� �������. �� ��������� �� ������ �� ������ ����� � �������� ����� ����.");
	B_LogEntry(CH4_Firemages,"����� �������� �� ������ ������� ������, �������� �� �����. ��� ������ ����� � ��� ����������. �� ����� � ����������� ������� �����.");
};


instance Info_Milten_LOADSWORD(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD_Condition;
	information = Info_Milten_LOADSWORD_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_LOADSWORD_Condition()
{
	if(LoadSword)
	{
		return TRUE;
	};
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_LOADSWORD_02_01");	//����������� ����, ��� ����. ����� ���� ������ � ��� ���, ��� �� �������� ��������� ���.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_02");	//������, �������. � ��� ��� ����� ������ ����������.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_03");	//� �� � ������������� ��������� �� ���� ��� ����, �� ������ �� ��� ��� �������. � ����� �����.
};


instance Info_Milten_LOADSWORD1(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD1_Condition;
	information = Info_Milten_LOADSWORD1_Info;
	important = 0;
	permanent = 0;
	description = "�������, ��� ����� ���� ������!";
};


func int Info_Milten_LOADSWORD1_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LOADSWORD))
	{
		return 1;
	};
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_01");	//�������, ��� ����� ���� ������!
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_02");	//��� ���������? ��� � ���� ���� ������?
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_03");	//� �������� ���� �� ���� ���, ��� ��� ����� �� �������.
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_04");	//������. ��� �� ����.
	Npc_ExchangeRoutine(self,"LSAway");
	AI_StopProcessInfos(self);
};


instance Info_Milten_LSAWAY(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSAWAY_Condition;
	information = Info_Milten_LSAWAY_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_LSAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LOADSWORD1) && (Npc_GetDistToWP(hero,"NC_KDW04_IN") < 500))
	{
		return TRUE;
	};
};

func void Info_Milten_LSAWAY_Info()
{
	if((hero.attribute[ATR_STRENGTH] < 30) || (Npc_HasItems(hero,ItMw_2H_Sword_Heavy_03) || Npc_HasItems(hero,Innos_Zorn) || Npc_HasItems(hero,Gorns_Rache) || Npc_HasItems(hero,Roter_Wind) || Npc_HasItems(hero,Lees_Axt) || Npc_HasItems(hero,Thorus_Schwert) || Npc_HasItems(hero,ItMw_2H_Sword_Heavy_04) || Npc_HasItems(hero,ItMw_2H_Axe_Heavy_01) || Npc_HasItems(hero,Oriks_Axt) || Npc_HasItems(hero,ItMw_2H_Axe_Heavy_02) || Npc_HasItems(hero,ItMw_2H_Axe_Heavy_04) || Npc_HasItems(hero,Torlofs_Axt) || Npc_HasItems(hero,ItMw_2H_Axe_Heavy_03)))
	{
		CreateInvItem(hero,demourizel);
	};
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_01");	//������ �����������, ��� ���������?
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_02");	//��� ����� ������� ������ ����, � � �����, ��� ���� ���� �� ���������� ������ ��� �������� ��.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_03");	//�� ������?
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_04");	//������ �� ����� ������. � ��������, ��� �������.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_05");	//� ����� ��������, ����������.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_06");	//�� ������ ���, ��� ����� ������.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_07");	//�������? �� ���� �������!
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_08");	//����� �� ������������ � ��� � ��� ����� ���, ��� �� ������� ������ ������.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_09");	//� ������� � ���.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_10");	//����� ���� ������������ ���� �������� ����?
	if(Npc_HasItems(hero,Mythrilklinge01))
	{
		AI_Output(hero,self,"Info_Milten_LSAWAY_15_11");	//� ���� �������� �� ����� ����.
		AI_EquipBestMeleeWeapon(hero);
		AI_ReadyMeleeWeapon(hero);
		AI_Output(self,hero,"Info_Milten_LSAWAY_02_12");	//��, ��! ��� ��� ������!
		AI_Output(hero,self,"Info_Milten_LSAWAY_15_13");	//��� ��� �������!
		AI_RemoveWeapon(hero);
	};
};


instance Info_Milten_LOADSWORD4(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD4_Condition;
	information = Info_Milten_LOADSWORD4_Info;
	important = 0;
	permanent = 0;
	description = "������� ��� ��� ����������, ������� �������� ���� ���� ����.";
};


func int Info_Milten_LOADSWORD4_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSAWAY))
	{
		return 1;
	};
};

func void Info_Milten_LOADSWORD4_Info()
{
	if(Npc_HasItems(hero,demourizel))
	{
		Npc_RemoveInvItem(hero,demourizel);
		AI_EquipBestMeleeWeapon(hero);
	};
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_01");	//������� ��� ��� ����������, ������� �������� ���� ���� ����.
	if(Npc_HasItems(hero,Scroll4Milten))
	{
		b_printtrademsg1("������ ���������� �������� �������.");
	};
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_02");	//���� ����� ����� ��������� ���, ����� � ������� ��� � ����.
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_03");	//��, ��, ���� ��� ����� ������ �������� ����������...
	if(Npc_HasItems(hero,Scroll4Milten))
	{
		B_UseFakeScroll();
	};
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_04");	//�� � ��� ��������� �������� � ��������� � ������� ������!
	if(Npc_HasItems(hero,Scroll4Milten))
	{
		b_printtrademsg2("�������� ���������� �������� �������.");
	};
};


instance Info_Milten_LSRISK(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSRISK_Condition;
	information = Info_Milten_LSRISK_Info;
	important = 0;
	permanent = 0;
	description = "�� ������ ��������!";
};


func int Info_Milten_LSRISK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LOADSWORD4))
	{
		return TRUE;
	};
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output(hero,self,"Info_Milten_LSRISK_15_01");	//�� ������ ��������!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_02");	//��� ����� �����!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_03");	//����� ��� ���� ������� �������!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_04");	//� �� �������...
	AI_Output(hero,self,"Info_Milten_LSRISK_15_05");	//��� ������� ��� ��������� ������. ������ ���!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_06");	//��, ������. ����� ����� ����, ��� �� ��� ��� ������, � �� ���� ���������� � ���� ����� ��� � ������ ��������.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_07");	//������ �����, ������, � ������� ���� ��������.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_08");	//���������� ����� �������� ����, �... ������ �� ������ �� ����!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_09");	//������. ���������� � ������ ����.
	B_LogEntry(CH5_Uriziel,"� ���� ������� ����� ����� �������� ������ ��� ��������� ������� ���������� ���� � ���. �� ������������ ����������� � �������� ������ ����.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LSOreHeap");
};


instance INFO_MILTEN_OREGUARD(C_Info)
{
	npc = PC_Mage;
	condition = info_milten_oreguard_condition;
	information = info_milten_oreguard_info;
	important = 1;
	permanent = 0;
};


func int info_milten_oreguard_condition()
{
	if(Npc_KnowsInfo(hero,info_oreguard))
	{
		return TRUE;
	};
};

func void info_milten_oreguard_info()
{
	AI_Output(hero,self,"DIA_Huno_YouKnowYourJob_15_00");	//� � ���� ������� ����������, ��� � ����.
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06");	//��� �� ����.
	Npc_ExchangeRoutine(self,"LSOreHeap2");
	AI_StopProcessInfos(self);
};


instance Info_Milten_LSOREHEAP(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSOREHEAP_Condition;
	information = Info_Milten_LSOREHEAP_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_LSOREHEAP_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSRISK) && (Npc_GetDistToWP(hero,"NC_PATH41") < 500))
	{
		return TRUE;
	};
};

func void Info_Milten_LSOREHEAP_Info()
{
	AI_Output(self,hero,"Info_Milten_LSOREHEAP_02_01");	//�� ������ ��� � ����������?
};


instance Info_Milten_LSNOW(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSNOW_Condition;
	information = Info_Milten_LSNOW_Info;
	important = 0;
	permanent = 0;
	description = "��� ����������!";
};


func int Info_Milten_LSNOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSOREHEAP) && Npc_HasItems(hero,Mythrilklinge01) && Npc_HasItems(hero,Scroll4Milten) && (Npc_GetDistToWP(hero,"NC_PATH41") < 1000))
	{
		return TRUE;
	};
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output(hero,self,"Info_Milten_LSNOW_15_01");	//��� ����������!
	b_printtrademsg1("������ ���������� �������� �������.");
	AI_Output(hero,self,"Info_Milten_LSNOW_15_02");	//�� �����?
	AI_Output(self,hero,"Info_Milten_LSNOW_02_03");	//���� ������ ���-������ ����� ���� ����� � �����...
	AI_Output(hero,self,"Info_Milten_LSNOW_15_04");	//����� ����� ������!
	B_GiveInvItems(hero,self,Scroll4Milten,1);
	StartChaptersSix = TRUE;
	AI_StopProcessInfos(self);
};


instance Info_Milten_CHAPTERSIX(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_CHAPTERSIX_Condition;
	information = Info_Milten_CHAPTERSIX_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_CHAPTERSIX_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSNOW) && StartChaptersSix)
	{
		return TRUE;
	};
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"NC_PIT_CENTER");
	B_Kapitelwechsel(6);
};


instance Info_Milten_LSDONE(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSDONE_Condition;
	information = Info_Milten_LSDONE_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_LSDONE_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void Info_Milten_LSDONE_Info()
{
	AI_Output(self,hero,"Info_Milten_LSDONE_02_01");	//������!
	if(hero.attribute[ATR_STRENGTH] >= 30)
	{
		AI_EquipBestMeleeWeapon(hero);
		AI_ReadyMeleeWeapon(hero);
		AI_PlayAni(hero,"T_URISELINSPECT");
		AI_RemoveWeapon(hero);
		AI_Output(hero,self,"Info_Milten_LSDONE_15_02");	//����������! ���� ������ ��� �����, � ������ �� �������� ����� ����!
	};
	AI_Output(self,hero,"Info_Milten_LSDONE_02_03");	//������, � ��� ����������! ���������� ���� ���� ���� ���� ������ ��������� � ����� ������ ����.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_04");	//��, �������, �� ��������� � ���� ������� ����� ��������.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_05");	//���� �������� ��������������� ����������� ������, ��� ���� ����� ��������� ������!
	if(!Npc_HasItems(hero,itarrune_1_6_teleport3) && !Npc_HasItems(hero,itarrune_1_5_teleport5))
	{
		b_printtrademsg1("������� ������ ������������.");
		CreateInvItem(hero,ItArScrollTeleport5);
	};
	AI_Output(hero,self,"Info_Milten_LSDONE_15_06");	//� ��� ����� � �����?
	AI_Output(self,hero,"Info_Milten_LSDONE_02_07");	//��� ��� �� ��������, � ���-������ ��������. �����!
	if((hero.attribute[ATR_MANA] < 5) && !Npc_HasItems(hero,ItFo_Potion_Mana_01) && !Npc_HasItems(hero,ItFo_Potion_Mana_02) && !Npc_HasItems(hero,ItFo_Potion_Mana_03))
	{
		b_printtrademsg2("�������� �������� ���������� �������.");
		CreateInvItem(hero,ItFo_Potion_Mana_01);
	};
	B_Story_UrizielLoaded();
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(PC_Thief,"Reunion");
	if(Npc_KnowsInfo(hero,Info_Gorn_DIEGOMILTEN))
	{
		B_ExchangeRoutine(PC_Fighter,"Reunion");
	};
	if(Npc_KnowsInfo(hero,Info_Lester_DIEGOMILTEN))
	{
		B_ExchangeRoutine(PC_Psionic,"Reunion");
	};
	AI_StartState(self,zs_miltensescape,1,"");
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};

