
instance GRD_896_GARDIST(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 25;
	voice = 3;
	id = 896;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",92,1,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_LightGuardsSword_03);
	EquipItem(self,ItRw_Crossbow_03);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoMutton);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_896;
};


func void rtn_start_896()
{
	TA_GuardPalisade(6,0,21,0,"OW_OM_NEW1");
	TA_GuardPalisade(21,0,6,0,"OW_OM_NEW1");
};

func void rtn_fmtaken_896()
{
	TA_GuardPalisade(6,0,21,0,"OCC_RUIN_LEFT_GANGWAY_BACK");
	TA_GuardPalisade(21,0,6,0,"OCC_RUIN_LEFT_GANGWAY_BACK");
};

func void rtn_dead2_896()
{
	TA_Stay(6,0,21,0,"OW_PATH_261");
	TA_Stay(21,0,6,0,"OW_PATH_261");
};


instance INFO_GRD896_EXIT(C_Info)
{
	npc = grd_896_gardist;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance GRD_895_GARDIST(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 25;
	voice = 5;
	id = 895;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",90,1,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_03);
	EquipItem(self,ItRw_Crossbow_03);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoMutton);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_895;
};


func void rtn_start_895()
{
	TA_GuardWheelOpen(6,0,21,0,"OW_OM_ENTRANCE02_WHEEL_USE");
	TA_GuardWheelOpen(21,0,6,0,"OW_OM_ENTRANCE02_WHEEL_USE");
};

func void rtn_fmtaken_895()
{
	TA_GuardPalisade(6,0,21,0,"OCC_MERCS_LEFT_ROOM_FRONT");
	TA_GuardPalisade(21,0,6,0,"OCC_MERCS_LEFT_ROOM_FRONT");
};

func void rtn_dead2_895()
{
	TA_Stay(6,0,21,0,"OW_PATH_261");
	TA_Stay(21,0,6,0,"OW_PATH_261");
};


instance INFO_GRD895_EXIT(C_Info)
{
	npc = grd_895_gardist;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance GRD_894_GARDIST(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 25;
	voice = 4;
	id = 894;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",46,1,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_03);
	EquipItem(self,ItRw_Crossbow_03);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoMutton);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_894;
};


func void rtn_start_894()
{
	TA_StandAround(6,0,12,0,"OW_OM_NEW4");
	TA_RoastScavenger(12,0,16,0,"OW_OM_NEW4");
	TA_StandAround(16,0,18,0,"OW_OM_NEW4");
	TA_RoastScavenger(18,0,23,0,"OW_OM_NEW4");
	TA_Sleep(23,0,6,0,"OW_OM_NEW5");
};

func void rtn_fmtaken_894()
{
	TA_GuardPalisade(6,0,21,0,"OW_PATH_1_17_3");
	TA_GuardPalisade(21,0,6,0,"OW_PATH_1_17_3");
};

func void rtn_dead2_894()
{
	TA_Stay(6,0,21,0,"OW_PATH_261");
	TA_Stay(21,0,6,0,"OW_PATH_261");
};


instance INFO_GRD894_EXIT(C_Info)
{
	npc = grd_894_gardist;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance GRD_893_GARDIST(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 25;
	voice = 14;
	id = 893;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",84,1,grd_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_03);
	EquipItem(self,ItRw_Crossbow_03);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoMutton);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_893;
};


func void rtn_start_893()
{
	TA_PracticeSword(6,0,12,0,"OW_OM_NEW8");
	TA_StandAround(12,0,16,0,"OW_OM_NEW10");
	TA_PracticeSword(16,0,18,0,"OW_OM_NEW8");
	TA_StandAround(18,0,23,0,"OW_OM_NEW10");
	TA_Sleep(23,0,6,0,"OW_OM_NEW9");
};

func void rtn_fmtaken_893()
{
	TA_GuardPalisade(6,0,21,0,"OW_PATH_1_17");
	TA_GuardPalisade(21,0,6,0,"OW_PATH_1_17");
};

