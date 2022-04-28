
instance STT_301_IAN_Exit(C_Info)
{
	npc = STT_301_Ian;
	nr = 999;
	condition = STT_301_IAN_Exit_Condition;
	information = STT_301_IAN_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_301_IAN_Exit_Condition()
{
	return 1;
};

func void STT_301_IAN_Exit_Info()
{
	AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01");	//Могу осмотреть шахту?
	AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02");	//Только не создавай нам лишних проблем.
	AI_StopProcessInfos(self);
};


instance STT_301_IAN_HI(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_HI_Condition;
	information = STT_301_IAN_HI_Info;
	important = 0;
	permanent = 0;
	description = "Ты Ян, главный человек в этой шахте?";
};


func int STT_301_IAN_HI_Condition()
{
	if(!Npc_KnowsInfo(hero,stt_301_ian_nest))
	{
		return TRUE;
	};
};

func void STT_301_IAN_HI_Info()
{
	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01");	//Ты Ян, главный человек в этой шахте?
	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02");	//Да, меня зовут Ян. Это моя шахта. Тебе лучше ничего здесь не трогать, и постарайся ничего не сломать.
};


instance STT_301_IAN_GOMEZ(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GOMEZ_Condition;
	information = STT_301_IAN_GOMEZ_Info;
	important = 0;
	permanent = 0;
	description = "Я думал, что эта шахта принадлежит Гомезу.";
};


func int STT_301_IAN_GOMEZ_Condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void STT_301_IAN_GOMEZ_Info()
{
	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01");	//Я думал, что эта шахта принадлежит Гомезу.
	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02");	//Конечно, эта шахта принадлежит Старому лагерю, но здесь, внизу, вся власть принадлежит мне и больше никому.
};


instance STT_301_IAN_ORE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_ORE_Condition;
	information = STT_301_IAN_ORE_Info;
	important = 0;
	permanent = 0;
	description = "Ты можешь рассказать мне о добыче руды?";
};


func int STT_301_IAN_ORE_Condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_gomez))
	{
		return TRUE;
	};
};

func void STT_301_IAN_ORE_Info()
{
	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01");	//Ты можешь рассказать мне о добыче руды?
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02");	//Рудокопы добывают здесь руду днем и ночью. Наша выработка составляет 220 мешков руды, 20 из них идет на переплавку.
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03");	//Из всей руды, которую мы поставляем королю, можно выковать не одну сотню клинков.
};


instance STT_301_IAN_MORE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MORE_Condition;
	information = STT_301_IAN_MORE_Info;
	important = 0;
	permanent = 0;
	description = "Я слышал, что это не простая руда... Ты можешь рассказать о ней?";
};


func int STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_ore);
};

func void STT_301_IAN_MORE_Info()
{
	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01");	//Я слышал, что это не простая руда, а магическая. Ты можешь рассказать мне о ней?
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02");	//Магическая руда обладает особыми свойствами. Оружие из нее никогда не ломается, а клинки выходят гораздо острее, чем из обычного железа.
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03");	//Армия солдат с таким оружием имеет серьезное преимущество в любой битве.
};


instance STT_301_IAN_MAGIC(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MAGIC_Condition;
	information = STT_301_IAN_MAGIC_Info;
	important = 0;
	permanent = 0;
	description = "А ты знаешь о руде еще что-нибудь?";
};


func int STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_more);
};

func void STT_301_IAN_MAGIC_Info()
{
	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01");	//А ты знаешь о руде еще что-нибудь?
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02");	//К сожалению, руда теряет магические свойства при переплавке. Только в плавильнях Нордмара знают правильный способ.
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03");	//Но даже в этом случае оружие из нашей руды превосходит обычное оружие по многим параметрам и наносит больший урон врагу.
};


instance STT_301_IAN_MINE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MINE_Condition;
	information = STT_301_IAN_MINE_Info;
	important = 0;
	permanent = 0;
	description = "Расскажи мне об этой шахте.";
};


func int STT_301_IAN_MINE_Condition()
{
	if((Kapitel < 3) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void STT_301_IAN_MINE_Info()
{
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01");	//Расскажи мне об этой шахте.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02");	//Если ты захочешь осмотреть шахту, тебе не следует далеко отходить от основного ствола. В дальних забоях обитает очень много ползунов.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03");	//И постарайся не отвлекать стражников. Большую часть времени они ничего не делают, но уж если поблизости окажется ползун, они смогут тебя защитить.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04");	//Хорошо, я это запомню.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05");	//Ладно, у меня еще много дел. Но помни, не мешай моим людям работать.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06");	//Я просто посмотрю шахту.
};


instance STT_301_IAN_WANTLIST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_WANTLIST_Condition;
	information = STT_301_IAN_WANTLIST_Info;
	important = 0;
	permanent = 0;
	description = "Мне нужно забрать список для лагеря.";
};


