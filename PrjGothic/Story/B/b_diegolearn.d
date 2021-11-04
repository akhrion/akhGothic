
func void b_diegolearn()
{
	Info_ClearChoices(Info_Diego_Teach);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK,Info_Diego_Teach_BACK);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,(5 * LPCOST_ATTRIBUTE_STRENGTH),OTHERCAMPLEARNPAY * 5),Info_Diego_Teach_STR_5);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),Info_Diego_Teach_STR_1);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,(5 * LPCOST_ATTRIBUTE_DEXTERITY),OTHERCAMPLEARNPAY * 5),Info_Diego_Teach_DEX_5);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),Info_Diego_Teach_DEX_1);
	}
	else if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel > 3))
	{
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	}
	else
	{
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,(5 * LPCOST_ATTRIBUTE_STRENGTH),OTHERCAMPLEARNPAY * 5),Info_Diego_Teach_STR_5);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),Info_Diego_Teach_STR_1);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,(5 * LPCOST_ATTRIBUTE_DEXTERITY),OTHERCAMPLEARNPAY * 5),Info_Diego_Teach_DEX_5);
		Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),Info_Diego_Teach_DEX_1);
	};
};


var int Diego_After_Gamestart;

instance Info_Diego_Gamestart(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_Gamestart_Condition;
	information = Info_Diego_Gamestart_Info;
	permanent = 0;
	important = 1;
};


func int Info_Diego_Gamestart_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void Info_Diego_Gamestart_Info()
{
	STR_ESSENZ_VAL = 3;
	STR_EXTRAKT_VAL = 5;
	STR_ELIXIER_VAL = 8;
	DEX_ESSENZ_VAL = 3;
	DEX_EXTRAKT_VAL = 5;
	DEX_ELIXIER_VAL = 8;
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00");	//Меня зовут Диего.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01");	//А меня...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02");	//Я не хочу знать, кто ты такой. Ты только что появился здесь, а я присматриваю за новичками. Для начала хватит и этого.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03");	//Если ты хочешь остаться в живых в этом гиблом месте, тебе придется поговорить со мной. Впрочем, умереть ты можешь в любое время, и кто я такой, чтобы помешать тебе? Ну, так что ты думаешь?
	Npc_ExchangeRoutine(CS_Eskorte1,"flee");
	Npc_ExchangeRoutine(CS_Eskorte2,"flee");
	B_Kapitelwechsel(1);
};


instance Info_Diego_EXIT_Gamestart(C_Info)
{
	npc = PC_Thief;
	nr = 999;
	condition = Info_Diego_EXIT_Gamestart_Condition;
	information = Info_Diego_EXIT_Gamestart_Info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

func void Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00");	//Спасибо за помощь.
	if(!Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01");	//Ну, ты сделал свой выбор. Рад был познакомиться.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02");	//Встретимся в Старом лагере.
	};
	AI_StopProcessInfos(self);
	if(Kapitel < 2)
	{
		Npc_ExchangeRoutine(self,"Start");
		Diego_After_Gamestart = TRUE;
	};
};


instance Info_Diego_EXIT_Later(C_Info)
{
	npc = PC_Thief;
	nr = 999;
	condition = Info_Diego_EXIT_Later_Condition;
	information = Info_Diego_EXIT_Later_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Diego_EXIT_Later_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_EXIT_Gamestart))
	{
		return 1;
	};
};

func void Info_Diego_EXIT_Later_Info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"Info_Diego_EXIT_11_01");	//Пойдем.
	}
	else
	{
		AI_Output(hero,self,"Info_Diego_EXIT_15_00");	//До встречи!
	};
	AI_StopProcessInfos(self);
};


instance Info_Diego_Brief(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Brief_Condition;
	information = Info_Diego_Brief_Info;
	permanent = 0;
	description = "У меня есть послание для Верховного Мага Круга Огня.";
};


func int Info_Diego_Brief_Condition()
{
	if((Kapitel < 3) && ((Npc_HasItems(other,ItWr_Fire_Letter_01) >= 1) || (Npc_HasItems(other,ItWr_Fire_Letter_02) >= 1)))
	{
		return TRUE;
	};
};

func void Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00");	//У меня есть послание для Верховного Мага Круга Огня.
	if(Npc_GetDistToWP(hero,"OCR_OUTSIDE_HUT_1") < 1500)
	{
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
	};
	AI_Output(self,hero,"Info_Diego_Brief_11_01");	//Да ну?!
	AI_Output(hero,self,"Info_Diego_Brief_15_02");	//Мне дал его какой-то маг, перед тем как меня сбросили сюда.
	AI_Output(self,hero,"Info_Diego_Brief_11_03");	//Твое счастье, что я последнее время не в ладах с магами. Любой другой мигом перерезал бы тебе глотку за это письмо.
	AI_Output(self,hero,"Info_Diego_Brief_11_04");	//Маги хорошо платят гонцам, а здесь большинство людей не имеет за душой и гроша.
	AI_Output(self,hero,"Info_Diego_Brief_11_05");	//На твоем месте я бы держал рот на замке до тех пор, пока не встретил кого-нибудь из магов. Правда, тебе на это не стоит рассчитывать.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Почему?
	AI_Output(self,hero,"Info_Diego_Brief_11_07");	//Маги живут в замке Старого лагеря, но только люди Гомеза могут входить туда.
	B_LogEntry(KDFLETTER,"Диего рассказал, что эти маги живут в центре Старого лагеря, но к ним довольно сложно попасть.");
};


instance Info_Diego_WarumGeholfen(C_Info)
{
	npc = PC_Thief;
	nr = 5;
	condition = Info_Diego_WarumGeholfen_Condition;
	information = Info_Diego_WarumGeholfen_Info;
	permanent = 0;
	description = "Почему ты мне помогаешь?";
};


func int Info_Diego_WarumGeholfen_Condition()
{
	if(!Diego_After_Gamestart && (Kapitel < 2))
	{
		return 1;
	};
};

