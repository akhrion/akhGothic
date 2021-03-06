
instance DIA_Scorpio_Exit(C_Info)
{
	npc = GRD_205_Scorpio;
	nr = 999;
	condition = DIA_Scorpio_Exit_Condition;
	information = DIA_Scorpio_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Scorpio_Exit_Condition()
{
	return 1;
};

func void DIA_Scorpio_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Scorpio_Hello(C_Info)
{
	npc = GRD_205_Scorpio;
	nr = 1;
	condition = DIA_Scorpio_Hello_Condition;
	information = DIA_Scorpio_Hello_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Scorpio_Hello_Condition()
{
	if(!C_NpcBelongsToOldCamp(other) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Scorpio_Hello_Info()
{
	AI_Output(self,other,"DIA_Scorpio_Hello_13_00");	//Кто пропустил тебя?
	if(THORUS_PASSGATE == TRUE)
	{
		AI_Output(other,self,"DIA_Scorpio_Hello_15_01");	//Торус.
	}
	else
	{
		AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02");	//Никто. Это было не слишком сложно.
	};
	AI_Output(self,other,"DIA_Scorpio_Hello_13_02");	//И что тебе здесь нужно?
	Info_ClearChoices(DIA_Scorpio_Hello);
	Info_AddChoice(DIA_Scorpio_Hello,"Просто захотелось посмотреть.",DIA_Scorpio_Hello_JustLooking);
	if(Npc_HasItems(hero,Cronos_Brief))
	{
		Info_AddChoice(DIA_Scorpio_Hello,"У меня есть письмо от магов Воды.",dia_scorpio_hello_cronosbrief);
	};
	if(Npc_HasItems(hero,ItWr_Fire_Letter_01) || Npc_HasItems(hero,ItWr_Fire_Letter_02))
	{
		Info_AddChoice(DIA_Scorpio_Hello,"У меня есть послание для магов.",DIA_Scorpio_Hello_Mages);
	};
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Scorpio_Hello,"Я принес болотник для Гомеза.",DIA_Scorpio_Hello_Kraut);
	};
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		Info_AddChoice(DIA_Scorpio_Hello,"Я хочу встретиться с Гомезом. Я собираюсь присоединиться к вам.",DIA_Scorpio_Hello_Join);
	};
};

func void dia_scorpio_hello_cronosbrief()
{
	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00");	//У меня есть письмо от магов Воды.
	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01");	//Ты работаешь на магов? До них мне нет никакого дела...
	Info_ClearChoices(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_JustLooking()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_JustLooking_15_00");	//Просто захотелось посмотреть.
	AI_Output(self,other,"DIA_Scorpio_Hello_JustLooking_13_01");	//Интересно.
	Info_ClearChoices(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Mages()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Mages_15_00");	//У меня есть послание для магов.
	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01");	//Ты работаешь на магов? До них мне нет никакого дела...
	if(LETTER_TOLD == 0)
	{
		LETTER_TOLD = 1;
	}
	else if(LETTER_TOLD == 1)
	{
		LETTER_TOLD = 2;
		if(!Npc_IsDead(VLK_505_Buddler))
		{
			B_ExchangeRoutine(VLK_505_Buddler,"letterwait");
		};
		if(!Npc_IsDead(VLK_506_Buddler))
		{
			B_ExchangeRoutine(VLK_506_Buddler,"letterwait");
		};
	};
	Info_ClearChoices(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Kraut()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Kraut_15_00");	//Я принес болотник для Гомеза.
	AI_Output(self,other,"DIA_Scorpio_Hello_Kraut_13_01");	//Тогда отнеси его в дом, который охраняется двумя стражниками.
	Info_ClearChoices(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Join()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_00");	//Я хочу встретиться с Гомезом. Я собираюсь присоединиться к вам.
	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_01");	//Ты? А ты уже доказал, что достоин к нам присоединиться?
	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_02");	//Призраки мной довольны...
	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_03");	//Призраки здесь ничего не решают. Здесь только наши слова имеют вес.
	Info_ClearChoices(DIA_Scorpio_Hello);
};


instance DIA_Scorpio_REFUSETRAIN(C_Info)
{
	npc = GRD_205_Scorpio;
	nr = 1;
	condition = DIA_Scorpio_REFUSETRAIN_Condition;
	information = DIA_Scorpio_REFUSETRAIN_Info;
	permanent = 1;
	description = "Ты можешь научить меня сражаться?";
};


func int DIA_Scorpio_REFUSETRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scorpio_Hello) && (Npc_GetTrueGuild(hero) != GIL_GRD) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Scorpio_REFUSETRAIN_Info()
{
	AI_Output(other,self,"DIA_Scorpio_REFUSETRAIN_15_00");	//Ты можешь научить меня сражаться?
	AI_Output(self,other,"DIA_Scorpio_REFUSETRAIN_13_01");	//Я тренирую только стражников. Ты сможешь тренироваться у меня только тогда, когда Торус назначит тебя стражником.
};


instance GRD_205_Scorpio_WELCOME(C_Info)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_WELCOME_Condition;
	information = GRD_205_Scorpio_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_205_Scorpio_WELCOME_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GRD) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void GRD_205_Scorpio_WELCOME_Info()
{
	AI_Output(self,other,"GRD_205_Scorpio_WELCOME_Info_13_01");	//Ты сделал хороший выбор, когда захотел присоединиться к нам.
	AI_StopProcessInfos(self);
};


instance GRD_205_Scorpio_CROSSBOW(C_Info)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_CROSSBOW_Condition;
	information = GRD_205_Scorpio_CROSSBOW_Info;
	important = 0;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int GRD_205_Scorpio_CROSSBOW_Condition()
{
	if(((Kapitel >= 4) || (Npc_GetTrueGuild(hero) == GIL_GRD)) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 0))
	{
		return TRUE;
	};
};

func void GRD_205_Scorpio_CROSSBOW_Info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_Info_15_01");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_Info_13_02");	//Если у тебя есть руда, то я могу научить тебя стрелять из арбалета. Это будет стоить 200 кусков.
	if((log_scorpiocrossbow == FALSE) && (Kapitel < 4))
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Скорпио может научить меня стрелять из арбалета.");
		log_scorpiocrossbow = TRUE;
	}
	else if((log_scorpiocrossbow == FALSE) && (Kapitel >= 4))
	{
		Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
		B_LogEntry(GE_TeacherOW,"Скорпио может научить меня стрелять из арбалета.");
		log_scorpiocrossbow = TRUE;
	};
	Info_ClearChoices(GRD_205_Scorpio_CROSSBOW);
	Info_AddChoice(GRD_205_Scorpio_CROSSBOW,DIALOG_BACK,GRD_205_Scorpio_CROSSBOW_BACK);
	Info_AddChoice(GRD_205_Scorpio_CROSSBOW,B_BuildLearnString(NAME_LearnCrossbow_1,LPCOST_TALENT_CROSSBOW_1,200),GRD_205_Scorpio_CROSSBOW_OK);
};

