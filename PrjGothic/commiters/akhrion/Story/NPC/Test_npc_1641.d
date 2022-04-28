
instance test_npc_1641(Npc_Default)
{
	name[0] = "Чебупелик";
	npcType = npctype_ambient;
	guild = GIL_None;
	level = 100;
	voice = 15;
	id = 1641;
	exp = 0;
	exp_next = 500;
	lp = 0;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_MANA_MAX] = 1;
	attribute[ATR_MANA] = 1;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,2,"Hum_Head_Bald",1,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,ItFoRice,2);
	EquipItem(self,ItMw_1H_Scythe_01);
	daily_routine = Rtn_start_1641;
};

func void Rtn_start_1641()
{
	TA_Test(20,20,7,20,"OW_PATH_196");//CASTLE_TOWER_TOP
	TA_Test(7,20,20,20,"OW_PATH_196");//"OW_PATH_196"
};
