
instance DIA_Balor_Exit(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 999;
	condition = DIA_Viran_Exit_Condition;
	information = DIA_Viran_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Balor_Exit_Condition()
{
	return 1;
};

func void DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Balor_BotenDay;

instance DIA_Balor_FetchWeed(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_FetchWeed_Condition;
	information = DIA_Balor_FetchWeed_Info;
	permanent = 0;
	description = "Меня прислал Идол Оран за урожаем болотника.";
};


func int DIA_Balor_FetchWeed_Condition()
{
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Balor_FetchWeed_Info()
{
	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00");	//Меня прислал Идол Оран за урожаем болотника.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01");	//Хорошо. Мне не придется относить его самому. Вот, возьми его.
	b_printtrademsg1("Получен болотник (50).");
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02");	//Не забудь заглянуть к Вайрану, на другую сторону болота, если ты у него еще не был.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03");	//Иначе наш дневной урожай кое-кому покажется слишком маленьким. Могут подумать, что ты половину присвоил, хехе.
	B_GiveInvItems(self,other,ItMi_Plants_Swampherb_01,50);
	B_LogEntry(CH1_DeliverWeed,"Бэлор передал мне дневной урожай болотника для Кор Галома.");
	B_GiveXP(XP_WeedFromBalor);
	if(!Npc_KnowsInfo(hero,DIA_Viran_What) && !Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		B_LogEntry(CH1_DeliverWeed,"По словам Бэлора, на другой стороне болота есть еще одна группа сборщиков болотника. Я не расспросил как следует Идола Орана. Теперь мне придется разыскивать эту группу и постараться не попасться на глаза болотожорам.");
	};
	Balor_BotenDay = Wld_GetDay();
};


var int Balor_PlayerCheating;

instance DIA_Balor_SellUnder(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_SellUnder_Condition;
	information = DIA_Balor_SellUnder_Info;
	permanent = 0;
	description = "Да как я могу? И потом... куда мне его девать? Продать кому-то?";
};


func int DIA_Balor_SellUnder_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

