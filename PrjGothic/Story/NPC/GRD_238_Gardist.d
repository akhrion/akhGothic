
instance GRD_238_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 15;
	voice = 8;
	id = 238;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	senses_range = 2000;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",14,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,ItMw_1H_Sword_02);
	CreateInvItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoCheese);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_238;
	fight_tactic = FAI_HUMAN_Strong;
};


func void Rtn_start_238()
{
	TA_Guard(0,0,6,0,"SPAWN_PATH_GUARD1");
	TA_Guard(6,0,24,0,"SPAWN_PATH_GUARD1");
};


instance INFO_GRD238_DIE(C_Info)
{
	npc = GRD_238_Gardist;
	condition = info_grd238_die_condition;
	information = info_grd238_die_info;
	permanent = 0;
	important = 1;
};


func int info_grd238_die_condition()
{
	if((Kapitel >= 4) && (OC_BANNED == FALSE))
	{
		return TRUE;
	};
	return false;
};

func void info_grd238_die_info()
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
			B_LogEntry(CH4_BannedFromOC,"Стражники у земель орков повели себя точно так же, как и Флетчер. Они что-то знают о том, что я ищу юниторы для Нового лагеря.");
		}
		else if(!Npc_KnowsInfo(hero,Info_Jackal_PAYDAY) && !Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,Info_Fletcher_DIE))
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Стражник у земель орков назвал меня предателем и перебежчиком. Без дальнейших разговоров он и его напарник напали на меня!");
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
	if(GETNEWGUY_STARTED == TRUE)
	{
		B_LogEntry(CH1_RecruitDusty,"Теперь я не смогу вывести кого-либо из Старого лагеря.");
		Log_SetTopicStatus(CH1_RecruitDusty,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,Info_Fletcher_DIE) && !Npc_KnowsInfo(hero,info_cutter_die))
	{
		B_LogEntry(CH4_Firemages,"Стражники Старого лагеря нападают на любого, кто окажется слишком неосторожен, чтобы подойти к ним.");
	};
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
	if(C_NpcBelongsToOldCamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_None);
		hero.guild = GIL_None;
	};
	B_ExchangeRoutine(GRD_208_Cutter,"FMTaken2");
	B_ExchangeRoutine(GRD_232_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_229_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_216_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_217_Torwache,"FMTaken2");
	B_SetPermAttitude(GRD_208_Cutter,ATT_HOSTILE);
	B_SetPermAttitude(GRD_232_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_229_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_216_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_217_Torwache,ATT_HOSTILE);
};

instance INFO_GRD238_OrcDogsNotHelp(C_Info)
{
	npc = GRD_238_Gardist;
	nr = 1;
	condition = INFO_GRD238_OrcDogsNotHelp_condition;
	information = INFO_GRD238_OrcDogsNotHelp_info;
	permanent = 0;
	important = 1;
};

func int INFO_GRD238_OrcDogsNotHelp_condition()
{
	if(
		Josef_IsOrcDogsDead()
	&&	Josef_bOrcDogsFightHappen
	&&	!Josef_bSCHelpWithOrcDogs
	)
	{
		return true;
	};
	return false;
};
func void INFO_GRD238_OrcDogsNotHelp_info()
{
	if(hero.attribute[ATR_STRENGTH] > 90)
	{
		AI_Output(self,hero,"INFO_GRD238_OrcDogsNotHelp_NULL_0"); //Даа парень.. эта гора мышц пропадает впустую.
	}
	else if(hero.attribute[ATR_STRENGTH] > 60)
	{
		AI_Output(self,hero,"INFO_GRD238_OrcDogsNotHelp_NULL_1"); //Пхах.. ну ты и падлец! Выглядишь сложенно, а стоишь в стороне!
	}
	else if(Josef_iOrcDogs_WaitPlayer_Counter > 10)
	{
		AI_Output(self,hero,"INFO_GRD238_OrcDogsNotHelp_NULL_2"); //Ну как, насмотрелся? Ты конечно тип.
	};
	AI_Output(self,hero,"INFO_GRD238_OrcDogsNotHelp_NULL_3"); //Хоть-бы на помощь позвал.
	if(C_Npc_IsBelongToCamp(hero,OLDCAMP))
	{
		if(hero.guild == GIL_VLK)
		{
			AI_Output(self,hero,"INFO_GRD238_OrcDogsNotHelp_NULL_4"); //Похоже, что работа на шахте, это твое. Инносом данный тебе талант..
			AI_Output(self,hero,"INFO_GRD238_OrcDogsNotHelp_NULL_5"); //Долби себе жилу и ни о чем не думай.
		}
		else
		{
			AI_Output(self,hero,"INFO_GRD238_OrcDogsNotHelp_NULL_6"); //Зачем только Гомез тебя принял. Тьфу.
			AI_Output(self,hero,"INFO_GRD238_OrcDogsNotHelp_NULL_7"); //Не то что-бы он.. а! ладно (отмахивается рукой и отворачивается)
		};
	};
	AI_StopProcessInfos(self);
};

instance INFO_GRD238_OrcDogsHelp(C_Info)
{
	npc = GRD_238_Gardist;
	nr = 1;
	condition = INFO_GRD238_OrcDogsHelp_condition;
	information = INFO_GRD238_OrcDogsHelp_info;
	permanent = 0;
	important = 1;
};

func int INFO_GRD238_OrcDogsHelp_condition()
{
	if(
		Josef_IsOrcDogsDead()
	&&	Josef_bSCHelpWithOrcDogs
	)
	{
		return true;
	};
	return false;
};
func void INFO_GRD238_OrcDogsHelp_info()
{
	AI_Output(self,hero,"INFO_GRD238_OrcDogsHelp_NULL_0"); //Даа.. ух.. Молодые варги - не такие уж и сильные, но живучие.
	AI_Output(self,hero,"INFO_GRD238_OrcDogsHelp_NULL_1"); //Спасибо что помог!
	AI_StopProcessInfos(self);
};

instance INFO_GRD238_NAME(C_Info)
{
	npc = GRD_238_Gardist;
	nr = 1;
	condition = info_grd238_name_condition;
	information = info_grd238_name_info;
	permanent = 0;
	description = "Как хоть тебя зовут?";
};

func int info_grd238_name_condition()
{
	if(Josef_bSCHelpWithOrcDogs)
	{
		return true;
	};
	return false;
};

func void info_grd238_name_info()
{
	AI_Output(hero,self,"Info_GRD238_NAME_NULL_0");  //Как хоть тебя зовут?
	AI_Output(self,hero,"Info_GRD238_NAME_NULL_1");  //Меня зовут Йосиф
	self.name[0] = "Йосиф";
	AI_StopProcessInfos(self);
};

instance INFO_GRD238_EXIT(C_Info)
{
	npc = GRD_238_Gardist;
	nr = 999;
	condition = info_grd238_exit_condition;
	information = info_grd238_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd238_exit_condition()
{
	return 1;
};

func void info_grd238_exit_info()
{
	AI_StopProcessInfos(self);
};
//akh working
//AI_Output(self,hero,""); //Какой-же ты криворукий!
//AI_Output(self,hero,""); //Ты больше помог этим псам, чем нам. И как только Гомез принял тебя..
//AI_Output(self,hero,""); //Пшел вон, криворукая скотина! (Тьфу)
//AI_Output(self,hero,""); //И кстати да, ты можешь прямо сейчас идти в земли орков - мы не будем тебя останавливать.
