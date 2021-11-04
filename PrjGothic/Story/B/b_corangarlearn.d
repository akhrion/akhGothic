
func void b_corangarlearn()
{
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,(5 * LPCOST_ATTRIBUTE_STRENGTH),OTHERCAMPLEARNPAY * 5),GUR_1202_CorAngar_Teach_STR_5);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),GUR_1202_CorAngar_Teach_STR_1);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,(5 * LPCOST_ATTRIBUTE_DEXTERITY),OTHERCAMPLEARNPAY * 5),GUR_1202_CorAngar_Teach_DEX_5);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),GUR_1202_CorAngar_Teach_DEX_1);
	}
	else
	{
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1)
	{
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0),GUR_1202_CorAngar_ZWEIHAND1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1)
	{
		Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0),GUR_1202_CorAngar_ZWEIHAND2);
	};
};


instance DIA_GUR_1202_CorAngar_Exit(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 999;
	condition = DIA_GUR_1202_CorAngar_Exit_Condition;
	information = DIA_GUR_1202_CorAngar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

func void DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CorAngar_LaterTrainer(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 6;
	condition = DIA_CorAngar_LaterTrainer_Condition;
	information = DIA_CorAngar_LaterTrainer_Info;
	permanent = 0;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_CorAngar_LaterTrainer_Condition()
{
	if(Npc_GetTrueGuild(hero) != GIL_TPL)
	{
		return 1;
	};
};

func void DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//Хочешь стать хорошим воином? Да, тебе действительно нужно найти опытного учителя.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02");	//Хорошо. Но, к сожалению, я не тот, кто сможет помочь тебе.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03");	//Я обучаю лишь тех, кто входит в священный круг Стражей.
};


instance DIA_CORANGAR_LATERTRAINER2(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 6;
	condition = dia_corangar_latertrainer2_condition;
	information = dia_corangar_latertrainer2_info;
	permanent = 0;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_corangar_latertrainer2_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return 1;
	};
};

func void dia_corangar_latertrainer2_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//Хочешь стать хорошим воином? Да, тебе действительно нужно найти опытного учителя.
	AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02");	//Чтобы овладеть техникой боя с двуручным мечом, нужна определенная сила и ловкость.
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01");	//Ловкость и сила - очень важные характеристики воина.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Кор Ангар может помочь мне увеличить силу и ловкость. Я смогу найти его на тренировочной площадке Стражей, на втором уровне.");
	B_LogEntry(GE_TeacherPSI,"Кор Ангар может научить меня обращаться с двуручным мечом. Но это произойдет после того, как я освою бой с одноручным оружием.");
};


instance DIA_CorAngar_WieTempler(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 7;
	condition = DIA_CorAngar_WieTempler_Condition;
	information = DIA_CorAngar_WieTempler_Info;
	permanent = 1;
	description = "Как мне стать одним из Стражей?";
};


func int DIA_CorAngar_WieTempler_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00");	//Как мне стать одним из Стражей?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01");	//Для этого тебе нужно доказать веру в Спящего и преданность ему, став послушником.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02");	//После этого приходи ко мне, и я буду учить тебя.
	AI_StopProcessInfos(self);
};


instance GUR_1202_CorAngar_Teach(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 10;
	condition = GUR_1202_CorAngar_Teach_Condition;
	information = GUR_1202_CorAngar_Teach_Info;
	permanent = 1;
	description = "Как я могу увеличить силу и ловкость?";
};


