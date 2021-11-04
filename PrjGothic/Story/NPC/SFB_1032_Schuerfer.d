
instance SFB_1032_Schuerfer(Npc_Default)
{
	name[0] = NAME_Schuerfer;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 6;
	voice = 2;
	id = 1032;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",40,1,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMwPickaxe);
	daily_routine = Rtn_FMCstart_1032;
};


func void Rtn_FMCstart_1032()
{
	TA_PickOre(6,0,23,0,"FMC_ORE_04");
	TA_Sleep(23,0,6,0,"FMC_HUT05_IN");
};

func void rtn_dead_1032()
{
	TA_Stay(6,0,23,0,"FMC_HUT05_IN");
	TA_Stay(23,0,6,0,"FMC_HUT05_IN");
};

