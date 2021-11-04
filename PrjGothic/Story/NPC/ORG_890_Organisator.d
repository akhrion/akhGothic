
instance ORG_890_Organisator(Npc_Default)
{
	name[0] = NAME_Organisator;
	npcType = Npctype_MINE_Ambient;
	guild = GIL_ORG;
	level = 8;
	voice = 7;
	id = 890;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",37,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,2);
	EquipItem(self,ItMw_1H_Mace_03);
	daily_routine = Rtn_FMCstart_890;
};


func void Rtn_FMCstart_890()
{
	TA_SitAround(7,0,13,0,"FMC_HUT06_IN");
	TA_Smoke(13,0,14,0,"FMC_HUT06_OUT");
	TA_SitAround(14,0,23,0,"FMC_HUT06_IN");
	TA_Sleep(23,0,7,0,"FMC_HUT06_IN");
};

func void rtn_dead_890()
{
	TA_Stay(7,0,23,0,"FMC_HUT06_IN");
	TA_Stay(23,0,7,0,"FMC_HUT06_IN");
};

