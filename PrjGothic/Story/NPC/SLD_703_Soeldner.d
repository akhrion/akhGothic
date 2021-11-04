
instance SLD_703_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = npctype_guard;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 703;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",106,1,sld_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,23);
	CreateInvItems(self,ItFo_Potion_Health_02,8);
	daily_routine = Rtn_start_703;
};


func void Rtn_start_703()
{
	TA_SitAround(7,55,23,45,"NC_PLACE01");
	TA_Sleep(23,45,7,30,"NC_HUT02_IN");
	TA_WashSelf(7,30,7,55,"NC_WASH_04");
};

func void rtn_fmtaken_703()
{
	TA_GuardPassage(7,45,23,45,"NC_PATH55");
	TA_GuardPassage(23,45,7,45,"NC_PATH55");
};

