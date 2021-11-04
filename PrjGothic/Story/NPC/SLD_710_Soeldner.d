
instance SLD_710_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = npctype_guard;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 710;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,3,"Hum_Head_FatBald",9,2,sld_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems(self,ItFo_Potion_Health_02,8);
	daily_routine = Rtn_start_710;
};


func void Rtn_start_710()
{
	TA_Sleep(22,55,7,35,"NC_HUT09_IN");
	TA_Smalltalk(7,35,22,55,"NC_HUT10_OUT");
};

func void rtn_fmtaken_710()
{
	TA_Smalltalk(22,55,7,35,"OW_PATH_069");
	TA_Smalltalk(7,35,22,55,"OW_PATH_069");
};

