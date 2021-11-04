
instance Org_818_Ratford_Exit(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 999;
	condition = Org_818_Ratford_Exit_Condition;
	information = Org_818_Ratford_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_818_Ratford_Exit_Condition()
{
	return 1;
};

func void Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_818_Ratford_WrongWay(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WrongWay_Condition;
	information = Org_818_Ratford_WrongWay_Info;
	permanent = 0;
	important = 1;
};


func int Org_818_Ratford_WrongWay_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Org_818_Ratford_WrongWay_Info()
{
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00");	//Эй, ты!
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01");	//Что тебе нужно?
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//Хочу предупредить тебя. Прямо за нами начинаются охотничьи угодья.
};


instance Org_818_Ratford_WhatGame(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhatGame_Condition;
	information = Org_818_Ratford_WhatGame_Info;
	permanent = 0;
	description = "А на кого здесь можно охотиться?";
};


func int Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhatGame_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00");	//А на кого здесь можно охотиться?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//На падальщиков. Мы добываем дичь, к тому же их не так уж сложно убивать. Нужно только знать как.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//Да? И как это сделать?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//Спроси моего напарника Дракса. Он в этом гораздо лучше разбирается.
};


instance Org_818_Ratford_WhyDangerous(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhyDangerous_Condition;
	information = Org_818_Ratford_WhyDangerous_Info;
	permanent = 0;
	description = "Почему эти места считаются опасными?";
};


func int Org_818_Ratford_WhyDangerous_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhatGame) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00");	//Почему эти места считаются опасными?
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//Ты только что прибыл, да? В колонии нет безопасных мест, каждый шаг таит какую-то опасность.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//На дорогах между лагерями не так опасно, но даже там тебя может поджидать пара волков или ящериц, для которых ты станешь легкой добычей.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//И тебе от них не спастись, если у тебя нет ни хорошего доспеха, ни стоящего оружия.
};


instance Org_818_Ratford_WoEquipment(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoEquipment_Condition;
	information = Org_818_Ratford_WoEquipment_Info;
	permanent = 0;
	description = "Где я могу найти хорошие доспехи и оружие?";
};


func int Org_818_Ratford_WoEquipment_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoEquipment_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//Где я могу найти хорошие доспехи и оружие?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//У торговцев в лагерях. Отсюда недалеко до Старого лагеря. Иди по дороге и без труда его найдешь.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//Но в Новом лагере, из которого мы пришли, вещи стоят не так дорого, если, конечно, найти нужных людей.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//Если зайдешь в Старый лагерь, найди Мордрага. Он один из нас. У него ты сможешь купить хороший товар по низкой цене.
	if(Mordrag_Traded == 0)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Вор Мордраг продает в Старом лагере свои товары по выгодным ценам.");
		Mordrag_Traded = 1;
	};
};


instance Org_818_Ratford_MoreLocations(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_MoreLocations_Condition;
	information = Org_818_Ratford_MoreLocations_Info;
	permanent = 0;
	description = "Расскажи мне о том, что находится в этой колонии.";
};


func int Org_818_Ratford_MoreLocations_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WoEquipment) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Org_818_Ratford_MoreLocations_Info()
{
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00");	//Расскажи мне о том, что находится в этой колонии.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//Чтобы быстро найти дорогу от одного лагеря к другому, лучше купить карту. Так ты избежишь многих неприятностей.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//Я имею в виду встречи с разными существами, которых лучше никогда не встречать. Они обитают в разных ущельях.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//Избегай старых развалин. Здесь их очень много. Большинство из них - старые укрепления, оставшиеся со времен первой войны с орками. Иногда можно встретить и покинутые поселения орков.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//Обычно в таких местах можно еще встретить орков или даже более опасных тварей. А ночью от таких мест вообще лучше держаться подальше.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//И мой последний совет: не стоит бродить по местным лесам!
};


instance Org_818_Ratford_WoKarte(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoKarte_Condition;
	information = Org_818_Ratford_WoKarte_Info;
	permanent = 0;
	description = "Где мне достать карту?";
};


