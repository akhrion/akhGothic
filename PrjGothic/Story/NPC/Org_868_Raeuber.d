
instance Org_868_Raeuber(Npc_Default)
{
	name[0] = NAME_Raeuber;
	npcType = npctype_main;
	guild = GIL_None;
	level = 10;
	voice = 5;
	id = 868;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",33,2,org2l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItem(self,ItFoLoaf);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_868;
};


func void Rtn_start_868()
{
	TA_GuardPalisade(13,0,14,0,"LOCATION_11_16");
	TA_GuardPalisade(14,0,13,0,"LOCATION_11_16");
};


instance INFO_RAEUBER2_EXIT(C_Info)
{
	npc = Org_868_Raeuber;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_raeubers_exit_condition()
{
	return 1;
};

func void info_raeubers_exit_info()
{
	AI_StopProcessInfos(self);
};

