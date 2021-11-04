
instance STT_301_IAN_Exit(C_Info)
{
	npc = STT_301_Ian;
	nr = 999;
	condition = STT_301_IAN_Exit_Condition;
	information = STT_301_IAN_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_301_IAN_Exit_Condition()
{
	return 1;
};

func void STT_301_IAN_Exit_Info()
{
	AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01");	//���� ��������� �����?
	AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02");	//������ �� �������� ��� ������ �������.
	AI_StopProcessInfos(self);
};


instance STT_301_IAN_HI(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_HI_Condition;
	information = STT_301_IAN_HI_Info;
	important = 0;
	permanent = 0;
	description = "�� ��, ������� ������� � ���� �����?";
};


func int STT_301_IAN_HI_Condition()
{
	if(!Npc_KnowsInfo(hero,stt_301_ian_nest))
	{
		return TRUE;
	};
};

func void STT_301_IAN_HI_Info()
{
	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01");	//�� ��, ������� ������� � ���� �����?
	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02");	//��, ���� ����� ��. ��� ��� �����. ���� ����� ������ ����� �� �������, � ���������� ������ �� �������.
};


instance STT_301_IAN_GOMEZ(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GOMEZ_Condition;
	information = STT_301_IAN_GOMEZ_Info;
	important = 0;
	permanent = 0;
	description = "� �����, ��� ��� ����� ����������� ������.";
};


func int STT_301_IAN_GOMEZ_Condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void STT_301_IAN_GOMEZ_Info()
{
	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01");	//� �����, ��� ��� ����� ����������� ������.
	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02");	//�������, ��� ����� ����������� ������� ������, �� �����, �����, ��� ������ ����������� ��� � ������ ������.
};


instance STT_301_IAN_ORE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_ORE_Condition;
	information = STT_301_IAN_ORE_Info;
	important = 0;
	permanent = 0;
	description = "�� ������ ���������� ��� � ������ ����?";
};


func int STT_301_IAN_ORE_Condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_gomez))
	{
		return TRUE;
	};
};

func void STT_301_IAN_ORE_Info()
{
	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01");	//�� ������ ���������� ��� � ������ ����?
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02");	//�������� �������� ����� ���� ���� � �����. ���� ��������� ���������� 220 ������ ����, 20 �� ��� ���� �� ����������.
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03");	//�� ���� ����, ������� �� ���������� ������, ����� �������� �� ���� ����� �������.
};


instance STT_301_IAN_MORE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MORE_Condition;
	information = STT_301_IAN_MORE_Info;
	important = 0;
	permanent = 0;
	description = "� ������, ��� ��� �� ������� ����... �� ������ ���������� � ���?";
};


func int STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_ore);
};

func void STT_301_IAN_MORE_Info()
{
	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01");	//� ������, ��� ��� �� ������� ����, � ����������. �� ������ ���������� ��� � ���?
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02");	//���������� ���� �������� ������� ����������. ������ �� ��� ������� �� ��������, � ������ ������� ������� ������, ��� �� �������� ������.
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03");	//����� ������ � ����� ������� ����� ��������� ������������ � ����� �����.
};


instance STT_301_IAN_MAGIC(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MAGIC_Condition;
	information = STT_301_IAN_MAGIC_Info;
	important = 0;
	permanent = 0;
	description = "� �� ������ � ���� ��� ���-������?";
};


func int STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_more);
};

func void STT_301_IAN_MAGIC_Info()
{
	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01");	//� �� ������ � ���� ��� ���-������?
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02");	//� ���������, ���� ������ ���������� �������� ��� ����������. ������ � ���������� �������� ����� ���������� ������.
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03");	//�� ���� � ���� ������ ������ �� ����� ���� ����������� ������� ������ �� ������ ���������� � ������� ������� ���� �����.
};


instance STT_301_IAN_MINE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MINE_Condition;
	information = STT_301_IAN_MINE_Info;
	important = 0;
	permanent = 0;
	description = "�������� ��� �� ���� �����.";
};


func int STT_301_IAN_MINE_Condition()
{
	if((Kapitel < 3) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void STT_301_IAN_MINE_Info()
{
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01");	//�������� ��� �� ���� �����.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02");	//���� �� �������� ��������� �����, ���� �� ������� ������ �������� �� ��������� ������. � ������� ������ ������� ����� ����� ��������.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03");	//� ���������� �� ��������� ����������. ������� ����� ������� ��� ������ �� ������, �� �� ���� ���������� �������� ������, ��� ������ ���� ��������.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04");	//������, � ��� �������.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05");	//�����, � ���� ��� ����� ���. �� �����, �� ����� ���� ����� ��������.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06");	//� ������ �������� �����.
};


instance STT_301_IAN_WANTLIST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_WANTLIST_Condition;
	information = STT_301_IAN_WANTLIST_Info;
	important = 0;
	permanent = 0;
	description = "��� ����� ������� ������ ��� ������.";
};


