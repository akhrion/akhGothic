
instance NOV_1372_DUSTY(Npc_Default)
{
	name[0] = "Дасти";
	npcType = npctype_friend;
	guild = GIL_NOV;
	level = 15;
	voice = 3;
	id = 1372;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",68,0,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItFo_Potion_Water_01);
	daily_routine = rtn_start_1372;
};


func void rtn_start_1372()
{
	TA_Sleep(23,0,7,45,"PSI_25_HUT_IN");
	TA_Listen(7,45,23,0,"PSI_12_HUT_EX_TEACH");
};

