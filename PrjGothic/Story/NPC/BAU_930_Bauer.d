
instance BAU_930_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	npcType = npctype_ambient;
	guild = GIL_BAU;
	level = 2;
	voice = 4;
	id = 930;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",110,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,ItFoRice,3);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	EquipItem(self,ItMw_1H_Sickle_01);
	daily_routine = Rtn_start_930;
};


func void Rtn_start_930()
{
	TA_SitCampfire(20,35,8,35,"NC_PATH_PEASANT_OUTSIDE11");
	TA_PickRice(8,35,20,35,"NC_PATH79");
};

func void rtn_repair_930()
{
	TA_SitCampfire(20,30,8,0,"NC_PATH_PEASANT_OUTSIDE11");
	TA_RepairHut(8,0,20,30,"NC_DAM_BOTTOM_REPAIR");
};

