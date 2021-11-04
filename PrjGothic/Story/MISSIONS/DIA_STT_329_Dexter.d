
instance DIA_Dexter_Exit(C_Info)
{
	npc = STT_329_Dexter;
	nr = 999;
	condition = DIA_Dexter_Exit_Condition;
	information = DIA_Dexter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Dexter_Exit_Condition()
{
	return 1;
};

func void DIA_Dexter_Exit_Info()
{
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_First(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_First_Condition;
	information = DIA_Dexter_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Dexter_First_Condition()
{
	return 1;
};

func void DIA_Dexter_First_Info()
{
	AI_Output(self,other,"DIA_Dexter_IAmNew_10_00");	//Эй, ты! Я продаю болотник и эликсиры из Лагеря сектантов. Что-нибудь хочешь купить?
	if(GRAVO_LOG == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Призрак Декстер на рыночной площади продает болотник и зелья из лагеря сектантов.");
	};
};


instance DIA_Dexter_Kraut(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_Kraut_Condition;
	information = DIA_Dexter_Kraut_Info;
	permanent = 0;
	description = "Что такое болотник?";
};


func int DIA_Dexter_Kraut_Condition()
{
	return 1;
};

func void DIA_Dexter_Kraut_Info()
{
	AI_Output(other,self,"DIA_Dexter_Kraut_15_00");	//Что такое болотник?
	AI_Output(self,other,"DIA_Dexter_Kraut_10_01");	//Новенький, да? Большинство из нас курят болотник, чтобы расслабиться.
};


instance DIA_Dexter_Trade(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_Trade_Condition;
	information = DIA_Dexter_Trade_Info;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int DIA_Dexter_Trade_Condition()
{
	return 1;
};

func void DIA_Dexter_Trade_Info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_Dexter_Trade_10_01");	//У меня все самое лучшее...
};


instance DIA_Dexter_JoinOC(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_JoinOC_Condition;
	information = DIA_Dexter_JoinOC_Info;
	permanent = 0;
	description = "Я хочу присоединиться к лагерю. Хочу стать Призраком.";
};


func int DIA_Dexter_JoinOC_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void DIA_Dexter_JoinOC_Info()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_00");	//Я хочу присоединиться к лагерю. Хочу стать Призраком.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_01");	//Да? Хочешь показать, что ты чего-то стоишь?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_02");	//Ну, хорошо. Можешь помочь мне. Если сделаешь все как надо, я поговорю с Диего.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_03");	//Что ты хочешь от меня?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_04");	//В Лагере сектантов есть один тип - Галом. Важный парень - один из Гуру.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_05");	//Он алхимик. И у него есть рецепт очень эффективного целебного эликсира.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_06");	//Если у меня будет этот рецепт, я смогу готовить такой же эликсир.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_07");	//Но к Галому просто так не подобраться.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_08");	//И что я должен сделать?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_09");	//Болотным придуркам постоянно нужны новые люди. Ты здесь новенький и тебе будет легко притвориться, что ты хочешь присоединиться к ним.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_10");	//Галом - один из Гуру, и именно он испытывает новичков. Когда встретишься с ним, попробуй получить рецепт.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_11");	//Как ты его добудешь мне все равно. Можешь купить его или украсть.
	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice(DIA_Dexter_JoinOC,"Ладно, я попробую его достать.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice(DIA_Dexter_JoinOC,"Мне кажется, это не так уж просто. Что я за это получу?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Ok_15_00");	//Ладно, я попробую его достать.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	Log_CreateTopic(CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_KalomsRecipe,"Призрак Декстер с рыночной площади заказал мне достать рецепт Гуру Кор Галома из лагеря Сектантов.");
	B_LogEntry(CH1_KalomsRecipe,"Декстер посоветовал мне сделать вид, будто я хочу присоединиться к ним.");
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_HowMuch_15_00");	//Мне кажется, это не так уж просто. Что я за это получу?
	AI_Output(self,other,"DIA_Dexter_JoinOC_HowMuch_10_01");	//Когда ты захочешь присоединиться к лагерю, Диего спросит о тебе. Угадай, что я ему скажу?
	Info_AddChoice(DIA_Dexter_JoinOC,"Может быть, придется заплатить за рецепт. Ты дашь 50 кусков руды.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Advance_15_00");	//Может быть, мне придется заплатить за этот рецепт. Ты можешь дать мне 50 кусков руды.
	AI_Output(self,other,"DIA_Dexter_JoinOC_Advance_10_01");	//Даже не думай об этом.
	Info_AddChoice(DIA_Dexter_JoinOC,"Нет руды - нет рецепта!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Threat_15_00");	//Нет руды - нет рецепта!
	AI_Output(self,other,"DIA_Dexter_JoinOC_Threat_10_01");	//Ладно! Хорошо! Когда рецепт будет у тебя, тогда и поговорим о руде.
	Info_AddChoice(DIA_Dexter_JoinOC,"Нет! Я хочу получить руду сейчас, или ты пойдешь за ним сам.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00");	//Нет! Я хочу получить руду сейчас, или ты пойдешь за ним сам.
	AI_Output(self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01");	//Слушай, здесь много и других новеньких. Так что... поручу я эту работу кому-нибудь другому...
	Info_AddChoice(DIA_Dexter_JoinOC,"Ладно! Давай просто забудем об этом.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00");	//Ладно! Давай просто забудем об этом.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01");	//Погоди! Не так быстро! Я всего лишь прощупывал почву... 50 кусков - это же хорошая сумма для новенького.
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02");	//Звучит гораздо лучше.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03");	//Да, да, хорошо! У меня найдется лишних 50 кусков для тебя. Только не подведи меня, паренек!
	b_printtrademsg1("Получено руды: 50");
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	Log_CreateTopic(CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_KalomsRecipe,"Призрак Декстер с рыночной площади заказал мне достать рецепт Гуру Кор Галома из лагеря Сектантов.");
	B_LogEntry(CH1_KalomsRecipe,"Декстер посоветовал мне сделать вид, будто я хочу присоединиться к ним.");
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	DEXTER_ORE_PREPAID = 1;
	Info_ClearChoices(DIA_Dexter_JoinOC);
};


var int Dexter_PsiCamp;

instance DIA_Dexter_WhereST(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_WhereST_Condition;
	information = DIA_Dexter_WhereST_Info;
	permanent = 0;
	description = "Где находится Лагерь сектантов?";
};


func int DIA_Dexter_WhereST_Condition()
{
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Dexter_WhereST_Info()
{
	AI_Output(other,self,"DIA_Dexter_WhereST_15_00");	//Где находится Лагерь сектантов?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_01");	//Выходишь из Лагеря через южные ворота и идешь на восток. Тебе не помешала бы карта.
	if(Npc_HasItems(self,ItWrWorldmap) > 0)
	{
		AI_Output(self,other,"DIA_Dexter_WhereST_10_02");	//Хочешь? Можешь купить ее у меня всего за 50 кусков руды...
	};
	AI_Output(other,self,"DIA_Dexter_WhereST_15_02");	//Южные ворота - это там, где разрушенная башня?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_03");	//Точно.
	if(!Dexter_PsiCamp)
	{
		B_LogEntry(CH1_KalomsRecipe,"Лагерь сектантов находится к востоку от Старого лагеря.");
		Dexter_PsiCamp = TRUE;
	};
};


instance DIA_Dexter_KalomsRecipeSuccess(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_KalomsRecipeSuccess_Condition;
	information = DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent = 1;
	description = "У меня есть рецепт, который ты просил!";
};


func int DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if((Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems(other,KalomsRecipe) > 0))
	{
		return 1;
	};
};

func void DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output(other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00");	//У меня есть рецепт, который ты просил!
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01");	//Отлично! Покажи его мне!
	b_printtrademsg1("Отдан рецепт.");
	B_GiveInvItems(other,self,KalomsRecipe,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02");	//Теперь я сам смогу готовить такой эликсир.
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03");	//Ты парень что надо! Я скажу об этом Диего!
	if(DEXTER_ORE_PREPAID != 1)
	{
		AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04");	//Вот, это тебе... за помощь...
		b_printtrademsg2("Получено руды: 40");
		CreateInvItems(self,ItMiNugget,40);
		B_GiveInvItems(self,other,ItMiNugget,40);
	};
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_SUCCESS);
		B_LogEntry(CH1_KalomsRecipe,"Декстер был удивлен. Теперь я могу быть уверен в его поддержке.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_SUCCESS);
		B_LogEntry(CH1_KalomsRecipe,"Декстер был удивлен. Но его помощь мне уже не требуется.");
	};
	B_GiveXP(XP_DexterKalom);
};
instance DIA_Dexter_UnikTrade(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_UnikTrade_Condition;
	information = DIA_Dexter_UnikTrade_Info;
	permanent = 1;
	description = "Слушай, а ты не интересуешься редкими травами?";
};


func int DIA_Dexter_UnikTrade_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dexter_KalomsRecipeSuccess))
	{
		return true;
	};
	return false;
};

func void DIA_Dexter_UnikTrade_Info()
{
	AI_Output(other,self,"DIA_Dexter_UnikTrade_NULL_00");	//Слушай, а ты не интересуешься редкими травами?
	AI_Output(other,self,"DIA_Dexter_UnikTrade_NULL_01");	//Я подумал, если тебе так интересен этот рецепт, то возможно и необычные травы тебя заинтересуют тоже..
	AI_Output(self,other,"DIA_Dexter_UnikTrade_NULL_02");	//Редкие? Хмм.. Даа. Мне интересны редкие травы.
	AI_Output(self,other,"DIA_Dexter_UnikTrade_NULL_03");	//Но только действительно редкие. Вишня тролля, драконий корень, ягоды гоблинов и все такое.
	AI_Output(other,self,"DIA_Dexter_UnikTrade_NULL_04");	//Я понял.
};