func int GUR_1202_CorAngar_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer2) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00");	//Как я могу увеличить силу и ловкость?
	b_corangarlearn();
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_STRENGTH] < 100))
		{
			b_printtrademsg1("Отдано руды: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_STRENGTH] < 96))
		{
			b_printtrademsg1("Отдано руды: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_DEXTERITY] < 100))
		{
			b_printtrademsg1("Отдано руды: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_DEXTERITY] < 96))
		{
			b_printtrademsg1("Отдано руды: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_ZWEIHAND1()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01");	//Научи меня вести бой двуручным мечом.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		AI_Output(self,other,"SVM_8_NoLearnYouAlreadyKnow");	//Сначала ты должен изучить основы и только потом переходить к более сложным вещам.
		PrintScreen("Требуется мастерство одноручного оружия!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03");	//Ты справишься с таким оружием только тогда, когда сможешь управлять не только своим телом, но и духом.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04");	//Пройдя эту ступень подготовки, закалив свое тело и дух, ты сможешь справиться с мечом.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05");	//Ключ к этому - умение сосредоточиться. В нем тело и дух становятся единым целым.
	};
	b_corangarlearn();
};

func void GUR_1202_CorAngar_ZWEIHAND2()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");	//Я хочу научиться еще лучше обращаться с двуручным мечом.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02");	//Ты уже освоил основы владения этим оружием. Теперь я научу тебя приемам, достойным мастера.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03");	//Сила твоего духа поможет тебе предугадывать движения противника до того, как он нанесет удар.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04");	//Если ты знаешь тактику противника, то победа уже наполовину в твоих руках.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05");	//Скорость - твое преимущество. Старайся, чтобы движения были плавными и неожиданными, а удары - точными и сильными.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06");	//Учись не обращать внимания на боль. Исход битвы будет зависеть от твоей силы воли.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07");	//Сохраняй спокойствие духа. Ты сможешь победить противника, если будешь идти в бой спокойным и сосредоточенным.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08");	//Используй свою силу осторожно и помни: тебя легче убить, если ты сам стал причиной поединка.
	};
	b_corangarlearn();
};


instance GUR_1202_CorAngar_WANNABETPL(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 5;
	condition = GUR_1202_CorAngar_WANNABETPL_Condition;
	information = GUR_1202_CorAngar_WANNABETPL_Info;
	important = 0;
	permanent = 1;
	description = "Я хочу стать Стражем!";
};


func int GUR_1202_CorAngar_WANNABETPL_Condition()
{
	if((Npc_KnowsInfo(hero,Tpl_1400_GorNaBar_VICTORY) || Npc_KnowsInfo(hero,Tpl_1415_Torwache_TEMPLERAUFNAHME) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01");	//Я хочу стать Стражем!
	if(CorKalom_BringMCQBalls != LOG_SUCCESS)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//Ты еще к этому не готов. Я смогу принять только тогда, когда у тебя будет больше опыта.
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//Ты еще к этому не готов. Я смогу принять только тогда, когда у тебя будет больше опыта.
		B_PrintGuildCondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03");	//Твое время пришло, ты можешь присоединиться к нам.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04");	//Ты должен знать, что Страж не просто защитник лагеря и хороший воин. Мы избранные Стражи Спящего, Стражи духа.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05");	//Мы в равной мере используем силу тела и силу духа. Настоящим Стражем может стать только тот, чье тело и дух пребывают в гармонии.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06");	//Я рад, что ты добился таких хороших результатов, затратив на это так мало времени. Ты готов быть принятым в круг Стражей.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//Запомни, когда твой дух силен и тело закалено, ты можешь отразить любую угрозу.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08");	//Сходи к Гор На Тофу на тренировочную площадку. Он даст тебе твои новые доспехи.
		Npc_SetTrueGuild(hero,GIL_TPL);
		hero.guild = GIL_TPL;
		Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
		B_LogEntry(GE_BecomeTemplar,"Сегодня Кор Ангар назначил меня Стражем. Я смогу взять свой новый доспех у Гор На Тофа. Обычно он стоит на тренировочной площадке.");
	};
};


instance GUR_1202_CorAngar_SENDS(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_SENDS_Condition;
	information = GUR_1202_CorAngar_SENDS_Info;
	important = 0;
	permanent = 0;
	description = "Что же нам теперь делать?";
};


func int GUR_1202_CorAngar_SENDS_Condition()
{
	if((Kapitel == 3) && (CorAngar_GotoOGY == FALSE))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01");	//Что же нам теперь делать?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02");	//Наше видение было очень неясным. Оно принесло нам больше вопросов, чем ответов.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03");	//Но одно стало ясно: мы видели орка в темной пещере. Недалеко отсюда есть заброшенный храм орков.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04");	//Раньше орки хоронили там умерших, поэтому это место называлось у них кладбищем орков.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05");	//Гуру Идол Люкор взял с собой нескольких Стражей и направился туда. Может быть, там мы найдем то, что послужит ответом на наши вопросы.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06");	//Мне нужен человек, который сможет пойти к ним, а затем вернуться ко мне и рассказать о том, что увидит.
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07");	//Почему ты не можешь пойти туда сам? Ты же предводитель Стражей!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08");	//Моя задача - защищать Просвещенного. Я останусь здесь с Юберионом и буду охранять его.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09");	//Ты уже хорошо послужил нашему лагерю. Я доверяю тебе больше, чем кому бы-то ни было.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10");	//Поэтому я прошу тебя, отправляйся на кладбище орков и расскажи мне, что удалось найти нашим Стражам.
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"А что я за это получу?",GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"Я сейчас же пойду туда!",GUR_1202_CorAngar_SENDS_KNOW);
};

