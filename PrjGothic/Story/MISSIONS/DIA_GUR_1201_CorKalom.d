
instance GUR_1201_CorKalom_FIRST(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_FIRST_Condition;
	information = GUR_1201_CorKalom_FIRST_Info;
	permanent = 1;
	important = 1;
};


func int GUR_1201_CorKalom_FIRST_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_FIRST_Info()
{
	AI_Output(self,other,"GUR_1201_CorKalom_FIRST_10_00");	//Что тебе нужно?
	Kalom_TalkedTo = TRUE;
};


instance GUR_1201_CorKalom_WannaJoin(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_WannaJoin_Condition;
	information = GUR_1201_CorKalom_WannaJoin_Info;
	permanent = 0;
	description = "Я хочу быть принятым в Братство.";
};


func int GUR_1201_CorKalom_WannaJoin_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_WannaJoin_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_00");	//Я хочу быть принятым в Братство.
	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_01");	//Я слышал, что ты наставляешь послушников и решаешь, кто из них будет принят.
	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_02");	//У меня слишком много дел! Я провожу очень важные эксперименты, поэтому не могу уделить тебе ни минуты.
	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_03");	//Я соглашусь с мнением Идолов. Если они скажут, что ты готов носить одежду послушника, то возвращайся ко мне.
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	B_LogEntry(CH1_JoinPsi,"Кор Галом примет меня в Братство послушником, если за меня скажут свое слово как минимум четыре Гуру.");
};


instance GUR_1201_CorKalom_Recipe(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 20;
	condition = GUR_1201_CorKalom_Recipe_Condition;
	information = GUR_1201_CorKalom_Recipe_Info;
	permanent = 0;
	description = "Торговец из Старого лагеря хочет получить рецепт целебного зелья.";
};


func int GUR_1201_CorKalom_Recipe_Condition()
{
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_Recipe_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Recipe_15_00");	//Один торговец из Старого лагеря хочет получить рецепт целебного зелья.
	AI_Output(self,other,"GUR_1201_CorKalom_Recipe_10_01");	//Я никому не продаю свои рецепты!
	B_LogEntry(CH1_KalomsRecipe,"Кор Галом отказывается отдавать свои рецепты. Но в его лаборатории есть сундук... И, кажется, этот работяга ничего кроме своих зелий не замечает...");
};


instance GUR_1201_CorKalom_Experimente(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 2;
	condition = GUR_1201_CorKalom_Experimente_Condition;
	information = GUR_1201_CorKalom_Experimente_Info;
	permanent = 1;
	description = "Что за исследования ты здесь проводишь?";
};


func int GUR_1201_CorKalom_Experimente_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_Experimente_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Experimente_15_00");	//Что за исследования ты здесь проводишь?
	if(!C_NpcBelongsToPsiCamp(other))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Experimente_10_01");	//Мои исследования так сложны, что ты в них ничего не поймешь. Не отвлекай меня от работы!
	}
	else
	{
		if(Npc_GetStr(other) < 40)
		{
			AI_Output(self,other,"GUR_1201_CorKalom_Experimente_NULL_02"); //Послушник, пойди и помоги нашим братьям собрать болотник. Не отвлекай меня от работы!
		}
		else
		{
			AI_Output(self,other,"GUR_1201_CorKalom_Experimente_NULL_03"); //Тебе разве нечем заняться? Иди и помоги стражам в шахте собирать жвала ползунов.
		};
	};
};


instance GUR_1201_CorKalom_BRINGWEED(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 2;
	condition = GUR_1201_CorKalom_BRINGWEED_Condition;
	information = GUR_1201_CorKalom_BRINGWEED_Info;
	permanent = 1;
	description = "Я принес тебе дневной сбор болотника.";
};


func int GUR_1201_CorKalom_BRINGWEED_Condition()
{
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void GUR_1201_CorKalom_BRINGWEED_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_BRINGWEED_15_00");	//Я принес тебе дневной сбор болотника.
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_01");	//И это все? Мне нужен весь урожай, а это как минимум сто стеблей!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_02");	//А, давай сюда. И не мешай мне работать!
		b_printtrademsg1("Отдан болотник (100).");
		B_GiveInvItems(hero,self,ItMi_Plants_Swampherb_01,100);
		Npc_RemoveInvItems(self,ItMi_Plants_Swampherb_01,100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry(CH1_DeliverWeed,"Кор Галом невыносим, как всегда. Я передал ему весь урожай болотника, а ему все мало.");
		Log_SetTopicStatus(CH1_DeliverWeed,LOG_SUCCESS);
		B_GiveXP(XP_DeliveredWeedHarvest);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		AI_StopProcessInfos(self);
	};
};


var int corkalom_potions;

instance GUR_1201_CorKalom_Crawlerzangen(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 800;
	condition = GUR_1201_CorKalom_Crawlerzangen_Condition;
	information = GUR_1201_CorKalom_Crawlerzangen_Info;
	permanent = 1;
	description = "Я принес тебе челюсти ползунов...";
};


