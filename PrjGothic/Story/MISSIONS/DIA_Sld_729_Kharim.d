
instance Info_Kharim_Exit(C_Info)
{
	npc = Sld_729_Kharim;
	nr = 999;
	condition = Info_Kharim_Exit_Condition;
	information = Info_Kharim_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Kharim_Exit_Condition()
{
	return 1;
};

func void Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Kharim_What(C_Info)
{
	npc = Sld_729_Kharim;
	nr = 1;
	condition = Info_Kharim_What_Condition;
	information = Info_Kharim_What_Info;
	permanent = 0;
	description = "Я здесь недавно. Скажи, кто ты?";
};


func int Info_Kharim_What_Condition()
{
	return 1;
};

func void Info_Kharim_What_Info()
{
	AI_Output(other,self,"Info_Kharim_What_15_00");	//Я здесь недавно. Скажи, кто ты?
	AI_Output(self,other,"Info_Kharim_What_09_01");	//Я Карим. Наверное, ты прибыл сюда недавно, иначе ты бы уже знал меня.
	AI_Output(self,other,"Info_Kharim_What_09_02");	//Я лучший боец из всех, кого забрасывали в этот лагерь.
};


var C_Npc ARENA_FIGHTER_2;
instance Info_Kharim_Charge(C_Info)
{
	npc = Sld_729_Kharim;
	nr = 2;
	condition = Info_Kharim_Charge_Condition;
	information = Info_Kharim_Charge_Info;
	permanent = 1;
	description = "Я вызываю тебя на бой! Пойдем, сразимся на арене!";
};


func int Info_Kharim_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && (!Npc_IsDead(Tpl_1422_GorHanis) && !Npc_IsDead(GRD_251_Kirgo)) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Npc_GetTrueGuild(hero) == GIL_None) && ((Kirgo_Charged != TRUE) || (KIRGO_CHARGED_END == TRUE)))
	{
		return 1;
	};
};

func void Info_Kharim_Charge_Info()
{
	AI_Output(other,self,"Info_Kharim_Charge_15_00");	//Я вызываю тебя на бой! Пойдем, сразимся на арене!
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_9_NotNow");	//Нет, не сейчас.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Kharim_Charge_09_01");	//Ты?! Да я от тебя мокрого места не оставлю!
		AI_Output(self,other,"Info_Kharim_Charge_09_02");	//Лучше забудь об этом и уходи, пока я не передумал!
		Info_ClearChoices(Info_Kharim_Charge);
		Info_AddChoice(Info_Kharim_Charge,"Хорошо, хорошо, я уже почти все забыл.",Info_Kharim_Charge_BACK);
		Info_AddChoice(Info_Kharim_Charge,"Так ты не принимаешь вызов, трус?!",Info_Kharim_Charge_Insult);
	};
};

func void Info_Kharim_Charge_BACK()
{
	AI_Output(other,self,"Info_Kharim_Charge_BACK_15_00");	//Хорошо, хорошо, я уже почти все забыл.
	AI_StopProcessInfos(self);
};

func void Info_Kharim_Charge_Insult()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_15_00");	//Так ты не принимаешь вызов, трус?!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_09_01");	//Придумай что-нибудь получше!
	Info_ClearChoices(Info_Kharim_Charge);
	Info_AddChoice(Info_Kharim_Charge,"Ты хочешь получить шанс выслужиться перед Гомезом!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice(Info_Kharim_Charge,"Может вот это тебя проймет: твоя мать была похожа на козу...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice(Info_Kharim_Charge,"Я не могу вспомнить ничего, что было бы доступно твоему умишку.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice(Info_Kharim_Charge,"Твои худые ручки не идут ни в какое сравнение с твоей рожей.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice(Info_Kharim_Charge,"Хорошо, хорошо, я уже почти все забыл.",Info_Kharim_Charge_BACK);
};

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Goats_15_00");	//Может вот это тебя проймет: твоя мать была похожа на козу...
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Goats_09_01");	//Странно, но ты угадал...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_GomezAss_15_00");	//Ты хочешь получить шанс выслужиться перед Гомезом!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_01");	//Что?! Ах ты, червяк! Да ты ничего о нас не знаешь! Новый Лагерь не подчиняется этому подонку!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_02");	//И, кроме того, я здесь по одной причине: мне приятно выбивать дурь из таких умников, как ты!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_03");	//С удовольствием окажу тебе эту услугу! Арена ждет нас!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,ItFo_Potion_Health_03);
		AI_UseItem(self,ItFo_Potion_Health_03);
	};
	Kharim_Charged = TRUE;
	Info_ClearChoices(Info_Kharim_Charge);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
	B_FullStop(GRD_251_Kirgo);
	B_FullStop(Tpl_1422_GorHanis);
	B_ExchangeRoutine(GRD_251_Kirgo,"nopractice");
	B_ExchangeRoutine(Tpl_1422_GorHanis,"nopractice");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Stupid_15_00");	//Подумать только: я не могу вспомнить ничего такого, что было бы доступно твоему умишку.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Stupid_09_01");	//Может быть, тебе стоит попробовать еще раз?
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Face_15_00");	//Ну, сначала я хотел обратить всеобщее внимание на твои худые ручки, но потом я увидел твою ужасную рожу.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Face_09_01");	//Ладно, я даю тебе еще один шанс убраться отсюда как можно быстрее!
};


instance Info_Kharim_InArena(C_Info)
{
	npc = Sld_729_Kharim;
	nr = 1;
	condition = Info_Kharim_InArena_Condition;
	information = Info_Kharim_InArena_Info;
	permanent = 0;
	important = 1;
};


func int Info_Kharim_InArena_Condition()
{
	if((Kharim_Charged == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 600))
	{
		return 1;
	};
};

func void Info_Kharim_InArena_Info()
{
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,ItFo_Potion_Health_03);
		AI_UseItem(self,ItFo_Potion_Health_03);
	};
	if(!Npc_HasItems(self,itmw_kharim) && !Npc_HasItems(self,ItMw_1H_Sword_01))
	{
		CreateInvItem(self,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Output(self,other,"Info_Kharim_InArena_09_00");	//Боль - это испытание силы духа!
	B_ClearImmortal(self);
	Wld_SendUntrigger("OC_ARENA_GATE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
	B_ExchangeRoutine(GRD_251_Kirgo,"START");
	B_ExchangeRoutine(grd_998_gardist,"wait");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	KHARIM_CHARGED_END = TRUE;
	PLAYERINARENA = TRUE;
};