func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01");	//А что я за это получу?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02");	//Тебе нужна руда? Наверное, я ошибся в тебе. Но мне все равно нужна твоя помощь. Вот сто кусков руды. Больше у меня нет!
	b_printtrademsg1("Получено руды: 100");
	CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,hero,ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01");	//Я сейчас же пойду туда!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02");	//Возьми вот это кольцо. Оно сможет защитить тебя в битве!
	b_printtrademsg1("Получено кольцо деревянной кожи.");
	B_Story_GotoOrcGraveyard();
	CreateInvItem(self,Schutzring_Geschosse1);
	B_GiveInvItems(self,hero,Schutzring_Geschosse1,1);
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
};


instance GUR_1202_CorAngar_WHERE(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_WHERE_Condition;
	information = GUR_1202_CorAngar_WHERE_Info;
	important = 0;
	permanent = 0;
	description = "Где находится кладбище орков?";
};


func int GUR_1202_CorAngar_WHERE_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_SENDS) && (BaalLukor_BringParchment == 0))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01");	//Где находится кладбище орков?
	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02");	//Это недалеко. Послушник Талас знает дорогу. Ты сможешь найти его на площади перед Храмом. Он укажет тебе путь.
	B_LogEntry(CH3_OrcGraveyard,"Послушник Талас сможет показать мне дорогу на кладбище орков. Он ждет меня на площади перед Храмом.");
};


instance GUR_1202_CorAngar_AFTER(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_AFTER_Condition;
	information = GUR_1202_CorAngar_AFTER_Info;
	important = 0;
	permanent = 0;
	description = "Я был на кладбище орков. Мы не смогли там ничего найти...";
};


func int GUR_1202_CorAngar_AFTER_Condition()
{
	if(BaalLukor_BringParchment == 4)
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_AFTER_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01");	//Я был на кладбище орков. Мы не смогли там ничего найти. Никаких знаков, указывающих на Спящего.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02");	//А что с Идолом Люкором и Стражами?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03");	//Они все мертвы.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04");	//Мертвы? Но почему, кто смел убить их?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05");	//В пещерах очень много орков. Это они убили всех Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06");	//Идол Люкор смог спастись от них, но, к несчастью, он сошел с ума.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07");	//Он стал кричать, что Спящий приказал ему убить меня, и попытался выполнить этот приказ.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08");	//Наверное, его ум помутился из-за большого разочарования. Он так хотел найти что-нибудь там.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09");	//Я не верю, что его поступок был вызван волей Спящего.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10");	//Такого не может... невозможно... Неважно!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11");	//Главное, что Идол Люкор не смог осуществить свое намерение.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12");	//Теперь вся наша надежда на Юбериона.
	B_GiveXP(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};


var int yberion_day;

instance Info_CorAngar_FindHerb(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_FindHerb_Condition;
	information = Info_CorAngar_FindHerb_Info;
	permanent = 0;
	important = 0;
	description = "Как дела у Юбериона?";
};


func int Info_CorAngar_FindHerb_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_AFTER))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Info()
{
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01");	//Как дела у Юбериона?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02");	//Сам он не сможет проснуться. Он быстро слабеет. Я знаю, что может его разбудить, но для этого мне нужна твоя помощь.
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//Как я могу ему помочь?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04");	//Найди мне болотные целебные травы. Принеси мне пять самых действенных из них.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//Может быть, Фортуно сможет тебе помочь? Он же травник.
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05");	//И, пожалуйста, поторопись!
	AI_StopProcessInfos(self);
	CorAngar_FindHerb = LOG_RUNNING;
	Log_CreateTopic(CH3_FindHerbs,LOG_MISSION);
	Log_SetTopicStatus(CH3_FindHerbs,LOG_RUNNING);
	B_LogEntry(CH3_FindHerbs,"Юберион все еще без сознания. Кор Ангар попросил меня найти для него пять кустов самых сильных лечебных трав. Но поможет ли это..?");
	YBERION_DAY = Wld_GetDay();
};


