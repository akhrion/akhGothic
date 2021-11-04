
func void b_torrezlearn()
{
	Info_ClearChoices(KDF_405_Torrez_MANA);
	Info_AddChoice(KDF_405_Torrez_MANA,DIALOG_BACK,KDF_405_Torrez_MANA_BACK);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(KDF_405_Torrez_MANA,B_BuildLearnString(NAME_LearnMana_5,(5 * LPCOST_ATTRIBUTE_MANA),OTHERCAMPLEARNPAY * 5),KDF_405_Torrez_MANA_MAN_5);
		Info_AddChoice(KDF_405_Torrez_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),KDF_405_Torrez_MANA_MAN_1);
	}
	else if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(KDF_405_Torrez_MANA,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),KDF_405_Torrez_MANA_MAN_5);
		Info_AddChoice(KDF_405_Torrez_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDF_405_Torrez_MANA_MAN_1);
	}
	else
	{
		Info_AddChoice(KDF_405_Torrez_MANA,B_BuildLearnString(NAME_LearnMana_5,(5 * LPCOST_ATTRIBUTE_MANA),OTHERCAMPLEARNPAY * 5),KDF_405_Torrez_MANA_MAN_5);
		Info_AddChoice(KDF_405_Torrez_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),KDF_405_Torrez_MANA_MAN_1);
	};
};


instance DIA_Torrez_Exit(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 999;
	condition = DIA_Torrez_Exit_Condition;
	information = DIA_Torrez_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Torrez_Exit_Condition()
{
	return 1;
};

func void DIA_Torrez_Exit_Info()
{
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Torrez_Hello(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 1;
	condition = DIA_Torrez_Hello_Condition;
	information = DIA_Torrez_Hello_Info;
	permanent = 0;
	description = "Я ищу Верховного Мага Круга Огня.";
};


func int DIA_Torrez_Hello_Condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_KDF) && !Npc_KnowsInfo(hero,DIA_Milten_Letter) && (Saturas_BringFoci == FALSE))
	{
		return 1;
	};
};

func void DIA_Torrez_Hello_Info()
{
	AI_Output(other,self,"DIA_Torrez_Hello_15_00");	//Я ищу Верховного Мага Круга Огня.
	AI_Output(self,other,"DIA_Torrez_Hello_04_01");	//Поговори об этом с Мильтеном! И не мешай мне!
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Torrez_Belohnung(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 5;
	condition = DIA_Torrez_Belohnung_Condition;
	information = DIA_Torrez_Belohnung_Info;
	permanent = 0;
	description = "Меня прислал Корристо. Я передал ему письмо, и могу выбрать награду.";
};


func int DIA_Torrez_Belohnung_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (milten_HasLetter == TRUE))
	{
		return 1;
	};
};

func void DIA_Torrez_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_15_00");	//Меня прислал Корристо. Я передал ему письмо и теперь могу выбрать себе награду.
	AI_Output(self,other,"DIA_Torrez_Belohnung_04_01");	//Ты оказал нам неоценимую услугу, и, конечно, можешь получить за нее награду. Выбирай.
	if(PYROCAR_MESSENGER == LOG_RUNNING)
	{
		B_LogEntry(KDFLETTER,"Я получил награду у Торреза. Мое задание выполнено.");
		Log_SetTopicStatus(KDFLETTER,LOG_SUCCESS);
		PYROCAR_MESSENGER = LOG_SUCCESS;
	};
	Info_ClearChoices(DIA_Torrez_Belohnung);
	Info_AddChoice(DIA_Torrez_Belohnung,"Эссенция силы духа (Макс. маг. сила +5)",DIA_Torrez_Belohnung_ManaMax);
	Info_AddChoice(DIA_Torrez_Belohnung,"3 свитка (Огненный шар, Молния и Превращение в падальщика)",DIA_Torrez_Belohnung_Scrolls);
	Info_AddChoice(DIA_Torrez_Belohnung,"Кольцо ловкости (+5)",DIA_Torrez_Belohnung_Dex);
	Info_AddChoice(DIA_Torrez_Belohnung,"Кольцо силы (+5)",DIA_Torrez_Belohnung_Str);
};

