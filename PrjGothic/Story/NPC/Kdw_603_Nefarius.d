
instance Kdw_603_Nefarius(Npc_Default)
{
	name[0] = "Нефариус";
	npcType = npctype_main;
	guild = GIL_KDW;
	level = 25;
	voice = 4;
	id = 603;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",8,1,kdw_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	EquipItem(self,itarrune_3_2_thunderball);
	CreateInvItem(self,ItFo_Potion_Health_02);
	CreateInvItem(self,ItFo_Potion_Mana_02);
	EquipItem(self,Schutzring_Total1);
	EquipItem(self,Ring_der_Magie);
	CreateInvItems(self,ItFo_Plants_Flameberry_01,2);
	daily_routine = Rtn_start_603;
};


func void Rtn_start_603()
{
	TA_PracticeMagic(4,0,23,0,"NC_PLACE02");
	TA_Sleep(23,0,4,0,"NC_KDW05_IN");
};

func void rtn_orealert_603()
{
	TA_Guard(4,0,23,0,"NC_LOWER_CAVE_01");
	TA_Guard(23,0,4,0,"NC_LOWER_CAVE_01");
};