func void GRD_205_Scorpio_CROSSBOW_BACK()
{
	Info_ClearChoices(GRD_205_Scorpio_CROSSBOW);
};

func void GRD_205_Scorpio_CROSSBOW_OK()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_OK_15_01");	//Как скажешь. Научи меня стрелять из арбалета.
	if(Npc_HasItems(hero,ItMiNugget) >= 200)
	{
		if(B_GiveSkill(other,NPC_TALENT_CROSSBOW,1,LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_02");	//Хорошо, начнем прямо сейчас.
			b_printtrademsg1("Отдано руды: 200");
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_03");	//Возьми рукоятку арбалета. Ее необходимо упереть в плечо, что поможет тебе точнее прицелиться.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_04");	//Сначала твое плечо будет сильно уставать и болеть.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_05");	//Но через неделю тренировок ты его даже не узнаешь!
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_06");	//Прицелься и нажимай на курок. Болт летит гораздо быстрее, чем стрела, и наносит большее повреждение врагу!
			B_GiveInvItems(other,self,ItMiNugget,200);
			GRD_205_Scorpio_CROSSBOW.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_07");	//Две сотни кусков и ни куском меньше. Если ты мне не заплатишь, я ничему тебя не научу.
	};
};


instance GRD_205_Scorpio_CROSSBOW2(C_Info)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_CROSSBOW2_Condition;
	information = GRD_205_Scorpio_CROSSBOW2_Info;
	important = 0;
	permanent = 1;
	description = "Я хочу научиться еще лучше стрелять из арбалета.";
};


func int GRD_205_Scorpio_CROSSBOW2_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 1)
	{
		return TRUE;
	};
};

