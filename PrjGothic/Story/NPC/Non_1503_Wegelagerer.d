
instance Non_1503_Wegelagerer(Npc_Default)
{
	name[0] = "������";
	npcType = Npctype_ROGUE;
	guild = GIL_None;
	level = 9;
	voice = 9;
	id = 1503;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,2,"Hum_Head_FatBald",9,3,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItems(self,ItMiNugget,11);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItFoBeer);
	daily_routine = Rtn_start_1503;
};


func void Rtn_start_1503()
{
	TA_SitCampfire(22,0,6,0,"OW_PATH_BANDITOS01");
	TA_Smalltalk(6,0,22,0,"OW_PATH_BANDITOS01");
};

