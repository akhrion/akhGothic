
instance DIA_Raven_Exit(C_Info)
{
	npc = EBR_105_Raven;
	nr = 999;
	condition = DIA_Raven_Exit_Condition;
	information = DIA_Raven_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Raven_Exit_Condition()
{
	return 1;
};

func void DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raven_FirstIn(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_FirstIn_Condition;
	information = DIA_Raven_FirstIn_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Raven_FirstIn_Condition()
{
	var C_Npc wache218;
	wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if(wache218.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void DIA_Raven_FirstIn_Info()
{
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00");	//Я могу что-нибудь сделать для тебя?
};


instance DIA_Raven_Who(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Who_Condition;
	information = DIA_Raven_Who_Info;
	permanent = 0;
	description = "Кто ты?";
};


func int DIA_Raven_Who_Condition()
{
	return 1;
};

func void DIA_Raven_Who_Info()
{
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Raven_Who_10_01");	//Я Равен, первый помощник Гомеза. Все, кто хочет встретиться с ним, сначала говорят со мной.
};


instance DIA_Raven_Krautbote(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Krautbote_Condition;
	information = DIA_Raven_Krautbote_Info;
	permanent = 0;
	description = "Я от Кор Галома. У меня есть немного болотника для Гомеза.";
};


func int DIA_Raven_Krautbote_Condition()
{
	if((Kalom_Krautbote == LOG_RUNNING) && (Kalom_DeliveredWeed == FALSE))
	{
		return 1;
	};
};

func void DIA_Raven_Krautbote_Info()
{
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00");	//Я от Кор Галома. У меня есть немного болотника для Гомеза.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01");	//Поговори об этом с Бартоло. Гомез не разговаривает с посыльными.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02");	//Бартоло ты найдешь в комнатке справа от входа или на кухне в большой башне.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03");	//Ночью он, конечно же, спит. И лучше тебе в это время его не беспокоить.
	B_LogEntry(CH1_KrautBote,"Болотник для Гомеза я должен отдать Бартоло. Он находится в доме Баронов.");
};


instance DIA_Raven_Aufnahme(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Aufnahme_Condition;
	information = DIA_Raven_Aufnahme_Info;
	permanent = 0;
	description = "Я хочу видеть Гомеза. Торус сказал, что я могу стать Призраком.";
};


func int DIA_Raven_Aufnahme_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Raven_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00");	//Я хочу видеть Гомеза. Торус сказал, что меня могут взять в Призраки.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01");	//Надежные люди нам всегда нужны. А на тебя можно положиться, раз тебя прислал Торус. Думаю, ты нам подойдешь.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02");	//Я отведу тебя к Гомезу. Иди за мной. Только ничего не трогай!
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
};


instance DIA_Raven_There(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_There_Condition;
	information = DIA_Raven_There_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Raven_There_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT"))
	{
		return 1;
	};
};

func void DIA_Raven_There_Info()
{
	AI_Output(self,other,"DIA_Raven_There_10_01");	//Вон там сидит Гомез. Если ты выберешь неверный тон, я лично научу тебя хорошим манерам, ясно?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRESTART");
};


instance DIA_Raven_PERM(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_PERM_Condition;
	information = DIA_Raven_PERM_Info;
	permanent = 1;
	description = "Как идет добыча руды?";
};


func int DIA_Raven_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

func void DIA_Raven_PERM_Info()
{
	AI_Output(other,self,"DIA_Raven_PERM_15_00");	//Как идет добыча руды?
	AI_Output(self,other,"DIA_Raven_PERM_10_01");	//Рудокопы на Старой шахте потрудились на славу. Последний груз из внешнего мира был довольно большим.
};


instance DIA_Raven_BinDabei(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_BinDabei_Condition;
	information = DIA_Raven_BinDabei_Info;
	permanent = 0;
	description = "Гомез сказал, что теперь я работаю на вас.";
};


func int DIA_Raven_BinDabei_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

func void DIA_Raven_BinDabei_Info()
{
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00");	//Гомез сказал, что теперь я работаю на вас.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01");	//Хорошо. У меня как раз есть для тебя одно задание.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02");	//Если у тебя действительно хорошие связи, у тебя с ним не возникнет никаких проблем.
	b_printtrademsg1("Получена одежда Призрака.");
	CreateInvItem(self,stt_armor_m);
	B_GiveInvItems(self,hero,stt_armor_m,1);
};