func int GUR_1201_CorKalom_Crawlerzangen_Condition()
{
	if(
		(Npc_HasItems(other,ItAt_Crawler_01) > 0)
	&& (
			Npc_KnowsInfo(hero,GUR_1201_CorKalom_SACHE)
		||	Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret)
		)
	)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_Crawlerzangen_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Crawlerzangen_15_00");	//Я принес тебе челюсти ползунов...
	b_printtrademsg1("Отданы все челюсти ползунов.");
	if(Npc_HasItems(other,ItAt_Crawler_01) > 25)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01");	//Очень хорошо. Вот, возьми за это некоторые из моих лучших зелий.
		b_printtrademsg2("Получено 10 зелий магической энергии.");
		CreateInvItems(self,ItFo_Potion_Mana_03,10);
		B_GiveInvItems(self,hero,ItFo_Potion_Mana_03,10);
	}
	else if(Npc_HasItems(other,ItAt_Crawler_01) > 15)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01");	//Очень хорошо. Вот, возьми за это некоторые из моих лучших зелий.
		b_printtrademsg2("Получено 5 зелий магической энергии.");
		CreateInvItems(self,ItFo_Potion_Mana_03,5);
		B_GiveInvItems(self,hero,ItFo_Potion_Mana_03,5);
	}
	else if(Npc_HasItems(other,ItAt_Crawler_01) > 5)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_02");	//Хорошо. Возьми несколько моих зелий в качестве награды.
		b_printtrademsg2("Получено 5 экстрактов магической энергии.");
		CreateInvItems(self,ItFo_Potion_Mana_02,5);
		B_GiveInvItems(self,hero,ItFo_Potion_Mana_02,5);
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_03");	//Хм. И это все? Вот, возьми магическое зелье и уходи.
		b_printtrademsg2("Получена эссенция магической энергии.");
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		B_GiveInvItems(self,hero,ItFo_Potion_Mana_01,1);
		AI_StopProcessInfos(self);
	};
	SC_Faith_Sleeper += (Npc_HasItems(other,ItAt_Crawler_01) / 5);
	B_GiveInvItems(other,self,ItAt_Crawler_01,Npc_HasItems(other,ItAt_Crawler_01));
};


instance GUR_1201_CorKalom_JoinPSI(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_JoinPSI_Condition;
	information = GUR_1201_CorKalom_JoinPSI_Info;
	permanent = 1;
	description = "По-моему, я смог доказать Идолам свою преданность.";
};


func int GUR_1201_CorKalom_JoinPSI_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && Npc_KnowsInfo(hero,GUR_1201_CorKalom_WannaJoin))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_JoinPSI_Info()
{
	var int counter;
	var C_Npc fortuno;
	counter = 0;
	fortuno = Hlp_GetNpc(NOV_1357_Fortuno);
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_00");	//По-моему, я смог доказать Идолам свою преданность.
	if(Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_01");	//Идол Оран считает, что я достоин стать верным слугой Спящего.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,DIA_BaalCadar_SleepSpell))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_02");	//Дальше...
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_03");	//Идол Кадар считает, что я быстро учусь.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,DIA_BaalNamib_FirstTalk))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_04");	//Идол Намиб уверен, что я истинный последователь веры в Спящего.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,DIA_BaalTyon_Vision))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_05");	//Благодаря мне Идолу Тиону было видение.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_SendToKalom))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_06");	//И?
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_07");	//Идол Тондрал сказал, что я могу получить одежду послушника. Я привел к нему нового последователя.
		counter = counter + 1;
	};
	if(hero.level >= 5)
	{
		if(counter >= 4)
		{
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_08");	//Хорошо. Слов Идолов мне вполне достаточно.
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_09");	//Вот, возьми эту одежду. А теперь иди и постарайся быть полезным.
			b_printtrademsg1("Получена одежда послушника.");
			CreateInvItem(hero,nov_armor_m);
			Npc_SetTrueGuild(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			CreateInvItem(fortuno,alchemy_joint2);
			CreateInvItem(fortuno,alchemy_joint3);
			B_LogEntry(CH1_JoinPsi,"Сегодня Кор Галом зачислил меня в послушники. Он мог бы вести себя и получше, но, как бы то ни было, теперь я принят в Братство.");
			Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
			B_LogEntry(GE_TraderPSI,"Доспехи послушников я могу получить у Идола Намиба.");
			if(DIFF_HARD == FALSE)
			{
				Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
				B_LogEntry(GE_TeacherPSI,"Я вступил в Болотный лагерь и теперь некоторые учителя будут согласны учить меня бесплатно.");
				FREELEARN_PSI = TRUE;
			};
			Log_SetTopicStatus(CH1_JoinPsi,LOG_SUCCESS);
			B_GiveXP(XP_BecomeNovice);
			Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JoinOC,LOG_FAILED);
			B_LogEntry(CH1_JoinOC,"Я решил присоединиться к Братству Спящего из Болотного лагеря, поэтому я больше не смогу стать Призраком.");
			Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JoinNC,LOG_FAILED);
			B_LogEntry(CH1_JoinNC,"Теперь меня не смогут принять в шайку воров из Нового лагеря, так как Братство стало моим новым домом.");
			if((Kirgo_Charged == TRUE) && (KIRGO_CHARGED_END == FALSE))
			{
				Kirgo_Charged = FALSE;
				B_ExchangeRoutine(GRD_251_Kirgo,"START");
			};
			if((Kharim_Charged == TRUE) && (KHARIM_CHARGED_END == FALSE))
			{
				Kharim_Charged = FALSE;
				B_ExchangeRoutine(Sld_729_Kharim,"START");
			};
			B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
			if(Thorus_MordragKo == LOG_RUNNING)
			{
				Thorus_MordragKo = LOG_FAILED;
				Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
				B_LogEntry(CH1_MordragKO,"Пусть Торус сам разбирается со своими проблемами, они меня больше не касаются.");
			};
			if(Dexter_GetKalomsRecipe == LOG_RUNNING)
			{
				Dexter_GetKalomsRecipe = LOG_FAILED;
				Log_SetTopicStatus(CH1_KalomsRecipe,LOG_FAILED);
				if(!Npc_KnowsInfo(hero,GUR_1201_CorKalom_Recipe))
				{
					B_LogEntry(CH1_KalomsRecipe,"Я стал одним из последователей Братства Спящего, разве я осмелюсь открывать тайны Гуру неверным из других лагерей?");
				}
				else if(Npc_HasItems(hero,KalomsRecipe) > 0)
				{
					B_LogEntry(CH1_KalomsRecipe,"Я стал одним из последователей Братства Спящего, разве я осмелюсь красть у Гуру? Пожалуй, верну рецепт Кор Галома на место!");
				}
				else
				{
					B_LogEntry(CH1_KalomsRecipe,"Я стал одним из последователей Братства Спящего, разве я осмелюсь красть у Гуру?");
				};
			};
		}
		else
		{
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00");	//И?
			AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01");	//И это все.
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02");	//Ты отвлекаешь меня от очень важной работы! Приходи, когда заслужишь похвалу четырех Идолов.
		};
	}
	else
	{
		B_PrintGuildCondition(5);
		AI_Output(self,other,"SVM_10_NoLearnYouAlreadyKnow");	//Сначала тебе нужно освоить основы, и только потом ты сможешь достичь мастерства.
	};
};