instance Info_CorAngar_FindHerb_WHERE(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_WHERE_Condition;
	information = Info_CorAngar_FindHerb_WHERE_Info;
	permanent = 0;
	important = 0;
	description = "А где растут эти травы?";
};


func int Info_CorAngar_FindHerb_WHERE_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01");	//А где растут эти травы?
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02");	//Поищи в болотах за лагерем. Они растут достаточно далеко отсюда, но будь осторожен, там тебя могут поджидать болотожоры.
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03");	//Не стоит терять времени. Иди же!
	AI_StopProcessInfos(self);
	B_LogEntry(CH3_FindHerbs,"Эти травы я смогу найти далеко на болотах за лагерем Братства. Там обитают опасные болотожоры. Я должен быть очень осторожен.");
};


instance Info_CorAngar_FindHerb_LOOK(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_LOOK_Condition;
	information = Info_CorAngar_FindHerb_LOOK_Info;
	permanent = 0;
	important = 0;
	description = "Как мне узнать те травы, которые помогут Юбериону?";
};


func int Info_CorAngar_FindHerb_LOOK_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//Как мне узнать те травы, которые помогут Юбериону?
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02");	//Они похожи на звезды из восьми зеленых и оранжевых лучей-листьев.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03");	//А теперь иди.
	AI_StopProcessInfos(self);
	B_LogEntry(CH3_FindHerbs,"Лечебные травы похожи на звезды из четырех зеленых и четырех оранжевых листьев.");
};


instance Info_CorAngar_FindHerb_Running(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_Running_Condition;
	information = Info_CorAngar_FindHerb_Running_Info;
	permanent = 1;
	important = 0;
	description = "Тех трав, которые я нашел, будет недостаточно.";
};


func int Info_CorAngar_FindHerb_Running_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5) && (Npc_HasItems(other,ItFo_Plants_Herb_03) > 0) && Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE) && Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Running_Info()
{
	var C_Npc fortuno;
	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");	//Тех трав, которые я нашел, будет недостаточно.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//Может быть, Фортуно сможет тебе помочь? Он же травник.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");	//Тебе нужно торопиться. Принеси пять кустов. Юберион не может ждать ни минуты.
	AI_StopProcessInfos(self);
	if(!Fortuno_HasYBerionHerbs)
	{
		fortuno = Hlp_GetNpc(NOV_1357_Fortuno);
		CreateInvItems(fortuno,ItFo_Plants_Herb_03,5);
		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry(CH3_FindHerbs,"Такие травы могут быть припасены у Фортуно.");
	};
};


instance Info_CorAngar_FindHerb_Success(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_Success_Condition;
	information = Info_CorAngar_FindHerb_Success_Info;
	permanent = 0;
	important = 0;
	description = "(отдать целебные травы)";
};


