
instance DIA_Snaf_Exit(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 999;
	condition = DIA_Snaf_Exit_Condition;
	information = DIA_Snaf_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Snaf_Exit_Condition()
{
	return 1;
};

func void DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Snaf_Hello(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Hello_Condition;
	information = DIA_Snaf_Hello_Info;
	permanent = 0;
	description = "Как у тебя дела?";
};


func int DIA_Snaf_Hello_Condition()
{
	return 1;
};

func void DIA_Snaf_Hello_Info()
{
	AI_Output(other,self,"DIA_Snaf_Hello_15_00");	//Как у тебя дела?
	AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//Неплохо. Если умеешь хорошо готовить, друзья к тебе сами придут.
	AI_Output(self,other,"DIA_Snaf_Hello_01_02");	//Хочешь попробовать тушеный рис? Вот возьми, и сам убедись, как это вкусно.
	b_printtrademsg1("Получен рис.");
	AI_Output(other,self,"DIA_Snaf_Hello_15_03");	//Спасибо.
	AI_Output(self,other,"DIA_Snaf_Hello_01_04");	//А ты мог бы мне помочь.
	CreateInvItem(self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};


instance DIA_Snaf_Zutaten(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Zutaten_Condition;
	information = DIA_Snaf_Zutaten_Info;
	permanent = 0;
	description = "Что тебе нужно?";
};


func int DIA_Snaf_Zutaten_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

func void DIA_Snaf_Zutaten_Info()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01");	//Думаю, ты любишь вкусно поесть. Я придумал новое блюдо: рагу из мясных жуков а-ля Снэф с рисом и грибами.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02");	//Я дам тебе столько рагу, сколько захочешь, но для его приготовления мне нужно три жука и немного грибов. Пяти должно быть достаточно.
	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01");	//Когда ты выйдешь через южные ворота - там, где разрушенная башня, - ты сразу увидишь поляну, на которой они растут.
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice(DIA_Snaf_Zutaten,"Ты хочешь меня отравить?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice(DIA_Snaf_Zutaten,"Мне нравится идея с рагу.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00");	//Ты хочешь меня отравить?
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01");	//Если не хочешь есть, не ешь. Никто не заставляет. Но может быть, ты все же попробуешь? Если достанешь все, что мне нужно, приходи.
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02");	//Я уже просил кого-то сходить за грибами, но он так и не вернулся. Наверное, ушел в Новый лагерь.
	Snaf_Zutaten = LOG_RUNNING;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Повар Снэф из Старого лагеря попросил меня найти для него трех мясных жуков и пять адских грибов. Он хочет приготовить новое блюдо.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00");	//Мне нравится идея с рагу.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01");	//Тогда постарайся достать мне нужные ингредиенты.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02");	//Тот, кого я в последний раз отправлял за ними, так и не вернулся. Наверное, ушел в Новый лагерь.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Повар Снэф из Старого лагеря попросил меня найти для него трех мясных жуков и пять адских грибов. Он хочет приготовить новое блюдо. Я тоже смогу его попробовать.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};


instance DIA_Snaf_ZutatenSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_ZutatenSuccess_Condition;
	information = DIA_Snaf_ZutatenSuccess_Info;
	permanent = 0;
	description = "Я достал все ингредиенты, посмотри.";
};


func int DIA_Snaf_ZutatenSuccess_Condition()
{
	if(
		(Snaf_Zutaten == LOG_RUNNING) &&
		(Npc_HasItems(other,ItFo_Plants_mushroom_01) >= 5) &&
		((Npc_HasItems(other,ItAt_Meatbug_01) + (Npc_HasItems(other,ItAt_Meatbug_02))) >= 3)
	)
	{
		return 1;
	};
};

