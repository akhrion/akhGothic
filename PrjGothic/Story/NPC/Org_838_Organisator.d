
instance Org_838_Organisator(Npc_Default)
{
	name[0] = NAME_Organisator;
	npcType = npctype_ambient;
	guild = GIL_ORG;
	level = 4;
	voice = 13;
	id = 838;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_FatBald",12,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	EquipItem(self,ItMw_1H_Mace_01);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,3);
	CreateInvItems(self,ItFoRice,3);
	daily_routine = Rtn_start_838;
};


func void Rtn_start_838()
{
	TA_Sleep(2,35,8,5,"NC_HUT31_IN");
	TA_Smalltalk(8,5,18,5,"NC_HUT31_OUT");
	TA_Smalltalk(18,5,2,35,"NC_TAVERN_TOP04");
};

