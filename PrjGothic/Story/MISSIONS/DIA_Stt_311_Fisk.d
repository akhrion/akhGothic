
instance Stt_311_Fisk_Exit(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 999;
	condition = Stt_311_Fisk_Exit_Condition;
	information = Stt_311_Fisk_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Stt_311_Fisk_First(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = Stt_311_Fisk_First_Condition;
	information = Stt_311_Fisk_First_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_First_Condition()
{
	if(!Npc_IsDead(ORG_826_Mordrag) && (MordragKO_HauAb == FALSE) && (MordragKO_StayAtNC == FALSE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_First_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_First_12_00");	//Эй, привет! Я Фиск. Я продаю здесь свои товары. Если тебе что-то понадобится, у меня ты точно сможешь это найти.
	if(GRAVO_LOG == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Призрак Фиск торгует различными товарами, но главное - он продает оружие. Большую часть времени он проводит на рыночной площади.");
	};
};


instance Stt_311_Fisk_Trade(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_Trade_Condition;
	information = Stt_311_Fisk_Trade_Info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int Stt_311_Fisk_Trade_Condition()
{
	if(FISK_REFUSETRADE == FALSE)
	{
		return 1;
	};
};

func void Stt_311_Fisk_Trade_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00");	//Покажи, что у тебя есть.
};


instance Stt_311_Fisk_WhistlersSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = Stt_311_Fisk_WhistlersSword_Condition;
	information = Stt_311_Fisk_WhistlersSword_Info;
	permanent = 1;
	description = "Мне нужен меч. Но не такой, как у всех. Необычный меч.";
};


func int Stt_311_Fisk_WhistlersSword_Condition()
{
	if((FISK_REFUSETRADE == FALSE) && (Fisk_ForgetSword == FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00");	//Мне нужен меч. Но не такой, как у всех. Необычный меч.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01");	//У меня как раз есть один такой. Он тебе понравится. Тот Призрак, который хотел его купить, больше за ним не придет.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02");	//Он стоит 110 кусков. Хочешь посмотреть?
	Fisk_SCknows110 = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"В другой раз.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"А Уистлер говорил, что он стоит сотню...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Хорошо, я покупаю его.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00");	//В другой раз.
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00");	//А Уистлер говорил, что он стоит сотню...
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01");	//А! Погоди-ка... Правда, я что-то не то сказал. Он же стоит пять сотен.
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02");	//Пять сотен?
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03");	//Что, опять мало? Может, повысить до тысячи? Тоже неплохо. Но, знаешь, я подумал, что я не буду его продавать. Он мне самому пригодится!
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//Хорошо, я покупаю его.
	if(Npc_HasItems(other,ItMiNugget) >= 110)
	{
		b_printtrademsg1("Отдано руды: 110");
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//Договорились!
		b_printtrademsg2("Получен меч Уистлера.");
		B_GiveInvItems(other,self,ItMiNugget,110);
		CreateInvItem(self,Whistlers_Schwert);
		B_GiveInvItems(self,other,Whistlers_Schwert,1);
		Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02");	//Боюсь, у тебя не хватит руды. Я еще придержу его для тебя, но только недолго.
	};
};


instance Stt_311_Fisk_ForgetSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_ForgetSword_Condition;
	information = Stt_311_Fisk_ForgetSword_Info;
	permanent = 1;
	description = "Мы можем поговорить о мече Уистлера?";
};


func int Stt_311_Fisk_ForgetSword_Condition()
{
	if((Fisk_ForgetSword == TRUE) && (Whistler_BuyMySword != LOG_OBSOLETE) && (Whistler_BuyMySword != LOG_FAILED))
	{
		return 1;
	};
};

func void Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00");	//Мы можем поговорить о мече Уистлера?
	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01");	//Передай ему, что этого меча ему в жизни не видать!
};


instance Stt_311_Fisk_MordragKO(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_MordragKO_Condition;
	information = Stt_311_Fisk_MordragKO_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_MordragKO_Condition()
{
	if(Npc_IsDead(ORG_826_Mordrag) || (MordragKO_HauAb == TRUE) || (MordragKO_StayAtNC == TRUE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_MordragKO_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00");	//Эй, ты!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01");	//Мордраг был одним из моих лучших поставщиков! Ты мне все испортил!
	FISK_REFUSETRADE = TRUE;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02");	//Если вздумаешь присоединиться к нашему лагерю, я буду голосовать против!
	};
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Ты продаешь товары, которые были украдены у Баронов...",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Успокойся! Быть может, я помогу тебе?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"А не пошел бы ты?..",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//Успокойся! Быть может, я помогу тебе?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01");	//Каким это образом? Разве только ты найдешь мне другого поставщика из Нового лагеря. Но, думаю, ничего у тебя не выйдет.
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02");	//Как же мне найти такого человека?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03");	//Я же сказал тебе, что у тебя ничего не выйдет. Нечего ко мне приставать!
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_RUNNING);
	B_LogEntry(CH1_FiskNewDealer,"Торговец Фиск из Старого лагеря хочет, чтобы я нашел ему нового поставщика вместо Мордрага.");
	Fisk_GetNewHehler = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00");	//А не пошел бы ты...
	AI_StopProcessInfos(self);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00");	//Ты продаешь товары, которые были украдены у Баронов. Думаю, Торусу интересно будет узнать об этом...
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01");	//Не пытайся меня шантажировать!
};


