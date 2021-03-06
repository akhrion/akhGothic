
instance DIA_Viran_Exit(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 999;
	condition = DIA_Viran_Exit_Condition;
	information = DIA_Viran_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Viran_Exit_Condition()
{
	return 1;
};

func void DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Viran_What(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_What_Condition;
	information = DIA_Viran_What_Info;
	permanent = 0;
	description = "Что у тебя за работа?";
};


func int DIA_Viran_What_Condition()
{
	return 1;
};

func void DIA_Viran_What_Info()
{
	AI_Output(other,self,"DIA_Viran_What_15_00");	//Что у тебя за работа?
	AI_Output(self,other,"DIA_Viran_What_07_01");	//Собираю болотник. Другие братья обработают его должным образом, и его можно будет курить.
	AI_Output(self,other,"DIA_Viran_What_07_02");	//Болота очень опасны, здесь водятся твари, убивающие всех без разбора, но болотник растет только здесь. Но это только к лучшему.
	AI_Output(other,self,"DIA_Viran_What_15_03");	//Почему?
	AI_Output(self,other,"DIA_Viran_What_07_04");	//Потому что никто из двух других лагерей сюда не заглядывает. Из всех людей в колонии только мы можем добывать болотник.
	AI_Output(self,other,"DIA_Viran_What_07_05");	//Мы продаем его другим лагерям, и сами назначаем цены.
};


instance DIA_Viran_FetchWeed(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_FetchWeed_Condition;
	information = DIA_Viran_FetchWeed_Info;
	permanent = 0;
	description = "Я от Идола Орана. Я должен доставить Кор Галому урожай болотника.";
};


func int DIA_Viran_FetchWeed_Condition()
{
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Viran_FetchWeed_Info()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_15_00");	//Меня прислал Идол Оран. Я должен доставить Кор Галому урожай болотника.
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_01");	//Ты думаешь, все так просто, да?
	AI_Output(self,other,"DIA_Viran_FetchWeed_07_02");	//Так может любой прийти и сказать: 'Меня прислал Идол Оран', а потом не найдешь ни его, ни болотника.
	Info_ClearChoices(DIA_Viran_FetchWeed);
	Info_AddChoice(DIA_Viran_FetchWeed,"Ну сходи и спроси у него сам, если мне не веришь!",DIA_Viran_FetchWeed_GotoHim);
	Info_AddChoice(DIA_Viran_FetchWeed,"Но меня действительно послал Идол Оран!",DIA_Viran_FetchWeed_Really);
};

func void DIA_Viran_FetchWeed_Really()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_Really_15_00");	//Но меня действительно послал Идол Оран!
	AI_Output(self,other,"DIA_Viran_FetchWeed_Really_07_01");	//Ну да, как же.
/*
	if(hero.attribute[ATR_STRENGTH] > 30){};//С виду ты крепок..
	if(hero.attribute[ATR_DEXTERITY] > 30){};//Я видел как ты прыгал по кочкам
*/
	
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output(other,self,"DIA_Viran_FetchWeed_GotoHim_15_00");	//Ну сходи и спроси у него сам, если мне не веришь!
	AI_Output(self,other,"DIA_Viran_FetchWeed_GotoHim_07_01");	//У меня есть идея получше. Ты докажешь, что работаешь на нас, если выполнишь одно маленькое задание!
	Info_ClearChoices(DIA_Viran_FetchWeed);
};


var int Viran_Bloodflies;

instance DIA_Viran_Bloodflies(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Bloodflies_Condition;
	information = DIA_Viran_Bloodflies_Info;
	permanent = 0;
	description = "И что я должен сделать?";
};


func int DIA_Viran_Bloodflies_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

func void DIA_Viran_Bloodflies_Info()
{
	AI_Output(other,self,"DIA_Viran_Bloodflies_15_00");	//И что я должен сделать?
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_01");	//Все очень просто. Как я уже говорил, здесь опасно работать. Но вот чертовы шершни нас совсем извели.
	AI_Output(self,other,"DIA_Viran_Bloodflies_07_02");	//Без них нам было бы гораздо лучше! Теперь тебе все понятно?
	Viran_Bloodflies = LOG_RUNNING;
	B_LogEntry(CH1_DeliverWeed,"Вайран отдаст мне урожай болотника после того, как я убью всех шершней в округе.");
};


var int Viran_BotenDay;