func void Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00");	//Почему ты мне помогаешь?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01");	//Потому что тебе нужна была помощь. Буллит не стал бы долго возиться с тобой. Ему нравится убивать таких, как ты.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02");	//А я не хотел просто стоять в стороне и смотреть. Я же не просто так пришел сюда. У меня есть для тебя одно предложение.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03");	//Предложение?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04");	//Да. Я думаю, после знакомства с шайкой Буллита ты понял, что тебе нужна защита.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05");	//Каждый, кто попадает сюда, должен сделать свой выбор. В колонии есть три лагеря, и ты должен будешь присоединиться к одному из них.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06");	//Я здесь для того, чтобы показать новичкам, что Старый лагерь - лучшее место для них.
};


instance Info_Diego_Bullit(C_Info)
{
	npc = PC_Thief;
	nr = 5;
	condition = Info_Diego_Bullit_Condition;
	information = Info_Diego_Bullit_Info;
	permanent = 0;
	description = "А что сейчас делает этот Буллит?";
};


func int Info_Diego_Bullit_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_WarumGeholfen) && !Diego_After_Gamestart)
	{
		return 1;
	};
};

func void Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02");	//А что сейчас делает этот Буллит?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03");	//Он с остальными переносит в лагерь припасы из внешнего мира. Ты найдешь его там.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04");	//Но если ты хочешь отплатить ему, будь осторожен. Буллит опытный боец.
};


instance Info_Diego_Kolonie(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_Kolonie_Condition;
	information = Info_Diego_Kolonie_Info;
	permanent = 0;
	description = "Расскажи мне об этом месте.";
};


func int Info_Diego_Kolonie_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00");	//Расскажи мне об этом месте.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01");	//Все, что находится внутри Барьера, мы называем колонией. Ты уже знаешь, что мы здесь добываем руду для короля.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02");	//Ну, по крайней мере, в Старом лагере...
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03");	//В колонии есть три лагеря. Старый лагерь самый большой. Он был первым.
};


instance Info_Diego_Barriere(C_Info)
{
	npc = PC_Thief;
	nr = 3;
	condition = Info_Diego_Barriere_Condition;
	information = Info_Diego_Barriere_Info;
	permanent = 0;
	description = "Расскажи мне о Барьере.";
};


func int Info_Diego_Barriere_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (Diego_After_Gamestart == TRUE))
	{
		return 1;
	};
};

func void Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00");	//Расскажи мне о Барьере.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01");	//Я мало что могу о нем рассказать. Мы знаем только, что он непроницаем.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02");	//Что случится, если попробую выйти за Барьер?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03");	//Последний, кто попробовал - уже мертв. Этот чертов Барьер легко впускает тебя внутрь, но обратного хода нет.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04");	//Если есть хоть один способ выбраться, я его найду.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05");	//Уже хочешь выбраться отсюда? Ты же только что попал сюда!
};


instance Info_Diego_OtherCamps(C_Info)
{
	npc = PC_Thief;
	nr = 2;
	condition = Info_Diego_OtherCamps_Condition;
	information = Info_Diego_OtherCamps_Info;
	permanent = 0;
	description = "А что с двумя другими лагерями?";
};


func int Info_Diego_OtherCamps_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (Diego_After_Gamestart == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00");	//А что с двумя другими лагерями?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01");	//Два другие лагеря отделились от нас, чтобы найти способ сбежать из колонии.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02");	//Новый лагерь находится на западе. Тамошние маги думают, что смогут подорвать Барьер, как только наберут для этого достаточно руды.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03");	//Есть еще секта придурков на востоке. Их лагерь стоит посреди болота, а они сидят и умоляют своего идола освободить их.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04");	//Он пока что-то не отвечает.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05");	//На твоем месте я бы не стал тратить время на этих фанатиков.
};


instance Info_Diego_OldCamp(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_OldCamp_Condition;
	information = Info_Diego_OldCamp_Info;
	permanent = 0;
	description = "Расскажи мне что-нибудь о Старом лагере.";
};


func int Info_Diego_OldCamp_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (Diego_After_Gamestart == TRUE))
	{
		return 1;
	};
};

func void Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00");	//Расскажи мне что-нибудь о Старом лагере.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01");	//Он самый крупный и мощный из трех лагерей. Гомез и его люди контролируют лагерь, а вместе с ним и обмен рудой.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02");	//Раз в месяц король присылает нам все, что мы закажем. Старик у нас в руках, ясно?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03");	//Он присылает нам вино, хлеб, мясо, оружие... все.
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,hero,"Info_Diego_OldCamp_11_04");	//Ты тоже можешь иметь свой кусок. Если присоединишься к Гомезу.
	};
};


instance Info_Diego_WhosGomez(C_Info)
{
	npc = PC_Thief;
	nr = 3;
	condition = Info_Diego_WhosGomez_Condition;
	information = Info_Diego_WhosGomez_Info;
	permanent = 0;
	description = "Кто такой Гомез?";
};


func int Info_Diego_WhosGomez_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OldCamp) || Npc_KnowsInfo(hero,Info_Diego_Brief))
	{
		return 1;
	};
};

func void Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00");	//Кто такой Гомез?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01");	//Гомез самый влиятельный из Баронов. Он хозяин в Старом лагере, как сильнейший человек в колонии.
};


instance Info_Diego_JoinOldcamp(C_Info)
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_JoinOldcamp_Condition;
	information = Info_Diego_JoinOldcamp_Info;
	permanent = 0;
	description = "А если я захочу стать одним из его людей, что мне нужно сделать?";
};


func int Info_Diego_JoinOldcamp_Condition()
{
	if(
		(
			Npc_KnowsInfo(hero,Info_Diego_OldCamp) ||
			Npc_KnowsInfo(hero,Info_Diego_Brief)
		) &&
		!C_NpcBelongsToOldCamp(hero) &&
		(
			(Npc_GetTrueGuild(hero) == GIL_None) &&
			(Kapitel < 2)
		)
	)
	{
		return TRUE;
	};
};