func void DIA_Torrez_Belohnung_Str()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Str_15_00");	//Я возьму Кольцо силы.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Str_04_01");	//Твой выбор не был неожиданным. Вот, возьми кольцо.
	b_printtrademsg1("Получено кольцо силы.");
	CreateInvItem(hero,Staerkering);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Dex_15_00");	//Я возьму Кольцо ловкости.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Dex_04_01");	//Ловкость побеждает силу. Я одобряю твой выбор.
	b_printtrademsg1("Получено кольцо ловкости.");
	CreateInvItem(hero,Ring_des_Geschicks);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Scrolls_15_00");	//Дай мне магические свитки.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Scrolls_04_01");	//Используй их с умом и помни, что ты можешь прочитать заклинание из свитка только один раз!
	b_printtrademsg1("Получены свитки: огненный шар, молния и превращение в падальщика.");
	CreateInvItem(other,ItArScrollFireball);
	CreateInvItem(other,ItArScrollTrfScavenger);
	CreateInvItem(other,ItArScrollChainLightning);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_ManaMax_15_00");	//Я возьму зелье!
	AI_Output(self,other,"DIA_Torrez_Belohnung_ManaMax_04_01");	//Твой выбор говорит о твоей мудрости. Это самое ценное из того, что ты мог взять у меня. Выпей это зелье, и оно увеличит твою силу!
	b_printtrademsg1("Получена эссенция силы духа.");
	CreateInvItem(hero,ItFo_Potion_Mana_Perma_01);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};


instance DIA_Torrez_BriefTausch(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 5;
	condition = DIA_Torrez_BriefTausch_Condition;
	information = DIA_Torrez_BriefTausch_Info;
	permanent = 0;
	description = "У меня есть для тебя письмо. Но сначала я хочу получить награду!";
};


func int DIA_Torrez_BriefTausch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (milten_HasLetter == FALSE))
	{
		return 1;
	}
	else if((Saturas_BringFoci != FALSE) && (Npc_HasItems(hero,ItWr_Fire_Letter_01) || Npc_HasItems(hero,ItWr_Fire_Letter_02)))
	{
		return 1;
	};
};

func void DIA_Torrez_BriefTausch_Info()
{
	var C_Npc Corristo;
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_00");	//У меня есть для тебя письмо. Но сначала я хочу получить за него награду!
	if(Saturas_BringFoci == FALSE)
	{
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_01");	//Почему бы тебе не поговорить с Мильтеном?
		AI_Output(other,self,"DIA_Torrez_BriefTausch_15_02");	//Я уже поговорил с ним.
	};
	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_03");	//Понятно. У меня есть для тебя награда. А теперь покажи мне письмо!
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_04");	//Вот оно.
	if(Npc_HasItems(other,ItWr_Fire_Letter_01) >= 1)
	{
		b_printtrademsg1("Отдано запечатанное письмо.");
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_05");	//Вот твоя награда - Кольцо силы. Редкий артефакт, к тому же очень полезный.
		b_printtrademsg2("Получено кольцо силы.");
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_06");	//А теперь иди!
		Npc_RemoveInvItems(hero,ItWr_Fire_Letter_01,1);
		CreateInvItems(hero,Staerkering,1);
		B_GiveXP(XP_XardasLetter);
	}
	else if(Npc_HasItems(other,ItWr_Fire_Letter_02) >= 1)
	{
		b_printtrademsg1("Отдано вскрытое письмо.");
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_07");	//Печать сломана.
		AI_Output(other,self,"DIA_Torrez_BriefTausch_15_08");	//Ну, это была простая случайность.
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_09");	//Что ж, вот твоя награда - целебное зелье. Это тоже неплохо. Обычно гонец, принесший письмо без печати, не получает ничего.
		b_printtrademsg2("Получено зелье исцеления.");
		Npc_RemoveInvItems(hero,ItWr_Fire_Letter_02,1);
		CreateInvItems(hero,ItFo_Potion_Health_03,1);
		B_GiveXP(XP_XardasLetterOPEN);
	};
	Corristo = Hlp_GetNpc(Kdf_402_Corristo);
	CreateInvItems(Corristo,ItWr_Fire_Letter_02,1);
	if(PYROCAR_MESSENGER == LOG_RUNNING)
	{
		B_LogEntry(KDFLETTER,"Я доставил письмо магам и получил награду у Торреза.");
		Log_SetTopicStatus(KDFLETTER,LOG_SUCCESS);
		PYROCAR_MESSENGER = LOG_SUCCESS;
	};
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Torrez_PERM(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 1;
	condition = DIA_Torrez_PERM_Condition;
	information = DIA_Torrez_PERM_Info;
	permanent = 1;
	description = "Как идет изучение магии?";
};


func int DIA_Torrez_PERM_Condition()
{
	if(Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Torrez_PERM_Info()
{
	AI_Output(other,self,"DIA_Torrez_PERM_15_00");	//Как идет изучение магии?
	AI_Output(self,other,"DIA_Torrez_PERM_04_01");	//Тебя наши дела не касаются!
	AI_StopProcessInfos(self);
};


instance KDF_405_Torrez_BOOK(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_BOOK_Condition;
	information = KDF_405_Torrez_BOOK_Info;
	important = 1;
	permanent = 0;
};


func int KDF_405_Torrez_BOOK_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE) && Npc_KnowsInfo(hero,KDF_403_Drago_RUNE))
	{
		return TRUE;
	};
};