func int Info_CorAngar_FindHerb_Success_Condition()
{
	if((Npc_HasItems(other,ItFo_Plants_Herb_03) >= 5) && (CorAngar_FindHerb == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void Info_CorAngar_FindHerb_Success_Info()
{
	var C_Npc YBerion;
	var C_Npc angar;
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	angar = Hlp_GetNpc(GUR_1202_CorAngar);
	B_GiveInvItems(other,self,ItFo_Plants_Herb_03,5);
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_01");	//Я добыл целебные травы для Юбериона.
	b_printtrademsg1("Отдано 5 целебных корней.");
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02");	//Отлично. Когда ты уходил, Юберион очнулся ненадолго.
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//Он что-нибудь сказал?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//Да, он сказал, что Спящий на самом деле не является тем, что мы о нем думаем. Мы не должны пытаться разбудить его.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//Теперь нам остается надеяться на то, что Юбериона можно вылечить.
	Yberion_dead = LOG_RUNNING;
	B_GiveXP(XP_FindHerbs);
	B_LogEntry(CH3_FindHerbs,"Я передал Кор Ангару лечебные травы, но они не помогли Юбериону... Глава Братства умер...");
	CorAngar_FindHerb = LOG_FAILED;
	Log_SetTopicStatus(CH3_FindHerbs,LOG_FAILED);
	YBERION_DIED = TRUE;
	AI_Wait(self,0.5);
	AI_GotoWP(self,"PSI_TEMPLE_ROOMS_IN_02");
	AI_SetWalkMode(self,NPC_RUN);
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,YBerion);
	YBerion.flags = 0;
	Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,-YBerion.attribute[ATR_HITPOINTS_MAX]);
	AI_UseItemToState(self,ItFo_Plants_Herb_03,0);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//Юберион умер. Наш духовный учитель оставил нас!
	AI_UseItemToState(self,ItFo_Plants_Herb_03,-1);
	AI_TurnToNPC(self,other);
	AI_TurnToNPC(other,self);
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01");	//Даже твоя помощь не смогла отвратить от него смерть!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//Что же теперь будет, Кор Ангар?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//Я всегда доверял Юбериону. Перед смертью он сказал мне, что теперь нам остается надеяться только на магов Воды.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//Значит, нам нужно помочь магам Воды.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//Да, им нужен будет юнитор и альманах. И то, и другое находится у Кор Галома.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//А где сейчас Кор Галом?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07");	//После слов Юбериона он ужасно рассердился и отправился сам искать путь к Спящему, взяв с собой нескольких Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//Как же мы теперь сможем забрать юнитор?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//Я думаю, он оставил юнитор и книгу в своей лаборатории. Вот тебе ключ от его сундука.
	b_printtrademsg2("Получен ключ из лаборатории.");
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,Stab_des_Lichts);
	if(YBERION_KEY_STOLEN == FALSE)
	{
		CreateInvItem(self,itke_yberion);
	};
	CreateInvItem(self,itke_psi_kalom_01);
	B_GiveInvItems(self,other,itke_psi_kalom_01,1);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	if(C_NpcBelongsToPsiCamp(hero))
	{
		B_LogEntry(CH3_EscapePlanNC,"Умер Юберион, духовный отец Братства! Да упокоится он с миром! Перед смертью он выразил свою волю: братья должны помочь магам Воды осуществить их план. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара, эти предметы могут пригодиться магам Воды.");
	}
	else
	{
		B_LogEntry(CH3_EscapePlanNC,"Я окончательно решил пойти в Новый лагерь, чтобы помочь магам Воды разрушить Барьер. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара эти предметы могут пригодиться магам Воды. ");
	};
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		BaalOrun_FetchWeed = LOG_FAILED;
		B_LogEntry(CH1_DeliverWeed,"Кор Галом покинул лагерь, я не успел отдать ему урожай болотника.");
		Log_SetTopicStatus(CH1_DeliverWeed,LOG_FAILED);
	};
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		Kalom_Krautbote = LOG_FAILED;
		B_LogEntry(CH1_KrautBote,"Кор Галом пропал, теперь я не смогу отдать ему руду за болотник.");
		Log_SetTopicStatus(CH1_KrautBote,LOG_FAILED);
	};
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		Kalom_DrugMonopol = LOG_FAILED;
		B_LogEntry(CH1_DrugMonopol,"Я не смогу получить награду за устранение конкурентов, Кор Галом ушел из лагеря.");
		Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	};
	CorAngar_SendToNC = TRUE;
};


instance Info_CorAngar_TELEPORT(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_TELEPORT_Condition;
	information = Info_CorAngar_TELEPORT_Info;
	permanent = 0;
	important = 1;
};


func int Info_CorAngar_TELEPORT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success) || Npc_KnowsInfo(hero,info_corangar_yberion_died) || Npc_KnowsInfo(hero,info_corangar_healthwater))
	{
		return TRUE;
	};
};

func void Info_CorAngar_TELEPORT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//Подожди!
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02");	//В чем дело?
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//Возьми эту руну в знак нашей благодарности за твою помощь.
	b_printtrademsg1("Получена руна телепортации в Болотный лагерь.");
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04");	//Она даст тебе возможность быстро перенестись на площадь перед нашим Храмом.
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//Спасибо тебе!
	if(YBERION_DIED == TRUE)
	{
		Npc_ExchangeRoutine(self,"AFTER");
		B_ExchangeRoutine(Gur_1207_Natalia,"AFTER");
		B_ExchangeRoutine(Gur_1205_Chani,"AFTER");
	}
	else if(YBERION_HEALED == TRUE)
	{
		Npc_ExchangeRoutine(self,"guru");
	};
	B_Story_SentToNC();
};


