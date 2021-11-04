
instance VLK_5003_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 3;
	voice = 14;
	id = 5003;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",67,1,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItem(self,ItMwPickaxe);
	daily_routine = Rtn_FMstart_5003;
};


func void Rtn_FMstart_5003()
{
	TA_PickOre(0,0,23,0,"FM_103");
	TA_PickOre(23,0,24,0,"FM_103");
};

