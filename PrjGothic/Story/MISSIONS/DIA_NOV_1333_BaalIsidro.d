
instance DIA_BaalIsidro_EXIT(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 999;
	condition = DIA_BaalIsidro_EXIT_Condition;
	information = DIA_BaalIsidro_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalIsidro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalIsidro_Hello(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Hello_Condition;
	information = DIA_BaalIsidro_Hello_Info;
	permanent = 0;
	description = "Какой-то у тебя слишком грустный вид.";
};


func int DIA_BaalIsidro_Hello_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_BaalIsidro_Hello_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_00");	//Какой-то у тебя слишком грустный вид.
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_01");	//Какой проницательный!
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_02");	//Мне срочно нужно избавиться от целой горы болотника.
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_03");	//Ты продаешь товары из Лагеря сектантов?
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_04");	//Да.
};


instance DIA_BaalIsidro_TRADE(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 800;
	condition = DIA_BaalIsidro_TRADE_Condition;
	information = DIA_BaalIsidro_TRADE_Info;
	permanent = 1;
	description = "Покажи, что ты там продаешь.";
	trade = 1;
};


func int DIA_BaalIsidro_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalIsidro_Hello) && ((Kapitel < 3) || (BaalIsidro_DealerJob == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_TRADE_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_TRADE_15_00");	//Покажи, что ты там продаешь.
	AI_Output(self,other,"DIA_BaalIsidro_TRADE_03_01");	//Вот...
};


instance DIA_BaalIsidro_GimmeKraut(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_GimmeKraut_Condition;
	information = DIA_BaalIsidro_GimmeKraut_Info;
	permanent = 0;
	description = "Я могу помочь продавать болотник. Но тебе придется поделиться.";
};


func int DIA_BaalIsidro_GimmeKraut_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalIsidro_Hello) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_GimmeKraut_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_GimmeKraut_15_00");	//Я могу помочь тебе продавать болотник. Но тебе придется поделиться.
	AI_Output(self,other,"DIA_BaalIsidro_GimmeKraut_03_01");	//Даже не думай меня обмануть, я еще не слишком пьян, чтобы отдать весь мой болотник первому встречному.
	BAALISIDRO_JOINTS_STARTED = TRUE;
	Log_CreateTopic(CH1_DealerJob,LOG_MISSION);
	Log_SetTopicStatus(CH1_DealerJob,LOG_RUNNING);
	B_LogEntry(CH1_DealerJob,"Послушник Идол Исидро целыми днями пьянствует в баре на озере. Ему нужно продать свой болотник, но он ничего не может с собой поделать. Может быть, я смогу уговорить его поручить это дело мне...");
};


instance DIA_BaalIsidro_Problem(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Problem_Condition;
	information = DIA_BaalIsidro_Problem_Info;
	permanent = 0;
	description = "Идол Каган хочет найти себе другого помощника...";
};


func int DIA_BaalIsidro_Problem_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp) && Npc_KnowsInfo(hero,DIA_BaalIsidro_GimmeKraut) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_Problem_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Problem_15_00");	//Послушай меня: Идол Каган хочет найти себе другого помощника. Кажется, скоро тебе придется несладко.
	AI_Output(self,other,"DIA_BaalIsidro_Problem_03_01");	//Что? О великий Спящий! Как же мне избавиться от этой травы...
	if(BaalIsidro_GotDrink == FALSE)
	{
		B_LogEntry(CH1_DealerJob,"Идол Исидро был сильно напуган, когда я рассказал ему о планах Идола Кагана найти ему замену. Но этого было недостаточно, чтобы уговорить его.");
	}
	else
	{
		B_LogEntry(CH1_DealerJob,"Идол Исидро был сильно напуган, когда я рассказал ему о планах Идола Кагана найти ему замену.");
	};
};


var int BaalIsidro_GotDrink;

instance DIA_BaalIsidro_Drink(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_Drink_Condition;
	information = DIA_BaalIsidro_Drink_Info;
	permanent = 1;
	description = "Я тоже так думаю. Вот, выпей.";
};