func int Org_818_Ratford_WoKarte_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_MoreLocations) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoKarte_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//Где мне достать карту?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//Спроси об этом людей из Старого лагеря. По-моему, там жил один картограф.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//Может, у тебя получиться выудить у него какую-нибудь карту. А может, у него будет карта и для меня?
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Если у меня получится достать карту бесплатно, то я возьму столько, сколько смогу унести.",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"А зачем это тебе? Разве он не продает их?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	var C_Npc Lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//Если у меня получится достать карту бесплатно, то я возьму столько, сколько смогу унести.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//А ты мне нравишься! Быть может, ты захочешь присоединиться к Новому лагерю? Если зайдешь туда, найди Ларса. Он принимает новых людей. Думаю, у него найдется для тебя работа.
		Lares = Hlp_GetNpc(Org_801_Lares);
		Lares.aivar[AIV_FINDABLE] = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01");	//Ну да, как же.
	};
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//А зачем это тебе? Разве он не продает их?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//Ну, за нее придется отдать не так уж мало руды...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};


instance Org_818_Ratford_Thanks(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 888;
	condition = Org_818_Ratford_Thanks_Condition;
	information = Org_818_Ratford_Thanks_Info;
	permanent = 0;
	description = "Спасибо за помощь.";
};


func int Org_818_Ratford_Thanks_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_MoreLocations) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Org_818_Ratford_Thanks_Info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//Спасибо за помощь.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//Только не думай, что здесь все будут рады помочь тебе!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//Конечно, у новичка отбирать нечего, но некоторые могут убить тебя просто потому, что им приглянулась твоя кирка.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//Я это запомню.
};


instance ORG_818_RATFORD_QUEST1(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = org_818_ratford_quest1_condition;
	information = org_818_ratford_quest1_info;
	permanent = 0;
	description = "И что будет, после того как я отдам ее тебе?";
};


func int org_818_ratford_quest1_condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WoKarte))
	{
		return 1;
	};
};

func void org_818_ratford_quest1_info()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_00");	//И что будет, после того как я отдам ее тебе?
	AI_Output(self,other,"Info_Jackal_PermPaid_07_01");	//Ты можешь рассчитывать на мою помощь!
	Log_CreateTopic(RATFORDMAPS,LOG_MISSION);
	Log_SetTopicStatus(RATFORDMAPS,LOG_RUNNING);
	B_LogEntry(RATFORDMAPS,"Ретфорду нужна карта колонии. Если у меня будет достаточно руды, то я смогу купить ее в Старом лагере. А если не будет, то я что-нибудь придумаю...");
};


instance ORG_818_RATFORD_QUEST2(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = org_818_ratford_quest2_condition;
	information = org_818_ratford_quest2_info;
	permanent = 1;
	description = "(отдать карту)";
};


func int org_818_ratford_quest2_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_quest1) && ((Npc_HasItems(hero,ItWrWorldmap) && (RATFORD_ITWRWORLDMAP == FALSE)) || (Npc_HasItems(hero,ItWrOMMap) && (RATFORD_ITWROMMAP == FALSE)) || (Npc_HasItems(hero,ItWrFocusmapPsi) && (RATFORD_ITWRFOCUSMAPPSI == FALSE)) || Npc_HasItems(hero,ItWrFocimap)))
	{
		return 1;
	};
};