instance GUR_1201_CorKalom_JoinPSI2(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_JoinPSI2_Condition;
	information = GUR_1201_CorKalom_JoinPSI2_Info;
	permanent = 0;
	description = "И это все? Даже 'добро пожаловать' трудно было сказать?";
};


func int GUR_1201_CorKalom_JoinPSI2_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_JoinPSI2_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_10");	//И это все? Даже 'добро пожаловать' трудно было сказать?
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_11");	//Добро пожаловать!
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_12");	//Так немного лучше.
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_13");	//Ты почему ничего не делаешь? Вот, возьми эту траву и отнеси ее Гомезу в Старый лагерь.
	b_printtrademsg1("Получен болотник (30).");
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_14");	//Если его люди откажутся тебя пропускать, скажи им, что тебя прислал Кор Галом.
	CreateInvItems(self,ItMiJoint_3,30);
	B_GiveInvItems(self,hero,ItMiJoint_3,30);
	Kalom_Krautbote = LOG_RUNNING;
	Log_CreateTopic(CH1_KrautBote,LOG_MISSION);
	Log_SetTopicStatus(CH1_KrautBote,LOG_RUNNING);
	B_LogEntry(CH1_KrautBote,"В своей обычной неподражаемой манере Кор Галом послал меня к Гомезу в Старый лагерь, чтобы отнести ему болотник.");
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_15");	//Ну, почему ты все еще здесь?
	AI_StopProcessInfos(self);
};


instance Info_Kalom_DrugMonopol(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_Kalom_DrugMonopol_Condition;
	information = Info_Kalom_DrugMonopol_Info;
	permanent = 0;
	description = "У тебя есть для меня еще какое-нибудь задание?";
};


func int Info_Kalom_DrugMonopol_Condition()
{
	if(Kalom_Krautbote == LOG_SUCCESS)
	{
		return 1;
	};
};