func int STT_301_IAN_WANTLIST_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && !Npc_KnowsInfo(hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};
};

func void STT_301_IAN_WANTLIST_Info()
{
	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01");	//Мне нужно забрать список для лагеря.
	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02");	//Так это каждый может сказать. Убирайся!
};


instance STT_301_IAN_GETLIST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GETLIST_Condition;
	information = STT_301_IAN_GETLIST_Info;
	important = 0;
	permanent = 0;
	description = "Диего прислал меня сюда. Я должен забрать список.";
};


func int STT_301_IAN_GETLIST_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && Npc_KnowsInfo(hero,Info_Diego_IanPassword) && !Npc_KnowsInfo(hero,stt_301_ian_steallist))
	{
		return TRUE;
	};
};

func void STT_301_IAN_GETLIST_Info()
{
	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//Диего прислал меня сюда. Я должен забрать список.
	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02");	//Понятно, вот тебе список. Они должны поторопиться с доставкой.
	b_printtrademsg1("Получен список.");
	B_LogEntry(CH1_BringList,"Ян без проблем передал мне список для Диего.");
	B_GiveInvItems(self,hero,TheList,1);
	Npc_RemoveInvItem(self,TheList);
};


instance STT_301_IAN_NEST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_NEST_Condition;
	information = STT_301_IAN_NEST_Info;
	important = 0;
	permanent = 0;
	description = "Где-то здесь должно быть логово ползунов.";
};


func int STT_301_IAN_NEST_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_RUNNING) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return 1;
	};
};

func void STT_301_IAN_NEST_Info()
{
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01");	//Где-то в этой шахте есть гнездо или логово ползунов.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02");	//Я думаю, в шахте очень много их гнезд.
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03");	//Слушай, мне нужно найти одно из них...
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04");	//У меня сейчас нет на это времени. У нас пресс сломался. Пару часов назад сломалась шестеренка. Вся работа стоит.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05");	//И я не знаю, где здесь можно найти новую.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06");	//Но если ты поможешь починить пресс. Я помогу тебе.
	B_LogEntry(CH2_MCEggs,"Ян не будет помогать мне искать логово ползунов. Сначала я должен найти ему новую шестеренку. Он сказал, что следует посмотреть в одной из заброшенных штолен. Где-то там должен стоять старый пресс.");
	Ian_gearwheel = LOG_RUNNING;
};


instance STT_301_IAN_GEAR_RUN(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GEAR_RUN_Condition;
	information = STT_301_IAN_GEAR_RUN_Info;
	important = 0;
	permanent = 0;
	description = "А где я могу найти эту самую шестеренку?";
};


func int STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt(PD_MISSION,"Ian_gearwheel:",Ian_gearwheel);
	if((Ian_gearwheel == LOG_RUNNING) && !Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};

func void STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01");	//А где я могу найти эту самую шестеренку?
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02");	//Понятия не имею. Я знаю столько же, сколько и ты.
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03");	//Правда, по-моему, в одной из штолен есть старый сломанный пресс.
};


instance STT_301_IAN_GEAR_SUC(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GEAR_SUC_Condition;
	information = STT_301_IAN_GEAR_SUC_Info;
	important = 0;
	permanent = 0;
	description = "Я нашел шестеренку.";
};


func int STT_301_IAN_GEAR_SUC_Condition()
{
	if(Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01) && (Ian_gearwheel == LOG_RUNNING))
	{
		return 1;
	};
};

func void STT_301_IAN_GEAR_SUC_Info()
{
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP(XP_BringGearWheel);
	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01");	//Я нашел шестеренку.
	b_printtrademsg1("Отдана шестеренка.");
	Npc_RemoveInvItem(hero,ItMi_Stuff_Gearwheel_01);
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02");	//О! Отличная работа! Думаю, она как раз подойдет. Что ж, вернемся к твоей проблеме. Ты искал логово ползунов, да? Хм...
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03");	//Сходи к Асгхану, он откроет тебе ворота. Возможно, то, что ты ищешь, находится именно там.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04");	//Скажи ему: 'Все будет в порядке'. Так он узнает, что я дал свое согласие.
	B_LogEntry(CH2_MCEggs,"Я принес Яну шестеренку, снятую со старого рудного пресса. Он сказал, что когда я буду говорить с Асгханом, я должен сообщить ему слова 'Все будет в порядке'. Тогда он откроет ворота в заброшенную часть шахты.");
};