func void Info_Diego_JoinOldcamp_Info()
{
	var C_Npc Thorus;
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00");	//А если я захочу стать одним из его людей, что мне нужно сделать?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01");	//У ворот замка ты найдешь человека по имени Торус. Скажи ему, что тебя прислал Диего.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
	Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
	B_LogEntry(CH1_JoinOC,"Если я хочу, чтобы меня взяли в Старый лагерь, я должен поговорить с Торусом.");
};


instance Info_Diego_WayToOldcamp(C_Info)
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_WayToOldcamp_Condition;
	information = Info_Diego_WayToOldcamp_Info;
	permanent = 0;
	description = "Как я смогу найти Старый лагерь?";
};


func int Info_Diego_WayToOldcamp_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && !Diego_After_Gamestart)
	{
		return 1;
	};
};

func void Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00");	//Как я смогу найти Старый лагерь?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01");	//Иди по этой дороге. Старый лагерь - ближайшее безопасное место на твоем пути.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02");	//Между лагерями шляются толпы диких тварей. Разгуливать там безоружным - самоубийство.
};


instance Info_Diego_WoWaffe(C_Info)
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_WoWaffe_Condition;
	information = Info_Diego_WoWaffe_Info;
	permanent = 0;
	description = "Где я могу взять оружие?";
};


func int Info_Diego_WoWaffe_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && !Diego_After_Gamestart)
	{
		return 1;
	};
};

func void Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00");	//Где я могу взять оружие?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01");	//Когда дойдешь до старой шахты, поищи вокруг. Я уверен, ты найдешь что-нибудь сносное.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02");	//Ее легко найти в нескольких метрах от выхода из ущелья.
};


instance Info_Diego_ThorusSays(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_ThorusSays_Condition;
	information = Info_Diego_ThorusSays_Info;
	permanent = 0;
	description = "Я говорил с Торусом.";
};


func int Info_Diego_ThorusSays_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe))
	{
		return 1;
	};
};

func void Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00");	//Я говорил с Торусом.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01");	//И что он сказал?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02");	//Он может принять меня в лагерь, если ты дашь на это свое согласие.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03");	//Вижу, у меня появилась еще одна забота.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04");	//Мы начнем прямо сейчас?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05");	//Первым делом тебе нужно узнать несколько вещей.
};


instance Info_Diego_Rules(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Rules_Condition;
	information = Info_Diego_Rules_Info;
	permanent = 0;
	description = "Что я должен знать, чтобы меня приняли в Старый лагерь?";
};


func int Info_Diego_Rules_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_ThorusSays) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00");	//Что я должен знать, чтобы меня приняли в Старый лагерь?
	AI_Output(self,hero,"Info_Diego_Rules_11_01");	//Если хочешь вступить в лагерь, ты должен заработать авторитет.
	AI_Output(self,hero,"Info_Diego_Rules_11_02");	//Во Внешнем Кольце есть несколько влиятельных парней, в основном Призраки. Если окажешь им пару услуг, считай, полдела сделано.
	AI_Output(self,hero,"Info_Diego_Rules_11_03");	//Потом ты должен будешь пройти тест на преданность.
	AI_Output(self,hero,"Info_Diego_Rules_11_04");	//Кроме того, каждый новичок должен обучиться нескольким способностям. Чем больше ты умеешь, тем больше от тебя пользы для лагеря.
	Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
	B_LogEntry(CH1_JoinOC,"Чтобы меня взяли в Старый лагерь, я должен произвести впечатление на нескольких людей из внешнего круга и пройти испытание на преданность, которое предлагает Диего.");
};


instance Info_Diego_Celebs(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Celebs_Condition;
	information = Info_Diego_Celebs_Info;
	permanent = 0;
	description = "Где найти этих влиятельных людей?";
};


func int Info_Diego_Celebs_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

func void Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00");	//Где найти этих влиятельных людей?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01");	//Так, ну, один из них перед тобой. Потом еще Торус. С ним ты уже знаком.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02");	//А остальные... Их ты найдешь сам. Если ты даже на это не способен, то тебе тут нечего делать.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03");	//Погуляй по Внешнему Кольцу, поболтай с людьми, и ты поймешь, кто есть кто.
};


instance Info_Diego_Teachers(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Teachers_Condition;
	information = Info_Diego_Teachers_Info;
	permanent = 0;
	description = "Кто здесь может научить меня чему-нибудь?";
};


func int Info_Diego_Teachers_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

func void Info_Diego_Teachers_Info()
{
	AI_Output(hero,self,"Info_Diego_Teachers_15_00");	//Кто здесь может научить меня чему-нибудь?
	AI_Output(self,hero,"Info_Diego_Teachers_11_01");	//Начни с Фингерса. Он самый опытный среди нас.
	AI_Output(self,hero,"Info_Diego_Teachers_11_02");	//И, если у тебя есть голова на плечах, ты легко найдешь себе еще учителей.
	AI_Output(hero,self,"Info_Diego_Teachers_15_03");	//Где я найду Фингерса?
	AI_Output(self,hero,"Info_Diego_Teachers_11_04");	//Его хижину не сразу заметишь. Она прямо под стеной замка по дороге отсюда к арене.
	AI_Output(self,hero,"Info_Diego_Teachers_11_05");	//У ворот замка поверни налево и спускайся вниз в сторону арены.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Фингерс может научить меня воровать и вскрывать замки. Он живет недалеко от арены, у стен замка.");
};


var int Diego_Merke_STR;
var int Diego_Merke_DEX;

instance INFO_DIEGO_TEACH_PRE(C_Info)
{
	npc = PC_Thief;
	nr = 100;
	condition = info_diego_teach_pre_condition;
	information = info_diego_teach_pre_info;
	permanent = 0;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int info_diego_teach_pre_condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		return 1;
	};
};

func void info_diego_teach_pre_info()
{
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,hero,"Info_Diego_Teach_11_01");	//Да. Я могу научить тебя как повысить силу и ловкость.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Диего может помочь стать более сильным и ловким.");
};


