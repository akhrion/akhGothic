
instance SLD_708_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = npctype_ambient;
	guild = GIL_SLD;
	level = 8;
	voice = 11;
	id = 708;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,sld_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,3);
	CreateInvItems(self,ItMiNugget,15);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_708;
};


func void Rtn_start_708()
{
	TA_Sleep(0,0,7,30,"NC_HUT07_IN");
	TA_WashSelf(7,30,8,0,"NC_WASH_03");
	TA_SitAround(8,0,0,0,"NC_PLACE03");
};

func void rtn_fmtaken_708()
{
	TA_GuardPassage(0,0,8,0,"NC_PATH44");
	TA_GuardPassage(8,0,0,0,"NC_PATH44");
};

