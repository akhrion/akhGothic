
instance GRD_251_Kirgo(Npc_Default)
{
	name[0] = "Кирго";
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_None;
	level = 10;
	voice = 5;
	id = 251;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",2,1,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_kirgo);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItems(self,ItFo_Potion_Health_01,10);
	daily_routine = Rtn_start_251;
};


func void Rtn_start_251()
{
	TA_Sleep(23,45,7,45,"OCR_HUT_21");
	TA_StandAround(7,45,10,0,"OCR_ARENABATTLE_OUTSIDE");
	TA_PracticeSword(10,0,14,5,"OCR_ARENABATTLE");
	TA_Smith_Sharp(14,5,17,15,"OCR_ARENABATTLE_ROOM_01");
	TA_SitCampfire(17,15,19,0,"OCR_ARENABATTLE_OUTSIDE");
	TA_Boss(19,0,19,10,"OCR_ARENABATTLE_TRAIN2");
	ta_arenafight(19,10,20,18,"OCR_ARENABATTLE_TRAIN2");
	TA_Boss(20,18,20,20,"OCR_ARENABATTLE_TRAIN2");
	ta_arenafight(20,20,21,40,"OCR_ARENABATTLE_TRAIN2");
	TA_Boss(21,40,23,0,"OCR_ARENABATTLE_TRAIN2");
	TA_SitCampfire(23,0,23,45,"OCR_ARENABATTLE_OUTSIDE");
};

func void Rtn_Guide_251()
{
	TA_GuidePC(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

func void rtn_nopractice_251()
{
	TA_Sleep(23,45,7,45,"OCR_HUT_21");
	TA_StandAround(7,45,15,0,"OCR_ARENABATTLE_OUTSIDE");
	TA_Smith_Sharp(15,0,17,15,"OCR_ARENABATTLE_ROOM_01");
	TA_SitCampfire(17,15,23,45,"OCR_ARENABATTLE_OUTSIDE");
};

func void rtn_dead_251()
{
	TA_Stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_5");
	TA_Stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_5");
};

func void rtn_wait_251()
{
	TA_Boss(8,0,20,0,"OCR_ARENABATTLE_TRAIN2");
	TA_Boss(20,0,8,0,"OCR_ARENABATTLE_TRAIN2");
};

func void rtn_fmtaken_251()
{
	TA_PracticeSword(8,0,20,0,"OCR_ARENABATTLE_TRAIN2");
	TA_PracticeSword(20,0,8,0,"OCR_ARENABATTLE_TRAIN2");
};

