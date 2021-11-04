
instance KDW_604_Cronos(Npc_Default)
{
	name[0] = "Кронос";
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL | NPC_FLAG_FRIEND;
	guild = GIL_KDW;
	level = 28;
	voice = 8;
	id = 604;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 376;
	attribute[ATR_HITPOINTS] = 376;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",7,1,kdw_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	EquipItem(self,itarrune_3_3_icecube);
	EquipItem(self,itarrune_3_5_chainlightning);
	CreateInvItem(self,alchemybook);
	B_Give_CronosChapter1Runes();
	daily_routine = Rtn_start_604;
};


func void Rtn_start_604()
{
	TA_Sleep(2,0,5,0,"NC_KDW02_IN");
	TA_Orepile(5,0,2,0,"NC_PATH_TO_PIT_03");
};

func void rtn_orealert_604()
{
	TA_Guard(1,0,4,0,"NC_KDW05+06_OUT");
	TA_Guard(4,0,1,0,"NC_KDW05+06_OUT");
};

