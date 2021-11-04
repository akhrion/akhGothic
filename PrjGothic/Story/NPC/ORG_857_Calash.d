
instance ORG_857_Calash(Npc_Default)
{
	name[0] = "�����";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 11;
	voice = 19;
	id = 857;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Bald",10,1,org_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,ItFoRice);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItems(self,ItMiNugget,5);
	CreateInvItem(self,ItFoBooze);
	CreateInvItem(self,ItKeLockpick);
	EquipItem(self,ItMw_1H_Mace_War_01);
	daily_routine = Rtn_prestart_857;
};


func void Rtn_prestart_857()
{
	TA_StandAround(6,0,0,0,"FMC_HUT08_OUT");
	TA_StandAround(0,0,6,0,"FMC_HUT08_OUT");
};

func void rtn_fmtaken_857()
{
	ta_sit(1,0,13,0,"FMC_HUT07_IN");
	ta_sit(13,0,1,0,"FMC_HUT07_IN");
};

func void rtn_fmtakenback_857()
{
	TA_StandAround(1,0,13,0,"LOCATION_11_13");
	TA_StandAround(13,0,1,0,"LOCATION_11_13");
};


instance INFO_CALASH_EXIT(C_Info)
{
	npc = ORG_857_Calash;
	nr = 999;
	condition = info_calash_exit_condition;
	information = info_calash_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_calash_exit_condition()
{
	return 1;
};

func void info_calash_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_CALASH_DIA1(C_Info)
{
	npc = ORG_857_Calash;
	nr = 1;
	condition = info_calash_dia1_condition;
	information = info_calash_dia1_info;
	permanent = 0;
	description = "� ���� ���� ��� ���� ������.";
};


func int info_calash_dia1_condition()
{
	if(Npc_HasItems(hero,calashnote) || Npc_HasItems(hero,calashnote2))
	{
		return TRUE;
	};
};

func void info_calash_dia1_info()
{
	AI_Output(hero,self,"Calash_DIA1_00");	//� ���� ���� ��� ���� ������.
	b_printtrademsg1("������ ������.");
	if(Npc_HasItems(hero,calashnote))
	{
		B_GiveInvItems(hero,self,calashnote,1);
	}
	else if(Npc_HasItems(hero,calashnote2))
	{
		B_GiveInvItems(hero,self,calashnote2,1);
	};
	B_UseFakeScroll();
	if(FMTaken == TRUE)
	{
		AI_Output(self,hero,"Calash_DIA1_02");	//��� �� ��������... �����, ��� �� ������ �����, � ��� ��� ������� ���� ������.
		AI_Output(self,hero,"Calash_DIA1_03");	//������ ��� ������ ������! �� ������ � ����� ����, ��� ����� ���������? �� � ����� �����!
		if(Lee_freeminereport == 0)
		{
			AI_Output(self,hero,"Calash_DIA1_04");	//������, ���� ������, ���� ������! � ��� ������� �������� ����� � ���� ��� ����.
		};
		AI_StopProcessInfos(self);
		if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
		{
			B_LogEntry(QUENTIN_GANG,"����� ����� �� �������� �� ����.");
		};
	}
	else
	{
		AI_Output(self,hero,"Calash_DIA1_01");	//��� ���������... ��� ��������, ��� �� ������ �����!
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,hero);
		AI_StartState(self,ZS_Attack,1,"");
		if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
		{
			B_LogEntry(QUENTIN_GANG,"����� ����� �� ����!");
		};
	};
	B_GiveXP(200);
};


instance CALASH_DIA2(C_Info)
{
	npc = ORG_857_Calash;
	nr = 1;
	condition = calash_dia2_condition;
	information = calash_dia2_info;
	permanent = 0;
	important = 1;
};


func int calash_dia2_condition()
{
	if(FMTaken == TRUE)
	{
		return 1;
	};
};

func void calash_dia2_info()
{
	AI_DrawWeapon(self);
	AI_Output(self,hero,"Calash_DIA2_01");	//�� ������� �� ���!
	AI_Output(hero,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//���������! ���� �����, � ������ ����?
	AI_Output(self,hero,"Calash_DIA2_02");	//�� ����, �� �� ����������� ���� �����?
	AI_Output(hero,self,"Info_Swiney_Schuerfer_Nein_15_00");	//���.
	AI_Output(self,hero,"Calash_DIA2_03");	//�����... ������...
	AI_RemoveWeapon(self);
};


instance INFO_CALASH_DIA3(C_Info)
{
	npc = ORG_857_Calash;
	nr = 1;
	condition = info_calash_dia3_condition;
	information = info_calash_dia3_info;
	permanent = 0;
	description = "���� ������ ������ �� ������!";
};


func int info_calash_dia3_condition()
{
	if(Lee_freeminereport == 1)
	{
		return TRUE;
	};
};

func void info_calash_dia3_info()
{
	AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01");	//���� ������ ������ �� ������!
	AI_Output(self,hero,"Calash_DIA3_01");	//�������! ������ � ���� ��������� � ������!
	B_GiveXP(100);
	Npc_ExchangeRoutine(self,"FMTakenBack");
	AI_StopProcessInfos(self);
};

