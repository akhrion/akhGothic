
instance ORG_806_Organisator(Npc_Default)
{
	name[0] = NAME_Organisator;
	npcType = npctype_ambient;
	guild = GIL_ORG;
	level = 8;
	voice = 7;
	id = 806;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",6,1,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,ItKeLockpick);
	CreateInvItems(self,ItMiNugget,14);
	CreateInvItem(self,ItAt_Teeth_01);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_806;
};


func void Rtn_start_806()
{
	TA_Sleep(0,0,7,0,"NC_HUT20_IN");
	TA_WashSelf(7,0,7,30,"NC_WASH_04");
	TA_Smalltalk(7,30,0,0,"NC_PLACE06");
};

func void rtn_ch5_806()
{
	TA_Sleep(0,0,7,30,"NC_HUT20_IN");
	TA_Smalltalk(7,30,16,0,"NC_PLACE06");
	TA_StandAround(16,0,17,0,"NC_PLACE06");
	TA_Smalltalk(17,0,0,0,"NC_PLACE06");
};

