
instance ORG_892_Organisator(Npc_Default)
{
	name[0] = NAME_Organisator;
	npcType = Npctype_MINE_Ambient;
	guild = GIL_ORG;
	level = 11;
	voice = 13;
	id = 892;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",35,2,org_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,ItKeLockpick);
	EquipItem(self,ItMw_1H_Mace_War_01);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,10);
	daily_routine = Rtn_FMCstart_892;
};


func void Rtn_FMCstart_892()
{
	TA_Smoke(6,0,23,0,"FMC_HUT11_OUT");
	TA_Sleep(23,0,6,0,"FMC_HUT11_IN");
};

func void rtn_dead_892()
{
	TA_Stay(6,0,23,0,"FMC_HUT11_OUT");
	TA_Stay(23,0,6,0,"FMC_HUT11_OUT");
};

