
instance BAU_927_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	npcType = npctype_ambient;
	guild = GIL_BAU;
	level = 2;
	voice = 9;
	id = 927;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Bald",4,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,ItFoRice,2);
	CreateInvItem(self,ItFoBooze);
	EquipItem(self,ItMw_1H_Sickle_01);
	daily_routine = Rtn_start_927;
};


func void Rtn_start_927()
{
	TA_SitCampfire(20,25,7,25,"NC_PATH_PEASANT_OUTSIDE4");
	TA_PickRice(7,25,20,25,"NC_PATH81");
};

