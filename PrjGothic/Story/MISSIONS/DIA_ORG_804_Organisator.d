
instance Org_804_Organisator_Exit(C_Info)
{
	npc = ORG_804_Organisator;
	nr = 999;
	condition = Org_804_Organisator_Exit_Condition;
	information = Org_804_Organisator_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_804_Organisator_Exit_Condition()
{
	return 1;
};

func void Org_804_Organisator_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_804_ORGANISATOR_HELLO(C_Info)
{
	npc = ORG_804_Organisator;
	nr = 1;
	condition = org_804_organisator_hello_condition;
	information = org_804_organisator_hello_info;
	permanent = 1;
	description = "Привет. Кто ты?";
};


func int org_804_organisator_hello_condition()
{
	return 1;
};

func void org_804_organisator_hello_info()
{
	AI_Output(other,self,"DIA_Butch_Hello_15_00");	//Привет. Кто ты?
	AI_Output(self,other,"DIA_Butch_Hello_13_01");	//Это тебя не касается! Что-то ты мне совсем не нравишься!
	AI_StopProcessInfos(self);
};


instance Org_804_Organisator_Greet(C_Info)
{
	npc = ORG_804_Organisator;
	nr = 1;
	condition = Org_804_Organisator_Greet_Condition;
	information = Org_804_Organisator_Greet_Info;
	permanent = 0;
	important = 1;
};


func int Org_804_Organisator_Greet_Condition()
{
	if((Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (other.guild != GIL_GRD) && (other.guild != GIL_STT) && (other.guild != GIL_KDF) && (other.guild != GIL_ORG))
	{
		return 1;
	};
};

func void Org_804_Organisator_Greet_Info()
{
	var C_Npc Lares;
	AI_Output(self,other,"Org_804_Organisator_Greet_06_00");	//А ты куда собрался?
	if(Npc_HasItems(hero,TheList))
	{
		AI_Output(other,self,"ORG_801_Lares_BringList_15_00");	//У меня есть список припасов для Старой шахты.
		AI_Output(other,self,"Org_804_Organisator_PERM_15_00");	//Могу я увидеть Ларса?
		AI_Output(self,other,"Org_804_Organisator_PERM_06_01");	//Спроси об этом у Роско.
	}
	else
	{
		AI_Output(other,self,"Org_804_Organisator_WayTo_15_00");	//А куда еще здесь можно идти?
		AI_Output(self,other,"Org_804_Organisator_WayTo_06_01");	//К Ларсу.
		AI_Output(other,self,"Org_804_Organisator_ToLares_15_00");	//Мне нужно к Ларсу.
		AI_Output(self,other,"Org_804_Organisator_ToLares_06_01");	//Мне кажется, он не захочет с тобой разговаривать.
		AI_Output(other,self,"Org_804_Organisator_ToLares_15_02");	//Я сам с этим разберусь.
		AI_Output(self,other,"Org_804_Organisator_ToLares_06_03");	//Ну, не буду тебя задерживать.
	};
	AI_StopProcessInfos(self);
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


const string Org_804_CHECKPOINT = "NC_HUT23_OUT";

instance Info_Org_804_FirstWarn(C_Info)
{
	npc = ORG_804_Organisator;
	nr = 2;
	condition = Info_Org_804_FirstWarn_Condition;
	information = Info_Org_804_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_804_FirstWarn_Condition()
{
	if(((other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_KDF)) && (self.aivar[AIV_PASSGATE] == FALSE) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		if(Npc_GetDistToWP(hero,"NC_HUT23_OUT") < 450)
		{
			return TRUE;
		};
	};
};

func void Info_Org_804_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Org_804_FirstWarn_Info_06_00");	//Прислужникам Гомеза вход воспрещен! Уходи!
	if(Npc_HasItems(hero,TheList))
	{
		AI_Output(other,self,"ORG_801_Lares_BringList_15_00");	//У меня есть список припасов для Старой шахты.
		AI_Output(other,self,"Org_804_Organisator_PERM_15_00");	//Могу я увидеть Ларса?
		AI_Output(self,other,"Org_804_Organisator_PERM_06_01");	//Спроси об этом у Роско.
		self.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Org_804_CHECKPOINT);
		hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
		AI_StopProcessInfos(self);
		LARES_STOP = TRUE;
	};
};


instance Info_Org_804_LastWarn(C_Info)
{
	npc = ORG_804_Organisator;
	nr = 1;
	condition = Info_Org_804_LastWarn_Condition;
	information = Info_Org_804_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_804_LastWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && ((other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_KDF)) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Org_804_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Org_804_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Org_804_LastWarn_06_00");	//Убирайся, пока цел!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Org_804_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
	LARES_STOP = TRUE;
};


instance Info_Org_804_Attack(C_Info)
{
	npc = ORG_804_Organisator;
	nr = 1;
	condition = Info_Org_804_Attack_Condition;
	information = Info_Org_804_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_804_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && ((other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_KDF)) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Org_804_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Org_804_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	LARES_STOP = TRUE;
};