func int DIA_BaalIsidro_Drink_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_Drink_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Drink_15_00");	//Я тоже так думаю. Вот, выпей.
	if((Npc_HasItems(other,ItFoBooze) > 0) || (Npc_HasItems(other,ItFoBeer) > 0) || (Npc_HasItems(other,ItFoWine) > 0))
	{
		AI_Output(self,other,"DIA_BaalIsidro_Drink_03_01");	//Спасибо тебе! Я выпью за твое здоровье!
		if(Npc_HasItems(other,ItFoBooze))
		{
			b_printtrademsg1("Отдан шнапс.");
			B_GiveInvItems(other,self,ItFoBooze,1);
			if(C_BodyStateContains(self,BS_SIT))
			{
				AI_UseMob(self,"CHAIR",-1);
				AI_TurnToNPC(self,hero);
				C_StopLookAt(self);
			};
			AI_UseItem(self,ItFoBooze);
		}
		else if(Npc_HasItems(other,ItFoBeer))
		{
			b_printtrademsg1("Отдано пиво.");
			B_GiveInvItems(other,self,ItFoBeer,1);
			if(C_BodyStateContains(self,BS_SIT))
			{
				AI_UseMob(self,"CHAIR",-1);
				AI_TurnToNPC(self,hero);
				C_StopLookAt(self);
			};
			AI_UseItem(self,ItFoBeer);
		}
		else if(Npc_HasItems(other,ItFoWine))
		{
			b_printtrademsg1("Отдано вино.");
			B_GiveInvItems(other,self,ItFoWine,1);
			if(C_BodyStateContains(self,BS_SIT))
			{
				AI_UseMob(self,"CHAIR",-1);
				AI_TurnToNPC(self,hero);
				C_StopLookAt(self);
			};
			AI_UseItem(self,ItFoWine);
		};
		BaalIsidro_GotDrink = TRUE;
		if(Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem))
		{
			B_LogEntry(CH1_DealerJob,"Мое угощение подействовало как нужно. Думаю, теперь Идол Исидро примет мое предложение.");
		}
		else
		{
			B_LogEntry(CH1_DealerJob,"Идол Исидро с радостью выпил за мое здоровье. Но, кажется, он все еще не согласен отдать мне свой болотник.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BaalIsidro_NO_Drink_03_00");	//Что? Где?
	};
};


instance DIA_BaalIsidro_ThinkAgain(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_ThinkAgain_Condition;
	information = DIA_BaalIsidro_ThinkAgain_Info;
	permanent = 1;
	description = "Подумай, я продам твой болотник, а прибыль мы поделим пополам!";
};


func int DIA_BaalIsidro_ThinkAgain_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob != LOG_RUNNING) && (BaalIsidro_DealerJob != LOG_SUCCESS)) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_ThinkAgain_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_00");	//Подумай, я продам твой болотник, а прибыль мы поделим пополам!
	if((BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem))
	{
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_01");	//О Спящий! Как же я замучился с этим болотником. Ты же не хочешь обвести меня вокруг пальца, да?
		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_02");	//Честное слово.
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_03");	//Хорошо, вот тебе весь болотник... Ты должен получить за него не меньше 400 кусков руды. Мы поделим их пополам. Как справишься со всем, приходи ко мне. Я все время буду здесь.
		b_printtrademsg1("Получено 50 сигарет.");
		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_04");	//Не знаешь, кто здесь может купить большую партию болотника?
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_05");	//Если бы я знал, я бы и сам сходил к нему.
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_06");	//Да, без этой проклятой травы я чувствую себя гораздо лучше.
		BaalIsidro_DealerJob = LOG_RUNNING;
		B_LogEntry(CH1_DealerJob,"Идол Исидро передал мне свой болотник. Я должен его продать и половину выручки принести ему.");
		Npc_RemoveInvItems(self,ItMiJoint_1,10);
		CreateInvItems(other,ItMiJoint_1,10);
		Npc_RemoveInvItems(self,ItMiJoint_2,20);
		CreateInvItems(other,ItMiJoint_2,20);
		Npc_RemoveInvItems(self,ItMiJoint_3,20);
		CreateInvItems(other,ItMiJoint_3,20);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00");	//Нет, ни за что. Я и сам смогу с этим справиться...
	};
};


instance DIA_BaalIsidro_RUNNING(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = DIA_BaalIsidro_RUNNING_Condition;
	information = DIA_BaalIsidro_RUNNING_Info;
	permanent = 1;
	description = "Я продал весь болотник.";
};