func void DIA_Balor_SellUnder_Info()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_15_00");	//Да как я могу? И потом... куда мне его девать? Продать кому-то?
	AI_Output(self,other,"DIA_Balor_SellUnder_01_01");	//А, я подсказал тебе хорошую идею, да?
	Info_ClearChoices(DIA_Balor_SellUnder);
	Info_AddChoice(DIA_Balor_SellUnder,"Забудь, это была просто шутка.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice(DIA_Balor_SellUnder,"Если бы ты знал того, кто мог его купить, мы поделили бы прибыль.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice(DIA_Balor_SellUnder,"Нет, просто скажи, кто он.",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00");	//Забудь, это была просто шутка.
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00");	//Если бы ты знал того, кто мог бы его купить, мы могли бы поделить прибыль пополам.
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01");	//Ну, есть в Новом лагере человек, которого мог бы заинтересовать груз болотника...
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02");	//Но если Гуру узнают об этом, они скормят тебя болотожорам! Так что я ничего не знаю, ясно?!
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00");	//Нет, просто скажи, кто он.
	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01");	//Ишь, чего захотел! Ну, вот что я тебе скажу: если Кор Галом не получит траву, достанется нам обоим! С ним лучше не шутить.
};


instance DIA_Balor_TellDealer(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_TellDealer_Condition;
	information = DIA_Balor_TellDealer_Info;
	permanent = 1;
	description = "Я учту. Так кому в Новом лагере можно продать болотник?";
};


func int DIA_Balor_TellDealer_Condition()
{
	if((Balor_PlayerCheating == TRUE) && (Balor_TellsNCDealer == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void DIA_Balor_TellDealer_Info()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_15_00");	//Я учту. Так кому в Новом лагере можно продать болотник?
	AI_Output(self,other,"DIA_Balor_TellDealer_01_01");	//Конечно, я назову тебе этого человека, а ты сбежишь с нашей травой. Даже не надейся!
	AI_Output(self,other,"DIA_Balor_TellDealer_01_02");	//Мне нужен задаток, пятьдесят кусков руды. Тогда и поговорим.
	Info_ClearChoices(DIA_Balor_TellDealer);
	Info_AddChoice(DIA_Balor_TellDealer,"Забудь об этом.",DIA_Balor_TellDealer_ForgetIt);
	Info_AddChoice(DIA_Balor_TellDealer,"Пятьдесят кусков? Хорошо, держи.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00");	//Пятьдесят кусков? Хорошо, держи.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		b_printtrademsg1("Отдано руды: 50");
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01");	//Что ж... Слушай. Его зовут Сайфер. Он почти все время сидит в баре на озере.
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02");	//Но будь с ним осторожен. Смотри, чтобы он тебя не обманул.
		b_printtrademsg2("Получен пакет с травой.");
		Info_ClearChoices(DIA_Balor_TellDealer);
		Npc_RemoveInvItems(other,ItMiNugget,50);
		Npc_RemoveInvItems(other,ItMi_Plants_Swampherb_01,50);
		CreateInvItems(other,weedpack,1);
		Balor_TellsNCDealer = TRUE;
		B_LogEntry(CH1_DeliverWeed,"Бэлор назвал мне человека из Нового лагеря. Его зовут Сайфер. Я смогу найти его в баре на озере. Гуру будут очень недовольны, если я продам болотник на сторону.");
		B_GiveXP(XP_BalorNamedCipher);
		Log_CreateTopic(GE_TraderNC,LOG_NOTE);
		B_LogEntry(GE_TraderNC,"Сайфер продает и покупает разные товары. Он интересуется крупными партиями болотника. Его можно найти в баре на озере около Нового лагеря.");
		B_LogEntry(GE_TraderNC,"Я договорился с Бэлором. Каждые несколько дней он будет собирать для меня пакет с урожаем болотника, который я смогу выгодно продать Сайферу.");
		Balor_BotenDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//Я не вижу руду. Пятьдесят кусков и ни куском меньше, понял?
		Info_ClearChoices(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//Забудь об этом.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01");	//Не думай, что можно вот так просто заявиться в Новый лагерь и продать весь болотник первому встречному! Если не знаешь нужного человека, у тебя ничего не выйдет.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02");	//Ты можешь рассказать все не тому человеку, и у тебя все отберут.
	Info_ClearChoices(DIA_Balor_TellDealer);
};


instance DIA_Balor_RipOff(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 5;
	condition = DIA_Balor_RipOff_Condition;
	information = DIA_Balor_RipOff_Info;
	permanent = 1;
	description = "Это снова я. Мне нужно забрать следующую партию.";
};


func int DIA_Balor_RipOff_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed) && (BALOR_CAN_GIVE == TRUE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void DIA_Balor_RipOff_Info()
{
	AI_Output(other,self,"DIA_Balor_RipOff_15_00");	//Это снова я. Мне нужно забрать следующую партию.
	if(Balor_BotenDay <= (Wld_GetDay() - 2))
	{
		if(Balor_TellsNCDealer == TRUE)
		{
			AI_Output(self,other,"DIA_Balor_RipOff_01_01");	//Еще бы! Чтобы снова отнести его в Новый лагерь.
			AI_Output(self,other,"DIA_Balor_RipOff_01_02");	//Дай мне задаток: пятьдесят кусков руды.
			Info_ClearChoices(DIA_Balor_RipOff);
			Info_AddChoice(DIA_Balor_RipOff,"Забудь об этом.",dia_balor_telldealer_forgetit2);
			Info_AddChoice(DIA_Balor_RipOff,"Ладно, вот тебе руда!",dia_balor_telldealer_pay2);
		}
		else
		{
			AI_Output(self,other,"DIA_Balor_RipOff_01_03");	//А, это снова ты? Ладно, бери, но только не вздумай нас обмануть!
			b_printtrademsg1("Получен болотник (50).");
			AI_Output(other,self,"DIA_Balor_RipOff_15_04");	//Да что ты, я и не собирался.
			CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
			B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
			BALOR_CAN_GIVE = FALSE;
			Balor_BotenDay = Wld_GetDay();
		};
	}
	else
	{
		if(Balor_TellsNCDealer == TRUE)
		{
			AI_PlayAni(self,"T_SEARCH");
		};
		AI_Output(self,other,"SVM_1_NotNow");	//Я занят!
		AI_StopProcessInfos(self);
	};
};

func void dia_balor_telldealer_pay2()
{
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		b_printtrademsg1("Отдано руды: 50");
		b_printtrademsg2("Получен пакет с травой.");
		Info_ClearChoices(DIA_Balor_RipOff);
		Npc_RemoveInvItems(other,ItMiNugget,50);
		Npc_RemoveInvItems(other,ItMi_Plants_Swampherb_01,50);
		CreateInvItems(other,weedpack,1);
		Balor_BotenDay = Wld_GetDay();
		BALOR_CAN_GIVE = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//Я не вижу руду. Пятьдесят кусков и ни куском меньше, понял?
		Info_ClearChoices(DIA_Balor_RipOff);
	};
};

func void dia_balor_telldealer_forgetit2()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//Забудь об этом.
	AI_Output(self,other,"SVM_1_OkayKeepIt");	//Хорошо, как хочешь! Оставь себе!
	Info_ClearChoices(DIA_Balor_RipOff);
};


instance DIA_Balor_Perm(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_Perm_Condition;
	information = DIA_Balor_Perm_Info;
	permanent = 1;
	description = "Что ж, работай хорошо.";
};


func int DIA_Balor_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

func void DIA_Balor_Perm_Info()
{
	AI_Output(other,self,"DIA_Balor_Perm_15_00");	//Что ж, работай хорошо.
	AI_Output(self,other,"DIA_Balor_Perm_01_01");	//Конечно, а что еще, по-твоему, здесь делаю? Валяюсь в болоте?
};


instance BALOR_GETLOST(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = balor_getlost_condition;
	information = balor_getlost_info;
	permanent = 1;
	important = 1;
};


func int balor_getlost_condition()
{
	if(((BALOR_TRADE_COUNT >= 5) || (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void balor_getlost_info()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		AI_Output(self,other,"SVM_1_YouDefeatedNOV_Guard");	//От тебя здесь одни неприятности. Так дальше не может продолжаться!
	}
	else
	{
		AI_Output(self,other,"SVM_1_SuckerDefeatedNov_Guard");	//Думаешь, ты можешь безнаказанно обижать здесь послушников?
	};
	AI_StopProcessInfos(self);
};

