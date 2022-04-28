
const string Grd_212_CHECKPOINT = "OCC_GATE_INSIDE";
var C_Npc wache212;
var C_Npc wache213;

instance Info_Grd_212_FirstWarn(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_FirstWarn_Condition;
	information = Info_Grd_212_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_212_FirstWarn_Condition()
{
	if(
		Npc_GetDistToWP(self,"OCC_GATE") < 700 &&
		(
			(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) &&
			(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) &&
			!isPermPass_OCCGATE &&
			B_isTempPassExpired(self,hero) &&
			!B_isGoingExit(self,hero,"OCC_GATE_INSIDE")
//			Npc_GetDistToWP(hero,"OCC_GATE_INSIDE") > 1000
		)
	)
	{
		return TRUE;
	};
	return false;
};
func void akh_talk()
{
	AI_Output(wache212,hero,"PassToOCInnerRingExpire_NULL_04"); //(претворно недоумевая) Я знать его не знаю!
};

func int isPlayerGoingExit_OCCGATE()
{
/*
	if(isTempPass_grd212_FireMagesLetterFood)
	{
		isTempPass_grd212_FireMagesLetterFood = false;

		wache212 = Hlp_GetNpc(Grd_212_Torwache);
		wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = false;
		wache213.aivar[AIV_PASSGATE] = false;
		if(
			Npc_GetDistToWP(hero,"OCC_GATE_INSIDE") < 1100
		)
		{
			if(self.id == 212)
			{
				if(!Wld_IsTime(0,0,5,0))
				{
					if(getCurDayHours() < 7)
					{
						AI_Output(self,hero,"PassToOCInnerRingExpire_NULL_06"); //Ты меня подставить решил? Не видишь рассвета?
//						AI_StopProcessInfos(self);
						hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
						Npc_SetTarget(self,hero);
						AI_StartState(self,ZS_Attack,1,"");
//						AI_OutputSVM_Overlay(self,hero,"GRD212FuckAwayAnIdiot"); //Вали отсюда пройдоха!
					}
					else
					{
						AI_Output(self,hero,"PassToOCInnerRingExpire_NULL_01"); //(притворяясь) О, а ты кто такой?!
						hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
					};
				};
			}
			else
			{
				AI_Output(self,hero,"PassToOCInnerRingExpire_NULL_02"); //(вглядывается) Тыы.. кто такой ВООБЩЕ?
				if(!Npc_IsDead(wache212))
				{
//					AI_TurnToNpc(self,wache212);
					AI_Output(wache213,wache212,"PassToOCInnerRingExpire_NULL_03"); //Эй 212й, это ты его впустил?
//					B_Say(self,wache212,"$GRD213TPCINTRUDER");	//Эй 212й, это ты его впустил?
//					B_Say(wache212,self,"$GRD212TPCINTRUDER");//asd
					
//					AI_OutputSVM(self,wache212,"$GRD213TPCINTRUDER");//qweqweqwe
//					AI_TurnToNpc(wache212,self);
					AI_WaitTillEnd(wache213,wache212);
					AI_WaitForQuestion(wache212,akh_talk);
//					AI_Output(wache212,hero,"PassToOCInnerRingExpire_NULL_04"); //(претворно недоумевая) Я знать его не знаю!
					hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
					Npc_SetTarget(wache212,hero);
				}
				else
				{
					AI_Output(self,hero,"PassToOCInnerRingExpire_NULL_05"); //(в сомнениях) Ну ладно.. иди..
					B_LogEntry(CH1_PassToInnerOldCamp,"Кажется я не успел, но все обошлось..");
					AI_StopProcessInfos(self);
					return false;
				};
			};
			B_LogEntry(CH1_PassToInnerOldCamp,"Кажется я не успел..");
			
//			hero.aivar[AIV_LASTDISTTOWP] = 0;
//			hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
//			B_FullStop(self);
			AI_StopProcessInfos(self);
			return true;
//			B_IntruderAlert(self,other);
//			B_SetAttackReason(self,AIV_AR_INTRUDER);
//			Npc_SetTarget(self,hero);
//			AI_StartState(self,ZS_Attack,1,"");
		}
		else
		{
			B_LogEntry(CH1_PassToInnerOldCamp,"Кажется мое время вышло. В замок дорога снова закрыта.");
		};
	};
*/
	return false;
};
func void Info_Grd_212_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_01");	//Стой!
	AI_Output(hero,self,"Info_Grd_212_FirstWarn_Info_15_02");	//В чем дело?
	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_03");	//В замок нельзя входить без разрешения. Убирайся отсюда!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_LastWarn(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_LastWarn_Condition;
	information = Info_Grd_212_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_212_LastWarn_Condition()
{
	if(
		Npc_GetDistToWP(self,"OCC_GATE") < 700 &&
		(
			(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) &&
			(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) &&
			!isPermPass_OCCGATE &&
			B_isTempPassExpired(self,hero) &&
			(Npc_GetDistToWP(hero,Grd_212_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
		)
	)
	{
		return TRUE;
	};
	return false;
};

func void Info_Grd_212_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Grd_212_LastWarn_13_01");	//Ты что, оглох? Еще шаг, и я прибью тебя на месте.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_Attack(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Attack_Condition;
	information = Info_Grd_212_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_212_Attack_Condition()
{
	if(
		Npc_GetDistToWP(self,"OCC_GATE") < 700 &&
		(
			(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) &&
			(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) &&
			!isPermPass_OCCGATE &&
			B_isTempPassExpired(self,hero) &&
			(Npc_GetDistToWP(hero,Grd_212_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
		)
	)
	{
		return TRUE;
	};
	return false;
};

func void Info_Grd_212_Attack_Info()
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

instance Info_Grd_212_LateGoingExit(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_LateGoingExit_Condition;
	information = Info_Grd_212_LateGoingExit_Info;
	permanent = 0;
	important = 1;
};
func int Info_Grd_212_LateGoingExit_Condition()
{
	if(
		hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN &&
		B_isGoingExit(self,hero,"OCC_GATE_INSIDE") &&
		isTempPass_grd212 &&
		B_isTempPassExpired(self,hero) &&
		!isPermPass_OCCGATE
	)
	{
		return true;
	};
	return false;
};
func void Info_Grd_212_LateGoingExit_Info()
{
	if(!Wld_IsTime(0,0,5,0))
	{
		if(getCurDayHours() < 7)
		{
			AI_Output(self,hero,"PassToOCInnerRingExpire_NULL_06"); //Ты меня подставить решил? Не видишь рассвета?
			hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
			hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
			Npc_SetTarget(self,hero);
			AI_StartState(self,ZS_Attack,1,"");
//			AI_OutputSVM_Overlay(self,hero,"GRD212FuckAwayAnIdiot"); //Вали отсюда пройдоха!
		}
		else
		{
			AI_Output(self,hero,"PassToOCInnerRingExpire_NULL_01"); //(притворяясь) О, а ты кто такой?!
			hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
			B_IntruderAlert(self,other);
			B_SetAttackReason(self,AIV_AR_INTRUDER);
			Npc_SetTarget(self,hero);
			AI_StartState(self,ZS_Attack,1,"");
		};
	};
	B_LogEntry(CH1_PassToInnerOldCamp,"Кажется я не успел..");
	AI_StopProcessInfos(self);
};

instance Info_Grd_212_UnknownGoingExit(C_INFO)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_UnknownGoingExit_Condition;
	information = Info_Grd_212_UnknownGoingExit_Info;
	permanent = 1;
	important = 1;
};
func int Info_Grd_212_UnknownGoingExit_Condition()
{
	if(!Npc_KnowsInfo(hero,Info_Grd_212_FirstWarn))
	{
		return false;
	};
	return false;
};
func void Info_Grd_212_UnknownGoingExit_Info()
{
	AI_Output(self,hero,"akh_working_WHO_ARE_YOU");//WHO ARE YOU?
};

instance Info_Grd_212_EXIT(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 999;
	condition = Info_Grd_212_EXIT_Condition;
	information = Info_Grd_212_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Grd_212_EXIT_Condition()
{
	return 1;
};

func void Info_Grd_212_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_Abblitzen(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Abblitzen_Condition;
	information = Info_Grd_212_Abblitzen_Info;
	permanent = 1;
	description = "Я хочу попасть в замок!";
};


func int Info_Grd_212_Abblitzen_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE && getCurDayHours() > 4)
	{
		return 1;
	};
};

func void Info_Grd_212_Abblitzen_Info()
{
	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_00");	//Я хочу попасть в замок!
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_01");	//Да, как интересно! А мне хочется убраться отсюда подальше!
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_02");	//И, уж конечно, у меня есть и другие дела, кроме как следить за теми, кто пытается попасть в замок.
	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_03");	//Ты можешь пропустить меня...
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_04");	//Нет, не могу! Поговори с Торусом.
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_FirstIn(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_FirstIn_Condition;
	information = Info_Grd_212_FirstIn_Info;
	permanent = 0;
	important = 1;
};


func int Info_Grd_212_FirstIn_Condition()
{
	if(
		isPermPass_OCCGATE
	)
	{
		return 1;
	};
};

func void Info_Grd_212_FirstIn_Info()
{
	AI_Output(self,other,"Info_Grd_212_FirstIn_13_00");	//Стой!
	AI_Output(other,self,"Info_Grd_212_FirstIn_15_01");	//Да ладно, я поговорил с Торусом. Он разрешил мне войти.
	AI_Output(self,other,"Info_Grd_212_FirstIn_13_02");	//Я запомню твое лицо. Если ты сделаешь хоть одну ошибку, тебе не сдобровать!
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_Passgate(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Passgate_Condition;
	information = Info_Grd_212_Passgate_Info;
	permanent = 1;
	description = "Я могу войти?";
};


func int Info_Grd_212_Passgate_Condition()
{
	if(isPermPass_OCCGATE)
	{
		return 1;
	};
};

func void Info_Grd_212_Passgate_Info()
{
	AI_Output(other,self,"Info_Grd_212_Passgate_15_00");	//Я могу войти?
	AI_Output(self,other,"Info_Grd_212_Passgate_13_01");	//Еще один вопрос, и я уж точно никогда тебя не впущу.
	AI_StopProcessInfos(self);
};