instance STT_301_IAN_GOTOASGHAN(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GOTOASGHAN_Condition;
	information = STT_301_IAN_GOTOASGHAN_Info;
	important = 0;
	permanent = 0;
	description = "Я все еще не нашел логово ползунов!";
};


func int STT_301_IAN_GOTOASGHAN_Condition()
{
	if((Ian_gearwheel == LOG_SUCCESS) && !Npc_KnowsInfo(hero,Grd_263_Asghan_NEST))
	{
		return 1;
	};
};

func void STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01");	//Я все еще не нашел логово ползунов!
	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02");	//Я же сказал, пойди к Асгхану. Он возглавляет стражников. Ты найдешь его на нижнем горизонте.
	B_LogEntry(CH2_MCEggs,"Если я хочу найти логово ползунов, то должен поговорить с Асгханом.");
};


instance STT_301_IAN_AFTERALL(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_AFTERALL_Condition;
	information = STT_301_IAN_AFTERALL_Info;
	important = 0;
	permanent = 0;
	description = "Я нашел логово ползунов!";
};


func int STT_301_IAN_AFTERALL_Condition()
{
	if(Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};

func void STT_301_IAN_AFTERALL_Info()
{
	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01");	//Я нашел логово ползунов!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02");	//В шахте снова будет тихо и спокойно!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03");	//Ладно, не обижайся. Ты хорошо поработал!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04");	//Вот, возьми себе этот ящик пива. Это твоя награда.
	b_printtrademsg1("Получено 5 бутылок крепкого пива.");
	CreateInvItems(self,ItFo_OM_Beer_01,5);
	B_GiveInvItems(self,hero,ItFo_OM_Beer_01,5);
};


instance STT_301_IAN_NOTENOUGH(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_NOTENOUGH_Condition;
	information = STT_301_IAN_NOTENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "Я нашел логово ползунов. А еще в нем были вот эти яйца.";
};


func int STT_301_IAN_NOTENOUGH_Condition()
{
	if((Npc_HasItems(hero,ItAt_Crawlerqueen) > 1) && (Npc_HasItems(hero,ItAt_Crawlerqueen) < 3))
	{
		return TRUE;
	};
};

func void STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01");	//Я нашел логово ползунов. А еще в нем были вот эти яйца.
	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02");	//Что? Ты нашел так мало яиц? Ну, что ж, ты хотя бы доказал, что умеешь драться.
};


instance STT_301_IAN_STEALLIST(C_Info)
{
	npc = STT_301_Ian;
	nr = 990;
	condition = stt_301_ian_steallist_condition;
	information = stt_301_ian_steallist_info;
	important = 0;
	permanent = 0;
	description = "(украсть список)";
};


func int stt_301_ian_steallist_condition()
{
	if(!Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack) && !Npc_KnowsInfo(hero,stt_301_ian_getlist) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Success) && Npc_KnowsInfo(hero,org_801_lares_newlist) && Npc_HasItems(self,TheList) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1))
	{
		return TRUE;
	};
};

func void stt_301_ian_steallist_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11");	//Рудная гора... э... она уже очень высокая!
	AI_Output(self,other,"DIA_ARTO_PERM_13_01");	//Точно.
	AI_TurnAway(self,other);
	AI_PlayAni(other,"T_STAND_2_IGET");
	AI_PlayAni(other,"T_IGET_2_STAND");
	AI_PlayAni(self,"T_SEARCH");
	PrintScreen("Украден список.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,TheList);
	Npc_RemoveInvItem(self,TheList);
	AI_WhirlAround(self,other);
	AI_Output(self,other,"SVM_13_YouWannaFoolMe");	//Обмануть меня захотел? Только попробуй!
	B_LogEntry(THELISTFORNC,"Ян развесил уши и профукал свой список. Теперь нужно отнести мой трофей в Новый лагерь.");
	AI_StopProcessInfos(self);
};

//Тебя прислал Диего? Хмм..
//Или тебя прислал не Диего? Хмм..
//Допустим тебя прислал Диего, но я этого не знаю.
//Этот список очень важен для нас. Странно, что Диего так халатно отнесся к этому делу, если конечно это он тебя прислал. Хмм.. (недовольно)
//Сходи на нижние ярусы, у плавильщика есть проблема, я не могу тратить силы своих людей на это, но если ты решишь его вопрос..
//То я охотнее поверю, что тебя прислал Диего. Хмм.. (цокает)