instance CORANGAR_STEALKEY(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 990;
	condition = corangar_stealkey_condition;
	information = corangar_stealkey_info;
	important = 0;
	permanent = 0;
	description = "(украсть ключ)";
};


func int corangar_stealkey_condition()
{
	if(Npc_HasItems(self,itke_yberion) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1))
	{
		return TRUE;
	};
};

func void corangar_stealkey_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01");	//Есть какие-нибудь верные приемы охоты на ползунов?
	AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//Запомни, когда твой дух силен и тело закалено, ты можешь отразить любую угрозу.
	AI_DrawWeapon(self);
	AI_PlayAni(other,"T_STAND_2_IGET");
	AI_PlayAni(other,"T_IGET_2_STAND");
	AI_PlayAni(self,"T_1HSFREE");
	AI_RemoveWeapon(self);
	PrintScreen("Украден ключ.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,itke_yberion);
	Npc_RemoveInvItem(self,itke_yberion);
	AI_StopProcessInfos(self);
};


instance INFO_CORANGAR_YBERION_DIED(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = info_corangar_yberion_died_condition;
	information = info_corangar_yberion_died_info;
	permanent = 0;
	important = 1;
};


func int info_corangar_yberion_died_condition()
{
	if((YBERION_DAY <= (Wld_GetDay() - 2)) && (CorAngar_FindHerb == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_corangar_yberion_died_info()
{
	var C_Npc YBerion;
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	YBerion.flags = 0;
	Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,-YBerion.attribute[ATR_HITPOINTS_MAX]);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,Stab_des_Lichts);
	CreateInvItem(self,itke_yberion);
	CreateInvItem(self,itke_psi_kalom_01);
	B_GiveInvItems(self,other,itke_psi_kalom_01,1);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	if(C_NpcBelongsToPsiCamp(hero))
	{
		B_LogEntry(CH3_EscapePlanNC,"Умер Юберион, духовный отец Братства! Да упокоится он с миром! Перед смертью он выразил свою волю: братья должны помочь магам Воды осуществить их план. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара, эти предметы могут пригодиться магам Воды.");
	}
	else
	{
		B_LogEntry(CH3_EscapePlanNC,"Я окончательно решил пойти в Новый лагерь, чтобы помочь магам Воды разрушить Барьер. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара эти предметы могут пригодиться магам Воды. ");
	};
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		BaalOrun_FetchWeed = LOG_FAILED;
		B_LogEntry(CH1_DeliverWeed,"Кор Галом покинул лагерь, я не успел отдать ему урожай болотника.");
		Log_SetTopicStatus(CH1_DeliverWeed,LOG_FAILED);
	};
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		Kalom_Krautbote = LOG_FAILED;
		B_LogEntry(CH1_KrautBote,"Кор Галом пропал, теперь я не смогу отдать ему руду за болотник.");
		Log_SetTopicStatus(CH1_KrautBote,LOG_FAILED);
	};
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		Kalom_DrugMonopol = LOG_FAILED;
		B_LogEntry(CH1_DrugMonopol,"Я не смогу получить награду за устранение конкурентов, Кор Галом ушел из лагеря.");
		Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	};
	CorAngar_SendToNC = TRUE;
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//Юберион умер. Наш духовный учитель оставил нас!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//Что же теперь будет, Кор Ангар?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//Я всегда доверял Юбериону. Перед смертью он сказал мне, что теперь нам остается надеяться только на магов Воды.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//Значит, нам нужно помочь магам Воды.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//Да, им нужен будет юнитор и альманах. И то, и другое находится у Кор Галома.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//А где сейчас Кор Галом?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07_New");	//Отправился сам искать путь к Спящему, взяв с собой нескольких Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//Как же мы теперь сможем забрать юнитор?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//Я думаю, он оставил юнитор и книгу в своей лаборатории. Вот тебе ключ от его сундука.
	b_printtrademsg1("Получен ключ из лаборатории.");
	B_LogEntry(CH3_FindHerbs,"Я не успел принести Юбериону лечебные травы... Глава Братства умер...");
	CorAngar_FindHerb = LOG_FAILED;
	Log_SetTopicStatus(CH3_FindHerbs,LOG_FAILED);
	YBERION_DIED = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_CORANGAR_HEALTHWATER(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 2;
	condition = info_corangar_healthwater_condition;
	information = info_corangar_healthwater_info;
	permanent = 0;
	important = 0;
	description = "(отдать зелье Фортуно)";
};


