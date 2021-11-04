
instance SLD_755_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = NpcType_MINE_Guard;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 755;
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
	daily_routine = Rtn_FMCstart_755;
};


func void Rtn_FMCstart_755()
{
	TA_GuardPalisade(5,0,0,0,"FMC_HUT12_OUT");
	TA_Sleep(0,0,5,0,"FMC_HUT12_IN");
};

func void rtn_saved_755()
{
	TA_Guard(5,0,0,0,"OW_PATH_081_N4");
	TA_Sleep(0,0,5,0,"OW_PATH_081_H2");
};

