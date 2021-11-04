
instance Gur_1207_Natalia(Npc_Default)
{
	name[0] = "Наталия";
	npcType = npctype_main;
	guild = GIL_BAB;
	level = 1;
	voice = 16;
	id = 1207;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 52;
	attribute[ATR_HITPOINTS] = 52;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,0,"Bab_Head_Hair1",0,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_1207;
};


func void rtn_start_1207()
{
	TA_Babe_Sleep(23,0,6,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(6,0,7,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_SitAround(7,0,8,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(8,0,9,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_SitAround(9,0,10,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(10,0,11,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_SitAround(11,0,12,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(12,0,13,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_SitAround(13,0,14,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(14,0,15,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_SitAround(15,0,16,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(16,0,17,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_SitAround(17,0,18,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(18,0,19,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_SitAround(19,0,20,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(20,0,21,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_SitAround(21,0,22,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Fan(22,0,23,0,"PSI_TEMPLE_ROOMS_03");
};

func void rtn_dead_1207()
{
	TA_Babe_SitAround(0,0,6,0,"PSI_TEMPLE_ROOMS_IN_02");
	TA_Babe_SitAround(6,0,0,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_after_1207()
{
	ta_babe_cry(0,0,6,0,"PSI_TEMPLE_ROOMS_IN_03");
	ta_babe_cry(6,0,0,0,"PSI_TEMPLE_ROOMS_IN_03");
};

func void rtn_wash_1207()
{
	TA_Babe_Sleep(0,0,6,0,"PSI_TEMPLE_ROOMS_IN_03");
	TA_Babe_Sweep(6,0,12,0,"PSI_TEMPLE_ROOMS_03");
	TA_Babe_Sweep(12,0,0,0,"PSI_TEMPLE_IN_06");
};