instance Stt_311_Fisk_HehlerSuccess(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 10;
	condition = Stt_311_Fisk_HehlerSuccess_Condition;
	information = Stt_311_Fisk_HehlerSuccess_Info;
	permanent = 0;
	description = "Я нашел человека. Он согласен быть твоим поставщиком.";
};


func int Stt_311_Fisk_HehlerSuccess_Condition()
{
	if((Fisk_GetNewHehler == LOG_RUNNING) && Npc_KnowsInfo(hero,Org_843_Sharky_Fisk))
	{
		return 1;
	};
};

func void Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00");	//Я нашел человека из Нового лагеря. Он согласен быть твоим поставщиком.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01");	//Что, правда? Кто бы мог подумать. Кажется, ты твердо намерен всем здесь понравиться...
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02");	//Так тебе это удалось? И кто же он?
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03");	//Шарки, один из воров.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04");	//Шарки? Да он же еще хуже, чем Мордраг.
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05");	//Что касается Диего: можешь больше не волноваться.
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//Договорились!
	};
	FISK_REFUSETRADE = FALSE;
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_SUCCESS);
	B_LogEntry(CH1_FiskNewDealer,"Фиск остался доволен тем, что Шарки согласился заменить Мордрага.");
};


var int fisk_armor_l_was_bought;
var int fisk_armor_m_was_bought;

instance Stt_311_Fisk_ARMOR(C_Info)
{
	npc = Stt_311_Fisk;
	condition = Stt_311_Fisk_ARMOR_Condition;
	information = Stt_311_Fisk_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Мне нужен какой-нибудь доспех.";
};


func int Stt_311_Fisk_ARMOR_Condition()
{
	if((FISK_REFUSETRADE == FALSE) && (Kapitel < 2) && ((FISK_ARMOR_L_WAS_BOUGHT != 1) || (FISK_ARMOR_M_WAS_BOUGHT != 1)))
	{
		return TRUE;
	};
};

func void Stt_311_Fisk_ARMOR_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01");	//Мне нужен какой-нибудь доспех.
	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02");	//Ну, думаю, я смогу подобрать что-нибудь для тебя.
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
	Info_AddChoice(Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	if(FISK_ARMOR_M_WAS_BOUGHT != 1)
	{
		Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString("Штаны рудокопа, защита: 15/0/5/0",VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);
	};
	if(FISK_ARMOR_L_WAS_BOUGHT != 1)
	{
		Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString("Простые штаны рудокопа, защита: 10/0/5/0",VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	};
};

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01");	//Я возьму простые штаны рудокопа.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_VLK_ARMOR_L)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02");	//Ты не сможешь их купить, тебе не хватает руды!
	}
	else
	{
		b_printtrademsg1("Отдано руды: 250");
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_VLK_ARMOR_L);
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03");	//Хороший выбор.
		b_printtrademsg2("Получены простые штаны рудокопа.");
		CreateInvItem(self,vlk_armor_l);
		B_GiveInvItems(self,hero,vlk_armor_l,1);
		FISK_ARMOR_L_WAS_BOUGHT = 1;
		if((FISK_ARMOR_M_WAS_BOUGHT == 1) && (FISK_ARMOR_L_WAS_BOUGHT == 1))
		{
			Info_ClearChoices(Stt_311_Fisk_ARMOR);
		};
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01");	//Я возьму штаны рудокопа.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_VLK_ARMOR_M)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02");	//Ты не сможешь их купить, тебе не хватает руды!
	}
	else
	{
		b_printtrademsg1("Отдано руды: 500");
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_VLK_ARMOR_M);
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03");	//Хороший выбор.
		b_printtrademsg2("Получены штаны рудокопа.");
		CreateInvItem(self,vlk_armor_m);
		B_GiveInvItems(self,hero,vlk_armor_m,1);
		FISK_ARMOR_M_WAS_BOUGHT = 1;
		if((FISK_ARMOR_M_WAS_BOUGHT == 1) && (FISK_ARMOR_L_WAS_BOUGHT == 1))
		{
			Info_ClearChoices(Stt_311_Fisk_ARMOR);
		};
	};
};


instance STT_311_FISK_LETMEHELP(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 10;
	condition = stt_311_fisk_letmehelp_condition;
	information = stt_311_fisk_letmehelp_info;
	permanent = 0;
	description = "Успокойся! Быть может, я помогу тебе?";
};


func int stt_311_fisk_letmehelp_condition()
{
	if(Npc_KnowsInfo(hero,Stt_311_Fisk_MordragKO) && (Fisk_GetNewHehler != LOG_RUNNING) && (Fisk_GetNewHehler != LOG_SUCCESS) && (Fisk_GetNewHehler != LOG_FAILED) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void stt_311_fisk_letmehelp_info()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//Успокойся! Быть может, я помогу тебе?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01");	//Каким это образом? Разве только ты найдешь мне другого поставщика из Нового лагеря. Но, думаю, ничего у тебя не выйдет.
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02");	//Как же мне найти такого человека?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03");	//Я же сказал тебе, что у тебя ничего не выйдет. Нечего ко мне приставать!
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_RUNNING);
	B_LogEntry(CH1_FiskNewDealer,"Торговец Фиск из Старого лагеря хочет, чтобы я нашел ему нового поставщика вместо Мордрага.");
	Fisk_GetNewHehler = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