instance DIA_Raven_SpySect(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpySect_Condition;
	information = DIA_Raven_SpySect_Info;
	permanent = 0;
	description = "Что я должен сделать?";
};


func int DIA_Raven_SpySect_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

func void DIA_Raven_SpySect_Info()
{
	AI_Output(other,self,"DIA_Raven_SpySect_15_00");	//Что я должен сделать?
	AI_Output(self,other,"DIA_Raven_SpySect_10_01");	//Мы ведем торговлю с Братством. Это, конечно, не значит, что мы доверяем этой болотной братии.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02");	//Пойди в их лагерь.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03");	//Когда ты будешь там, следи за всем, что там происходит. Запоминай все, что увидишь и услышишь. Это может нам пригодиться.
	AI_Output(self,other,"DIA_Raven_SpySect_10_04");	//И чем больше ты узнаешь, тем лучше. Ты должен действовать осторожно. Думаю, ты понимаешь, что я имею в виду?
	AI_Output(other,self,"DIA_Raven_SpySect_15_05");	//Будь спокоен, я постараюсь не ссориться с ними.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06");	//Я знал, что ты поймешь меня правильно.
	Raven_SpySect = LOG_RUNNING;
	Log_CreateTopic(CH1_GoToPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_GoToPsi,LOG_RUNNING);
	B_LogEntry(CH1_GoToPsi,"Равен послал меня в лагерь на болотах. Я должен разузнать, что готовят Гуру. Может быть, я смогу найти что-то полезное для Баронов.");
};


instance DIA_Raven_Equipment(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Equipment_Condition;
	information = DIA_Raven_Equipment_Info;
	permanent = 0;
	description = "Где здесь можно найти хорошее снаряжение?";
};


func int DIA_Raven_Equipment_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Equipment_Info()
{
	AI_Output(other,self,"DIA_Raven_Equipment_15_00");	//Где здесь можно найти хорошее снаряжение?
	AI_Output(self,other,"DIA_Raven_Equipment_10_01");	//Иди к Диего. Он даст тебе один из доспехов. Он будет служить тебе опознавательным знаком и защитой от врагов.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02");	//В нем ты сможешь ходить по всему лагерю. Никто не будет тебя останавливать.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03");	//А если тебе нужно оружие, поговори со Скипом. Ты найдешь его в большом сарае во внутреннем дворе замка, слева от ворот.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"У Диего можно найти хорошие доспехи для Призраков. Днем он стоит у входа в замок.");
	if(!Npc_KnowsInfo(hero,DIA_Skip_First))
	{
		B_LogEntry(GE_TraderOC,"Стражник Скип со двора замка продает оружие. Но только людям Гомеза.");
	};
};


instance DIA_Raven_SpyBericht(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpyBericht_Condition;
	information = DIA_Raven_SpyBericht_Info;
	permanent = 1;
	description = "Я подумал, что мне стоит доложить о своем приходе.";
};


