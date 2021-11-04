
instance SFB_1030_Schuerfer(Npc_Default)
{
	name[0] = NAME_Schuerfer;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 3;
	voice = 1;
	id = 1030;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Psionic",42,1,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	EquipItem(self,ItMwPickaxe);
	CreateInvItem(self,ItMw_1H_Nailmace_01);
	daily_routine = Rtn_FMCstart_1030;
};


func void Rtn_FMCstart_1030()
{
	TA_PickOre(6,0,23,0,"FMC_ORE_02");
	TA_Sleep(23,0,6,0,"FMC_HUT14_IN");
};

func void rtn_dead_1030()
{
	TA_Stay(6,0,23,0,"FMC_HUT14_IN");
	TA_Stay(23,0,6,0,"FMC_HUT14_IN");
};