func void rtn_dead2_893()
{
	TA_Stay(6,0,21,0,"OW_PATH_261");
	TA_Stay(21,0,6,0,"OW_PATH_261");
};


instance INFO_GRD893_EXIT(C_Info)
{
	npc = grd_893_gardist;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance GRD_872_GARDIST(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 25;
	voice = 19;
	id = 872;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",4,1,grd_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_03);
	EquipItem(self,ItRw_Crossbow_03);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoMutton);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_872;
};


func void rtn_start_872()
{
	TA_GuardPalisade(6,0,22,0,"OW_OM_NEW6");
	TA_GuardPalisade(22,0,6,0,"OW_OM_NEW6");
};

func void rtn_sleep_872()
{
	TA_StandAround(8,0,21,0,"OW_OM_NEW5");
	TA_Sleep(21,0,8,0,"OW_OM_NEW9");
};

func void rtn_dead_872()
{
	TA_Stay(6,0,21,0,"OW_OM_ENTRANCE04");
	TA_Stay(21,0,6,0,"OW_OM_ENTRANCE04");
};

func void rtn_dead2_872()
{
	TA_Stay(6,0,21,0,"OW_PATH_261");
	TA_Stay(21,0,6,0,"OW_PATH_261");
};


instance INFO_GRD872_EXIT(C_Info)
{
	npc = grd_872_gardist;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


const string GRD_872_CHECKPOINT = "OW_OM_ENTRANCE02_WHEEL";

var C_Item EQPANTS;
instance INFO_GRD872_OM(C_Info)
{
	npc = grd_872_gardist;
	nr = 1;
	condition = info_grd872_om_condition;
	information = info_grd872_om_info;
	permanent = 1;
	important = 1;
};


func int info_grd872_om_condition()
{
	EQPANTS = Npc_GetEquippedArmor(hero);
	if((Hlp_GetInstanceID(eqpants) != Hlp_GetInstanceID(vlk_armor_l)) && (Hlp_GetInstanceID(eqpants) != Hlp_GetInstanceID(vlk_armor_m)) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Kapitel < 4) && (Npc_GetTrueGuild(hero) == GIL_None) && !Npc_HasItems(hero,ItAt_Crawlerqueen) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return 1;
	};
};

func void info_grd872_om_info()
{
	AI_Output(self,hero,"OM_GRD_01");	//Ты что, заблудился? Куда собрался?
	if(Diego_BringList == LOG_RUNNING)
	{
		AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//Диего прислал меня сюда. Я должен забрать список.
		AI_Output(self,other,"SVM_19_WeWillMeetAgain");	//Я тебя запомнил...
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//Ну...
		AI_Output(self,other,"SVM_19_GetOutOfHere");	//Проваливай!
		hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_872_CHECKPOINT);
		hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
		AI_StopProcessInfos(self);
	};
};