func int info_corangar_healthwater_condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && Npc_HasItems(other,HealthWater))
	{
		return 1;
	};
};

func void info_corangar_healthwater_info()
{
	var C_Npc YBerion;
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,Stab_des_Lichts);
	CreateInvItem(self,itke_yberion);
	CreateInvItem(self,itke_psi_kalom_01);
	B_GiveInvItems(self,other,itke_psi_kalom_01,1);
	B_GiveInvItems(other,self,HealthWater,1);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	B_GiveXP(2000);
	if(C_NpcBelongsToPsiCamp(hero))
	{
		B_LogEntry(CH3_EscapePlanNC,"Юберион ненадолго очнулся и выразил свою волю: братья должны помочь магам Воды осуществить их план. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара, эти предметы могут пригодиться магам Воды.");
	}
	else
	{
		B_LogEntry(CH3_EscapePlanNC,"Я окончательно решил пойти в Новый лагерь, чтобы помочь магам Воды разрушить Барьер. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара, эти предметы могут пригодиться магам Воды.");
	};
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		BaalOrun_FetchWeed = LOG_FAILED;
		B_LogEntry(CH1_DeliverWeed,"Кор Галом покинул лагерь, я не успел отдать ему урожай болотника.");
		Log_SetTopicStatus(CH1_DeliverWeed,LOG_FAILED);
	};
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		Kalom_Krautbote = LOG_FAILED;
		B_LogEntry(CH1_KrautBote,"Кор Галом пропал, теперь я не смогу отдать ему руду за болотник.");
		Log_SetTopicStatus(CH1_KrautBote,LOG_FAILED);
	};
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		Kalom_DrugMonopol = LOG_FAILED;
		B_LogEntry(CH1_DrugMonopol,"Я не смогу получить награду за устранение конкурентов, Кор Галом ушел из лагеря.");
		Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	};
	CorAngar_SendToNC = TRUE;
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01_New");	//Вот, может быть, это поможет.
	b_printtrademsg1("Отдано лечебное зелье Фортуно.");
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//Теперь нам остается надеяться на то, что Юбериона можно вылечить.
	AI_Wait(self,0.5);
	AI_GotoWP(self,"PSI_TEMPLE_ROOMS_IN_02");
	AI_SetWalkMode(self,NPC_RUN);
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,YBerion);
	AI_UseItemToState(self,HealthWater,0);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Wait(self,3);
	AI_UseItemToState(self,HealthWater,-1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02_New");	//Отлично. Юберион очнулся ненадолго.
	AI_TurnToNPC(other,self);
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//Он что-нибудь сказал?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//Да, он сказал, что Спящий на самом деле не является тем, что мы о нем думаем. Мы не должны пытаться разбудить его.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//Что же теперь будет, Кор Ангар?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03_New");	//Я всегда доверял Юбериону. Он сказал мне, что теперь нам остается надеяться только на магов Воды.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//Значит, нам нужно помочь магам Воды.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//Да, им нужен будет юнитор и альманах. И то, и другое находится у Кор Галома.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//А где сейчас Кор Галом?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07_New");	//Отправился сам искать путь к Спящему, взяв с собой нескольких Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//Как же мы теперь сможем забрать юнитор?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//Я думаю, он оставил юнитор и книгу в своей лаборатории. Вот тебе ключ от его сундука.
	b_printtrademsg2("Получен ключ из лаборатории.");
	B_LogEntry(CH3_FindHerbs,"Зелье Фортуно сработало! Юберион пришел в себя и успел немного поговорить с Кор Ангаром, прежде чем потерял сознание. Он все еще слаб, но уже не при смерти. Надеюсь, он поправится.");
	CorAngar_FindHerb = LOG_SUCCESS;
	Log_SetTopicStatus(CH3_FindHerbs,LOG_SUCCESS);
	YBERION_HEALED = TRUE;
	AI_StopProcessInfos(self);
};

