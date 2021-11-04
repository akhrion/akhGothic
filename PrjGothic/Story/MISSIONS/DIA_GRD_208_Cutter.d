
instance DIA_Cutter_Exit(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 999;
	condition = DIA_Cutter_Exit_Condition;
	information = DIA_Cutter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Cutter_Exit_Condition()
{
	return 1;
};

func void DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cutter_Hello(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Hello_Condition;
	information = DIA_Cutter_Hello_Info;
	permanent = 0;
	description = "Да, какой большой замок.";
};


func int DIA_Cutter_Hello_Condition()
{
	if(!C_NpcBelongsToOldCamp(other) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Cutter_Hello_Info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//Да, какой большой замок.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//Раньше я тебя здесь не видел. Кто ты?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//Я здесь недавно. Хочу немного осмотреть это место.
};


instance DIA_Cutter_Burg(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Burg_Condition;
	information = DIA_Cutter_Burg_Info;
	permanent = 0;
	description = "Ты можешь рассказать мне что-нибудь о замке?";
};


func int DIA_Cutter_Burg_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Hello) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Cutter_Burg_Info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//Ты можешь рассказать мне что-нибудь о замке?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//После великого восстания он был занят Гомезом и его людьми. Теперь никто другой не смеет приближаться к нему.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//Я еще тогда понял, что лучше всего будет присоединиться к Гомезу.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//Еще в те времена, когда все мы сидели в подземельях и работали на шахте, он был самым влиятельным среди заключенных.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//Так под замком есть подземелья?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//Да, но сейчас они пусты. Со времен восстания туда никто не спускался.
};


instance DIA_Cutter_PERM(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_PERM_Condition;
	information = DIA_Cutter_PERM_Info;
	permanent = 1;
	description = "Как живется здесь стражникам?";
};


func int DIA_Cutter_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Burg) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Cutter_PERM_Info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//Как живется здесь стражникам?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//Спокойно живется. Наш лагерь сильнейший в колонии. С нами лучше не ссориться.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//Я уже понял.
	AI_StopProcessInfos(self);
};


instance GRD_208_Cutter_WELCOME(C_Info)
{
	npc = GRD_208_Cutter;
	condition = GRD_208_Cutter_WELCOME_Condition;
	information = GRD_208_Cutter_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_208_Cutter_WELCOME_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GRD) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void GRD_208_Cutter_WELCOME_Info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//Ты принял правильное решение. Думаю, тебе понравится быть стражником.
	AI_StopProcessInfos(self);
};


instance INFO_CUTTER_DIE(C_Info)
{
	npc = GRD_208_Cutter;
	condition = info_cutter_die_condition;
	information = info_cutter_die_info;
	permanent = 0;
	important = 1;
};


func int info_cutter_die_condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void info_cutter_die_info()
{
	AI_GotoNpc(self,hero);
	if((oldHeroGuild == GIL_STT) || (oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		if(oldHeroGuild == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01");	//Среди нас появился предатель! И мы еще называли тебя стражником!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02");	//Похоже, одного их мятежных магов Огня мы пропустили!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03");	//Один из Призраков оказался предателем!
		};
		AI_Output(hero,self,"VLK_585_Aleph_GUARDS_Info_15_01");	//О чем ты говоришь?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05");	//Ты ведешь какие-то дела с Новым лагерем, да?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06");	//Постой, но я все еще...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07");	//А ты думал, что так будет продолжаться вечно?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08");	//Прекрати нести весь этот вздор...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09");	//Предателей обычно убивают.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10");	//Так умри, предатель!
		if(Npc_KnowsInfo(hero,Info_Fletcher_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"Палач, который сейчас охраняет главные ворота, повел себя точно так же, как и Флетчер. Он что-то знает о том, что я ищу юниторы для Нового лагеря.");
		}
		else if(!Npc_KnowsInfo(hero,Info_Jackal_PAYDAY) && !Npc_KnowsInfo(hero,Info_Fletcher_DIE) && !Npc_KnowsInfo(hero,info_grd238_die))
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Палач, который теперь вместе с группой стражников охраняет северные ворота, назвал меня предателем и перебежчиком. Без дальнейших разговоров он напал на меня!");
			B_LogEntry(CH4_BannedFromOC,"Кажется, меня прогнали из Старого лагеря!");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11");	//И как это ты осмелился выйти из Нового лагеря? Неразумный поступок!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12");	//И ты решился выйти из своего Болотного лагеря? Как глупо с твоей стороны!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13");	//Что такое? О чем ты говоришь?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14");	//Так ты ничего не слышал о нападении на Новую шахту, да?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15");	//О чем ты...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16");	//Прости, но мы не можем позволить тебе разгуливать здесь. Ты знаешь слишком много!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17");	//Эй, я не хочу драться с тобой...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18");	//Об этом раньше нужно было думать!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19");	//Все, с меня хватит...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20");	//И правда, хватит! Убить его!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	B_ExchangeRoutine(GRD_232_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_229_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_216_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_217_Torwache,"FMTaken2");
	if((GETNEWGUY_STARTED == TRUE) && (OC_BANNED == FALSE))
	{
		B_LogEntry(CH1_RecruitDusty,"Теперь я не смогу вывести кого-либо из Старого лагеря.");
		Log_SetTopicStatus(CH1_RecruitDusty,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	B_SetPermAttitude(GRD_208_Cutter,ATT_HOSTILE);
	B_SetPermAttitude(GRD_232_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_229_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_216_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_217_Torwache,ATT_HOSTILE);
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,Info_Fletcher_DIE) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		B_LogEntry(CH4_Firemages,"Ворота в Старый лагерь закрыты и охраняются стражниками. Они нападают на любого, кто окажется слишком неосторожен, чтобы подойти к ним.");
	};
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
	if(C_NpcBelongsToOldCamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_None);
		hero.guild = GIL_None;
	};
};