func void Info_Kalom_DrugMonopol_Info()
{
	var C_Npc Renyu;
	var C_Npc Killian;
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//У тебя есть для меня еще какое-нибудь задание?
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_01");	//В Новом лагере объявились умники, которые сами стали продавать болотник.
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_03");	//Позаботься о том, чтобы их дело было закрыто.
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_04");	//А как...
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_05");	//Мне неинтересно, как!
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_06");	//Думаю, они обосновались где-то за пределами Нового лагеря. Иди и найди их.
	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic(CH1_DrugMonopol,LOG_MISSION);
	Log_SetTopicStatus(CH1_DrugMonopol,LOG_RUNNING);
	B_LogEntry(CH1_DrugMonopol,"Кор Галом пожелал избавиться от конкурентов, торгующих болотником в Новом лагере. Я не знаю, где их искать, но, может быть, мне следует поискать перед Новым лагерем...");
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Killian = Hlp_GetNpc(Org_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};


instance Info_Kalom_Success(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_Kalom_Success_Condition;
	information = Info_Kalom_Success_Info;
	permanent = 1;
	description = "По поводу торговли болотником в Новом лагере...";
};


func int Info_Kalom_Success_Condition()
{
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Kalom_Success_Info()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	var C_Npc Jacko;
	Killian = Hlp_GetNpc(Org_861_Killian);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Jacko = Hlp_GetNpc(Org_862_Jacko);
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_00");	//По поводу торговли болотником в Новом лагере...
	AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_01");	//Да?
	if((Stooges_Fled == TRUE) || (Npc_IsDead(Jacko) && Npc_IsDead(Renyu) && Npc_IsDead(Killian)))
	{
		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//Я справился с твоим заданием.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_05");	//Я удивлен. Я недооценивал тебя. Может быть, ты действительно будешь нам полезен.
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry(CH1_DrugMonopol,"Я рассказал Кор Галому все, что смог узнать о конкурентах. Он был как обычно очень 'любезен'.");
		Log_SetTopicStatus(CH1_DrugMonopol,LOG_SUCCESS);
		B_GiveXP(XP_DrugMonopol);
	}
	else
	{
		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_02");	//Я не смог никого найти.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_03");	//Да, так я думал. Разве тебе можно было доверить это дело?!
	};
};


instance Info_Kalom_KrautboteBACK(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = Info_Kalom_KrautboteBACK_Condition;
	information = Info_Kalom_KrautboteBACK_Info;
	permanent = 1;
	description = "Я принес болотник.";
};


func int Info_Kalom_KrautboteBACK_Condition()
{
	if((Kalom_DeliveredWeed == TRUE) && (Kalom_Krautbote == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void Info_Kalom_KrautboteBACK_Info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00");	//Я принес болотник.
	if(Npc_HasItems(hero,ItMiNugget) >= 500)
	{
		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01");	//Хорошо. Иди, найди себе какое-нибудь дело.
		b_printtrademsg1("Отдано руды: 500");
		Kalom_Krautbote = LOG_SUCCESS;
		B_LogEntry(CH1_KrautBote,"Кор Галом получил руду за болотник для Баронов из Старого лагеря.");
		Log_SetTopicStatus(CH1_KrautBote,LOG_SUCCESS);
		B_GiveInvItems(hero,self,ItMiNugget,500);
		B_GiveXP(XP_WeedShipmentReported);
	}
	else
	{
		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02");	//А где пятьсот кусков руды? Поторопись и принеси их мне сюда!
	};
};


instance Info_CorKalom_BringFocus(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringFocus_Condition;
	information = Info_CorKalom_BringFocus_Info;
	permanent = 0;
	important = 0;
	description = "Меня прислал Юберион. Я принес юнитор.";
};


func int Info_CorKalom_BringFocus_Condition()
{
	if((YBerion_BringFocus == LOG_SUCCESS) && Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_CorKalom_BringFocus_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01");	//Меня прислал Юберион. Я принес юнитор.
	b_printtrademsg1("Отдан юнитор.");
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02");	//А-а, юнитор... Теперь-то я смогу изучить действие этого редкого артефакта.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03");	//Если бы у меня было достаточно слюны этих мерзких тварей...
	B_LogEntry(CH2_Focus,"Я принес юнитор Кор Галому!");
	Log_SetTopicStatus(CH2_Focus,LOG_SUCCESS);
	Npc_RemoveInvItem(hero,Focus_1);
	B_GiveXP(XP_BringFocusToCorKalom);
};


instance Info_CorKalom_BLUFF(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 10;
	condition = Info_CorKalom_BLUFF_Condition;
	information = Info_CorKalom_BLUFF_Info;
	permanent = 0;
	description = "Юберион сказал мне, что ты дашь мне награду за юнитор.";
};


func int Info_CorKalom_BLUFF_Condition()
{
	if(Npc_KnowsInfo(hero,Info_CorKalom_BringFocus) && (CorKalom_BringMCQBalls != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_CorKalom_BLUFF_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01");	//Юберион сказал мне, что ты дашь мне награду за юнитор.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02");	//Да? Он так сказал? Думаю, пятьдесят кусков руды тебя устроит?
	b_printtrademsg1("Получено руды: 50");
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
};


instance GUR_1201_CorKalom_SACHE(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_SACHE_Condition;
	information = GUR_1201_CorKalom_SACHE_Info;
	important = 0;
	permanent = 0;
	description = "Слюны?";
};


func int GUR_1201_CorKalom_SACHE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_CorKalom_BringFocus))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_SACHE_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_Info_15_01");	//Слюны?
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_02");	//Да, как ты уже знаешь, я делаю зелья для великой Церемонии. Слюна ползунов является одним из самых ценных компонентов!
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_03");	//Ты ведь знаешь, кто такие ползуны?
	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
	Info_AddChoice(GUR_1201_CorKalom_SACHE,"Нет.",GUR_1201_CorKalom_SACHE_NEIN);
	Info_AddChoice(GUR_1201_CorKalom_SACHE,"Да.",GUR_1201_CorKalom_SACHE_JA);
};