func int STT_301_IAN_WANTLIST_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && !Npc_KnowsInfo(hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};
};

func void STT_301_IAN_WANTLIST_Info()
{
	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01");	//��� ����� ������� ������ ��� ������.
	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02");	//��� ��� ������ ����� �������. ��������!
};


instance STT_301_IAN_GETLIST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GETLIST_Condition;
	information = STT_301_IAN_GETLIST_Info;
	important = 0;
	permanent = 0;
	description = "����� ������� ���� ����. � ������ ������� ������.";
};


func int STT_301_IAN_GETLIST_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && Npc_KnowsInfo(hero,Info_Diego_IanPassword) && !Npc_KnowsInfo(hero,stt_301_ian_steallist))
	{
		return TRUE;
	};
};

func void STT_301_IAN_GETLIST_Info()
{
	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//����� ������� ���� ����. � ������ ������� ������.
	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02");	//�������, ��� ���� ������. ��� ������ ������������ � ���������.
	b_printtrademsg1("������� ������.");
	B_LogEntry(CH1_BringList,"�� ��� ������� ������� ��� ������ ��� �����.");
	B_GiveInvItems(self,hero,TheList,1);
	Npc_RemoveInvItem(self,TheList);
};


instance STT_301_IAN_NEST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_NEST_Condition;
	information = STT_301_IAN_NEST_Info;
	important = 0;
	permanent = 0;
	description = "���-�� ����� ������ ���� ������ ��������.";
};


func int STT_301_IAN_NEST_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_RUNNING) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return 1;
	};
};

func void STT_301_IAN_NEST_Info()
{
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01");	//���-�� � ���� ����� ���� ������ ��� ������ ��������.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02");	//� �����, � ����� ����� ����� �� �����.
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03");	//������, ��� ����� ����� ���� �� ���...
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04");	//� ���� ������ ��� �� ��� �������. � ��� ����� ��������. ���� ����� ����� ��������� ����������. ��� ������ �����.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05");	//� � �� ����, ��� ����� ����� ����� �����.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06");	//�� ���� �� �������� �������� �����. � ������ ����.
	B_LogEntry(CH2_MCEggs,"�� �� ����� �������� ��� ������ ������ ��������. ������� � ������ ����� ��� ����� ����������. �� ������, ��� ������� ���������� � ����� �� ����������� ������. ���-�� ��� ������ ������ ������ �����.");
	Ian_gearwheel = LOG_RUNNING;
};


instance STT_301_IAN_GEAR_RUN(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GEAR_RUN_Condition;
	information = STT_301_IAN_GEAR_RUN_Info;
	important = 0;
	permanent = 0;
	description = "� ��� � ���� ����� ��� ����� ����������?";
};


func int STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt(PD_MISSION,"Ian_gearwheel:",Ian_gearwheel);
	if((Ian_gearwheel == LOG_RUNNING) && !Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};

func void STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01");	//� ��� � ���� ����� ��� ����� ����������?
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02");	//������� �� ����. � ���� ������� ��, ������� � ��.
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03");	//������, ��-�����, � ����� �� ������ ���� ������ ��������� �����.
};


instance STT_301_IAN_GEAR_SUC(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GEAR_SUC_Condition;
	information = STT_301_IAN_GEAR_SUC_Info;
	important = 0;
	permanent = 0;
	description = "� ����� ����������.";
};


func int STT_301_IAN_GEAR_SUC_Condition()
{
	if(Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01) && (Ian_gearwheel == LOG_RUNNING))
	{
		return 1;
	};
};

func void STT_301_IAN_GEAR_SUC_Info()
{
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP(XP_BringGearWheel);
	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01");	//� ����� ����������.
	b_printtrademsg1("������ ����������.");
	Npc_RemoveInvItem(hero,ItMi_Stuff_Gearwheel_01);
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02");	//�! �������� ������! �����, ��� ��� ��� ��������. ��� �, �������� � ����� ��������. �� ����� ������ ��������, ��? ��...
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03");	//����� � �������, �� ������� ���� ������. ��������, ��, ��� �� �����, ��������� ������ ���.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04");	//����� ���: '��� ����� � �������'. ��� �� ������, ��� � ��� ���� ��������.
	B_LogEntry(CH2_MCEggs,"� ������ ��� ����������, ������ �� ������� ������� ������. �� ������, ��� ����� � ���� �������� � ��������, � ������ �������� ��� ����� '��� ����� � �������'. ����� �� ������� ������ � ����������� ����� �����.");
};


