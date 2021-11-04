
instance KDF_401_Damarok_WELCOME(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_WELCOME_Condition;
	information = KDF_401_Damarok_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDF_401_Damarok_WELCOME_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE) && Npc_KnowsInfo(hero,KDF_403_Drago_RUNE) && Npc_KnowsInfo(hero,KDF_405_Torrez_BOOK) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_WELCOME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"KDF_401_Damarok_Alchemy_01");	//������ � ���� ������� ���� ����� � ������� ���� ��������� �������.
	if(ALCHEMYACTIVE == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"��� ���� ������� ����� ������� ���� �������.");
	};
	Corristo_KDFAufnahme = 6;
	B_Story_Feueraufnahme();
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_Exit(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 999;
	condition = KDF_401_Damarok_Exit_Condition;
	information = KDF_401_Damarok_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int KDF_401_Damarok_Exit_Condition()
{
	return TRUE;
};

func void KDF_401_Damarok_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance KDF_401_DAMAROK_TEACH(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_teach_condition;
	information = kdf_401_damarok_teach_info;
	important = 0;
	permanent = 1;
	description = "� ���� ������� ���������� ������.";
};


func int kdf_401_damarok_teach_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDF) && (LOG_DAMAROKTRAIN == FALSE))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_teach_info()
{
	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01");	//� ���� ������� ���������� ������.
	if(ALCHEMYACTIVE == FALSE)
	{
		AI_Output(self,other,"KDF_401_Damarok_Alchemy_02");	//��� �� ������ ������?
		Info_ClearChoices(kdf_401_damarok_teach);
		Info_AddChoice(kdf_401_damarok_teach,DIALOG_BACK,kdf_401_damarok_teach_back);
		Info_AddChoice(kdf_401_damarok_teach,"������� (10 ����� ��������)",kdf_401_damarok_teach_alchemy);
	}
	else
	{
		AI_Output(self,other,"KDF_401_Damarok_Alchemy_05");	//�� ��� ������ ���, ���� � ��� ������� ����.
		LOG_DAMAROKTRAIN = TRUE;
	};
};

func void kdf_401_damarok_teach_back()
{
	Info_ClearChoices(kdf_401_damarok_teach);
};

func void kdf_401_damarok_teach_alchemy()
{
	if(hero.lp < 10)
	{
		PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Info_ClearChoices(kdf_401_damarok_teach);
		Info_AddChoice(kdf_401_damarok_teach,DIALOG_BACK,kdf_401_damarok_teach_back);
		Info_AddChoice(kdf_401_damarok_teach,"������� (10 ����� ��������)",kdf_401_damarok_teach_alchemy);
	}
	else
	{
		AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//������ ����� ������.
		AI_Output(self,other,"KDF_401_Damarok_Alchemy_03");	//����� ����������� ����� �� ������������ �����, ���� ����������� ������������ ��������.
		AI_Output(self,other,"KDF_401_Damarok_Alchemy_04");	//����� ���� ����������� ��������� �������� � ������ �����������.
		Log_CreateTopic("�������",LOG_NOTE);
		B_LogEntry("�������","������� ��������� ��� � ������� ����������� ��� ������������� �����. ������ ����� ������ �������.");
		PrintScreen("������ ����� �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",4);
		hero.lp = hero.lp - 10;
		ALCHEMYACTIVE = TRUE;
		Npc_SetTalentSkill(hero,NPC_TALENT_REGENERATE,1);
		if(Npc_HasItems(KDF_405_Torrez,alchemybook))
		{
			Npc_RemoveInvItem(KDF_405_Torrez,alchemybook);
		};
		if(Npc_HasItems(KDW_604_Cronos,alchemybook))
		{
			Npc_RemoveInvItem(KDW_604_Cronos,alchemybook);
		};
		if(Npc_HasItems(NOV_1357_Fortuno,alchemybook))
		{
			Npc_RemoveInvItem(NOV_1357_Fortuno,alchemybook);
		};
		if(Npc_HasItems(STT_329_Dexter,alchemybook))
		{
			Npc_RemoveInvItem(STT_329_Dexter,alchemybook);
		};
		if(Npc_HasItems(KDW_605_Riordian,alchemybook))
		{
			Npc_RemoveInvItem(KDW_605_Riordian,alchemybook);
		};
		LOG_DAMAROKTRAIN = TRUE;
		Info_ClearChoices(kdf_401_damarok_teach);
	};
};


instance KDF_401_DAMAROK_TRADE(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_trade_condition;
	information = kdf_401_damarok_trade_info;
	important = 0;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int kdf_401_damarok_trade_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void kdf_401_damarok_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//������ ��� ���� ������.
};

