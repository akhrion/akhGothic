
instance SLD_723_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = npctype_guard;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 723;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Pony",48,1,sld_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems(self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,22);
	CreateInvItems(self,ItFo_Potion_Health_02,7);
	daily_routine = Rtn_start_723;
};


func void Rtn_start_723()
{
	TA_GuardPassage(8,0,22,0,"NC_GUARD_MAGES_LEFT");
	TA_GuardPassage(22,0,8,0,"NC_GUARD_MAGES_LEFT");
};

func void rtn_orealert_723()
{
	TA_Guard(8,0,22,0,"NC_OREALERT_2");
	TA_Guard(22,0,8,0,"NC_OREALERT_2");
};

