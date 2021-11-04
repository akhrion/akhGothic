
instance DIA_Cutter_Exit(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 999;
	condition = DIA_Cutter_Exit_Condition;
	information = DIA_Cutter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Cutter_Exit_Condition()
{
	return 1;
};

func void DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cutter_Hello(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Hello_Condition;
	information = DIA_Cutter_Hello_Info;
	permanent = 0;
	description = "��, ����� ������� �����.";
};


func int DIA_Cutter_Hello_Condition()
{
	if(!C_NpcBelongsToOldCamp(other) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Cutter_Hello_Info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//��, ����� ������� �����.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//������ � ���� ����� �� �����. ��� ��?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//� ����� �������. ���� ������� ��������� ��� �����.
};


instance DIA_Cutter_Burg(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Burg_Condition;
	information = DIA_Cutter_Burg_Info;
	permanent = 0;
	description = "�� ������ ���������� ��� ���-������ � �����?";
};


func int DIA_Cutter_Burg_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Hello) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Cutter_Burg_Info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//�� ������ ���������� ��� ���-������ � �����?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//����� �������� ��������� �� ��� ����� ������� � ��� ������. ������ ����� ������ �� ����� ������������ � ����.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//� ��� ����� �����, ��� ����� ����� ����� �������������� � ������.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//��� � �� �������, ����� ��� �� ������ � ����������� � �������� �� �����, �� ��� ����� ����������� ����� �����������.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//��� ��� ������ ���� ����������?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//��, �� ������ ��� �����. �� ������ ��������� ���� ����� �� ���������.
};


instance DIA_Cutter_PERM(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_PERM_Condition;
	information = DIA_Cutter_PERM_Info;
	permanent = 1;
	description = "��� ������� ����� ����������?";
};


func int DIA_Cutter_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Burg) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Cutter_PERM_Info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//��� ������� ����� ����������?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//�������� �������. ��� ������ ���������� � �������. � ���� ����� �� ���������.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//� ��� �����.
	AI_StopProcessInfos(self);
};


instance GRD_208_Cutter_WELCOME(C_Info)
{
	npc = GRD_208_Cutter;
	condition = GRD_208_Cutter_WELCOME_Condition;
	information = GRD_208_Cutter_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_208_Cutter_WELCOME_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GRD) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void GRD_208_Cutter_WELCOME_Info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//�� ������ ���������� �������. �����, ���� ���������� ���� ����������.
	AI_StopProcessInfos(self);
};


instance INFO_CUTTER_DIE(C_Info)
{
	npc = GRD_208_Cutter;
	condition = info_cutter_die_condition;
	information = info_cutter_die_info;
	permanent = 0;
	important = 1;
};


func int info_cutter_die_condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void info_cutter_die_info()
{
	AI_GotoNpc(self,hero);
	if((oldHeroGuild == GIL_STT) || (oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		if(oldHeroGuild == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01");	//����� ��� �������� ���������! � �� ��� �������� ���� ����������!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02");	//������, ������ �� �������� ����� ���� �� ����������!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03");	//���� �� ��������� �������� ����������!
		};
		AI_Output(hero,self,"VLK_585_Aleph_GUARDS_Info_15_01");	//� ��� �� ��������?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05");	//�� ������ �����-�� ���� � ����� �������, ��?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06");	//������, �� � ��� ���...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07");	//� �� �����, ��� ��� ����� ������������ �����?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08");	//�������� ����� ���� ���� �����...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09");	//���������� ������ �������.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10");	//��� ����, ���������!
		if(Npc_KnowsInfo(hero,Info_Fletcher_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"�����, ������� ������ �������� ������� ������, ����� ���� ����� ��� ��, ��� � �������. �� ���-�� ����� � ���, ��� � ��� ������� ��� ������ ������.");
		}
		else if(!Npc_KnowsInfo(hero,Info_Jackal_PAYDAY) && !Npc_KnowsInfo(hero,Info_Fletcher_DIE) && !Npc_KnowsInfo(hero,info_grd238_die))
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"�����, ������� ������ ������ � ������� ���������� �������� �������� ������, ������ ���� ���������� � ������������. ��� ���������� ���������� �� ����� �� ����!");
			B_LogEntry(CH4_BannedFromOC,"�������, ���� �������� �� ������� ������!");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11");	//� ��� ��� �� ��������� ����� �� ������ ������? ���������� ��������!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12");	//� �� ������� ����� �� ������ ��������� ������? ��� ����� � ����� �������!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13");	//��� �����? � ��� �� ��������?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14");	//��� �� ������ �� ������ � ��������� �� ����� �����, ��?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15");	//� ��� ��...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16");	//������, �� �� �� ����� ��������� ���� ����������� �����. �� ������ ������� �����!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17");	//��, � �� ���� ������� � �����...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18");	//�� ���� ������ ����� ���� ������!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19");	//���, � ���� ������...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20");	//� ������, ������! ����� ���!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	B_ExchangeRoutine(GRD_232_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_229_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_216_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_217_Torwache,"FMTaken2");
	if((GETNEWGUY_STARTED == TRUE) && (OC_BANNED == FALSE))
	{
		B_LogEntry(CH1_RecruitDusty,"������ � �� ����� ������� ����-���� �� ������� ������.");
		Log_SetTopicStatus(CH1_RecruitDusty,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	B_SetPermAttitude(GRD_208_Cutter,ATT_HOSTILE);
	B_SetPermAttitude(GRD_232_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_229_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_216_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_217_Torwache,ATT_HOSTILE);
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,Info_Fletcher_DIE) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		B_LogEntry(CH4_Firemages,"������ � ������ ������ ������� � ���������� �����������. ��� �������� �� ������, ��� �������� ������� �����������, ����� ������� � ���.");
	};
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
	if(C_NpcBelongsToOldCamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_None);
		hero.guild = GIL_None;
	};
};

