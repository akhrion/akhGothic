
instance SFB_1031_Schuerfer(Npc_Default)
{
	name[0] = NAME_Schuerfer;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 3;
	voice = 2;
	id = 1031;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",44,3,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	EquipItem(self,ItMwPickaxe);
	CreateInvItem(self,ItMw_1H_Hatchet_01);
	daily_routine = Rtn_FMCstart_1031;
};


func void Rtn_FMCstart_1031()
{
	TA_PickOre(6,0,23,0,"FMC_ORE_03");
	TA_Sleep(23,0,6,0,"FMC_HUT14_IN");
};

func void rtn_dead_1031()
{
	TA_Stay(6,0,23,0,"FMC_ORE_03");
	TA_Stay(23,0,6,0,"FMC_ORE_03");
};

