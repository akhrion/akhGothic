
instance ORG_826_Mordrag(Npc_Default)
{
	name[0] = "Мордраг";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 10;
	voice = 11;
	id = 826;
	attribute[ATR_STRENGTH] = 36;
	attribute[ATR_DEXTERITY] = 36;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	b_give_mordragchapter1crap();
	EquipItem(self,ItMw_1H_Mace_02);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,30);
	daily_routine = Rtn_PreStart_826;
};


func void Rtn_PreStart_826()
{
	TA_Smalltalk(10,0,23,0,"OCR_OUTSIDE_HUT_44");
	TA_SitAround(23,0,5,30,"OCR_OUTSIDE_MCAMP_01");
	TA_StandAround(5,30,10,0,"OCR_OUTSIDE_HUT_44");
};

func void Rtn_Guide_826()
{
	TA_GuidePC(8,0,20,0,"OW_PATH_07_21");
	TA_GuidePC(20,0,8,0,"OW_PATH_07_21");
};

func void Rtn_Start_826()
{
	TA_StandAround(8,0,23,0,"NC_TAVERN_MORDRAG_SHRIKE");
	TA_StandAround(23,0,8,0,"NC_TAVERN_MORDRAG_SHRIKE");
};

