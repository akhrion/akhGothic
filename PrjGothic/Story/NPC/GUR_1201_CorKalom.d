
instance GUR_1201_CorKalom(Npc_Default)
{
	name[0] = "Кор Галом";
	npcType = npctype_friend;
	guild = GIL_GUR;
	level = 30;
	voice = 10;
	id = 1201;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Psionic",19,0,gur_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,Kaloms_Schwert);
	CreateInvItem(self,itarrune_5_2_sleep);
	daily_routine = Rtn_start_1201;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void Rtn_start_1201()
{
	TA_PotionAlchemy(15,0,22,0,"PSI_LABOR_IN");
	TA_PotionAlchemy(22,0,15,0,"PSI_LABOR_IN");
};

func void Rtn_CallSleeper_1201()
{
	TA_Stay(0,0,12,0,"PSI_TEMPLE_STAIRS_RIGHT");
	TA_Stay(12,0,24,0,"PSI_TEMPLE_STAIRS_RIGHT");
};

func void rtn_care_1201()
{
	TA_ReadBook(0,0,12,0,"PSI_TEMPLE_ROOMS_IN_02");
	TA_ReadBook(12,0,24,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void Rtn_Flee_1201()
{
	TA_Stay(0,0,12,0,"WP_INTRO01");
	TA_Stay(12,0,24,0,"WP_INTRO01");
};

