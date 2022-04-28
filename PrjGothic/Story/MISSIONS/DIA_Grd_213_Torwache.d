
const string Grd_213_CHECKPOINT = "OCC_GATE_INSIDE";

instance Info_Grd_213_FirstWarn(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_FirstWarn_Condition;
	information = Info_Grd_213_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_213_FirstWarn_Condition()
{
	if(
		Npc_GetDistToWP(self,"OCC_GATE") < 700 &&
		(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) &&
		!isPermPass_OCCGATE &&
		(Npc_GetAttitude(self,hero) != ATT_FRIENDLY)
	)
	{
		return TRUE;
	};
	return false;
};

func void Info_Grd_213_FirstWarn_Info()
{
		PrintGlobals(PD_MISSION);
		AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_01");	//Стоять!
		AI_Output(hero,self,"Info_Grd_213_FirstWarn_Info_15_02");	//В чем дело?
		AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_03");	//Тебе нельзя заходить в замок! Убирайся!
		hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_213_CHECKPOINT);
		hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
		AI_StopProcessInfos(self);
};


instance Info_Grd_213_LastWarn(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_LastWarn_Condition;
	information = Info_Grd_213_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_213_LastWarn_Condition()
{
	if(
		(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) &&
		!isPermPass_OCCGATE  &&
		(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) &&
		(Npc_GetDistToWP(hero,Grd_213_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
	)
	{
		return TRUE;
	};
};

func void Info_Grd_213_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Grd_213_LastWarn_07_01");	//Ты оглох? Еще шаг, и я превращу тебя в корм для червей!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_213_Attack(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Attack_Condition;
	information = Info_Grd_213_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_213_Attack_Condition()
{
	if(
		(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) &&
		!isPermPass_OCCGATE  &&
		(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) &&
		(Npc_GetDistToWP(hero,Grd_213_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
	)
	{
		return TRUE;
	};
};

func void Info_Grd_213_Attack_Info()
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


instance Grd_213_Torwache_WELCOME(C_Info)
{
	npc = Grd_213_Torwache;
	condition = Grd_213_Torwache_WELCOME_Condition;
	information = Grd_213_Torwache_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int Grd_213_Torwache_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void Grd_213_Torwache_WELCOME_Info()
{
	AI_Output(self,other,"Grd_213_Torwache_WELCOME_Info_07_01");	//Я слышал, ты стал одним из нас. Неплохо для того, кто так мало времени провел в колонии.
};


instance Info_Grd_213_EXIT(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 999;
	condition = Info_Grd_213_EXIT_Condition;
	information = Info_Grd_213_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Grd_213_EXIT_Condition()
{
	return 1;
};

func void Info_Grd_213_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Grd_213_Abblitzen(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Abblitzen_Condition;
	information = Info_Grd_213_Abblitzen_Info;
	permanent = 1;
	description = "Тебе следует менять вид деятельности. Может, пустишь в замок?";
};


func int Info_Grd_213_Abblitzen_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void Info_Grd_213_Abblitzen_Info()
{
	AI_Output(other,self,"Info_Grd_213_Abblitzen_15_00");	//Тебе иногда следует менять вид деятельности, чтобы жизнь разнообразить. Может, пустишь меня в замок?
	AI_Output(self,other,"Info_Grd_213_Abblitzen_07_01");	//Разнообразить, говоришь? А мне нравится эта идея. Мне уже так давно не удавалось хорошо проучить такого как ты.
	AI_StopProcessInfos(self);
};


instance Info_Grd_213_Passgate(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Passgate_Condition;
	information = Info_Grd_213_Passgate_Info;
	permanent = 1;
	description = "Ну, все в порядке?";
};


func int Info_Grd_213_Passgate_Condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void Info_Grd_213_Passgate_Info()
{
	AI_Output(other,self,"Info_Grd_213_Passgate_15_00");	//Ну, все в порядке?
	if(
		C_Npc_IsBelongToCamp(other,OLDCAMP)
	)
	{
		if(
			other.guild == GIL_STT
		||	other.guild == GIL_GRD
		)
		{
			AI_Output(self,other,"Info_Grd_213_Passgate_NULL_02");	//Да, да.. не отвлекай меня.
		}
		else if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"Info_Grd_213_Passgate_NULL_03");	//... ам.. д-даа.. все в порядке, у нас все хорошо..
		}
		else if(other.guild == GIL_VLK)
		{
			AI_Output(self,other,"Info_Grd_213_Passgate_07_01");	//Хватит стоять в воротах и мешать другим, проходи!
		}
		else
		{
			AI_Output(self,other,"Info_Grd_213_Passgate_07_01");	//Хватит стоять в воротах и мешать другим, проходи!
		};
	}
	else
	{
		AI_Output(self,other,"Info_Grd_213_Passgate_07_01");	//Хватит стоять в воротах и мешать другим, проходи!
	};
	AI_StopProcessInfos(self);
};

