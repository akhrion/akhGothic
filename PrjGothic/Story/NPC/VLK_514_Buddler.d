
instance VLK_514_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 514;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",0,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_514;
};


func void Rtn_start_514()
{
	TA_Sleep(23,0,8,0,"OCR_HUT_17");
	TA_Smalltalk(8,0,19,0,"OCR_OUTSIDE_HUT_17");
	TA_ArenaSpectator(19,0,23,0,"OCR_ARENA_09");
};

func void rtn_noarena_514()
{
	TA_Sleep(23,0,8,0,"OCR_HUT_17");
	TA_Smalltalk(8,0,23,0,"OCR_OUTSIDE_HUT_17");
};