instance Info_Diego_Teach(C_Info)
{
	npc = PC_Thief;
	nr = 100;
	condition = Info_Diego_Teach_Condition;
	information = Info_Diego_Teach_Info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int Info_Diego_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,info_diego_teach_pre))
	{
		return 1;
	};
};

func void Info_Diego_Teach_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Я хочу улучшить свои навыки.
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	b_diegolearn();
};

func void Info_Diego_Teach_BACK()
{
	if(Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00");	//Теперь ты стал сильнее.
	};
	if(Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01");	//Твои навыки стрельбы из лука и арбалета стали лучше.
	};
	if((hero.attribute[ATR_STRENGTH] < 100) || (hero.attribute[ATR_DEXTERITY] < 100))
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02");	//Заходи еще, тебе многому нужно научиться!
	};
	Info_ClearChoices(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || ((Kapitel > 3) && (DIFF_HARD == FALSE)))
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
		AI_Output(self,other,"SVM_11_Ooh");	//Ох! Нехорошо!
	};
	b_diegolearn();
};

func void Info_Diego_Teach_STR_5()
{
	if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || ((Kapitel > 3) && (DIFF_HARD == FALSE)))
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
		AI_Output(self,other,"SVM_11_Ooh");	//Ох! Нехорошо!
	};
	b_diegolearn();
};

func void Info_Diego_Teach_DEX_1()
{
	if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel > 3))
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
		AI_Output(self,other,"SVM_11_Ooh");	//Ох! Нехорошо!
	};
	b_diegolearn();
};

func void Info_Diego_Teach_DEX_5()
{
	if((hero.guild == GIL_STT) || (hero.guild == GIL_GRD) || (hero.guild == GIL_KDF) || (Kapitel > 3))
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
		AI_Output(self,other,"SVM_11_Ooh");	//Ох! Нехорошо!
	};
	b_diegolearn();
};


instance Info_Diego_BringList_Offer(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_BringList_Offer_Condition;
	information = Info_Diego_BringList_Offer_Info;
	permanent = 0;
	description = "Какой тест я должен пройти?";
};


func int Info_Diego_BringList_Offer_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Rules) && ((hero.guild == GIL_None) || (hero.guild == GIL_STT) || (hero.guild == GIL_GRD)) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_Diego_BringList_Offer_Info()
{
	var C_Npc Ian;
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_00");	//Какой тест я должен пройти?
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_01");	//Ты отправишься в Старую шахту. Там встретишь одного парня, его зовут Ян. Он даст тебе список.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_02");	//Эта бумага важна для нас. Там список припасов, которые нужны ребятам из шахты для нормальной работы.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_03");	//Они получат все это с ближайшей поставкой.
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_04");	//Без проблем!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_05");	//Да нет, проблема все же есть. Новый лагерь ни в коем случае не должен получить этот список!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_06");	//Я уже сказал, что это важно. Если у тебя все получится, ты сделаешь большой шаг в своей карьере.
	Diego_BringList = LOG_RUNNING;
	Log_CreateTopic(CH1_BringList,LOG_MISSION);
	Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
	B_LogEntry(CH1_BringList,"Диего послал меня в Старую шахту. Там я должен найти человека по имени Ян и взять у него список припасов. Этот список не должен попасть в руки воров из Нового лагеря.");
	Ian = Hlp_GetNpc(STT_301_Ian);
	CreateInvItem(STT_301_Ian,TheList);
};


instance Info_Diego_IanPassword(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_IanPassword_Condition;
	information = Info_Diego_IanPassword_Info;
	permanent = 0;
	description = "Как может Ян передать мне такую важную бумагу?..";
};


func int Info_Diego_IanPassword_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer) && (Diego_BringList == LOG_RUNNING))
	{
		return 1;
	};
};

func void Info_Diego_IanPassword_Info()
{
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_01");	//Как может Ян передать мне такую важную бумагу? Он же меня не знает.
	AI_Output(self,hero,"Info_Diego_IanPassword_Info_11_02");	//Не бойся, даст, когда ты скажешь, что ты от Диего.
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_03");	//Я ему так и скажу.
	B_LogEntry(CH1_BringList,"Ян отдаст мне список, если я скажу, что меня прислал Диего.");
};


instance Info_Diego_MapToOldMine(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_MapToOldMine_Condition;
	information = Info_Diego_MapToOldMine_Info;
	permanent = 0;
	description = "Где находится Старая шахта?";
};


func int Info_Diego_MapToOldMine_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer) && (Diego_BringList == LOG_RUNNING))
	{
		return 1;
	};
};

func void Info_Diego_MapToOldMine_Info()
{
	AI_Output(hero,self,"Info_Diego_MapToOldMine_Info_15_00");	//Где находится Старая шахта?
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_01");	//Подойди к Грехему. Он картограф. Скажи, что ты от меня. Он даст тебе карту, и по ней ты найдешь путь к шахте.
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_02");	//Он живет слева от северных ворот.
	B_LogEntry(CH1_BringList,"Грехем даст мне карту. Я смогу найти его возле северных ворот.");
};


instance Info_Diego_BringList_Success(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_BringList_Success_Condition;
	information = Info_Diego_BringList_Success_Info;
	permanent = 0;
	description = "Ян передал мне список.";
};


func int Info_Diego_BringList_Success_Condition()
{
	if(((Diego_BringList == LOG_RUNNING) || Npc_KnowsInfo(hero,ORG_801_Lares_BringList)) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)) && !Npc_KnowsInfo(hero,Info_Diego_OCWARN) && !Npc_KnowsInfo(hero,Info_Milten_OCWARN))
	{
		return 1;
	};
};

