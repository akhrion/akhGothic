
instance SFB_1043_Schuerfer(Npc_Default)
{
	name[0] = NAME_Schuerfer;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 2;
	id = 1043;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",43,4,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	CreateInvItem(self,ItMwPickaxe);
	EquipItem(self,ItMw_1H_Sword_Short_01);
	daily_routine = Rtn_FMCstart_1043;
};


func void Rtn_FMCstart_1043()
{
	TA_Smoke(8,0,0,0,"FMC_HUT04_OUT");
	TA_Sleep(0,0,8,0,"FMC_HUT04_IN");
};

func void rtn_dead_1043()
{
	TA_Stay(8,0,0,0,"FMC_HUT04_IN");
	TA_Stay(0,0,8,0,"FMC_HUT04_IN");
};

