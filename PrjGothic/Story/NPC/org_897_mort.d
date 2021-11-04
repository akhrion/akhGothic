
instance ORG_897_MORT(Npc_Default)
{
	name[0] = "Морт";
	npcType = npctype_friend;
	guild = GIL_KDF;
	level = 999;
	voice = 5;
	id = 897;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",12,4,org2l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,70);
	daily_routine = rtn_start_897;
	aivar[AIV_IMPORTANT] = TRUE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_start_897()
{
	ta_sit(7,0,20,0,"OCC_CELLAR_LAST_ROOM");
	ta_sit(20,0,7,0,"OCC_CELLAR_LAST_ROOM");
};

func void rtn_follow_897()
{
	TA_FollowPC(7,0,20,0,"OCC_CELLAR_LAST_ROOM");
	TA_FollowPC(20,0,7,0,"OCC_CELLAR_LAST_ROOM");
};

func void rtn_camp_897()
{
	ta_sit(7,0,20,0,"LOCATION_11_12_07");
	ta_sit(20,0,7,0,"LOCATION_11_12_07");
};


instance INFO_MORT_EXIT(C_Info)
{
	npc = org_897_mort;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_MORT_LETSGO(C_Info)
{
	npc = org_897_mort;
	condition = info_mort_letsgo_condition;
	information = info_mort_letsgo_info;
	important = 0;
	permanent = 1;
	description = "Пойдем со мной, мне нужна твоя помощь.";
};


func int info_mort_letsgo_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && !Npc_KnowsInfo(hero,quentin_dia51))
	{
		return TRUE;
	};
};

func void info_mort_letsgo_info()
{
	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01");	//Пойдем со мной, мне нужна твоя помощь.
	AI_Standup(self);
	B_GiveXP(100);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"follow");
	AI_StopProcessInfos(self);
};

