
instance Non_01_Unknown(Npc_Default)
{
	name[0] = "Незнакомец";
	npcType = npctype_main;
	guild = GIL_None;
	level = 4;
	voice = 4;
	id = 01;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA] = 0;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_HITPOINTS] = 25;
	attribute[ATR_HITPOINTS_MAX] = 25;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,0,"Hum_Head_Thief",16,1,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,2);
	daily_routine = Rtn_start_01;
};


func void Rtn_start_01()
{
	TA_StandAround(22,0,5,0,"LOCATION_01_07");
	TA_StandAround(5,0,22,0,"LOCATION_01_07");
};

func void rtn_idle_01()
{
	ta_sit(22,0,8,0,"FMC_HUT02_IN");
	ta_sit(8,0,22,0,"FMC_HUT02_IN");
};
//CASTLE_TOWER_TOP
//WP_INTRO01
//OW_PATH_1_17
//OW_PATH_1_17_3