func void Info_Diego_BringList_Success_Info()
{
	b_printtrademsg1("Отдан список.");
	AI_Output(hero,self,"Info_Diego_BringList_Success_15_00");	//Ян передал мне список.
	if(Npc_HasItems(hero,TheList) && Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		B_GiveInvItems(hero,self,TheList,1);
		B_LogEntry(CH1_BringList,"Диего остался доволен моей работой. Я передал ему список Яна.");
		Diego_BringList = LOG_SUCCESS;
		B_GiveXP(XP_DiegoBringlist);
		Log_SetTopicStatus(CH1_BringList,LOG_SUCCESS);
	}
	else if(Npc_HasItems(hero,TheListNC))
	{
		B_GiveInvItems(hero,self,TheListNC,1);
		b_printtrademsg1("Отдан дополненный список.");
		if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
		{
			B_LogEntry(CH1_BringList,"Диего остался доволен моей работой. Кажется, он не заметил, что Ларс подделал список. Или все же заметил?");
			Diego_BringList = LOG_SUCCESS;
			B_GiveXP(XP_DiegoBringlist);
		}
		else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
		{
			B_LogEntry(THELISTFORNC,"Диего остался доволен моей работой. Кажется, он не заметил, что Ларс подделал список. Или все же заметил?");
			Diego_BringList = LOG_SUCCESS;
			B_GiveXP(XP_DiegoBringlist);
		};
	};
	B_UseFakeScroll();
	AI_Output(self,hero,"Info_Diego_BringList_Success_11_01");	//Отлично сработано! Это будет говорить в твою пользу!
	Points_OC = Points_OC + 5;
};


var int Diego_GomezAudience;

instance Info_Diego_JoinAnalyze(C_Info)
{
	npc = PC_Thief;
	nr = 800;
	condition = Info_Diego_JoinAnalyze_Condition;
	information = Info_Diego_JoinAnalyze_Info;
	permanent = 1;
	description = "Что думают обо мне в лагере?";
};


func int Info_Diego_JoinAnalyze_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Rules) && (Npc_GetTrueGuild(hero) == GIL_None) && (oldHeroGuild == 0) && (Diego_GomezAudience == FALSE))
	{
		return 1;
	};
};

func void Info_Diego_JoinAnalyze_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_00");	//Что думают обо мне в лагере?
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_11_01");	//Ну, я тут поговорил с людьми...
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_02");	//И что?
	Points_OC = 0;
	if(((Scatty_ChargeKirgo == LOG_FAILED) && (KIRGO_KILLED == TRUE)) || ((Scatty_ChargeKharim == LOG_FAILED) && (KHARIM_KILLED == TRUE)))
	{
		AI_Output(self,hero,"SVM_11_YouKilledMyFriend");	//Наше первое правило: не убивать. Ты его нарушил!
		Points_OC = Points_OC - 1;
	};
	if(Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01");	//Скатти сказал, что ты одолел Кирго.
		Points_OC = Points_OC + 2;
	}
	else if((Scatty_ChargeKirgo == LOG_FAILED) && (KIRGO_KILLED == FALSE))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02");	//Скатти сказал, что Кирго победил тебя. Мне показалось, что он тобой недоволен.
		Points_OC = Points_OC - 1;
	}
	else if(Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03");	//Скатти сказал, что хотел бы взглянуть на твой бой с Кирго.
	};
	if((Scatty_ChargeKharim == LOG_FAILED) && (KHARIM_KILLED == FALSE))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04");	//Впрочем, ему понравилось, что ты вызвал на бой Карима. Ничего, что ты проиграл.
		Points_OC = Points_OC + 2;
	}
	else if(Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05");	//Однако его в самом деле порадовал твой бой с Каримом. Он все обсуждает твою победу.
		Points_OC = Points_OC + 5;
	}
	else if(Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06");	//И он бы посмотрел, как ты выстоишь против Карима.
	};
	if(Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01");	//Уистлер рассказал мне о Фиске... Я, на твоем месте, забрал бы руду и смотался. В любом случае в его глазах ты поднялся.
		Points_OC = Points_OC + 3;
	}
	else if((Whistler_BuyMySword == LOG_FAILED) || ((Whistler_BuyMySword == LOG_RUNNING) && (Whistler_BuyMySword_Day <= (Wld_GetDay() - 2))))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02");	//Я поговорил с Уистлером. Да ты наглец! Взял и смотался с его рудой. Должен признать, что в храбрости тебе не откажешь!
		Points_OC = Points_OC + 2;
	}
	else if(Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03");	//Уистлер хочет получить свой меч. Давай решай, отдавать его или нет, иначе он наверняка подумает, что ты взял его руду и сбежал!
	};
	if(Sly_LostNek == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01");	//Слай рассказал, что ты помог в поисках Нека. Похоже, он тобой доволен.
		Points_OC = Points_OC + 4;
	}
	else if(Sly_LostNek == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02");	//Мне кажется, Слай неправ насчет Нека. Этот парень был настоящей занозой, плохо знал свое дело, но все же я не думаю, что он перешел в Новый лагерь.
	};
	if(Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01");	//Фингерс может тебя многому научить. Я бы на твоем месте сходил к нему.
	}
	else if(Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02");	//Фингерс сказал, что ты уже кое-что освоил, но он считает, что ты способен на большее.
		Points_OC = Points_OC + 3;
	};
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01");	//Надо бы мне переговорить с Декстером. Он решил использовать тебя для своих торговых дел.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02");	//Хотя насчет испытания нет никаких правил. Если ты сделаешь это, твой авторитет поднимется.
	}
	else if(Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03");	//Ты и правда удачно провел это дело с Кор Галомом! Декстер удивлен, да и я тоже.
		Points_OC = Points_OC + 5;
	};
	if(Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01");	//Насчет Мордрага стоит задуматься. Он неплохо сражается. Если и правда хочешь победить его, советую потренироваться.
	}
	else if(Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02");	//Торус говорит, что нам нужны ребята вроде тебя - это хороший знак.
		Points_OC = Points_OC + 5;
	}
	else if(Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03");	//Торус был очень недоволен, вспоминая твою неудачу. Как ты умудрился провалить такое дело?!
		Points_OC = Points_OC - 5;
	};
	if(Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01");	//Фиск сказал мне, что ты его удивил. В любом случае он на твоей стороне.
		Points_OC = Points_OC + 5;
	}
	else if(Npc_IsDead(ORG_826_Mordrag) || (MordragKO_HauAb == TRUE) || (MordragKO_StayAtNC == TRUE))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02");	//Фиск теперь тебя недолюбливает, парень. На твоем месте я бы быстренько подыскал замену Мордрагу.
	};
	if(Points_OC > 15)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_00");	//Ты обрел поддержку уже многих в этом лагере.
		if(hero.level >= 5)
		{
			if(Diego_BringList == LOG_SUCCESS)
			{
				AI_Output(self,hero,"Info_Diego_Points_11_01");	//Да и проверку на верность ты прошел. Иди к Торусу. Я ему рассказал о твоих успехах. Он разрешит тебе пройти к Гомезу.
				Diego_GomezAudience = TRUE;
				B_LogEntry(CH1_JoinOC,"Диего сказал, что я могу встретиться с Гомезом. Теперь я смогу стать одним из людей Гомеза и войти в замок. Нужно лишь поговорить с Торусом.");
				Info_Diego_JoinAnalyze.permanent = 0;
			}
			else
			{
				AI_Output(self,hero,"Info_Diego_Points_11_02");	//Но тебе еще предстоит проверка на верность.
			};
		}
		else
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_04");	//Но ты еще не готов. Иди, выполняй другие поручения.
			B_PrintGuildCondition(5);
		};
	}
	else if(Points_OC > 10)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_10");	//В результате могу сказать, что ты действовал неплохо для новичка.
	}
	else if(Points_OC >= 0)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_20");	//Действуй шустрее, если ты хочешь хоть чего-то добиться в этом лагере.
	};
};


