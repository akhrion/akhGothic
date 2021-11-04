
instance KDF_401_Damarok(Npc_Default)
{
	name[0] = "Дамарок";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 27;
	voice = 5;
	id = 401;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 364;
	attribute[ATR_HITPOINTS] = 364;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",5,1,kdf_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,itarrune_2_2_fireball);
	CreateInvItems(self,ItFo_Potion_Health_02,2);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItems(self,ItFo_Potion_Mana_01,3);
	CreateInvItems(self,ItFo_Plants_Herb_01,2);
	CreateInvItems(self,ItFo_Plants_Herb_02,5);
	CreateInvItems(self,ItFo_Plants_Herb_03,3);
	CreateInvItems(self,ItFo_Plants_Nightshadow_02,2);
	CreateInvItems(self,ItMiFlask,5);
	daily_routine = Rtn_start_401;
};


func void Rtn_start_401()
{
	TA_SitAround(19,1,7,1,"OCC_CHAPEL_UPSTAIRS_RIGHT");
	TA_PotionAlchemy(7,1,19,1,"OCC_CHAPEL_RIGHT_ROOM");
};

func void Rtn_KDFRITUAL_401()
{
	TA_Position(8,0,20,0,"OCC_CHAPEL_MAGE_04");
	TA_Position(20,0,8,0,"OCC_CHAPEL_MAGE_04");
};

func void rtn_dead_401()
{
	TA_Stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_MAG2");
	TA_Stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_MAG2");
};

