
instance ORG_891_Organisator(Npc_Default)
{
	name[0] = NAME_Organisator;
	npcType = Npctype_MINE_Ambient;
	guild = GIL_ORG;
	level = 8;
	voice = 6;
	id = 891;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",9,3,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,2);
	EquipItem(self,ItMw_1H_Mace_03);
	daily_routine = Rtn_FMCstart_891;
};


func void Rtn_FMCstart_891()
{
	TA_SitAround(6,0,12,0,"FMC_HUT06_IN");
	TA_StandAround(12,0,13,0,"FMC_HUT06_OUT");
	TA_SitAround(13,0,22,0,"FMC_HUT06_IN");
	TA_Sleep(22,0,6,0,"FMC_HUT06_IN");
};

func void rtn_dead_891()
{
	TA_Stay(6,0,22,0,"FMC_HUT06_OUT");
	TA_Stay(22,0,6,0,"FMC_HUT06_OUT");
};

