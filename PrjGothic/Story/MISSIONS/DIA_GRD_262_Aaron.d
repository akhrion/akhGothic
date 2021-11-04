
instance GRD_262_Aaron_Exit(C_Info)
{
	npc = GRD_262_Aaron;
	nr = 999;
	condition = GRD_262_Aaron_Exit_Condition;
	information = GRD_262_Aaron_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int GRD_262_Aaron_Exit_Condition()
{
	return 1;
};

func void GRD_262_Aaron_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance GRD_262_Aaron_CHEST(C_Info)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_CHEST_Condition;
	information = GRD_262_Aaron_CHEST_Info;
	important = 0;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int GRD_262_Aaron_CHEST_Condition()
{
	if((Npc_GetDistToWP(self,"OM_CAVE1_34") < 400) && !Npc_KnowsInfo(hero,GRD_262_Aaron_BLUFF))
	{
		return 1;
	};
};

func void GRD_262_Aaron_CHEST_Info()
{
	AI_Output(other,self,"GRD_262_Aaron_CHEST_Info_15_01");	//Что ты здесь делаешь?
	AI_Output(self,other,"GRD_262_Aaron_CHEST_Info_09_02");	//Охраняю свой сундук, чтобы рудокопы типа Снайпса не лезли в него.
};


instance GRD_262_Aaron_BLUFF(C_Info)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_BLUFF_Condition;
	information = GRD_262_Aaron_BLUFF_Info;
	important = 0;
	permanent = 1;
	description = "(отвлечь Аарона)";
};


func int GRD_262_Aaron_BLUFF_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_584_Snipes_DEAL) && (Aaron_lock != LOG_RUNNING) && (Aaron_lock != LOG_SUCCESS))
	{
		return 1;
	};
};

func void GRD_262_Aaron_BLUFF_Info()
{
	Info_ClearChoices(GRD_262_Aaron_BLUFF);
	Info_AddChoice(GRD_262_Aaron_BLUFF,DIALOG_BACK,GRD_262_Aaron_BLUFF_BACK);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Меня прислал Ян. Он сказал, что хочет видеть тебя!",GRD_262_Aaron_BLUFF_IAN);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Я слышал, что в шахту пробрались воры. Они хотят украсть руду.",GRD_262_Aaron_BLUFF_BANDIT);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Рудокопы нашли огромный кусок руды!",GRD_262_Aaron_BLUFF_ORE);
};

func void GRD_262_Aaron_BLUFF_ORE()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_01");	//Рудокопы нашли огромный кусок руды!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_02");	//Ну и что?
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_03");	//Думаю, тебе интересно будет посмотреть на него.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_04");	//Да ну его.
};

func void GRD_262_Aaron_BLUFF_BANDIT()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BANDIT_15_01");	//Я слышал, что в шахту пробрались воры. Они хотят украсть руду.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BANDIT_09_02");	//Думаешь, я такой идиот, что поверю этому? Да никто не осмелится сюда и носа сунуть.
};

func void GRD_262_Aaron_BLUFF_IAN()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_IAN_15_01");	//Меня прислал Ян. Он сказал, что хочет видеть тебя!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_IAN_09_02");	//Чего он хочет?
	Info_ClearChoices(GRD_262_Aaron_BLUFF);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"А, не знаю, чего он там хочет...",GRD_262_Aaron_BLUFF_UGLY);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Он хочет наказать тебя. Говорит, что ты бездельник, каких мало.",GRD_262_Aaron_BLUFF_BAD);
	Info_AddChoice(GRD_262_Aaron_BLUFF,"Он хочет наградить тебя за твою работу.",GRD_262_Aaron_BLUFF_GOOD);
};

func void GRD_262_Aaron_BLUFF_GOOD()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_GOOD_15_01");	//Он хочет наградить тебя за твою работу.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_GOOD_09_02");	//Правда? Если так, разрешаю тебе забрать эту награду.
	Npc_SetTempAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};

func void GRD_262_Aaron_BLUFF_BAD()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BAD_15_01");	//Он хочет наказать тебя. Говорит, что ты бездельник, каких мало.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BAD_09_02");	//Первый раз что ли? Лучше убирайся отсюда.
	AI_StopProcessInfos(self);
};