func int DIA_BaalIsidro_RUNNING_Condition()
{
	if((BaalIsidro_DealerJob == LOG_RUNNING) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_BaalIsidro_RUNNING_Info()
{
	AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_00");	//Я продал весь болотник.
	AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_01");	//А где мои 200 кусков?
	if(Npc_HasItems(other,ItMiNugget) >= 200)
	{
		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_02");	//Вот они.
		b_printtrademsg1("Отдано руды: 200");
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_03");	//Хорошо... А этот Идол Каган пусть делает что хочет!
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_04");	//Приятно иметь с тобой дело, брат.
		B_GiveInvItems(hero,self,ItMiNugget,200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_DealerJob,LOG_SUCCESS);
		B_LogEntry(CH1_DealerJob,"Идол Исидро был очень рад, что я избавил его от горы болотника и принес 200 кусков руды.");
		B_GiveXP(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_NoOre_15_05");	//Я забыл взять твою долю.
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_NoOre_03_06");	//Так принеси их!
		AI_StopProcessInfos(self);
	};
};


instance DIA_BAALISIDRO_REVENGE(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = dia_baalisidro_revenge_condition;
	information = dia_baalisidro_revenge_info;
	permanent = 0;
	important = 1;
};


func int dia_baalisidro_revenge_condition()
{
	if((Kapitel > 2) && (BaalIsidro_DealerJob == LOG_RUNNING) && (BAALISIDRO_JOINTS_STARTED == TRUE))
	{
		return 1;
	};
};

func void dia_baalisidro_revenge_info()
{
	if(C_NpcBelongsToPsiCamp(hero))
	{
		AI_Output(self,other,"SVM_3_HeyYou");	//Эй, ты!
	}
	else
	{
		AI_Output(self,other,"SVM_3_YouViolatedForbiddenTerritory");	//Эй! Откуда ты здесь взялся?
	};
	AI_DrawWeapon(self);
	AI_Output(self,other,"SVM_3_YouStoleFromMe");	//Ты обокрал меня, мерзкий вор!
	BaalIsidro_DealerJob = LOG_FAILED;
	Log_SetTopicStatus(CH1_DealerJob,LOG_FAILED);
	B_LogEntry(CH1_DealerJob,"Из-за меня Идола Исидро с позором вернули в Болотный лагерь.");
	Info_ClearChoices(dia_baalisidro_revenge);
	if(Npc_HasItems(hero,ItMiNugget) >= 200)
	{
		Info_AddChoice(dia_baalisidro_revenge,"Ладно, вот тебе руда!",dia_baalisidro_revenge_giveore);
	}
	else
	{
		Info_AddChoice(dia_baalisidro_revenge,"Но у меня не так много руды.",dia_baalisidro_revenge_noore);
	};
	Info_AddChoice(dia_baalisidro_revenge,"Уйди от меня!",dia_baalisidro_revenge_fuckoff);
};

func void dia_baalisidro_revenge_giveore()
{
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	b_printtrademsg1("Отдано руды: 200");
	AI_Output(self,other,"SVM_3_HeDeservedIt");	//Давно надо было это сделать!
	B_GiveInvItems(other,self,ItMiNugget,200);
	AI_RemoveWeapon(self);
	AI_StopProcessInfos(self);
};

func void dia_baalisidro_revenge_noore()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//Но у меня не так много руды.
	AI_Output(self,other,"SVM_3_ShitNoOre");	//У тебя нет руды? Ты огорчил меня. Как ты мог?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void dia_baalisidro_revenge_fuckoff()
{
	AI_Output(other,self,"DIA_Mud_GetLost_15_00");	//Уйди от меня!
	AI_Output(self,other,"SVM_3_DieMonster");	//Как же ты мне надоел, сейчас я с тобой покончу!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_BAALISIDRO_HELLO_CH5(C_Info)
{
	npc = NOV_1333_BaalIsidro;
	nr = 1;
	condition = dia_baalisidro_hello_ch5_condition;
	information = dia_baalisidro_hello_ch5_info;
	permanent = 0;
	description = "Какой-то у тебя слишком грустный вид.";
};


func int dia_baalisidro_hello_ch5_condition()
{
	if((Kapitel > 2) && (BAALISIDRO_JOINTS_STARTED == TRUE) && !Npc_KnowsInfo(hero,dia_baalisidro_revenge) && (BaalIsidro_DealerJob != LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_baalisidro_hello_ch5_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_00");	//Какой-то у тебя слишком грустный вид.
	AI_Output(self,other,"SVM_3_NotNow");	//Я занят.
	BaalIsidro_DealerJob = LOG_FAILED;
	Log_SetTopicStatus(CH1_DealerJob,LOG_FAILED);
	B_LogEntry(CH1_DealerJob,"Идола Исидро с позором вернули в Болотный лагерь.");
	AI_StopProcessInfos(self);
};