func void KDF_405_Torrez_BOOK_Info()
{
	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_01");	//Каждый Круг магии описан в специальной книге. Читай их и ты приобретешь знание. А в знании - сила!
	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_02");	//Вот, возьми книгу Первого Круга. Она научит тебя понимать Огонь.
	b_printtrademsg1("Получена книга 'Первый круг магии'.");
	B_GiveInvItems(self,hero,ItWr_Book_Circle_01,1);
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance KDF_405_Torrez_SELLBOOKS(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_SELLBOOKS_Condition;
	information = KDF_405_Torrez_SELLBOOKS_Info;
	important = 0;
	permanent = 1;
	description = "Я хочу приобрести магические свитки.";
	trade = 1;
};


func int KDF_405_Torrez_SELLBOOKS_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_405_Torrez_GREET))
	{
		return TRUE;
	};
};

func void KDF_405_Torrez_SELLBOOKS_Info()
{
	AI_Output(other,self,"KDF_405_Torrez_SELLBOOKS_Info_15_01");	//Я хочу приобрести магические свитки.
};


instance KDF_405_Torrez_GREET(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_GREET_Condition;
	information = KDF_405_Torrez_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Приветствую тебя, маг!";
};


func int KDF_405_Torrez_GREET_Condition()
{
	return TRUE;
};

func void KDF_405_Torrez_GREET_Info()
{
	AI_Output(other,self,"KDF_405_Torrez_GREET_Info_15_01");	//Приветствую тебя, маг!
	AI_Output(self,other,"KDF_405_Torrez_GREET_Info_04_02");	//Да пребудет с тобой Иннос! Я делюсь своими знаниями мира магии и могу учить магов увеличивать их магическую силу!
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Торрез продает магические свитки и руны. Он находится во дворе замка.");
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Торрез может помочь мне увеличить мою магическую силу. Он все время проводит во дворе замка.");
};


instance KDF_405_Torrez_MANA(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_MANA_Condition;
	information = KDF_405_Torrez_MANA_Info;
	important = 0;
	permanent = 1;
	description = "Мне нужно увеличить магическую силу.";
};


func int KDF_405_Torrez_MANA_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_405_Torrez_GREET))
	{
		return TRUE;
	};
};

func void KDF_405_Torrez_MANA_Info()
{
	AI_Output(other,self,"KDF_405_Torrez_MANA_Info_15_01");	//Мне нужно увеличить магическую силу.
	AI_Output(self,other,"KDF_405_Torrez_MANA_Info_04_02");	//Я могу помочь тебе. Как ты будешь ее использовать, зависит только от тебя.
	b_torrezlearn();
};

func void KDF_405_Torrez_MANA_BACK()
{
	Info_ClearChoices(KDF_405_Torrez_MANA);
};

func void KDF_405_Torrez_MANA_MAN_1()
{
	if(((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF)) && (DIFF_HARD == FALSE))
	{
		B_BuyAttributePoints(other,ATR_MANA_MAX,1);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_MANA_MAX] < 100))
		{
			b_printtrademsg1("Отдано руды: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_MANA_MAX,1);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Что ж, тогда ничего не получится. Очень жаль, но я ничего не могу сделать.
	};
	b_torrezlearn();
};

func void KDF_405_Torrez_MANA_MAN_5()
{
	if(((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF)) && (DIFF_HARD == FALSE))
	{
		B_BuyAttributePoints(other,ATR_MANA_MAX,5);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_MANA_MAX] < 96))
		{
			b_printtrademsg1("Отдано руды: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_MANA_MAX,5);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Что ж, тогда ничего не получится. Очень жаль, но я ничего не могу сделать.
	};
	b_torrezlearn();
};


instance KDF_405_Torrez_WANNABEMAGE(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_WANNABEMAGE_Condition;
	information = KDF_405_Torrez_WANNABEMAGE_Info;
	important = 0;
	permanent = 0;
	description = "Что нужно сделать, чтобы стать магом?";
};


func int KDF_405_Torrez_WANNABEMAGE_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_405_Torrez_GREET) && (Npc_GetTrueGuild(hero) != GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_405_Torrez_WANNABEMAGE_Info()
{
	AI_Output(other,self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01");	//Что нужно сделать, чтобы стать магом?
	AI_Output(self,other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02");	//Поговори об этом с Мастером Корристо, если у него найдется для тебя свободная минута.
};

