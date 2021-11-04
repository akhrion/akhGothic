
instance INFO_OREGUARD(C_Info)
{
	npc = SLD_726_Soeldner;
	condition = info_oreguard_condition;
	information = info_oreguard_info;
	important = 1;
	permanent = 0;
};


func int info_oreguard_condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSRISK) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_oreguard_info()
{
	var C_Npc milten;
	milten = Hlp_GetNpc(PC_Mage);
	if(Npc_GetDistToWP(milten,"NC_PATH34") > 300)
	{
		AI_Teleport(milten,"NC_LOWER_CAVE_02");
		Npc_ExchangeRoutine(milten,"LSOreHeap_JustInCase");
	};
	CreateInvItem(milten,ItArScrollSleep);
	AI_SetWalkMode(milten,NPC_RUN);
	C_StopLookAt(milten);
	AI_GotoWP(milten,"NC_PATH_NEW1");
	AI_ReadySpell(milten,SPL_SLEEP,0);
	AI_TurnToNPC(milten,self);
	AI_PlayAni(milten,"T_MAGRUN_2_SLESHOOT");
	AI_Output(self,hero,"SVM_11_YouViolatedForbiddenTerritory");	//Эй, а ты как сюда попал?
	AI_Output(self,hero,"SVM_11_WhatDidYouInThere");	//Что это тебе здесь нужно? Убирайся, пока я не убрал тебя сам!
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
	AI_UnreadySpell(milten);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DRAINED");
};


const string OREGUARD_CHECKPOINT = "NC_PATH36";

instance INFO_OREGUARD_FIRSTWARN(C_Info)
{
	npc = SLD_726_Soeldner;
	nr = 1;
	condition = info_oreguard_firstwarn_condition;
	information = info_oreguard_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_oreguard_firstwarn_condition()
{
	if(!Npc_KnowsInfo(hero,Info_Milten_LSRISK) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (Npc_GetTrueGuild(hero) != GIL_SLD) && (Npc_GetTrueGuild(hero) != GIL_KDW) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1000))
	{
		return TRUE;
	};
};

func void info_oreguard_firstwarn_info()
{
	AI_Output(self,hero,"SVM_11_GetOutOfHere");	//Убирайся, или я вышвырну тебя отсюда!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,OREGUARD_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_OREGUARD_LASTWARN(C_Info)
{
	npc = SLD_726_Soeldner;
	nr = 2;
	condition = info_oreguard_lastwarn_condition;
	information = info_oreguard_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_oreguard_lastwarn_condition()
{
	if(!Npc_KnowsInfo(hero,Info_Milten_LSRISK) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,OREGUARD_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (Npc_GetTrueGuild(hero) != GIL_SLD) && (Npc_GetTrueGuild(hero) != GIL_KDW) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1000))
	{
		return TRUE;
	};
};

func void info_oreguard_lastwarn_info()
{
	AI_Output(self,hero,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,OREGUARD_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_OREGUARD_ATTACK(C_Info)
{
	npc = SLD_726_Soeldner;
	nr = 1;
	condition = info_oreguard_attack_condition;
	information = info_oreguard_attack_info;
	permanent = 1;
	important = 1;
};


func int info_oreguard_attack_condition()
{
	if(!Npc_KnowsInfo(hero,Info_Milten_LSRISK) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,OREGUARD_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (Npc_GetTrueGuild(hero) != GIL_SLD) && (Npc_GetTrueGuild(hero) != GIL_KDW) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1000))
	{
		return TRUE;
	};
};

func void info_oreguard_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