func void akh_RemoveItAtMeatbug(var int a_)
{
	var int a1;
	a1 = Npc_HasItems(other,ItAt_Meatbug_01);
	if(a1 >= a_)
	{
		Npc_RemoveInvItems(hero,ItAt_Meatbug_01,a_);
	}
	else
	{
		Npc_RemoveInvItems(hero,ItAt_Meatbug_01,a1);
		Npc_RemoveInvItems(hero,ItAt_Meatbug_02,a_ - a1);
	};
};
var int Snaf_RagoutDay;
func void DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Я достал все ингредиенты, посмотри.
	b_printtrademsg1("Отданы адские грибы и мясо жуков.");
	Npc_RemoveInvItems(hero,ItFo_Plants_mushroom_01,5);
	akh_RemoveItAtMeatbug(3);
	if(Wld_IsTime(8,0,22,0) && (Npc_GetDistToWP(self,"OCR_CAULDRON_2") < 230))
	{
		AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01");	//Хорошо! Теперь их нужно положить в котел, и рагу будет готово... Вот так...
		AI_UseMob(self,"CAULDRON",1);
		AI_Wait(self,2);
		AI_UseMob(self,"CAULDRON",-1);
		AI_Output(self,other,"DIA_Snaf_Hello_01_02_01");	//Вот возьми, и сам убедись, как это вкусно.
		b_printtrademsg2("Получено рагу из жуков.");
		CreateInvItems(hero,ItFoMeatbugragout,1);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//Неплохо. Если умеешь хорошо готовить, друзья к тебе сами придут.
		Snaf_RagoutDay = Wld_GetDay();
	};
	Snaf_Zutaten = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_SUCCESS);
	B_LogEntry(CH1_SnafsRecipe,"Снэф остался доволен тем, что я принес ему необходимые ингредиенты.");
	if(Snaf_FreeMBRagout == TRUE)
	{
		B_LogEntry(CH1_SnafsRecipe,"Теперь я смогу каждый день получать у него порцию рагу из мясных жуков.");
	};
	B_GiveXP(100);
	AI_StopProcessInfos(self);
};


instance DIA_Snaf_AfterSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_AfterSuccess_Condition;
	information = DIA_Snaf_AfterSuccess_Info;
	permanent = 1;
	description = "Ты говорил, что я могу взять столько порций, сколько захочу...";
};


func int DIA_Snaf_AfterSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_SUCCESS) && (Snaf_FreeMBRagout == TRUE))
	{
		return 1;
	};
};

func void DIA_Snaf_AfterSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00");	//Ты говорил, что я могу взять столько порций, сколько захочу...
	if(Snaf_RagoutDay != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01");	//Да, так и есть. Вот, возьми три порции.
		b_printtrademsg1("Получено 3 порции рагу из жуков.");
		CreateInvItems(self,ItFoMeatbugragout,3);
		B_GiveInvItems(self,other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02");	//Конечно! Но сегодняшнее рагу закончилось. Приходи завтра.
	};
};


instance DIA_Snaf_WhereMeatbugs(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = DIA_Snaf_WhereMeatbugs_Condition;
	information = DIA_Snaf_WhereMeatbugs_Info;
	permanent = 0;
	description = "Ты знаешь, где найти жуков?";
};


func int DIA_Snaf_WhereMeatbugs_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00");	//Ты знаешь, где найти жуков?
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01");	//Там, где много мусора. Возле стен лагеря есть несколько заброшенных домов, может быть, там ты что-нибудь найдешь.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02");	//На первый взгляд они кажутся несъедобными, но это обманчивое впечатление. Из них получается отличное рагу.
	B_LogEntry(CH1_SnafsRecipe,"Мясных жуков можно найти в заброшенных домах у стен замка.");
};


instance DIA_Snaf_WhereNek(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 5;
	condition = DIA_Snaf_WhereNek_Condition;
	information = DIA_Snaf_WhereNek_Info;
	permanent = 0;
	description = "А как звали того, кого ты посылал за грибами до меня?";
};


func int DIA_Snaf_WhereNek_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereNek_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00");	//А как звали того, кого ты посылал за грибами до меня?
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01");	//Нек. Ему здесь не очень нравилось. Думаю, он уже сидит где-нибудь в Новом лагере.
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02");	//Я посылал его за грибами, но он так и не вернулся...
	if((Sly_LostNek != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
		Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
		B_LogEntry(CH1_LostNek,"Повар Снэф послал Нека за грибами. После этого он его ни разу не видел.");
	};
};

