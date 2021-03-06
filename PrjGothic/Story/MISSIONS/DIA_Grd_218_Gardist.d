
instance DIA_Grd_218_FirstIn(C_Info)
{
	npc = Grd_218_Gardist;
	nr = 1;
	condition = DIA_Grd_218_FirstIn_Condition;
	information = DIA_Grd_218_FirstIn_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grd_218_FirstIn_Condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void DIA_Grd_218_FirstIn_Info()
{
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_00");	//Стой! Что тебе здесь нужно?
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_01");	//Просто хотел зайти.
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_02");	//Ты шутишь, да?
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_03");	//Лучше спроси об этом Торуса.
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_04");	//Конечно, спрошу. И если ты солгал, я лично тебя убью.
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_05");	//Это значит, что я могу войти?
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_06");	//Да, давай быстрее!
	AI_StopProcessInfos(self);
};


const string Grd_218_CHECKPOINT = "OCC_BARONS_HALLWAY_FRONT";

instance Info_Grd_218_FirstWarn(C_Info)
{
	npc = Grd_218_Gardist;
	nr = 1;
	condition = Info_Grd_218_FirstWarn_Condition;
	information = Info_Grd_218_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_218_FirstWarn_Condition()
{
	if(
		(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) &&
		(self.aivar[AIV_PASSGATE] == FALSE) &&
		(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) &&
		Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)
	)
	{
		return TRUE;
	};
	return false;
};

func void Info_Grd_218_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Grd_218_FirstWarn_Info_07_01");	//Стой! Ни шагу дальше!
	AI_Output(hero,self,"Info_Grd_218_FirstWarn_Info_15_02");	//Это почему?
	AI_Output(self,hero,"Info_Grd_218_FirstWarn_Info_07_03");	//Для таких как ты дом Баронов закрыт, понял?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_218_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_218_Attack(C_Info)
{
	npc = Grd_218_Gardist;
	nr = 1;
	condition = Info_Grd_218_Attack_Condition;
	information = Info_Grd_218_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_218_Attack_Condition()
{
	if(
		(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) &&
		(self.aivar[AIV_PASSGATE] == FALSE) &&
		(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) &&
		(Npc_GetDistToWP(hero,Grd_218_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 200)) &&
		Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)
	)
	{
		return TRUE;
	};
};

func void Info_Grd_218_Attack_Info()
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

