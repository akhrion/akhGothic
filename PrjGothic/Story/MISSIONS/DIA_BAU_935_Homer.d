
instance DIA_Homer_EXIT(C_Info)
{
	npc = BAU_935_Homer;
	nr = 999;
	condition = DIA_Homer_EXIT_Condition;
	information = DIA_Homer_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Homer_EXIT_Condition()
{
	return 1;
};

func void DIA_Homer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Homer_Hello(C_Info)
{
	npc = BAU_935_Homer;
	nr = 1;
	condition = DIA_Homer_Hello_Condition;
	information = DIA_Homer_Hello_Info;
	permanent = 0;
	description = "Ты что-то ищешь?";
};


func int DIA_Homer_Hello_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Homer_LurkerClaw))
	{
		return true;
	};
};

func void DIA_Homer_Hello_Info()
{
	AI_Output(other,self,"DIA_Homer_Hello_15_00");	//Ты что-то ищешь?
	AI_Output(self,other,"DIA_Homer_Hello_02_01");	//Я ищу течь в плотине. Похоже, над основанием поработал шныг.
	AI_Output(self,other,"DIA_Homer_Hello_02_02");	//Эта тварь своими зубами и когтями подтачивает камни и деревянные балки под водой.
	AI_Output(self,other,"DIA_Homer_Hello_02_03");	//Если так будет продолжаться, плотина вскоре разрушится.
};


instance DIA_Homer_BuiltDam(C_Info)
{
	npc = BAU_935_Homer;
	nr = 2;
	condition = DIA_Homer_BuiltDam_Condition;
	information = DIA_Homer_BuiltDam_Info;
	permanent = 0;
	description = "Это ты ее построил?";
};


func int DIA_Homer_BuiltDam_Condition()
{
	if(
		Npc_KnowsInfo(hero,DIA_Homer_Hello)
	||	Npc_KnowsInfo(hero,DIA_Homer_LurkerClaw)
	)
	{
		return 1;
	};
};

func void DIA_Homer_BuiltDam_Info()
{
	AI_Output(other,self,"DIA_Homer_BuiltDam_15_00");	//Это ты ее построил?
	AI_Output(self,other,"DIA_Homer_BuiltDam_02_01");	//Да. Я построил эту плотину, когда мы основали Новый лагерь.
	AI_Output(self,other,"DIA_Homer_BuiltDam_02_02");	//Конечно, все помогали, но я был главным строителем.
};


instance DIA_Homer_WannaHelp(C_Info)
{
	npc = BAU_935_Homer;
	nr = 1;
	condition = DIA_Homer_WannaHelp_Condition;
	information = DIA_Homer_WannaHelp_Info;
	permanent = 0;
	description = "Может, я могу тебе чем-нибудь помочь?";
};


func int DIA_Homer_WannaHelp_Condition()
{
	if(
		Npc_KnowsInfo(hero,DIA_Homer_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Homer_LurkerClaw)
	)
	{
		return 1;
	};
};

func void DIA_Homer_WannaHelp_Info()
{
	AI_Output(other,self,"DIA_Homer_WannaHelp_15_00");	//Может, я могу тебе чем-нибудь помочь?
	AI_Output(self,other,"DIA_Homer_WannaHelp_02_01");	//Конечно. Просто избавься от этой твари, пока она не разрушила плотину.
//	Wld_InsertNpc(DamLurker,"NC_SPAWN_DAM_LURKER2");
	Homer_DamLurker = LOG_RUNNING;
	Log_CreateTopic(CH1_DamLurker,LOG_MISSION);
	Log_SetTopicStatus(CH1_DamLurker,LOG_RUNNING);
	B_LogEntry(CH1_DamLurker,"Гомер рассказал мне, что его плотину подтачивает шныг. Если я расправлюсь с ним, плотину можно будет отремонтировать.");
};


instance DIA_Homer_Running(C_Info)
{
	npc = BAU_935_Homer;
	nr = 1;
	condition = DIA_Homer_Running_Condition;
	information = DIA_Homer_Running_Info;
	permanent = 0;
	description = "Где найти этого шныга?";
};


