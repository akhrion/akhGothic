
instance DIA_Roscoe_Exit(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 999;
	condition = DIA_Roscoe_Exit_Condition;
	information = DIA_Roscoe_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Roscoe_Exit_Condition()
{
	return 1;
};

func void DIA_Roscoe_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Roscoe_BringList(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_BringList_Condition;
	information = DIA_Roscoe_BringList_Info;
	permanent = 0;
	description = "У меня есть список припасов для Старой шахты.";
};


func int DIA_Roscoe_BringList_Condition()
{
	if(Npc_HasItems(other,TheList) >= 1)
	{
		return 1;
	};
};

func void DIA_Roscoe_BringList_Info()
{
	AI_Output(other,self,"DIA_Roscoe_BringList_15_00");	//У меня есть список припасов для Старой шахты.
	AI_Output(self,other,"DIA_Roscoe_BringList_10_01");	//Неплохо. Как ты его достал?
	if(Npc_KnowsInfo(hero,stt_301_ian_getlist))
	{
		AI_Output(other,self,"DIA_Roscoe_BringList_15_02");	//Его дал мне Ян.
	}
	else
	{
		AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//Ну...
	};
	if(hero.guild != GIL_ORG)
	{
		AI_Output(self,other,"DIA_Roscoe_BringList_10_03");	//Ты смелый! Тебя прислали испытать меня, ведь так? Торус должно быть уже сходит с ума, я уверен.
		if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
		{
			AI_Output(other,self,"DIA_Roscoe_BringList_15_04");	//Я получил задание от Диего.
			AI_Output(self,other,"DIA_Roscoe_BringList_10_05");	//А Диего приказывает Торус.
		};
		AI_Output(other,self,"DIA_Roscoe_BringList_15_06");	//Так я могу пройти?
	};
	AI_Output(self,other,"DIA_Roscoe_BringList_10_07");	//Да, проходи! Ларс не поверит своим глазам.
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Roscoe_Mordrag(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_Mordrag_Condition;
	information = DIA_Roscoe_Mordrag_Info;
	important = 0;
	description = "Меня прислал Мордраг.";
};


func int DIA_Roscoe_Mordrag_Condition()
{
	if(Npc_HasItems(hero,MordragsRing))
	{
		return 1;
	};
};

func void DIA_Roscoe_Mordrag_Info()
{
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_00");	//Меня прислал Мордраг.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_01");	//Его уже давно здесь никто не видел. Похоже на то, что он переметнулся к Старому лагерю.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_02");	//Он показал мне дорогу сюда.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_03");	//Мордраг вернулся? Если встретишь его, то передай, что Ларс хочет видеть его.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_04");	//Мордраг передал кое-что для Ларса.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_05");	//Что?
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_06");	//Кольцо.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_07");	//Наверняка дорогая вещь... Хорошо, можешь увидеться с ним.
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Roscoe_WannaJoin(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_WannaJoin_Condition;
	information = DIA_Roscoe_WannaJoin_Info;
	permanent = 0;
	description = "Я хочу присоединиться к вам.";
};


func int DIA_Roscoe_WannaJoin_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Roscoe_Mordrag) && !Npc_KnowsInfo(hero,DIA_Roscoe_BringList) && (Npc_GetTrueGuild(hero) == GIL_None) && (oldHeroGuild == 0))
	{
		return 1;
	};
};

func void DIA_Roscoe_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Roscoe_WannaJoin_15_00");	//Я хочу присоединиться к вам.
	AI_Output(self,other,"DIA_Roscoe_WannaJoin_10_01");	//Ты не один такой. Если хочешь пройти, тебе придется предложить нечто особенное.
};


instance DIA_Roscoe_ComeAgain(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = DIA_Roscoe_ComeAgain_Condition;
	information = DIA_Roscoe_ComeAgain_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Roscoe_ComeAgain_Condition()
{
	if(
		((Npc_HasItems(hero,TheList) >= 1)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe))
	|| (Npc_KnowsInfo(hero,Org_826_Mordrag_AtNewcamp) && Npc_KnowsInfo(hero,ORG_801_Lares_BringList)))
	{
		return 1;
	};
};

func void DIA_Roscoe_ComeAgain_Info()
{
	AI_Output(self,other,"DIA_Roscoe_ComeAgain_10_00");	//Опять ты.
};


const string Roscoe_CHECKPOINT = "NC_HUT22_IN_MOVEMENT";

instance Info_Roscoe_FirstWarn(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = Info_Roscoe_FirstWarn_Condition;
	information = Info_Roscoe_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Roscoe_FirstWarn_Condition()
{
	if((LARES_STOP == FALSE) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Roscoe_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_00");	//И куда это ты собрался?
	AI_Output(hero,self,"Info_Roscoe_FirstWarn_Info_15_01");	//Я хочу поговорить с Ларсом.
	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_02");	//Ларс здесь, но у тебя должна быть веская причина, чтобы побеспокоить его.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
};


instance Info_Roscoe_LastWarn(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 1;
	condition = Info_Roscoe_LastWarn_Condition;
	information = Info_Roscoe_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Roscoe_LastWarn_Condition()
{
	if((LARES_STOP == FALSE) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Roscoe_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Roscoe_LastWarn_10_00");	//Ты что, глухой?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Roscoe_Attack(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 1;
	condition = Info_Roscoe_Attack_Condition;
	information = Info_Roscoe_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Roscoe_Attack_Condition()
{
	if((LARES_STOP == FALSE) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Roscoe_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};


instance INFO_ROSCOE_NEWWARN(C_Info)
{
	npc = ORG_840_Roscoe;
	nr = 2;
	condition = info_roscoe_newwarn_condition;
	information = info_roscoe_newwarn_info;
	permanent = 1;
	important = 1;
};


func int info_roscoe_newwarn_condition()
{
	if((LARES_STOP == TRUE) && ((other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_KDF)) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_roscoe_newwarn_info()
{
	AI_Output(self,hero,"SVM_11_YouDeafOrWhat");	//Ты хочешь, чтобы я лично занялся тобой? Убирайся!
	AI_StopProcessInfos(self);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	LARES_STOP = FALSE;
};