func void GUR_1201_CorKalom_SACHE_NEIN()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//Нет.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_02");	//Это очень опасные твари. Живут в темных шахтах и едят все, к чему могут дотянуться.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03");	//В их пасти есть железы, выделяющие особую слюну.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04");	//Из нее я делаю особые зелья, которые указывают нам духовный путь к Спящему.
	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
};

func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//Да.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_JA_10_02");	//Отлично!
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03");	//В их пасти есть железы, выделяющие особую слюну.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04");	//Из нее я делаю особые зелья, которые указывают нам духовный путь к Спящему.
	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
};


instance GUR_1201_CorKalom_VISION(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_VISION_Condition;
	information = GUR_1201_CorKalom_VISION_Info;
	important = 0;
	permanent = 0;
	description = "Расскажи еще!";
};


func int GUR_1201_CorKalom_VISION_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_SACHE))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_VISION_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_01");	//Расскажи еще!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_02");	//Что ж, недавно Спящий послал мне одно видение. Он подал мне знак.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_03");	//Я понял, что кроме слюны ползунов в зелье нужно добавить что-то еще.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_04");	//И он избрал меня для этой миссии. Ты получишь задание не от меня. Эта честь будет оказана тебе самим Спящим!
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_05");	//Невероятно!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_06");	//Молчи, глупец!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_07");	//Он дал мне понять, что избранный мной путь верен, но средства недостаточно сильны.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_08");	//Это значит, что второй компонент тоже нужно получить у ползунов. Но это не слюна.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_09");	//Должно быть что-то еще.
};


instance GUR_1201_CorKalom_NEST(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_NEST_Condition;
	information = GUR_1201_CorKalom_NEST_Info;
	important = 0;
	permanent = 0;
	description = "А ты никогда не изучал ползунов?";
};


func int GUR_1201_CorKalom_NEST_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_VISION))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_NEST_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_NEST_Info_15_01");	//А ты никогда не изучал ползунов? Я хотел сказать... Может, в его теле есть еще что-нибудь, что будет сильнее слюны.
	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_02");	//Конечно, мы изучили несколько ползунов. Но, кажется, нужное нам вещество содержится только в железах в пасти.
	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_03");	//Должно быть что-то, о чем мы еще не знаем. Иди и найди ответ в их логове!
	CorKalom_BringMCQBalls = LOG_RUNNING;
};

func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic(CH2_MCEggs,LOG_MISSION);
	Log_SetTopicStatus(CH2_MCEggs,LOG_RUNNING);
	B_LogEntry(CH2_MCEggs,"Гуру Кор Галом дал мне задание найти источник сильнодействующего вещества, связанного с ползунами. До этого он использовал слюну этих тварей, но она оказалась недостаточно сильной. Нужно найти что-то другое.");
	if(PresseTourJanuar2001)
	{
		CreateInvItems(hero,ItAt_Crawlerqueen,3);
	};
};


instance GUR_1201_CorKalom_WEG(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_WEG_Condition;
	information = GUR_1201_CorKalom_WEG_Info;
	nr = 21;
	important = 0;
	permanent = 0;
	description = "Думаю, в шахте будет не слишком светло.";
};


func int GUR_1201_CorKalom_WEG_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_NEST) && !Npc_KnowsInfo(hero,GUR_1201_CorKalom_RAT))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_WEG_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_WEG_Info_15_01");	//Думаю, в шахте будет не слишком светло.
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_02");	//Возьми свитки с заклинанием света и используй их, чтобы развеять тьму.
	b_printtrademsg1("Получено 5 свитков света.");
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_03");	//Стражи в шахте помогут тебе.
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_04");	//Да пребудет с тобой сила Спящего, да осветит он твой путь своим светом, просветит твой дух и укрепит твою волю!
	CreateInvItems(self,ItArScrollLight,5);
	B_GiveInvItems(self,other,ItArScrollLight,5);
	GUR_1201_CorKalom_WEG_ACCEPT();
};


instance GUR_1201_CorKalom_RAT(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_RAT_Condition;
	information = GUR_1201_CorKalom_RAT_Info;
	nr = 20;
	important = 0;
	permanent = 0;
	description = "Да, меня ждет очередное кровавое приключение...";
};


func int GUR_1201_CorKalom_RAT_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_NEST) && !Npc_KnowsInfo(hero,GUR_1201_CorKalom_WEG))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_RAT_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_RAT_Info_15_01");	//Да, меня ждет очередное кровавое приключение...
	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_02");	//Возьми эти целебные зелья.
	b_printtrademsg1("Получено 5 экстрактов исцеления.");
	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_03");	//Я даю их тебе не потому, что слишком беспокоюсь за твою жизнь, а потому что это задание для меня слишком важно.
	CreateInvItems(self,ItFo_Potion_Health_02,5);
	B_GiveInvItems(self,other,ItFo_Potion_Health_02,5);
	GUR_1201_CorKalom_WEG_ACCEPT();
};