func void GRD_205_Scorpio_CROSSBOW2_Info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01");	//Я хочу научиться еще лучше стрелять из арбалета.
	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02");	//Это будет стоить 300 кусков руды.
	if((log_scorpiocrossbow == FALSE) && (Kapitel < 4))
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Скорпио может научить меня стрелять из арбалета.");
		log_scorpiocrossbow = TRUE;
	}
	else if((log_scorpiocrossbow == FALSE) && (Kapitel >= 4))
	{
		Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
		B_LogEntry(GE_TeacherOW,"Скорпио может научить меня стрелять из арбалета.");
		log_scorpiocrossbow = TRUE;
	};
	Info_ClearChoices(GRD_205_Scorpio_CROSSBOW2);
	Info_AddChoice(GRD_205_Scorpio_CROSSBOW2,DIALOG_BACK,GRD_205_Scorpio_CROSSBOW2_BACK);
	Info_AddChoice(GRD_205_Scorpio_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,LPCOST_TALENT_CROSSBOW_2,300),GRD_205_Scorpio_CROSSBOW2_OK);
};

func void GRD_205_Scorpio_CROSSBOW2_BACK()
{
	Info_ClearChoices(GRD_205_Scorpio_CROSSBOW2);
};

func void GRD_205_Scorpio_CROSSBOW2_OK()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//Начнем прямо сейчас.
	if(Npc_HasItems(hero,ItMiNugget) >= 300)
	{
		if(B_GiveSkill(other,NPC_TALENT_CROSSBOW,2,LPCOST_TALENT_CROSSBOW_2))
		{
			b_printtrademsg1("Отдано руды: 300");
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02");	//Преимущество арбалета состоит в том, что точность стрельбы повышается при выстреле с колена.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03");	//Но тебе также предстоит научиться оценивать скорость противника.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04");	//Выстрел должен быть направлен по ходу его движения, тогда ты сможешь в него попасть.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05");	//Если у тебя несколько целей, не пропускай ни одной из них, но веди по ним прицельный огонь по очереди.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06");	//Я научил тебя всему, что знаю сам.
			B_GiveInvItems(other,self,ItMiNugget,300);
			GRD_205_Scorpio_CROSSBOW2.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07");	//Найди мне сначала триста кусков руды.
	};
};


instance GRD_205_Scorpio_HeyPC(C_Info)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_HeyPC_Condition;
	information = GRD_205_Scorpio_HeyPC_Info;
	important = 1;
	permanent = 0;
};


func int GRD_205_Scorpio_HeyPC_Condition()
{
	if((Kapitel >= 4) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void GRD_205_Scorpio_HeyPC_Info()
{
	AI_Output(self,other,"GRD_205_Scorpio_HeyPC_Info_13_01");	//Эй, не бойся, подойди ко мне!
};


instance GRD_205_Scorpio_BANISHED(C_Info)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_BANISHED_Condition;
	information = GRD_205_Scorpio_BANISHED_Info;
	important = 0;
	permanent = 0;
	description = "У тебя все в порядке?";
};


func int GRD_205_Scorpio_BANISHED_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_205_Scorpio_HeyPC))
	{
		return TRUE;
	};
};

func void GRD_205_Scorpio_BANISHED_Info()
{
	AI_Output(other,self,"GRD_205_Scorpio_BANISHED_Info_15_01");	//У тебя все в порядке?
	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_02");	//Здесь меня трудно будет найти. Меня не интересует хлам, который растаскивают стражники.
	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_03");	//Но я успел захватить кое-что из арсенала. Если тебе нужно хорошее оружие, только скажи.
	if(Scorpio_Exile == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Скорпио покинул Старый лагерь из-за того, что там произошло. Теперь он живет в доме вместе с Кавалорном, на дороге между Старым и Новым лагерями.");
		Scorpio_Exile = TRUE;
	};
};


instance GRD_205_Scorpio_TRADE(C_Info)
{
	npc = GRD_205_Scorpio;
	condition = GRD_205_Scorpio_TRADE_Condition;
	information = GRD_205_Scorpio_TRADE_Info;
	important = 0;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int GRD_205_Scorpio_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_205_Scorpio_BANISHED))
	{
		return TRUE;
	};
};

func void GRD_205_Scorpio_TRADE_Info()
{
	AI_Output(other,self,"GRD_205_Scorpio_TRADE_Info_15_01");	//Покажи мне свои товары.
};