instance Info_Diego_WhatToSayToGomez(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_WhatToSayToGomez_Condition;
	information = Info_Diego_WhatToSayToGomez_Info;
	permanent = 0;
	description = "Как мне вести себя при встрече с Гомезом?";
};


func int Info_Diego_WhatToSayToGomez_Condition()
{
	if((Diego_GomezAudience == TRUE) && !Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

func void Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhatToSayToGomez_Info_15_00");	//Как мне вести себя при встрече с Гомезом?
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_01");	//Гомез словно нюхом такие вещи чует. Когда он посмотрит на тебя, то сам решит, что с тобой делать.
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_02");	//Теперь я не буду направлять тебя, так что соберись. Удачи!
};


instance PC_Thief_ARMOR(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_ARMOR_Condition;
	information = PC_Thief_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString("Тяжелый доспех Призрака, защита: 40/5/20/0",VALUE_STT_ARMOR_H);
};


func int PC_Thief_ARMOR_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_HasItems(hero,stt_armor_h))
	{
		return TRUE;
	};
};

func void PC_Thief_ARMOR_Info()
{
	AI_Output(hero,self,"PC_Thief_ARMOR_Info_15_01");	//Где я могу достать такой доспех, как у тебя?
	if(Npc_HasItems(hero,ItMiNugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_02");	//А руды у тебя хватит?
		b_printtrademsg1("Отдано руды: 1200");
		AI_Output(hero,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07");	//Конечно!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_STT_ARMOR_H);
		b_printtrademsg2("Получен доспех Призрака.");
		CreateInvItem(hero,stt_armor_h);
	}
	else
	{
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_03");	//Неси руду - будут доспехи.
	};
};


instance PC_Thief_MEETAGAIN(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_MEETAGAIN_Condition;
	information = PC_Thief_MEETAGAIN_Info;
	important = 1;
	permanent = 0;
};


func int PC_Thief_MEETAGAIN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"OW_PATH_190") < 700))
	{
		return TRUE;
	};
};

func void PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_00");	//Эй, я уж думал ты погиб.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_01");	//Недавно я тоже так думал.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_02");	//С момента нашей последней встречи много чего случилось. Я слышал, ты не последнюю роль сыграл на церемонии призыва у сектантов.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_03");	//Да, ты так много знаешь.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_04");	//Даже больше, чем ты думаешь... Теперь ты ищешь юнитор?
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_05");	//Да, один из этих камней находится где-то здесь.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_06");	//Я знаю, где лежит один такой камень. Но тут есть проблема.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_07");	//Понятно. Что ты за это хочешь?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_08");	//А ты неплохо выучился, но сейчас дело не в этом.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_09");	//Не в этом? Так что же это за проблема?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_10");	//Проблема тонны на три весом.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_11");	//Пойдем. Увидишь - сам поймешь.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GuideTroll");
	Log_CreateTopic(CH3_TrollCanyon,LOG_MISSION);
	Log_SetTopicStatus(CH3_TrollCanyon,LOG_RUNNING);
	B_LogEntry(CH3_TrollCanyon,"Когда я подходил к северному хранилищу юнитора, я снова встретил Диего. Он предупредил меня, что в ущелье скрывается какое-то огромное чудовище.");
	B_LogEntry(CH3_TrollCanyon,"Каким-то образом он узнал, что я помогаю Братству и ищу юниторы. Мы решили продолжить путь вместе.");
	AI_StopProcessInfos(self);
};


instance PC_Thief_SHOWFOCUS(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_SHOWFOCUS_Condition;
	information = PC_Thief_SHOWFOCUS_Info;
	important = 1;
	permanent = 0;
};


func int PC_Thief_SHOWFOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,PC_Thief_MEETAGAIN) && (Npc_GetDistToWP(self,"LOCATION_12_01") < 1000) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void PC_Thief_SHOWFOCUS_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_01");	//По левую сторону ущелья вход в пещеру, где хранится юнитор.
	AI_Output(hero,self,"PC_Thief_SHOWFOCUS_Info_15_02");	//Понятно, сначала нам придется избавиться от той огромной твари.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_03");	//Чтобы справиться с троллем, нужно найти его слабое место... или придумать что-нибудь еще.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_04");	//Я отвлеку его.
	B_LogEntry(CH3_TrollCanyon,"Мы нашли огромного тролля, который преграждал нам дальнейший путь. Диего решил отвлечь его, пока я найду способ убить тролля.");
	Npc_ExchangeRoutine(self,"WaitAtWheel");
	AI_DrawWeapon(self);
	AI_StopProcessInfos(self);
};


