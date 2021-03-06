
instance DIA_Tpl_1415_Torwache_Exit(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 999;
	condition = DIA_Tpl_1415_Torwache_Exit_Condition;
	information = DIA_Tpl_1415_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Tpl_1415_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tpl_1415_Torwache_First(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 2;
	condition = DIA_Tpl_1415_Torwache_First_Condition;
	information = DIA_Tpl_1415_Torwache_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Tpl_1415_Torwache_First_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_First_Info()
{
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_00");	//Рад видеть тебя, незнакомец!
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_01");	//Ты ступил на святую землю - Братство Спящего.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_02");	//Какими судьбами ты здесь?
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
	if(Kapitel == 1)
	{
		Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Я здесь недавно. Могу я осмотреть лагерь?",DIA_Tpl_1415_Torwache_First_JustLooking);
	}
	else
	{
		Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Я просто хотел посмотреть лагерь.",DIA_Tpl_1415_Torwache_First_JustLooking);
	};
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Я собираюсь присоединиться к вам.",DIA_Tpl_1415_Torwache_First_Join);
	};
};

func void DIA_Tpl_1415_Torwache_First_Join()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_Join_15_00");	//Мне сказали, что вам нужны люди. Я хочу присоединиться к вам.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_01");	//Тогда я рад видеть тебя! Наше братство открыто для всех, кто душою стремится к Спящему.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_02");	//Если твое стремление серьезно, то иди к Идолу Намибу. Он во дворе за воротами. Может, он и уделит тебе внимание.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_04");	//Но ты не сможешь с ним поговорить, пока он сам этого не захочет.
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
};

func void DIA_Tpl_1415_Torwache_First_JustLooking()
{
	if(Kapitel == 1)
	{
		AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00");	//Я здесь недавно. Могу я осмотреть лагерь?
		AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01");	//Мы всегда рады новым людям.
	}
	else
	{
		AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01");	//Я просто хотел посмотреть лагерь.
	};
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02");	//Но только пока ты соблюдаешь наши правила. Есть места недозволенные таким как ты.
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
};


instance DIA_Tpl_1415_Torwache_Sit(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 2;
	condition = DIA_Tpl_1415_Torwache_Sit_Condition;
	information = DIA_Tpl_1415_Torwache_Sit_Info;
	permanent = 1;
	description = "Как идут дела?";
};


func int DIA_Tpl_1415_Torwache_Sit_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_Sit_Info()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_Sit_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_Sit_13_01");	//Тишина. Заходи.
};


instance Tpl_1415_Torwache_TEMPLERAUFNAHME(C_Info)
{
	npc = TPL_1415_Templer;
	condition = Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition;
	information = Tpl_1415_Torwache_TEMPLERAUFNAHME_Info;
	important = 1;
	permanent = 0;
};


func int Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition()
{
	if(((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void Tpl_1415_Torwache_TEMPLERAUFNAHME_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01");	//Эй, я знаю, что случилось в шахте. Молодчина! Ты достоин быть одним из Стражей.
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02");	//Просто поговори с Кор Ангаром!
	if(!Npc_KnowsInfo(hero,Tpl_1400_GorNaBar_VICTORY))
	{
		Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
		B_LogEntry(GE_BecomeTemplar,"Мне нужно поговорить с Кор Ангаром. Может быть, он зачислит меня в ряды Стражей.");
	};
};


instance Tpl_1415_Templer_ROCK(C_Info)
{
	npc = TPL_1415_Templer;
	condition = Tpl_1415_Templer_ROCK_Condition;
	information = Tpl_1415_Templer_ROCK_Info;
	important = 0;
	permanent = 1;
	description = "Мне нужен какой-нибудь доспех.";
};


func int Tpl_1415_Templer_ROCK_Condition()
{
	if((Kapitel < 2) && (GOT_NOV_L_ARMOR == FALSE))
	{
		return TRUE;
	};
};

func void Tpl_1415_Templer_ROCK_Info()
{
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_01");	//Мне нужен какой-нибудь доспех.
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_02");	//Доспехи Стража нужно еще заслужить. А пока могу одолжить тебе набедренную повязку послушника.
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_03");	//Все же лучше, чем ничего...
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_04");	//Только не подумай, что это бесплатно!
	Info_ClearChoices(Tpl_1415_Templer_ROCK);
	Info_AddChoice(Tpl_1415_Templer_ROCK,DIALOG_BACK,Tpl_1415_Templer_ROCK_BACK);
	Info_AddChoice(Tpl_1415_Templer_ROCK,B_BuildBuyArmorString("Повязка послушника, защита: 15/0/10/0",VALUE_NOV_ARMOR_L),Tpl_1415_Templer_ROCK_BUY);
};

func void Tpl_1415_Templer_ROCK_BACK()
{
	Info_ClearChoices(Tpl_1415_Templer_ROCK);
};

func void Tpl_1415_Templer_ROCK_BUY()
{
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_BUY_15_01");	//Хорошо, я возьму у тебя повязку.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_NOV_ARMOR_L)
	{
		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_02");	//Приходи тогда, когда у тебя будет достаточно руды!
	}
	else
	{
		b_printtrademsg1("Отдано руды: 500");
		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_03");	//Эта нехитрая одежда может спасти тебе жизнь!
		b_printtrademsg2("Получена повязка послушника.");
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NOV_ARMOR_L);
		CreateInvItem(self,nov_armor_l);
		B_GiveInvItems(self,hero,nov_armor_l,1);
		GOT_NOV_L_ARMOR = TRUE;
	};
};