instance STT_301_IAN_GOTOASGHAN(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GOTOASGHAN_Condition;
	information = STT_301_IAN_GOTOASGHAN_Info;
	important = 0;
	permanent = 0;
	description = "� ��� ��� �� ����� ������ ��������!";
};


func int STT_301_IAN_GOTOASGHAN_Condition()
{
	if((Ian_gearwheel == LOG_SUCCESS) && !Npc_KnowsInfo(hero,Grd_263_Asghan_NEST))
	{
		return 1;
	};
};

func void STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01");	//� ��� ��� �� ����� ������ ��������!
	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02");	//� �� ������, ����� � �������. �� ����������� ����������. �� ������� ��� �� ������ ���������.
	B_LogEntry(CH2_MCEggs,"���� � ���� ����� ������ ��������, �� ������ ���������� � ��������.");
};


instance STT_301_IAN_AFTERALL(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_AFTERALL_Condition;
	information = STT_301_IAN_AFTERALL_Info;
	important = 0;
	permanent = 0;
	description = "� ����� ������ ��������!";
};


func int STT_301_IAN_AFTERALL_Condition()
{
	if(Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};

func void STT_301_IAN_AFTERALL_Info()
{
	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01");	//� ����� ������ ��������!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02");	//� ����� ����� ����� ���� � ��������!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03");	//�����, �� ��������. �� ������ ���������!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04");	//���, ������ ���� ���� ���� ����. ��� ���� �������.
	b_printtrademsg1("�������� 5 ������� �������� ����.");
	CreateInvItems(self,ItFo_OM_Beer_01,5);
	B_GiveInvItems(self,hero,ItFo_OM_Beer_01,5);
};


instance STT_301_IAN_NOTENOUGH(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_NOTENOUGH_Condition;
	information = STT_301_IAN_NOTENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "� ����� ������ ��������. � ��� � ��� ���� ��� ��� ����.";
};


func int STT_301_IAN_NOTENOUGH_Condition()
{
	if((Npc_HasItems(hero,ItAt_Crawlerqueen) > 1) && (Npc_HasItems(hero,ItAt_Crawlerqueen) < 3))
	{
		return TRUE;
	};
};

func void STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01");	//� ����� ������ ��������. � ��� � ��� ���� ��� ��� ����.
	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02");	//���? �� ����� ��� ���� ���? ��, ��� �, �� ���� �� �������, ��� ������ �������.
};


instance STT_301_IAN_STEALLIST(C_Info)
{
	npc = STT_301_Ian;
	nr = 990;
	condition = stt_301_ian_steallist_condition;
	information = stt_301_ian_steallist_info;
	important = 0;
	permanent = 0;
	description = "(������� ������)";
};


func int stt_301_ian_steallist_condition()
{
	if(!Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack) && !Npc_KnowsInfo(hero,stt_301_ian_getlist) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Success) && Npc_KnowsInfo(hero,org_801_lares_newlist) && Npc_HasItems(self,TheList) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1))
	{
		return TRUE;
	};
};

func void stt_301_ian_steallist_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11");	//������ ����... �... ��� ��� ����� �������!
	AI_Output(self,other,"DIA_ARTO_PERM_13_01");	//�����.
	AI_TurnAway(self,other);
	AI_PlayAni(other,"T_STAND_2_IGET");
	AI_PlayAni(other,"T_IGET_2_STAND");
	AI_PlayAni(self,"T_SEARCH");
	PrintScreen("������� ������.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,TheList);
	Npc_RemoveInvItem(self,TheList);
	AI_WhirlAround(self,other);
	AI_Output(self,other,"SVM_13_YouWannaFoolMe");	//�������� ���� �������? ������ ��������!
	B_LogEntry(THELISTFORNC,"�� �������� ��� � �������� ���� ������. ������ ����� ������� ��� ������ � ����� ������.");
	AI_StopProcessInfos(self);
};

//���� ������� �����? ���..
//��� ���� ������� �� �����? ���..
//�������� ���� ������� �����, �� � ����� �� ����.
//���� ������ ����� ����� ��� ���. �������, ��� ����� ��� ������� ������� � ����� ����, ���� ������� ��� �� ���� �������. ���.. (����������)
//����� �� ������ �����, � ����������� ���� ��������, � �� ���� ������� ���� ����� ����� �� ���, �� ���� �� ������ ��� ������..
//�� � ������� ������, ��� ���� ������� �����. ���.. (������)