func void org_818_ratford_quest2_info()
{
	Info_ClearChoices(org_818_ratford_quest2);
	Info_AddChoice(org_818_ratford_quest2,DIALOG_BACK,org_818_ratford_back);
	if(Npc_HasItems(hero,ItWrWorldmap) && (RATFORD_ITWRWORLDMAP == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...колонии.",org_818_ratford_itwrworldmap);
	};
	if(Npc_HasItems(hero,ItWrOMMap) && (RATFORD_ITWROMMAP == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...дороги к Старой шахте.",org_818_ratford_itwrommap);
	};
	if(Npc_HasItems(hero,ItWrFocusmapPsi) && (RATFORD_ITWRFOCUSMAPPSI == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...Юбериона.",org_818_ratford_itwrfocusmappsi);
	};
	if(Npc_HasItems(hero,ItWrFocimap))
	{
		Info_AddChoice(org_818_ratford_quest2,"...Сатураса.",org_818_ratford_itwrfocimap);
	};
};

func void org_818_ratford_back()
{
	Info_ClearChoices(org_818_ratford_quest2);
	Npc_RemoveInvItem(self,ItWrWorldmap);
	Npc_RemoveInvItem(self,ItWrOMMap);
	Npc_RemoveInvItem(self,ItWrFocusmapPsi);
	Npc_RemoveInvItem(self,ItWrFocimap);
};

func void org_818_ratford_itwrworldmap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//Я справился с твоим заданием.
	b_printtrademsg1("Отдана карта колонии.");
	CreateInvItem(self,ItWrWorldmap);
	AI_UseItemToState(self,ItWrWorldmap,1);
	AI_Wait(self,2);
	AI_UseItemToState(self,ItWrWorldmap,-1);
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//Возьми, ты заслужил их.
	b_printtrademsg2("Получено 4 волчьих шкуры.");
	B_GiveInvItems(other,self,ItWrWorldmap,1);
	CreateInvItems(self,ItAt_Wolf_01,4);
	B_GiveInvItems(self,other,ItAt_Wolf_01,4);
	B_LogEntry(RATFORDMAPS,"Я отдал Ретфорду карту колонии, а взамен получил несколько волчьих шкур.");
	Log_SetTopicStatus(RATFORDMAPS,LOG_SUCCESS);
	RATFORD_ITWRWORLDMAP = TRUE;
	B_GiveXP(200);
	Npc_RemoveInvItem(self,ItWrWorldmap);
};

func void org_818_ratford_itwrommap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//Я справился с твоим заданием.
	b_printtrademsg1("Отдана карта дороги к Старой шахте.");
	CreateInvItem(self,ItWrOMMap);
	AI_UseItemToState(self,ItWrOMMap,1);
	AI_Wait(self,1);
	AI_UseItemToState(self,ItWrOMMap,-1);
	AI_Output(self,other,"SVM_7_OkayKeepIt");	//Хорошо, хорошо! Оставь себе!
	b_printtrademsg2("Получена карта дороги к Старой шахте.");
	B_LogEntry(RATFORDMAPS,"Карта дороги к Старой шахте слишком мала.");
	RATFORD_ITWROMMAP = TRUE;
	B_GiveXP(40);
};

func void org_818_ratford_itwrfocusmappsi()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//Я справился с твоим заданием.
	b_printtrademsg1("Отдана карта Юбериона.");
	CreateInvItem(self,ItWrFocusmapPsi);
	AI_UseItemToState(self,ItWrFocusmapPsi,1);
	AI_Wait(self,1);
	AI_UseItemToState(self,ItWrFocusmapPsi,-1);
	AI_Output(self,other,"SVM_7_YouCanKeeptheCrap");	//Ну, ладно, оставь себе! А я найду себе что-то другое.
	b_printtrademsg2("Получена карта Юбериона.");
	B_LogEntry(RATFORDMAPS,"Карта Юбериона не подходит для охоты.");
	RATFORD_ITWRFOCUSMAPPSI = TRUE;
	B_GiveXP(40);
};

func void org_818_ratford_itwrfocimap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//Я справился с твоим заданием.
	b_printtrademsg1("Отдана карта Сатураса.");
	CreateInvItem(self,ItWrFocimap);
	AI_UseItemToState(self,ItWrFocimap,1);
	AI_Wait(self,2);
	AI_UseItemToState(self,ItWrFocimap,-1);
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//Возьми, ты заслужил их.
	b_printtrademsg2("Получено 4 волчьих шкуры.");
	B_GiveInvItems(other,self,ItWrFocimap,1);
	CreateInvItems(self,ItAt_Wolf_01,4);
	B_GiveInvItems(self,other,ItAt_Wolf_01,4);
	B_LogEntry(RATFORDMAPS,"Хоть карта Сатураса и довольно старая, но Ретфорду она будет очень полезна.");
	Log_SetTopicStatus(RATFORDMAPS,LOG_SUCCESS);
	B_GiveXP(200);
	Npc_RemoveInvItem(self,ItWrFocimap);
};