instance GUR_1201_CorKalom_RUN(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_RUN_Condition;
	information = GUR_1201_CorKalom_RUN_Info;
	important = 0;
	permanent = 0;
	description = "Где найти этих ползунов?";
};


func int GUR_1201_CorKalom_RUN_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_RUNNING) && (Npc_HasItems(hero,ItAt_Crawlerqueen) < 1))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_RUN_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_01");	//Где найти этих ползунов?
	AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_02");	//В Старой шахте.
	if(!EnteredOldMine)
	{
		AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_03");	//Где находится Старая шахта?
		AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_04");	//Возьми эту карту. На ней отмечены все важные места в колонии.
		b_printtrademsg1("Получена карта колонии.");
		CreateInvItem(self,ItWrWorldmap);
		B_GiveInvItems(self,other,ItWrWorldmap,1);
	};
};


instance GUR_1201_CorKalom_CRAWLER(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_CRAWLER_Condition;
	information = GUR_1201_CorKalom_CRAWLER_Info;
	important = 0;
	permanent = 0;
	description = "Есть какие-нибудь верные приемы охоты на ползунов?";
};


func int GUR_1201_CorKalom_CRAWLER_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_RUN) && (CorKalom_BringMCQBalls != LOG_SUCCESS))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_CRAWLER_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01");	//Есть какие-нибудь верные приемы охоты на ползунов?
	AI_Output(self,other,"GUR_1201_CorKalom_CRAWLER_Info_10_02");	//В шахте находятся несколько наших Стражей, которые добывают их челюсти. Поговори с Гор На Видом. Он поможет тебе.
};


instance GUR_1201_CorKalom_FIND(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_FIND_Condition;
	information = GUR_1201_CorKalom_FIND_Info;
	important = 0;
	permanent = 0;
	description = "А в какой части шахты находится логово ползунов?";
};


func int GUR_1201_CorKalom_FIND_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_CRAWLER))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_FIND_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_01");	//А в какой части шахты находится логово ползунов?
	AI_Output(self,other,"GUR_1201_CorKalom_FIND_Info_10_02");	//Это самая сложная часть миссии. Я ничего не могу тебе посоветовать. Ты сам должен его найти. Сила Спящего будет поддерживать тебя.
	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_03");	//Да, ты меня успокоил.
};


instance Info_CorKalom_BringMCQBalls_Success(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringMCQBalls_Success_Condition;
	information = Info_CorKalom_BringMCQBalls_Success_Info;
	permanent = 0;
	description = "Я нашел яйца королевы ползунов.";
};


func int Info_CorKalom_BringMCQBalls_Success_Condition()
{
	if((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3) && (CorKalom_BringMCQBalls == LOG_RUNNING))
	{
		return 1;
	};
};

func void Info_CorKalom_BringMCQBalls_Success_Info()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01");	//Я нашел яйца королевы ползунов.
	b_printtrademsg1("Отдано 3 яйца.");
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02");	//Я знал это! Мое видение действительно было знаком. Самое сильное вещество для зелья содержится в яйцах.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03");	//Отлично, этого мне хватит, чтобы сделать зелье, которое поможет нам призвать Спящего!
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04");	//А где моя награда?
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05");	//Ах, да, награда... Спасибо тебе.
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06");	//Да нет, я имел в виду нечто более материальное...
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07");	//Да? Хорошо, чего же ты хочешь?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems(hero,self,ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self,ItAt_Crawlerqueen,3);
	B_GiveXP(XP_BringMCEggs);
	B_LogEntry(CH2_MCEggs,"Я отдал Кор Галому три яйца ползунов. Он был невежлив, как и всегда. Мне почти расхотелось брать из его рук свою награду!");
	Log_SetTopicStatus(CH2_MCEggs,LOG_SUCCESS);
	B_ExchangeRoutine(TPL_1439_GorNaDrak,"GC");
	B_ExchangeRoutine(TPL_1440_Templer,"GC");
	Wld_InsertNpc(tpl_1400_gornabar_psi,"PSI_24_HUT_EX_SMALLTALK");
	Wld_InsertNpc(tpl_1401_gornakosh_psi,"PSI_24_HUT_EX_SMALLTALK");
	Wld_InsertNpc(tpl_1433_gornavid_psi,"PSI_24_HUT_EX_SMALLTALK");
	if(C_NpcBelongsToNewCamp(hero))
	{
		B_LogEntry(CH1_GotoPsiCamp,"Думаю, теперь мне известно достаточно о том, что захотели сделать Гуру. Я должен сообщить об этом Мордрагу.");
	};
	if(C_NpcBelongsToOldCamp(hero))
	{
		B_LogEntry(CH1_GoToPsi,"Думаю, теперь я знаю, что именно захотели сделать Гуру Братства. Я должен рассказать об этом Равену из Старого лагеря.");
	};
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Руну.",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Оружие.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Целебное зелье.",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Руду.",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Зелье магической силы.",Info_CorKalom_BringMCQBalls_Success_MANA);
};

