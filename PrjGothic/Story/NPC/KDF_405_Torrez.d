
instance KDF_405_Torrez(Npc_Default)
{
	name[0] = "Торрез";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 26;
	voice = 4;
	id = 405;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 352;
	attribute[ATR_HITPOINTS] = 352;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",5,4,kdf_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,itarrune_2_2_fireball);
	CreateInvItem(self,alchemybook);
	B_Give_TorrezChapter1Runes();
	daily_routine = Rtn_start_405;
};


func void Rtn_start_405()
{
	TA_Sleep(22,5,6,55,"OCC_CHAPEL_LEFT_ROOM");
	TA_Smalltalk(6,55,22,5,"OCC_CENTER_2");
};

func void Rtn_KDFRITUAL_405()
{
	TA_Position(8,0,20,0,"OCC_CHAPEL_MAGE_02");
	TA_Position(20,0,8,0,"OCC_CHAPEL_MAGE_02");
};

func void rtn_miltenleft_405()
{
	TA_Sleep(0,0,8,0,"OCC_CHAPEL_LEFT_ROOM");
	TA_Stand(8,0,0,0,"OCC_CHAPEL_ENTRANCE");
};

func void rtn_dead_405()
{
	TA_Stay(8,0,20,0,"WP_INTRO01");
	TA_Stay(20,0,8,0,"WP_INTRO01");
};


instance KDF_4051_TORREZ(Npc_Default)
{
	name[0] = "Торрез";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 26;
	voice = 4;
	id = 4051;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 111;
	attribute[ATR_HITPOINTS] = 111;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",5,4,kdf_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	CreateInvItems(self,ItMiFlask,4);
	CreateInvItem(self,ItMi_Stuff_OldCoin_01);
	daily_routine = rtn_start_4051;
};


func void rtn_start_4051()
{
	TA_Stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_MAG5");
	TA_Stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_MAG5");
};

