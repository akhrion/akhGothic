
instance Org_844_Lefty(Npc_Default)
{
	name[0] = "Лефти";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 8;
	voice = 7;
	id = 844;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",37,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItems(self,ItFoRice,2);
	CreateInvItems(self,ItFo_Potion_Water_01,5);
	CreateInvItem(self,ItFoBooze);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = rtn_wait_844;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void Rtn_start_844()
{
	TA_SitCampfire(19,0,8,0,"NC_PATH86_MOVEMENT");
	TA_Smalltalk(8,0,19,0,"NC_PATH53");
};

func void rtn_wait_844()
{
	TA_SitCampfire(19,0,8,0,"NC_PATH86_MOVEMENT");
	TA_Boss(8,0,19,0,"NC_PATH86");
};

