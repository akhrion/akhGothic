
instance NOV_1304_Balor(Npc_Default)
{
	name[0] = "Бэлор";
	npcType = npctype_main;
	guild = GIL_NOV;
	level = 15;
	voice = 1;
	id = 1304;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",26,3,nov_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	EquipItem(self,ItMw_1H_Hatchet_01);
	CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
	CreateInvItems(self,ItMiNugget,7);
	CreateInvItems(self,ItFoRice,3);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItMiJoint_1,4);
	daily_routine = Rtn_start_1304;
};


func void Rtn_start_1304()
{
	TA_Boss(6,0,21,0,"PATH_TAKE_HERB_06");
	TA_SitCampfire(21,0,6,0,"PATH_TAKE_HERB_07");
};

func void rtn_remove_1304()
{
	TA_Stay(23,0,7,45,"WP_INTRO01");
	TA_Stay(7,45,23,0,"WP_INTRO01");
};


instance TPL_1480_TEMPLER(Npc_Default)
{
	name[0] = NAME_Templer;
	npcType = npctype_guard;
	guild = GIL_TPL;
	level = 17;
	voice = 13;
	id = 1480;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_Bald",13,1,tpl_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_01);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,20);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = rtn_start_1480;
};


func void rtn_start_1480()
{
	TA_Boss(6,0,21,0,"PATH_TAKE_HERB_06");
	TA_SitCampfire(21,0,6,0,"PATH_TAKE_HERB_07");
};


instance DIA_BALOR_TPL(C_Info)
{
	npc = tpl_1480_templer;
	condition = dia_balor_tpl_condition;
	information = dia_balor_tpl_info;
	important = 1;
	permanent = 0;
};


func int dia_balor_tpl_condition()
{
	return 1;
};

func void dia_balor_tpl_info()
{
	AI_Output(self,other,"SVM_13_YouStoleFromGur");	//Ты обокрал Гуру! Они уже знают, что это был ты.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		AI_StartState(self,ZS_Attack,0,"");
	}
	else
	{
		AI_StartState(self,ZS_Attack,1,"");
	};
};