func void GRD_262_Aaron_BLUFF_UGLY()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_UGLY_15_01");	//А, не знаю, чего он там хочет. Сходи к нему и сам узнай. Думаешь, он рассказал бы мне об этом?
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_UGLY_09_02");	//Хорошо, уже иду!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"trick");
	Aaron_lock = LOG_RUNNING;
	Snipes_deal = LOG_SUCCESS;
	GRD_262_Aaron_BLUFF.permanent = 0;
	B_LogEntry(CH2_SnipesDeal,"Я сказал Аарону, что Ян хочет его видеть. Он ушел вниз. Надеюсь, у него есть чувство юмора...");
};

func void GRD_262_Aaron_BLUFF_BACK()
{
	Info_ClearChoices(GRD_262_Aaron_BLUFF);
};


instance GRD_262_Aaron_PISSED(C_Info)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_PISSED_Condition;
	information = GRD_262_Aaron_PISSED_Info;
	important = 1;
	permanent = 0;
};


func int GRD_262_Aaron_PISSED_Condition()
{
	if((Aaron_lock == LOG_RUNNING) && (Npc_GetDistToWP(hero,"OM_CAVE1_47") < 1000))
	{
		return TRUE;
	};
};

func void GRD_262_Aaron_PISSED_Info()
{
	AI_DrawWeapon(self);
	AI_Output(self,other,"Info_Aaron_PISSED_09_01");	//Эй, парень! Следующая такая шутка будет для тебя последней, понял?
	AI_RemoveWeapon(self);
	Npc_ExchangeRoutine(self,"start");
	Aaron_lock = LOG_SUCCESS;
	B_LogEntry(CH2_SnipesDeal,"Я снова встретил Аарона. Теперь я знаю, что чувства юмора у него нет.");
};


instance GRD_262_Aaron_SELL(C_Info)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_SELL_Condition;
	information = GRD_262_Aaron_SELL_Info;
	important = 0;
	permanent = 0;
	description = "Эй, ты не терял ключ от своего сундука?";
};


func int GRD_262_Aaron_SELL_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_584_Snipes_DEAL_RUN))
	{
		return 1;
	};
};

func void GRD_262_Aaron_SELL_Info()
{
	AI_Output(other,self,"Info_Aaron_SELL_15_01");	//Эй, ты не терял ключ от своего сундука?
	AI_Output(self,other,"Info_Aaron_SELL_09_02");	//Верно. Даже не хочу предполагать, откуда ты узнал об этом ключе.
	AI_Output(self,other,"Info_Aaron_SELL_09_03");	//Двадцать кусков, если ты вернешь мне ключ.
	B_LogEntry(CH2_SnipesDeal,"Аарон даст мне 20 кусков руды, если я найду ключ от его сундука!");
};


instance GRD_262_Aaron_SELLNOW(C_Info)
{
	npc = GRD_262_Aaron;
	condition = GRD_262_Aaron_SELLNOW_Condition;
	information = GRD_262_Aaron_SELLNOW_Info;
	important = 0;
	permanent = 0;
	description = "(продать ключ)";
};


func int GRD_262_Aaron_SELLNOW_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_262_Aaron_SELL) && Npc_HasItems(hero,ItKe_OM_02) && (AARON_KEY_TAKEN == FALSE))
	{
		return 1;
	};
};

func void GRD_262_Aaron_SELLNOW_Info()
{
	AI_Output(other,self,"Info_Aaron_SELLNOW_15_01");	//Вот твой ключ.
	b_printtrademsg1("Отдан ключ.");
	AI_Output(self,other,"Info_Aaron_SELLNOW_09_02");	//Мой ключ, точно. Вот, как мы и договаривались, твои двадцать кусков руды.
	b_printtrademsg2("Получено руды: 20");
	AI_Output(self,other,"Info_Aaron_SELLNOW_09_03");	//Но, в будущем я с тебя глаз уже не спущу!
	CreateInvItems(self,ItMiNugget,20);
	B_GiveInvItems(self,other,ItMiNugget,20);
	B_GiveInvItems(hero,self,ItKe_OM_02,1);
	B_GiveXP(XP_SellKeyToAaron);
	B_LogEntry(CH2_SnipesDeal,"Я продал Аарону ключ от его сундука. В этом деле и для меня нашлась выгода!");
	Log_SetTopicStatus(CH2_SnipesDeal,LOG_SUCCESS);
};

