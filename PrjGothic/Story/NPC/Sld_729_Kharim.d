
instance Sld_729_Kharim(Npc_Default)
{
	name[0] = "Карим";
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_None;
	level = 20;
	voice = 9;
	id = 729;
	attribute[ATR_STRENGTH] = 130;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
//	protection[PROT_POINT] = 50;
//	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
//	protection[PROT_MAGIC] = 50;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",9,1,sld_armor_m);
//	B_Scale(self);
	Mdl_SetModelFatness(self,1);
	Mdl_SetModelScale(self,1.3,1.1,1.1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,itmw_kharim);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,19);
	CreateInvItems(self,ItFo_Potion_Health_01,10);
	daily_routine = Rtn_start_729;
};


func void Rtn_start_729()
{
	TA_Sleep(0,0,7,30,"OCR_HUT_31");
	TA_StandAround(7,30,11,0,"OCR_CAMPFIRE_I_2");
	TA_Smith_Sharp(11,0,14,0,"OCR_ARENABATTLE_ROOM_01");
	TA_PracticeSword(14,0,15,0,"OCR_ARENABATTLE");
	TA_StandAround(15,0,17,0,"OCR_ARENABATTLE_OUTSIDE");
	TA_SitCampfire(17,0,19,0,"OCR_CAMPFIRE_I_2");
	TA_Boss(19,0,19,10,"OCR_ARENABATTLE");
	ta_arenafight(19,10,20,18,"OCR_ARENABATTLE");
	TA_Boss(20,18,21,40,"OCR_ARENABATTLE");
	ta_arenafight(21,40,22,58,"OCR_ARENABATTLE");
	TA_Boss(22,58,23,0,"OCR_ARENABATTLE");
	TA_SitCampfire(23,0,0,0,"OCR_CAMPFIRE_I_2");
};

func void Rtn_Guide_729()
{
	TA_GuidePC(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

func void rtn_nopractice_729()
{
	TA_Sleep(0,0,7,30,"OCR_HUT_31");
	TA_StandAround(7,30,11,0,"OCR_CAMPFIRE_I_2");
	TA_Smith_Sharp(11,0,14,0,"OCR_ARENABATTLE_ROOM_01");
	TA_StandAround(14,0,17,0,"OCR_ARENABATTLE_OUTSIDE");
	TA_SitCampfire(17,0,0,0,"OCR_CAMPFIRE_I_2");
};

func void rtn_dead_729()
{
	TA_Stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_4");
	TA_Stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_4");
};

func void rtn_wait_729()
{
	TA_Boss(8,0,20,0,"OCR_ARENABATTLE");
	TA_Boss(20,0,8,0,"OCR_ARENABATTLE");
};