instance DIA_Viran_Running(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Running_Condition;
	information = DIA_Viran_Running_Info;
	permanent = 1;
	description = "Но я не вижу здесь никаких шершней.";
};


func int DIA_Viran_Running_Condition()
{
	if(Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Viran_Running_Info()
{
	AI_Output(other,self,"DIA_Viran_Running_15_00");	//Но я не вижу здесь никаких шершней.
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,Bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self,other) < 2000))
	{
		AI_Output(self,hero,"DIA_Viran_Running_07_00");	//Ну, они летают в десятке метров от нас. Сам посмотри!
		AI_Output(self,hero,"DIA_Viran_Running_07_01");	//Просто так ты не отделаешься!
	}
	else
	{
		AI_Output(self,hero,"DIA_Viran_Running_07_02");	//О, шершней больше нигде не видно. Хорошая работа!
		AI_Output(self,hero,"DIA_Viran_Running_07_03");	//Ее смог бы сделать либо полный идиот, либо один из нас.
		AI_Output(self,hero,"DIA_Viran_Running_07_04");	//А идиоту не хватит ума, чтобы обмануть меня, я прав?
		AI_Output(self,hero,"DIA_Viran_Running_07_05");	//Вот, возьми урожай и отнеси его Кор Галому.
		b_printtrademsg1("Получен болотник (50).");
		AI_Output(self,hero,"DIA_Viran_Running_07_06");	//Если он скажет, что этого слишком мало, предложи ему самому попробовать поработать здесь, тогда-то он узнает, как нам достается болотник.
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
		if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
		{
			B_LogEntry(CH1_DeliverWeed,"Вайран отдал мне вторую половину урожая болотника. Посмотрим, что скажет на это Кор Галом.");
		}
		else
		{
			B_LogEntry(CH1_DeliverWeed,"Вайран дал мне урожай болотника. Его оказалось слишком мало. Мне кажется, он дал мне только половину.");
		};
		B_GiveXP(XP_WeedFromViran);
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Viran_Perm(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	condition = DIA_Viran_Perm_Condition;
	information = DIA_Viran_Perm_Info;
	permanent = 1;
	description = "Как идет сбор урожая?";
};


func int DIA_Viran_Perm_Condition()
{
	if(Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Viran_Perm_Info()
{
	AI_Output(other,self,"DIA_Viran_Perm_15_00");	//Как идет сбор урожая?
	AI_Output(self,other,"DIA_Viran_Perm_07_01");	//Да, да, посмейся. Уверен, что Гуру поручают тебе работу получше, чем у нас.
	AI_Output(self,other,"DIA_Viran_Perm_07_02");	//Ну, я-то все равно не сам здесь гну спину. Для этого есть 'пехота'.
};


instance DIA_Viran_RipOff(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 5;
	condition = DIA_Viran_RipOff_Condition;
	information = DIA_Viran_RipOff_Info;
	permanent = 1;
	description = "Я снова пришел за урожаем для Кор Галома.";
};


func int DIA_Viran_RipOff_Condition()
{
	if((Viran_BotenDay <= (Wld_GetDay() - 1)) && (Viran_Bloodflies == LOG_SUCCESS) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_Viran_RipOff_Info()
{
	if(Viran_BotenDay <= (Wld_GetDay() - 1))
	{
		var int amount; amount = Hlp_Random(50);
		AI_Output(other,self,"DIA_Viran_RipOff_15_00");	//Я снова тут. Где мой болотник поц?
		AI_Output(self,other,"asd");	//Так рано? Мы успели собрать лишь часть.
		b_printtrademsg1(
			ConcatStrings(
				ConcatStrings(
					"Получен болотник (",
					IntToString(amount)
				),
				")."
			)
		);
		CreateInvItems(self,ItMi_Plants_Swampherb_01, amount);
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,amount);
	} else {
		AI_Output(other,self,"DIA_Viran_RipOff_15_00");	//Я снова пришел за урожаем для Кор Галома.
		AI_Output(self,other,"DIA_Viran_RipOff_07_01");	//Как, опять?
		AI_Output(other,self,"DIA_Viran_RipOff_15_02");	//Только не говори мне, что теперь нужно поубивать всех болотожоров в округе, чтобы доказать тебе, что это правда. У меня нет времени.
		AI_Output(self,other,"DIA_Viran_RipOff_07_03");	//Да, ладно! Забирай уж этот чертов болотник!
		b_printtrademsg1("Получен болотник (50).");
		CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
	};
	Viran_BotenDay = Wld_GetDay();
};