func void Info_CorKalom_BringMCQBalls_Success_RUNE()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01");	//Руну.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02");	//Пусть эта руна осветит твой путь!
	b_printtrademsg1("Получена руна света.");
	CreateInvItem(self,itarrune_1_1_light);
	B_GiveInvItems(self,hero,itarrune_1_1_light,1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_WAFFE()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01");	//Оружие.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02");	//Пусть это оружие уничтожит всех твоих врагов!
	b_printtrademsg1("Получен Камнелом.");
	CreateInvItem(self,ItMw_1H_Mace_War_03);
	B_GiveInvItems(self,hero,ItMw_1H_Mace_War_03,1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01");	//Целебное зелье.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02");	//Пусть это зелье продлит твою жизнь!
	b_printtrademsg1("Получена эссенция жизни.");
	CreateInvItem(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_Perma_01,1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_ORE()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01");	//Руду.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02");	//Возьми эту руду в знак благодарности всего Братства!
	b_printtrademsg1("Получено руды: 100");
	CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,hero,ItMiNugget,100);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01");	//Зелье магической силы.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02");	//Пусть это зелье увеличит твою магическую силу!
	if(!C_NpcBelongsToPsiCamp(hero))
	{
		b_printtrademsg1("Получена эссенция силы духа.");
		CreateInvItem(self,ItFo_Potion_Mana_Perma_01);
		B_GiveInvItems(self,hero,ItFo_Potion_Mana_Perma_01,1);
	}
	else
	{
		b_printtrademsg1("Получено зелье из яиц Королевы ползунов.");
		CreateInvItem(self,ItFo_Potion_Elixier_Egg);
		B_GiveInvItems(self,hero,ItFo_Potion_Elixier_Egg,1);
	};
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};


instance Info_CorKalom_BringBook(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringBook_Condition;
	information = Info_CorKalom_BringBook_Info;
	permanent = 0;
	description = "Теперь мы можем начать Церемонию?";
};


func int Info_CorKalom_BringBook_Condition()
{
	if(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		return 1;
	};
};

func void Info_CorKalom_BringBook_Info()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_01");	//Теперь мы можем начать Церемонию?
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_02");	//Нет! Мне до сих пор не удалось найти способ зарядить юнитор.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_03");	//Моих знаний для этого недостаточно.
	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_04");	//Значит, я зря добывал эти яйца, так что ли?
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_05");	//Нет, послушай. Где-то есть альманах, в котором содержится нужное мне знание.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_06");	//Мы купили эту книгу в Старом лагере у Корристо, мага Огня.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_07");	//Но по пути в наш лагерь она была украдена.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_08");	//Книгу должен был принести Талас, один из послушников. На него напали и ограбили.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_09");	//Он меня разочаровал, но я дал ему еще один шанс. Он должен найти украденный альманах.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_10");	//Поговори с ним. Ему пригодится твоя помощь.
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic(CH2_Book,LOG_MISSION);
	Log_SetTopicStatus(CH2_Book,LOG_RUNNING);
	B_LogEntry(CH2_Book,"Кор Галому нужен еще один предмет, чтобы провести великую Церемонию. Речь идет о книге, в которой говорится, как использовать юнитор. Послушнику Таласу не удалось принести ее в лагерь, так как его обокрали гоблины. Сейчас он стоит на площади перед Храмом и ждет помощи в поисках альманаха.");
	Info_ClearChoices(Info_CorKalom_BringBook);
	Info_AddChoice(Info_CorKalom_BringBook,DIALOG_BACK,Info_CorKalom_BringBook_BACK);
	Info_AddChoice(Info_CorKalom_BringBook,"А я за это что-нибудь получу?",Info_CorKalom_BringBook_EARN);
	Info_AddChoice(Info_CorKalom_BringBook,"Кто украл альманах?",Info_CorKalom_BringBook_WHO);
	Info_AddChoice(Info_CorKalom_BringBook,"Где сейчас находится Талас?",Info_CorKalom_BringBook_WHERE);
};

func void Info_CorKalom_BringBook_BACK()
{
	Info_ClearChoices(Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Where_15_01");	//Где сейчас находится Талас?
	AI_Output(self,other,"Info_CorKalom_BringBook_Where_10_02");	//Он пытается найти людей, которые смогли бы ему помочь. Ты встретишь его на площади перед Храмом.
};

func void Info_CorKalom_BringBook_WHO()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Who_15_01");	//Кто украл альманах?
	AI_Output(self,other,"Info_CorKalom_BringBook_Who_10_02");	//Талас сказал, что на него напали черные гоблины. Странно, конечно, но вполне вероятно.
};

