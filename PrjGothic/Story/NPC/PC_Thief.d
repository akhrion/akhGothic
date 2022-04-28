
instance PC_Thief(Npc_Default)
{
	name[0] = "Диего";
	npcType = npctype_friend;
	guild = GIL_STT;
	level = 30;
	exp = 232500;
	voice = 11;
	id = 1;
//	flags = NPC_FLAG_IMMORTAL;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",15,4,stt_armor_h);
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_REGENERATEHP] = 3;
	protection[PROT_FALL] = 1000;
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,2);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,10);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,2);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentValue(self,NPC_TALENT_BOW,60);
	Npc_SetTalentSkill(hero,NPC_TALENT_REGENERATE,0);
	EquipItem(self,Diegos_Bogen);
	EquipItem(self,ItMw_1H_Sword_04);
	CreateInvItems(self,ItAmArrow,100);
	daily_routine = Rtn_PreStart_1;
	fight_tactic = FAI_HUMAN_MASTER;
	aivar[AIV_IMPORTANT] = TRUE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void Rtn_PreStart_1()
{
	TA_Position(0,0,12,0,"WP_INTRO_FALL3");
	TA_Position(12,0,0,0,"WP_INTRO_FALL3");
};

func void Rtn_Start_1()
{
	TA_Sleep(23,0,7,0,"OCR_HUT_1");
	TA_SitAround(7,0,10,0,"OCR_CAULDRON_1");
	TA_Smalltalk(10,0,12,0,"OCR_CAMPFIRE_A_MOVEMENT1");
	TA_SitAround(12,0,16,0,"OCR_CAULDRON_1");
	TA_Smalltalk(16,0,18,0,"OCR_CAMPFIRE_A_MOVEMENT3");
	TA_SitCampfire(18,0,23,0,"OCR_CAMPFIRE_A_MOVEMENT1");
};

func void Rtn_OCWait_1()
{
	TA_Stay(0,0,12,0,"OC_ROUND_13");
	TA_Stay(12,0,0,0,"OC_ROUND_13");
};

func void Rtn_TrollWait_1()
{
	TA_Stay(0,0,23,0,"OW_PATH_190");
	TA_Stay(23,0,0,0,"OW_PATH_190");
};

func void Rtn_GuideTroll_1()
{
	TA_GuidePC(0,0,12,0,"LOCATION_12_01");
	TA_GuidePC(12,0,0,0,"LOCATION_12_01");
};

func void Rtn_WaitAtWheel_1()
{
	TA_Stay(0,0,12,0,"LOCATION_12_14_WHEEL");
	TA_Stay(12,0,24,0,"LOCATION_12_14_WHEEL");
};

func void Rtn_WaitAtFocus_1()
{
	TA_GuidePC(0,0,12,0,"LOCATION_12_03");
	TA_GuidePC(12,0,24,0,"LOCATION_12_03");
};

func void Rtn_OMFull_1()
{
};

func void Rtn_FMTaken_1()
{
};

func void Rtn_OrcAssault_1()
{
};

func void rtn_reunion_1()
{
	TA_Guard(8,0,16,5,"LOCATION_02_03");
	TA_Sleep(16,5,0,5,"LOCATION_02_07");
	TA_SitAround(0,5,8,0,"LOCATION_02_04");
};