func int DIA_Raven_SpyBericht_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_SpyBericht_Info()
{
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00");	//Я подумал, что мне стоит доложить о своем приходе.
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01");	//Хорошо. Мне нужно знать все, что происходит вокруг.
	if((Npc_HasItems(other,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS))
	{
		if(Kapitel >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//Они провели Великую Церемонию.
		}
		else
		{
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02");	//Им нужны яйца ползунов, чтобы получить особое зелье. С его помощью они хотят укрепить силу духа и вызвать Спящего. Я добыл яйца у королевы ползунов.
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_03");	//Интересно. Хотелось бы узнать, сработает ли все это. Отнеси яйца в храм.
		};
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Ты хорошо поработал.
		Npc_ExchangeRoutine(self,"START");
		Raven_SpySect = LOG_SUCCESS;
		B_GiveXP(XP_ReportToRaven);
		Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
		B_LogEntry(CH1_GoToPsi,"Равен отблагодарил меня на словах! Честно говоря, у меня несколько иные понятия о благодарности. Теперь я буду действовать только по своему усмотрению.");
	}
	else
	{
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05");	//Я еще не знаю, что они там собираются делать.
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06");	//Так зачем же ты меня отвлекаешь?
	};
};


instance DIA_RAVEN_QUENTIN(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = dia_raven_quentin_condition;
	information = dia_raven_quentin_info;
	permanent = 0;
	description = "У тебя есть для меня еще какое-нибудь задание?";
};


func int dia_raven_quentin_condition()
{
	if(Raven_SpySect == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_raven_quentin_info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//У тебя есть для меня еще какое-нибудь задание?
	AI_Output(self,other,"DIA_Quentin_Raven_01");	//Есть. Пропали несколько наших рудокопов. Похоже, что здесь замешаны люди некого Квентина.
	AI_Output(self,other,"DIA_Quentin_Raven_02");	//Он недавно объявился в колонии и быстро стал довольно влиятельным. Некоторые воры из Нового лагеря переметнулись к нему.
	AI_Output(self,other,"DIA_Quentin_Raven_03");	//Найди их убежище и разберись с этой проблемой. Свободен!
	QUENTIN_GANG_QUEST_STARTED = LOG_RUNNING;
	Log_CreateTopic(QUENTIN_GANG,LOG_MISSION);
	Log_SetTopicStatus(QUENTIN_GANG,LOG_RUNNING);
	B_LogEntry(QUENTIN_GANG,"Равен дал мне новое задание: найти логово бандитов Квентина и разобраться с ними. Звучит невероятно сложно, как всегда...");
	AI_StopProcessInfos(self);
};


instance DIA_RAVEN_QUENTIN_DONE(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = dia_raven_quentin_done_condition;
	information = dia_raven_quentin_done_info;
	permanent = 0;
	description = "С Квентином покончено!";
};


func int dia_raven_quentin_done_condition()
{
	if(Npc_IsDead(Org_858_Quentin) && Npc_KnowsInfo(hero,dia_raven_quentin))
	{
		return 1;
	};
};

func void dia_raven_quentin_done_info()
{
	AI_Output(other,self,"DIA_Quentin_Raven_04");	//С Квентином покончено!
	AI_Output(other,self,"DIA_Quentin_Raven_05");	//Он нашел небольшое месторождение руды в горах недалеко от места обмена.
	AI_Output(other,self,"DIA_Quentin_Raven_06");	//Ему удалось собрать вокруг себя банду, а похищенных людей они использовали как рабов для добычи.
	AI_Output(self,other,"DIA_Quentin_Raven_07");	//Интересно... Я направлю туда наших людей. Теперь это наша руда!
	if(Npc_KnowsInfo(hero,dia_vlk595_quentin_done))
	{
		AI_Output(self,other,"DIA_Quentin_Raven_08");	//А что с нашими рудокопами?
		AI_Output(other,self,"DIA_Quentin_Raven_09");	//Вернулись в лагерь.
		B_ClearImmortal(vlk_595_buddler);
		B_ClearImmortal(vlk_596_buddler);
		B_ClearImmortal(vlk_597_buddler);
	};
	AI_Output(self,other,"DIA_Quentin_Raven_10");	//Гомез будет в полном восторге!
	AI_Output(self,other,"DIA_Quentin_Raven_11");	//Ну все, ступай, ступай... Я передам ему эту новость сам.
	AI_Output(self,other,"DIA_Quentin_Raven_12");	//А ты теперь сможешь купить тяжелый доспех у Стоуна. Считай, что заслужил.
	b_printtrademsg1("Получено руды: 500");
	CAN_BUY_GRD_ARMOR_H = TRUE;
	B_GiveXP(1000);
	B_GiveInvItems(self,other,ItMiNugget,500);
	QUENTIN_GANG_QUEST_STARTED = LOG_SUCCESS;
	Log_SetTopicStatus(QUENTIN_GANG,LOG_SUCCESS);
	B_LogEntry(QUENTIN_GANG,"Задание выполнено, Равен отблагодарил меня рудой. Но, похоже, Гомез не узнает о моих подвигах.");
	b_clearquentincamp();
	AI_StopProcessInfos(self);
};