instance PC_Thief_AFTERTROLL(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_AFTERTROLL_Condition;
	information = PC_Thief_AFTERTROLL_Info;
	important = 1;
	permanent = 0;
};


func int PC_Thief_AFTERTROLL_Condition()
{
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self,Troll,NOFUNC,-1);
	if(Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS) && ((trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink))) || (Npc_GetDistToWP(hero,"LOCATION_12_14_WHEEL") < 1000)))
	{
		return TRUE;
	};
};

func void PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_01");	//Просто фантастика! Да, ты вовремя среагировал! Что ж, идем за юнитором.
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_02");	//Я побуду здесь, присмотрю, чтобы не было всяких неприятных сюрпризов.
	B_LogEntry(CH3_TrollCanyon,"Тролль побежден. Теперь можно заняться лебедкой, которая открывает решетку на пути к платформе с юнитором.");
	AI_StopProcessInfos(self);
};


instance PC_Thief_WHEEL(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_WHEEL_Condition;
	information = PC_Thief_WHEEL_Info;
	important = 1;
	permanent = 0;
};


func int PC_Thief_WHEEL_Condition()
{
	if(Npc_KnowsInfo(hero,PC_Thief_AFTERTROLL) && (Troll_Wheel == 1))
	{
		return TRUE;
	};
};

func void PC_Thief_WHEEL_Info()
{
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_01");	//Похоже, заклинило.
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_02");	//Дай-ка мне взглянуть, может быть, удастся что-то сделать.
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"LOCATION_12_14_WHEEL");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
};


instance PC_Thief_FIXWHEEL(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_FIXWHEEL_Condition;
	information = PC_Thief_FIXWHEEL_Info;
	important = 1;
	permanent = 0;
};


func int PC_Thief_FIXWHEEL_Condition()
{
	if(Npc_KnowsInfo(hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};

func void PC_Thief_FIXWHEEL_Info()
{
	AI_Output(self,hero,"PC_Thief_FIXWHEEL_Info_11_01");	//Вот, теперь должно заработать.
	Troll_Wheel = 2;
	B_LogEntry(CH3_TrollCanyon,"Диего сумел отремонтировать лебедку. Теперь мне ничто не мешает взять камень.");
	Npc_ExchangeRoutine(self,"WaitAtFocus");
	AI_StopProcessInfos(self);
};


instance PC_Thief_WAITATFOCUS(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_WAITATFOCUS_Condition;
	information = PC_Thief_WAITATFOCUS_Info;
	important = 1;
	permanent = 0;
};


func int PC_Thief_WAITATFOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL) && (Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000))
	{
		return TRUE;
	};
};

func void PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_WAITATFOCUS_Info_11_01");	//Иди за юнитором, а я подожду здесь.
	AI_StopProcessInfos(self);
};


instance PC_Thief_GOTIT(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_GOTIT_Condition;
	information = PC_Thief_GOTIT_Info;
	important = 1;
	permanent = 0;
};


func int PC_Thief_GOTIT_Condition()
{
	if(Npc_HasItems(hero,Focus_2) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void PC_Thief_GOTIT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_01");	//Нашел юнитор? Отлично.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_02");	//Ладно, мне пора возвращаться в Старый лагерь. Желаю удачи!
	AI_Output(hero,self,"PC_Thief_GOTIT_Info_15_03");	//Смотри, будь осторожен.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_04");	//Еще увидимся.
	B_LogEntry(CH3_TrollCanyon,"Юнитор мой, а Диего возвращается в Старый лагерь. Думаю, это была еще не последняя наша встреча.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
};


instance Info_Diego_OCWARN(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCWARN_Condition;
	information = Info_Diego_OCWARN_Info;
	important = 1;
	permanent = 0;
};


func int Info_Diego_OCWARN_Condition()
{
	if((Kapitel == 4) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Diego_OCWARN_11_01");	//Эй... Тихо!
	if(Npc_KnowsInfo(hero,Info_Milten_OCWARN))
	{
		AI_Output(hero,self,"Info_Diego_OCWARN_15_02");	//Привет, Диего! Я встретил Мильтена на другом конце лагеря.
		AI_Output(self,hero,"Info_Diego_OCWARN_11_03");	//Хорошо, тогда ты в курсе последних событий.
		AI_Output(self,hero,"Info_Diego_OCWARN_11_04");	//Ты знаешь, что планируется нападение на Свободную шахту?
	}
	else
	{
		AI_Output(hero,self,"Info_Diego_OCWARN_15_05");	//Привет, Диего! Почему ты прячешься?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_06");	//А ты еще не слышал?
		AI_Output(hero,self,"Info_Diego_OCWARN_15_07");	//Слышал что?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_08");	//В Старой шахте обвал, все Маги Огня мертвы, а на Свободную шахту готовится нападение.
		AI_Output(hero,self,"Info_Diego_OCWARN_15_09");	//Что? О чем ты говоришь?
		b_failch4quests();
	};
};


instance Info_Diego_OCMINE(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCMINE_Condition;
	information = Info_Diego_OCMINE_Info;
	important = 0;
	permanent = 0;
	description = "Почему обрушилась Старая шахта?";
};


func int Info_Diego_OCMINE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCWARN))
	{
		return TRUE;
	};
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output(hero,self,"Info_Diego_OCMINE_15_01");	//Почему обрушилась Старая шахта?
	AI_Output(self,hero,"Info_Diego_OCMINE_11_02");	//Один оставшийся в живых рудокоп говорит, что во время работ на нижнем уровне, они натолкнулись на подземную реку.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_03");	//Когда вода хлынула в шахту, сломалась одна из подпорок, и верхний уровень обрушился.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_04");	//Из тех, кто находился в шахте, уцелела лишь горстка.
};


instance Info_Diego_OCKDF(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCKDF_Condition;
	information = Info_Diego_OCKDF_Info;
	important = 0;
	permanent = 0;
	description = "Почему все маги Огня погибли?";
};


