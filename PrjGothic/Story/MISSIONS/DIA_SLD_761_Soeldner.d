
instance DIA_SLD_761_Soeldner_INTRO(C_Info)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_761_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};


func int DIA_SLD_761_Soeldner_INTRO_CONDITION()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_INTRO_INFO()
{
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01");	//Что ты здесь делаешь?
};


instance DIA_SLD_761_Soeldner_EXIT_1(C_Info)
{
	nr = 999;
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_761_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
	description = "Думаю, у меня есть более важные дела.";
};


func int DIA_SLD_761_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_EXIT_1_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01");	//Думаю, у меня есть более важные дела.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");	//Я тоже так думаю.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_761_Soeldner_EXIT_2(C_Info)
{
	nr = 999;
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_761_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
	description = "Лучше я пойду отсюда...";
};


func int DIA_SLD_761_Soeldner_EXIT_2_CONDITION()
{
	if(Npc_KnowsInfo(hero,DIA_SLD_761_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_EXIT_2_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01");	//Лучше я пойду отсюда...
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");	//Хорошо.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_761_Soeldner_UMSEHEN(C_Info)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_761_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
	description = "Я просто хотел посмотреть лагерь.";
};


func int DIA_SLD_761_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_UMSEHEN_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01");	//Я просто хотел посмотреть лагерь.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");	//Это не место для прогулок, а вход в шахту. Посторонним сюда нельзя.
};


instance DIA_SLD_761_Soeldner_INMINE(C_Info)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_761_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
	description = "Я просто хотел осмотреть шахту.";
};


func int DIA_SLD_761_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_INMINE_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");	//Я просто хотел осмотреть шахту.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");	//Ты же видишь, что шахта закрыта. Тебе здесь не место.
};


instance DIA_SLD_761_Soeldner_Bribe(C_Info)
{
	npc = SLD_761_Soeldner;
	condition = DIA_SLD_761_Soeldner_Bribe_CONDITION;
	information = DIA_SLD_761_Soeldner_Bribe_INFO;
	important = 0;
	permanent = 0;
	description = "Значит, ничего нельзя сделать?";
};


func int DIA_SLD_761_Soeldner_Bribe_CONDITION()
{
	if(Npc_KnowsInfo(hero,DIA_SLD_761_Soeldner_INMINE))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_Bribe_INFO()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");	//Значит, ничего нельзя сделать?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");	//А что тут можно сделать?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");	//Постой-ка! Если ты думаешь меня подкупить, то у тебя ничего не выйдет.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");	//Да я и не думал подкупать тебя, я просто подумал...
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");	//Лучше мне уйти отсюда.
	AI_StopProcessInfos(self);
};

