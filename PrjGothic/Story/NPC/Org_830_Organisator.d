
instance Org_830_Organisator(Npc_Default)
{
	name[0] = NAME_Torwache;
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 4;
	voice = 13;
	id = 830;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_FatBald",12,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	EquipItem(self,ItMw_1H_Mace_01);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItMiJoint_1,3);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	daily_routine = Rtn_start_830;
};


func void Rtn_start_830()
{
	TA_Smoke(8,0,20,0,"OW_PATH_07_21_GUARD_LEFT");
	TA_Smoke(20,0,8,0,"OW_PATH_07_21_GUARD_LEFT");
};

func void rtn_fmtaken_830()
{
	TA_PracticeSword(8,0,20,0,"OW_PATH_068");
	TA_PracticeSword(20,0,8,0,"OW_PATH_068");
};