func int DIA_Homer_Running_Condition()
{
	if(Homer_DamLurker == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Homer_Running_Info()
{
	AI_Output(other,self,"DIA_Homer_Running_15_00");	//Где найти этого шныга?
	AI_Output(self,other,"DIA_Homer_Running_02_01");	//Я бы поискал на другой стороне озера. Туда никто не ходит. Скорее всего, именно там находится логово шныга.
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry(CH1_DamLurker,"Шныг живет на другом берегу озера.");
};


instance DIA_Homer_Success(C_Info)
{
	npc = BAU_935_Homer;
	nr = 2;
	condition = DIA_Homer_Success_Condition;
	information = DIA_Homer_Success_Info;
	permanent = 0;
	description = "Я убил шныга!";
};


func int DIA_Homer_Success_Condition()
{
	var C_Npc Lurker;
	Lurker = Hlp_GetNpc(DamLurker);
	PrintDebugString(PD_MISSION,"Имя:",Lurker.name);
	PrintDebugInt(PD_MISSION,"Жизненная сила:",Lurker.attribute);
	if((Homer_DamLurker == LOG_RUNNING) && Npc_HasItems(hero,ItAt_DamLurker_01))
	{
		return 1;
	};
};

func void DIA_Homer_Success_Info()
{
	AI_Output(other,self,"DIA_Homer_Success_15_00");	//Я убил шныга!
	AI_Output(self,other,"DIA_Homer_Success_02_01");	//Молодец! Лорд прислал мне в помощь несколько людей, чтобы починить плотину.
	AI_Output(self,other,"DIA_Homer_Success_02_02");	//Теперь, наконец-то, я смогу немного поспать.
	Homer_DamLurker = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_DamLurker,LOG_SUCCESS);
	B_LogEntry(CH1_DamLurker,"Со шныгом покончено. Гомер теперь может спать спокойно.");
	B_GiveXP(XP_ReportDeadDamLurker);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_ExchangeRoutine(BAU_924_Bauer,"REPAIR");
	B_ExchangeRoutine(BAU_928_Bauer,"REPAIR");
	B_ExchangeRoutine(BAU_929_Bauer,"REPAIR");
	B_ExchangeRoutine(BAU_930_Bauer,"REPAIR");
};
instance DIA_Homer_LurkerClaw(C_Info)
{
	npc = BAU_935_Homer;
	nr = 2;
	condition = DIA_Homer_LurkerClaw_Condition;
	information = DIA_Homer_LurkerClaw_Info;
	permanent = 0;
	important = true;
};
func int DIA_Homer_LurkerClaw_Condition()
{
	if(
		Npc_HasItems(hero,ItAt_DamLurker_01)
	&&	(
			Homer_DamLurker == LOG_SUCCESS
		||	Homer_DamLurker == LOG_NOTSTARTED
		)
	)
	{
		return true;
	};
};
func void DIA_Homer_LurkerClaw_Info()
{
	if(Homer_DamLurker == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Homer_LurkerClaw_NULL_00");	//О, это когти того шныга у тебя?
		AI_Output(other,self,"DIA_Homer_LurkerClaw_NULL_01");	//Да, это они.
		AI_Output(self,other,"DIA_Homer_LurkerClaw_NULL_02");	//Сколько этот гад мне нерв попортил!
		AI_Output(other,self,"DIA_Homer_LurkerClaw_NULL_03");	//Вот возьми. Будет тебе напоминанием о ваших отношениях.
	}
	else
	{
		AI_Output(self,other,"DIA_Homer_LurkerClaw_NULL_04");	//Я узнаю эту лапу.. ты ты убил эту тварь!?
		AI_Output(other,self,"DIA_Homer_LurkerClaw_NULL_05");	//Что?
		AI_Output(self,other,"DIA_Homer_LurkerClaw_NULL_06");	//Ты убил ее?! Эту гадину, что постоянно подтачивала доски в плотине?
		AI_Output(other,self,"DIA_Homer_LurkerClaw_NULL_07");	//Я не понимаю о чем ты..
		AI_Output(self,other,"DIA_Homer_LurkerClaw_NULL_08");	//Этот коготь! Это коготь шныга, который постоянно разламывал мою плотину. Ты-же убил его?
		AI_Output(other,self,"DIA_Homer_LurkerClaw_NULL_09");	//Аа ты про это. Да! Я наткнулся на него там, за озером. Живучая тварина, сильная.. была.
		AI_Output(self,other,"DIA_Homer_LurkerClaw_NULL_10");	//Спасибо тебе!
	};
	B_GiveInvItems(other,self,ItAt_DamLurker_01,1);
	B_GiveXP(XP_DamLurkerClawHomer);
};


instance DIA_Homer_PERM(C_Info)
{
	npc = BAU_935_Homer;
	nr = 2;
	condition = DIA_Homer_PERM_Condition;
	information = DIA_Homer_PERM_Info;
	permanent = 1;
	description = "Плотина в порядке?";
};


func int DIA_Homer_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Homer_LurkerClaw))
	{
		return 1;
	};
};

func void DIA_Homer_PERM_Info()
{
	AI_Output(other,self,"DIA_Homer_PERM_15_00");	//Плотина в порядке?
	AI_Output(self,other,"DIA_Homer_PERM_02_01");	//Она надежна, как крепость, которую никто не может разрушить.
};

