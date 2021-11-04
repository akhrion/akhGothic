
instance Tpl_1422_GorHanis(Npc_Default)
{
	name[0] = "Гор Ханис";
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_None;
	level = 20;
	voice = 8;
	id = 1422;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",66,1,tpl_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,itmw_gorhanis);
	EquipItem(self,ItMi_Amulet_Psi_01);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	CreateInvItems(self,ItFo_Potion_Health_01,10);
	daily_routine = Rtn_start_1422;
};


func void Rtn_start_1422()
{
	TA_Sleep(23,45,7,45,"OCR_HUT_32");
	TA_StandAround(7,45,10,5,"OCR_CAMPFIRE_I_1");
	TA_Smalltalk(10,5,16,0,"OCR_SMALLTALK_A_OC_ARENA");
	TA_PracticeSword(16,0,17,15,"OCR_ARENABATTLE");
	TA_SitCampfire(17,15,19,0,"OCR_CAMPFIRE_I_1");
	TA_Boss(19,0,20,18,"OCR_ARENABATTLE_TRAIN");
	ta_arenafight(20,18,21,38,"OCR_ARENABATTLE_TRAIN");
	TA_Boss(21,38,21,40,"OCR_ARENABATTLE_TRAIN");
	ta_arenafight(21,40,22,58,"OCR_ARENABATTLE_TRAIN");
	TA_Boss(22,58,23,0,"OCR_ARENABATTLE_TRAIN");
	TA_SitCampfire(23,0,23,45,"OCR_CAMPFIRE_I_1");
};

func void rtn_guide_1422()
{
	TA_GuidePC(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

func void rtn_nopractice_1422()
{
	TA_Sleep(23,45,7,45,"OCR_HUT_32");
	TA_StandAround(7,45,10,5,"OCR_CAMPFIRE_I_1");
	TA_Smalltalk(10,5,16,0,"OCR_SMALLTALK_A_OC_ARENA");
	TA_StandAround(16,0,17,15,"OCR_CAMPFIRE_I_1");
	TA_SitCampfire(17,15,23,45,"OCR_CAMPFIRE_I_1");
};

func void rtn_dead_1422()
{
	TA_Stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_3");
	TA_Stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_3");
};

func void rtn_wait_1422()
{
	TA_Boss(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	TA_Boss(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

