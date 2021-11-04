
instance SFB_1042_Schuerfer(Npc_Default)
{
	name[0] = NAME_Schuerfer;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 1;
	id = 1042;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Bald",43,1,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,ItMwPickaxe);
	EquipItem(self,ItMw_1H_Sword_Short_01);
	daily_routine = Rtn_FMCstart_1042;
};


func void Rtn_FMCstart_1042()
{
	TA_Smoke(5,0,23,0,"FMC_HUT04_OUT");
	TA_Sleep(23,0,5,0,"FMC_HUT04_IN");
};

func void rtn_dead_1042()
{
	TA_Stay(5,0,23,0,"FMC_HUT04_OUT");
	TA_Stay(23,0,5,0,"FMC_HUT04_OUT");
};

