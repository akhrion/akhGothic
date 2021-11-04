
instance SLD_750_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = NpcType_MINE_Guard;
	guild = GIL_SLD;
	level = 16;
	voice = 11;
	id = 750;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",49,1,sld_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_FMCstart_750;
};


func void Rtn_FMCstart_750()
{
	TA_GuardPalisade(1,0,13,0,"FMC_PATH19");
	TA_GuardPalisade(13,0,1,0,"FMC_PATH19");
};

