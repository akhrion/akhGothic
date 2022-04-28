
instance KDF_403_Drago(Npc_Default)
{
	name[0] = "Драго";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 28;
	voice = 13;
	id = 403;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 376;
	attribute[ATR_HITPOINTS] = 376;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",4,0,kdf_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,itarrune_2_2_fireball);
	CreateInvItems(self,ItFo_Potion_Health_02,3);
	CreateInvItems(self,ItFo_Potion_Health_01,4);
	EquipItem(self,Schutzring_Total2);
	daily_routine = Rtn_start_403;
};


func void Rtn_start_403()
{
	TA_PracticeMagic(7,10,18,50,"OCC_CHAPEL_MAGE_04");
	TA_StandAround(18,50,19,40,"OCC_CENTER_2");
	TA_ReadBook(19,40,7,10,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

func void Rtn_KDFRITUAL_403()
{
	TA_Position(8,0,20,0,"OCC_CHAPEL_MAGE_03");
	TA_Position(20,0,8,0,"OCC_CHAPEL_MAGE_03");
};

func void rtn_dead_403()
{
	TA_Stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_MAG4");
	TA_Stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_MAG4");
};

