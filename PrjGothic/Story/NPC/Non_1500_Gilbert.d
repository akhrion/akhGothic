
instance Non_1500_Gilbert(Npc_Default)
{
	name[0] = "Гилберт";
	npcType = npctype_main;
	guild = GIL_None;
	level = 4;
	voice = 4;
	id = 1500;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA] = 0;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_HITPOINTS] = 148;
	attribute[ATR_HITPOINTS_MAX] = 148;
	protection[PROT_FLY] = 9999;
	protection[PROT_FALL] = 9999;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,0,"Hum_Head_Thief",16,1,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Axe_Old_01);
	CreateInvItems(self,ItKeLockpick,2);
	CreateInvItem(self,itke_gilbert);
	daily_routine = Rtn_start_1500;
};


func void Rtn_start_1500()
{
	TA_StandAround(22,0,5,0,"LOCATION_01_07");
	TA_StandAround(5,0,22,0,"LOCATION_01_07");
};

func void rtn_start2_1500()
{
	TA_Sleep(22,0,8,0,"LOCATION_01_07");
	ta_sit(8,0,22,0,"LOCATION_01_07");
};

func void rtn_hide_1500()
{
	ta_sit(22,0,8,0,"FMC_HUT02_IN");
	ta_sit(8,0,22,0,"FMC_HUT02_IN");
};

