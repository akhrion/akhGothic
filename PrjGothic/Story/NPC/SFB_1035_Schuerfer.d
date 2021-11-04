
instance SFB_1035_Schuerfer(Npc_Default)
{
	name[0] = NAME_Schuerfer;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 5;
	id = 1035;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,0,"Hum_Head_FatBald",11,1,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	EquipItem(self,ItMw_1H_Hatchet_01);
	CreateInvItem(self,ItMwPickaxe);
	daily_routine = Rtn_FMCstart_1035;
};


func void Rtn_FMCstart_1035()
{
	TA_PickOre(6,0,23,0,"FMC_ORE_07");
	TA_Sleep(23,0,6,0,"FMC_HUT05_IN");
};

func void rtn_dead_1035()
{
	TA_Stay(6,0,23,0,"FMC_HUT05_IN");
	TA_Stay(23,0,6,0,"FMC_HUT05_IN");
};