func int Info_Diego_OCKDF_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCFM))
	{
		return TRUE;
	};
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output(hero,self,"Info_Diego_OCKDF_15_01");	//Почему все маги Огня погибли?
	AI_Output(self,hero,"Info_Diego_OCKDF_11_02");	//Это долгая история.
};


instance Info_Diego_OCFM(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCFM_Condition;
	information = Info_Diego_OCFM_Info;
	important = 0;
	permanent = 0;
	description = "Зачем они хотят напасть на Свободную шахту?";
};


func int Info_Diego_OCFM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCKDF))
	{
		return TRUE;
	};
};

func void Info_Diego_OCFM_Info()
{
	AI_Output(hero,self,"Info_Diego_OCFM_15_01");	//Зачем они хотят напасть на Свободную шахту?
	AI_Output(self,hero,"Info_Diego_OCFM_11_02");	//Это долгая история.
};


instance Info_Diego_OCSTORY(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCSTORY_Condition;
	information = Info_Diego_OCSTORY_Info;
	important = 0;
	permanent = 0;
	description = "Расскажи!";
};


func int Info_Diego_OCSTORY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCFM) || Npc_KnowsInfo(hero,Info_Diego_OCKDF))
	{
		return TRUE;
	};
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_01");	//Расскажи! Это далеко не первая долгая история из тех, что мне приходилось слышать.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_02");	//Ну, ладно. По счастью, я оказался в особняке Баронов, когда они узнали об обвале в шахте.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_03");	//Гомез чуть не обезумел от ярости, услышав это известие. Верно, испугался, что его положение может пошатнуться.
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_04");	//Еще бы. Тот, кто контролирует добычу руды, тот держит в руках всю колонию.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_05");	//Ты прав. Теперь у него нет никакого источника руды, поэтому скоро нам перестанут доставлять товары из внешнего мира.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_06");	//Никто не будет работать на него, если он не найдет новый источник дохода.
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_07");	//И из-за этого он хочет напасть на Свободную шахту?
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_08");	//Это, если честно, последний шанс Гомеза удержать власть.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_09");	//Часа два назад, около двадцати стражников отправились к Свободной шахте.
	B_Story_FMTaken();
};


instance Info_Diego_OCWARNNC(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCWARNNC_Condition;
	information = Info_Diego_OCWARNNC_Info;
	important = 0;
	permanent = 0;
	description = "Он сошел с ума! Я расскажу об этом в Новом лагере!";
};


func int Info_Diego_OCWARNNC_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return TRUE;
	};
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_01");	//Он сошел с ума! Я расскажу об этом в Новом лагере!
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_02");	//Тогда тебе нужно торопиться - они уже вполне могли добраться туда.
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_03");	//Но они никогда не смогут прорваться через укрепления Нового лагеря!
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_04");	//Это им не нужно. Несколько месяцев назад они нашли путь, ведущий через горы прямо к Свободной шахте. Кроме них никто о нем не знает.
};


instance Info_Diego_OCGUARDS(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCGUARDS_Condition;
	information = Info_Diego_OCGUARDS_Info;
	important = 0;
	permanent = 0;
	description = "Я видел стражников, охраняющих закрытые ворота.";
};


func int Info_Diego_OCGUARDS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return TRUE;
	};
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output(hero,self,"Info_Diego_OCGUARDS_15_01");	//Я видел стражников, охраняющих закрытые ворота.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_02");	//Держись от них подальше. Они нападут на любого, кто подойдет к лагерю.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_03");	//Они боятся мести за нападение на Свободную шахту.
};


instance Info_Diego_OCMURDER(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCMURDER_Condition;
	information = Info_Diego_OCMURDER_Info;
	important = 0;
	permanent = 0;
	description = "Но что случилось с магами Огня?";
};


func int Info_Diego_OCMURDER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return TRUE;
	};
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_01");	//Но что случилось с магами Огня?
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_02");	//Корристо и остальные маги оставались последними, кто сохранил рассудок в этой ситуации.
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_03");	//Они запретили нападение и потребовали объединиться с двумя остальными лагерями.
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_04");	//Они запретили Гомезу напасть на шахту?
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_05");	//Ну, да. Корристо и другие не должны были так вести себя. Гомез перестал доверять им и, внезапно напав, перебил всех.
};


instance Info_Diego_OCRETREAT(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCRETREAT_Condition;
	information = Info_Diego_OCRETREAT_Info;
	important = 0;
	permanent = 0;
	description = "Что вы с Мильтеном собираетесь делать теперь?";
};


func int Info_Diego_OCRETREAT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCMURDER))
	{
		return TRUE;
	};
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output(hero,self,"Info_Diego_OCRETREAT_15_01");	//Что вы с Мильтеном собираетесь делать теперь?
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_02");	//Мы пока останемся здесь и будем предупреждать друзей, чтобы они не наткнулись на стражу.
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_03");	//Однако ты мог бы помочь нам.
};


instance Info_Diego_OCFAVOR(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCFAVOR_Condition;
	information = Info_Diego_OCFAVOR_Info;
	important = 0;
	permanent = 0;
	description = "Конечно. Что я должен сделать?";
};


func int Info_Diego_OCFAVOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return TRUE;
	};
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_01");	//Конечно. Что я должен сделать?
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_02");	//Разыщи Лестера и Горна. Они должны узнать о том, что здесь происходит.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_03");	//Скажи им, что мы четверо встретимся в нашем месте, как всегда.
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_04");	//Если я встречу их раньше тебя, я передам, что ты хочешь их видеть.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_05");	//Благодарю, друг мой. Ты оказался отличным парнем! Теперь иди, еще увидимся.
	Log_CreateTopic(CH4_4Friends,LOG_MISSION);
	Log_SetTopicStatus(CH4_4Friends,LOG_RUNNING);
	B_LogEntry(CH4_4Friends,"Все маги Огня мертвы. Но Гомез не хочет на этом останавливаться. Диего попросил меня предупредить Горна и Лестера о том, что он хочет встретиться с ними в потайном месте. Мне кажется, они уже давно знакомы.");
};

