
instance VLK_595_BUDDLER(Npc_Default)
{
	name[0] = "����";
	npcType = npctype_main;
	guild = GIL_None;
	level = 2;
	voice = 19;
	id = 595;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_FatBald",16,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMwPickaxe);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_595;
};


func void rtn_start_595()
{
	TA_PickOre(23,0,6,30,"LOCATION_11_NEW7");
	TA_PickOre(6,30,23,0,"LOCATION_11_NEW7");
};

func void rtn_oc_595()
{
	TA_SitAround(23,0,6,30,"OCR_HUT_Z5_SIT2");
	TA_SitAround(6,30,23,0,"OCR_HUT_Z5_SIT2");
};


instance INFO_VLK595_EXIT(C_Info)
{
	npc = vlk_595_buddler;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance DIA_VLK595_QUENTIN_DONE(C_Info)
{
	npc = vlk_595_buddler;
	nr = 1;
	condition = dia_vlk595_quentin_done_condition;
	information = dia_vlk595_quentin_done_info;
	permanent = 0;
	description = "��? ������ �� ��������?";
};


func int dia_vlk595_quentin_done_condition()
{
	if(Npc_IsDead(Org_858_Quentin))
	{
		return 1;
	};
};

func void dia_vlk595_quentin_done_info()
{
	AI_Output(other,self,"DIA_Ghorim_SUCCESS_15_00");	//��? ������ �� ��������?
	AI_Output(self,other,"SVM_19_Help");	//�����!
	B_GiveXP(300);
	b_setorg2hostile();
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_SUCCESS;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_SUCCESS);
		B_LogEntry(QUENTIN_GANG,"� ���� ���������, ������� ������ � ����� �������. ��� ����������� � ������ ������.");
	};
	AI_StopProcessInfos(self);
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"LOCATION_11_NEW1");
	AI_Teleport(self,"LOCATION_11_04");
	Npc_ExchangeRoutine(self,"oc");
	AI_GotoWP(vlk_596_buddler,"LOCATION_11_NEW1");
	AI_Teleport(vlk_596_buddler,"OC2");
	Npc_ExchangeRoutine(vlk_596_buddler,"oc");
	AI_GotoWP(vlk_597_buddler,"LOCATION_11_NEW1");
	AI_Teleport(vlk_597_buddler,"OC2");
	Npc_ExchangeRoutine(vlk_597_buddler,"oc");
};


instance VLK_596_BUDDLER(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_main;
	guild = GIL_None;
	level = 2;
	voice = 9;
	id = 596;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_Bald",2,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMwPickaxe);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_596;
};


func void rtn_start_596()
{
	TA_PickOre(23,0,6,30,"LOCATION_11_NEW5");
	TA_PickOre(6,30,23,0,"LOCATION_11_NEW5");
};

func void rtn_oc_596()
{
	TA_SitAround(23,0,6,30,"OCR_HUT_Z5_SIT");
	TA_SitAround(6,30,23,0,"OCR_HUT_Z5_SIT");
};


instance INFO_VLK596_EXIT(C_Info)
{
	npc = vlk_596_buddler;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance VLK_597_BUDDLER(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_main;
	guild = GIL_None;
	level = 2;
	voice = 5;
	id = 597;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_Bald",4,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMwPickaxe);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_597;
};


func void rtn_start_597()
{
	TA_PickOre(23,0,6,30,"LOCATION_11_NEW6");
	TA_PickOre(6,30,23,0,"LOCATION_11_NEW6");
};

func void rtn_oc_597()
{
	TA_SitAround(23,0,6,30,"OCR_HUT_Z5_SIT3");
	TA_SitAround(6,30,23,0,"OCR_HUT_Z5_SIT3");
};


instance INFO_VLK597_EXIT(C_Info)
{
	npc = vlk_597_buddler;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

