
instance Kdw_601_Myxir(Npc_Default)
{
	name[0] = "������";
	npcType = npctype_main;
	guild = GIL_KDW;
	level = 24;
	voice = 10;
	id = 601;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 328;
	attribute[ATR_HITPOINTS] = 328;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",7,4,kdw_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	EquipItem(self,itarrune_3_1_thunderbolt);
	CreateInvItem(self,ItFo_Potion_Health_02);
	CreateInvItem(self,ItFo_Potion_Mana_03);
	CreateInvItem(self,ItFo_Plants_Flameberry_01);
	CreateInvItem(self,ItFo_Plants_RavenHerb_01);
	daily_routine = Rtn_start_601;
};


func void Rtn_start_601()
{
	TA_Sleep(1,0,4,0,"NC_KDW03_IN");
	TA_ReadBook(4,0,1,0,"NC_KDW03_IN");
};

func void rtn_orealert_601()
{
	TA_Guard(1,0,4,0,"NC_KDW03+04_OUT");
	TA_Guard(4,0,1,0,"NC_KDW03+04_OUT");
};

