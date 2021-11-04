
instance ORG_899_ALEX(Npc_Default)
{
	name[0] = "�����";
	npcType = npctype_friend;
	guild = GIL_None;
	level = 999;
	voice = 19;
	id = 899;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",39,4,org2l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_start_899;
};


func void rtn_start_899()
{
	ta_sit(7,0,20,0,"OCC_CELLAR_FRONT_LEFT_CELL");
	ta_sit(20,0,7,0,"OCC_CELLAR_FRONT_LEFT_CELL");
};

func void rtn_follow_899()
{
	TA_FollowPC(13,0,14,0,"OCC_CELLAR_FRONT_LEFT_CELL");
	TA_FollowPC(14,0,13,0,"OCC_CELLAR_FRONT_LEFT_CELL");
};

func void rtn_camp_899()
{
	TA_PracticeSword(7,0,20,0,"LOCATION_11_14");
	TA_PracticeSword(20,0,7,0,"LOCATION_11_14");
};

func void rtn_follow2_899()
{
	TA_FollowPC(13,0,14,0,"LOCATION_11_14");
	TA_FollowPC(14,0,13,0,"LOCATION_11_14");
};

func void rtn_remove_899()
{
	TA_Stay(10,0,22,0,"WP_INTRO01");
	TA_Stay(22,0,10,0,"WP_INTRO01");
};


instance INFO_ALEX_EXIT(C_Info)
{
	npc = org_899_alex;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ALEX_LETSGO(C_Info)
{
	npc = org_899_alex;
	condition = info_alex_letsgo_condition;
	information = info_alex_letsgo_info;
	important = 0;
	permanent = 0;
	description = "������ �� ����, ��� ����� ���� ������.";
};


func int info_alex_letsgo_condition()
{
	if((Npc_HasItems(hero,alexstuff) && Npc_HasItems(hero,ItWrOCmap)) || (Npc_KnowsInfo(hero,quentin_dia4) && (FMTaken == TRUE)))
	{
		return TRUE;
	};
};

func void info_alex_letsgo_info()
{
	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01");	//������ �� ����, ��� ����� ���� ������.
	AI_Output(self,hero,"Alex_01_01");	//� �� ������� ����!
	AI_Output(hero,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//���������! ���� �����, � ������ ����?
	AI_Output(self,hero,"Alex_01_02");	//��� �� �� ��������? �������, �� ���������� � ������������?
	AI_Output(hero,self,"Info_Thorus_MordragKo_MordragGone_15_00");	//������ �� �� ����� ���� ���� ���!
	AI_Output(self,hero,"Alex_01_03");	//�������, ��������� ������!
	AI_Standup(self);
	B_GiveXP(300);
	if(FMTaken == FALSE)
	{
		b_printtrademsg1("������ ���������� � �����.");
		B_GiveInvItems(hero,self,alexstuff,1);
		B_GiveInvItems(hero,self,ItWrOCmap,1);
		Npc_RemoveInvItem(self,alexstuff);
		CreateInvItem(self,grd_armor_l);
		AI_EquipArmor(self,grd_armor_l);
		AI_PlayAni(self,"T_PLUNDER");
		CreateInvItem(self,ItMw_1H_Sword_Short_01);
	}
	else
	{
		self.guild = GIL_KDF;
		CreateInvItem(self,ItMw_1H_Poker_01);
	};
	AI_EquipBestMeleeWeapon(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"follow");
	AI_StopProcessInfos(self);
};


instance INFO_ALEX_BYE(C_Info)
{
	npc = org_899_alex;
	nr = 1;
	condition = info_alex_bye_condition;
	information = info_alex_bye_info;
	permanent = 0;
	important = 1;
};


func int info_alex_bye_condition()
{
	if((Npc_GetDistToWP(hero,"OCC_MERCS_DOWNSTAIRS_1") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (FMTaken == FALSE))
	{
		return 1;
	};
};

func void info_alex_bye_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Alex_02_01");	//����� �� ����������, ������ � ����� ����. � ���� ��� ��������� �� �����, �� ��������� �� ����. ���������� � ������, � ������� ���� �� ������!
	B_LogEntry(QUENTIN_GANG,"����� ������ ����, ��� ������ ��������� �� ����� ���. �������, �� ������ �� ������ ������ ��� �������.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_GotoWP(self,"OCC_MERCS_HALLWAY_MIDDLE");
	AI_Teleport(self,"OCC_MERCS_UPPER_RIGHT_ROOM_BED3");
	Npc_ExchangeRoutine(self,"Remove");
	Wld_InsertNpc(org_898_alex,"LOCATION_11_14");
};


instance INFO_ALEX1_LETSGO(C_Info)
{
	npc = org_899_alex;
	condition = info_alex1_letsgo_condition;
	information = info_alex1_letsgo_info;
	important = 0;
	permanent = 1;
	description = "������ �� ����, ��� ����� ���� ������.";
};


func int info_alex1_letsgo_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(hero,quentin_dia51) && (Npc_GetDistToWP(self,"OW_PATH_ORCENTRANCE") > 1100))
	{
		return TRUE;
	};
};

func void info_alex1_letsgo_info()
{
	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01");	//������ �� ����, ��� ����� ���� ������.
	AI_Output(self,hero,"Alex_03_01");	//��� �������, �������!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"follow");
	if(FMTaken == TRUE)
	{
		self.guild = GIL_KDF;
	};
	AI_StopProcessInfos(self);
};


instance ALEX1_OT(C_Info)
{
	npc = org_899_alex;
	nr = 1;
	condition = alex1_ot_condition;
	information = alex1_ot_info;
	permanent = 1;
	important = 1;
};


func int alex1_ot_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"OW_PATH_ORCENTRANCE") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return 1;
	};
};

func void alex1_ot_info()
{
	AI_Output(self,hero,"Alex_OT");	//� ������� � ���� ������, �� ������� ����� ���� ���.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

