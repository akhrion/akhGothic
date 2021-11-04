
instance GUR_1211_BaalLukor(Npc_Default)
{
	name[0] = "Идол Люкор";
	npcType = npctype_friend;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GUR;
	level = 50;
	voice = 13;
	id = 1211;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,ItMw_1H_Sword_02);
	daily_routine = Rtn_start_1211;
	fight_tactic = FAI_HUMAN_Strong;
};


func void Rtn_start_1211()
{
	TA_Guard(23,0,16,0,"GRYD_025");
	TA_Guard(16,0,23,0,"GRYD_025");
};

func void Rtn_Follow_1211()
{
	TA_FollowPC(23,0,16,0,"GRYD_025");
	TA_FollowPC(16,0,23,0,"GRYD_025");
};

func void Rtn_WaitInSideTunnelOne_1211()
{
	TA_Stay(23,0,16,0,"GRYD_040");
	TA_Stay(16,0,23,0,"GRYD_040");
};

func void Rtn_WaitInSideTunnelTwo_1211()
{
	TA_Stay(23,0,16,0,"GRYD_047");
	TA_Stay(16,0,23,0,"GRYD_047");
};

func void Rtn_Door_1211()
{
	TA_Stay(23,0,16,0,"GRYD_060");
	TA_Stay(16,0,23,0,"GRYD_060");
};

func void Rtn_Teleport_1211()
{
	TA_FollowPC(23,0,16,0,"GRYD_060");
	TA_FollowPC(16,0,23,0,"GRYD_060");
};

func void Rtn_Meditate_1211()
{
	TA_Meditate(23,0,16,0,"GRYD_082");
	TA_Meditate(16,0,23,0,"GRYD_082");
};


instance GUR_999_BAALLUKOR(Npc_Default)
{
	name[0] = "Идол Люкор";
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GUR;
	level = 50;
	voice = 13;
	id = 999;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,ItMw_1H_Sword_02);
	daily_routine = rtn_start_999;
	fight_tactic = FAI_HUMAN_Strong;
};


func void rtn_start_999()
{
	TA_Stay(6,0,23,30,"PSI_VIEWPOINT");
	TA_SitAround(23,30,6,0,"PSI_34_HUT_IN");
};

func void rtn_remove_999()
{
	TA_Stay(23,0,16,0,"WP_INTRO01");
	TA_Stay(16,0,23,0,"WP_INTRO01");
};


instance INFO_LUKOR_PSI_EXIT(C_Info)
{
	npc = gur_999_baallukor;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_LUKOR_PSI_HI(C_Info)
{
	npc = gur_999_baallukor;
	condition = info_lukor_psi_hi_condition;
	information = info_lukor_psi_hi_info;
	important = 0;
	permanent = 0;
	description = "Пробудись!";
};


func int info_lukor_psi_hi_condition()
{
	return 1;
};

func void info_lukor_psi_hi_info()
{
	AI_Output(hero,self,"SVM_15_SectGreetings");	//Пробудись!
	if((Npc_GetTrueGuild(hero) != GIL_NOV) && (Npc_GetTrueGuild(hero) != GIL_TPL))
	{
		AI_Output(self,hero,"SVM_13_WhatDoYouWant");	//Что тебе от меня нужно?
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"SVM_13_FriendlyGreetings");	//У тебя все в порядке?
	};
};