func void Info_CorKalom_BringBook_EARN()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Earn_15_01");	//А я за это что-нибудь получу?
	if(!C_NpcBelongsToPsiCamp(other))
	{
		AI_Output(self,other,"Info_CorKalom_BringBook_Earn_10_02");	//Разве тебе мало доказательств моей щедрости? Ты не останешься без награды.
	}
	else
	{
		SC_Faith_Sleeper -=5;
		AI_Output(self,other,"Info_CorKalom_BringBook_Earn_NULL_03"); //Что?.. Ты позволяешь задавать себе такие вопросы? Разве ты не хочешь пробуждения нашего великого бога?
		AI_Output(self,other,"Info_CorKalom_BringBook_Earn_NULL_04"); //Вероятно я ошибся в тебе. Тем не менее да, награда будет.
	};
};


instance Info_CorKalom_BringBook_Success(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringBook_Success_Condition;
	information = Info_CorKalom_BringBook_Success_Info;
	permanent = 0;
	description = "Я нашел книгу.";
};


func int Info_CorKalom_BringBook_Success_Condition()
{
	if(Npc_HasItems(hero,ItWrFokusbuch) && (CorKalom_BringBook == LOG_RUNNING))
	{
		return 1;
	};
};

func void Info_CorKalom_BringBook_Success_Info()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_01");	//Я нашел книгу.
	b_printtrademsg1("Отдан альманах.");
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_02");	//Хорошая работа. Теперь ты достал все, что нам нужно.
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_03");	//Еще немного, и все будет готово.
	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_04");	//Где состоится Церемония?
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_05");	//Приходи ночью на площадь перед Храмом. Мы все соберемся там, чтобы призвать Спящего.
	Npc_RemoveInvItem(hero,ItWrFokusbuch);
	B_GiveXP(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;
	B_LogEntry(CH2_Book,"После того как я принес альманах Кор Галому, все братья стали готовиться к великой Церемонии. Ее проведут ночью на площади перед Храмом.");
	Log_SetTopicStatus(CH2_Book,LOG_SUCCESS);
	AI_StopProcessInfos(self);
	B_Story_PrepareRitual();
};


instance Info_CorKalom_Belohnung(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = Info_CorKalom_Belohnung_Condition;
	information = Info_CorKalom_Belohnung_Info;
	permanent = 0;
	description = "Давай поговорим о моей награде.";
};


func int Info_CorKalom_Belohnung_Condition()
{
	if(Npc_KnowsInfo(hero,Info_CorKalom_BringBook_Success))
	{
		return 1;
	};
};

func void Info_CorKalom_Belohnung_Info()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_15_00");	//Давай поговорим о моей награде.
	AI_Output(self,other,"Info_CorKalom_Belohnung_10_01");	//Что ты хочешь получить?
	Info_ClearChoices(Info_CorKalom_Belohnung);
	Info_AddChoice(Info_CorKalom_Belohnung,"Дай мне свитки с заклинаниями.",Info_CorKalom_Belohnung_SCROLL);
	Info_AddChoice(Info_CorKalom_Belohnung,"Я возьму руду.",Info_CorKalom_Belohnung_ORE);
	Info_AddChoice(Info_CorKalom_Belohnung,"Я возьму зелья.",Info_CorKalom_Belohnung_MANA);
};

func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_SCROLL_15_00");	//Дай мне свитки с заклинаниями.
	AI_Output(self,other,"Info_CorKalom_Belohnung_SCROLL_10_01");	//Используй эти заклинания с умом!
	b_printtrademsg1("Получено 3 свитка сна.");
	CreateInvItems(self,ItArScrollSleep,3);
	B_GiveInvItems(self,hero,ItArScrollSleep,3);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};

func void Info_CorKalom_Belohnung_ORE()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_ORE_15_00");	//Я возьму руду.
	AI_Output(self,other,"Info_CorKalom_Belohnung_ORE_10_01");	//Надеюсь, эта руда утолит твою жадность.
	b_printtrademsg1("Получено руды: 300");
	CreateInvItems(self,ItMiNugget,300);
	B_GiveInvItems(self,hero,ItMiNugget,300);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};

func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_MANA_15_00");	//Я возьму зелья.
	AI_Output(self,other,"Info_CorKalom_Belohnung_MANA_10_01");	//Пусть эти зелья придадут тебе сил!
	b_printtrademsg1("Получено 5 экстрактов магической энергии.");
	CreateInvItems(self,ItFo_Potion_Mana_02,5);
	B_GiveInvItems(self,hero,ItFo_Potion_Mana_02,5);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};


instance GUR_1201_CorKalom_Exit(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 999;
	condition = GUR_1201_CorKalom_Exit_Condition;
	information = GUR_1201_CorKalom_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int GUR_1201_CorKalom_Exit_Condition()
{
	return 1;
};

func void GUR_1201_CorKalom_Exit_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Exit_15_01");	//До встречи!
	AI_Output(self,other,"GUR_1201_CorKalom_Exit_10_02");	//Да просветит тебя Спящий!
	AI_StopProcessInfos(self);
};

