
instance SFB_1041_Schuerfer(Npc_Default)
{
	name[0] = NAME_Schuerfer;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 5;
	id = 1041;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",43,2,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMwPickaxe);
	CreateInvItem(self,ItMw_1H_Nailmace_01);
	daily_routine = Rtn_FMCstart_1041;
};


func void Rtn_FMCstart_1041()
{
	TA_Smalltalk(7,0,22,0,"FMC_HUT03_OUT");
	TA_Sleep(22,0,7,0,"FMC_HUT03_IN");
};

func void rtn_saved_1041()
{
	TA_StandAround(7,0,22,0,"OW_PATH_081_H3");
	TA_Sleep(22,0,7,0,"OW_PATH_081_H2");
};