instance INFO_GRD_872_LASTWARN(C_Info)
{
	npc = grd_872_gardist;
	nr = 2;
	condition = info_grd_872_lastwarn_condition;
	information = info_grd_872_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_872_lastwarn_condition()
{
	if((Hlp_GetInstanceID(eqpants) != Hlp_GetInstanceID(vlk_armor_l)) && (Hlp_GetInstanceID(eqpants) != Hlp_GetInstanceID(vlk_armor_m)) && (Kapitel < 4) && !Npc_HasItems(hero,ItAt_Crawlerqueen) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_872_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 95)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_872_lastwarn_info()
{
	AI_Output(self,other,"SVM_19_GetOutOfHere");	//Проваливай!
	if(Diego_BringList == LOG_RUNNING)
	{
		AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//Диего прислал меня сюда. Я должен забрать список.
		AI_Output(self,other,"SVM_19_WeWillMeetAgain");	//Я тебя запомнил...
		self.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_872_CHECKPOINT);
		hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	};
	AI_StopProcessInfos(self);
};


instance INFO_GRD_872_ATTACK(C_Info)
{
	npc = grd_872_gardist;
	nr = 1;
	condition = info_grd_872_attack_condition;
	information = info_grd_872_attack_info;
	permanent = 1;
	important = 1;
};


func int info_grd_872_attack_condition()
{
	if((Hlp_GetInstanceID(eqpants) != Hlp_GetInstanceID(vlk_armor_l)) && (Hlp_GetInstanceID(eqpants) != Hlp_GetInstanceID(vlk_armor_m)) && (Kapitel < 4) && !Npc_HasItems(hero,ItAt_Crawlerqueen) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_872_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 80)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_872_attack_info()
{
	if(Diego_BringList == LOG_RUNNING)
	{
		AI_DrawWeapon(self);
		AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//Диего прислал меня сюда. Я должен забрать список.
		AI_Output(self,other,"SVM_19_WeWillMeetAgain");	//Я тебя запомнил...
		AI_RemoveWeapon(self);
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.aivar[AIV_LASTDISTTOWP] = 0;
		hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
		B_FullStop(self);
		AI_StopProcessInfos(self);
		B_SetAttackReason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,hero);
		AI_StartState(self,ZS_Attack,1,"");
	};
};


instance INFO_GRD872_OM0(C_Info)
{
	npc = grd_872_gardist;
	nr = 1;
	condition = info_grd872_om0_condition;
	information = info_grd872_om0_info;
	permanent = 0;
	important = 1;
};


func int info_grd872_om0_condition()
{
	if((Kapitel < 4) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || (Npc_GetTrueGuild(hero) == GIL_ORG)) && !Npc_HasItems(hero,ItAt_Crawlerqueen) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void info_grd872_om0_info()
{
	AI_Output(self,hero,"OM_GRD_01");	//Ты что, заблудился? Куда собрался?
	AI_Output(hero,self,"Info_Org_876_FirstWarn_Info_15_01");	//Туда.
	AI_Output(self,hero,"OM_GRD_02");	//Не шляйся тут! Что, в вашей шахте закончилась руда?
	AI_Output(hero,self,"KDW_600_Saturas_TIMESUP_Info_15_05");	//Нет...
	AI_Output(self,hero,"OM_GRD_03");	//Тогда поделись! С тебя триста кусков, и я сделаю вид, что не видел здесь придурка из Нового лагеря.
	Info_ClearChoices(info_grd872_om0);
	if(Npc_HasItems(hero,ItMiNugget) >= 300)
	{
		Info_AddChoice(info_grd872_om0,"Ладно, вот тебе руда!",info_grd872_om_1);
	};
	Info_AddChoice(info_grd872_om0,"Но у меня не так много руды...",info_grd872_om_2);
	Info_AddChoice(info_grd872_om0,"Не думаю, что ты получишь от меня хоть что-нибудь.",info_grd872_om_3);
};

func void info_grd872_om_1()
{
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	b_printtrademsg1("Отдано руды: 300");
	B_GiveInvItems(hero,self,ItMiNugget,300);
	AI_Output(self,hero,"OM_GRD_04");	//Не знаю, что ты задумал, но в шахте полно стражников - если решишь что-то стащить, то тебя мигом порубят на куски.
	AI_Output(self,hero,"OM_GRD_05");	//Пойду-ка я посплю...
	self.aivar[AIV_PASSGATE] = TRUE;
	Npc_ExchangeRoutine(self,"sleep");
	AI_StopProcessInfos(self);
};

func void info_grd872_om_2()
{
	AI_Output(hero,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//Но у меня не так много руды.
	AI_Output(self,hero,"OM_GRD_06");	//Тогда я заберу у тебя все, что найду!
	AI_StopProcessInfos(self);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

func void info_grd872_om_3()
{
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_08");	//Не думаю, что ты получишь от меня хоть что-нибудь.
	AI_Output(self,hero,"OM_GRD_06");	//Тогда я заберу у тебя все, что найду!
	AI_StopProcessInfos(self);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

