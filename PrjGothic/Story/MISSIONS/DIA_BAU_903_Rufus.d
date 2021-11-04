
instance DIA_Rufus_EXIT(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 999;
	condition = DIA_Rufus_EXIT_Condition;
	information = DIA_Rufus_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Rufus_EXIT_Condition()
{
	return 1;
};

func void DIA_Rufus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Rufus_Wasser(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 800;
	condition = Info_Rufus_Wasser_Condition;
	information = Info_Rufus_Wasser_Info;
	permanent = 1;
	description = "Меня послал Лефти. Я принес воды.";
};


func int Info_Rufus_Wasser_Condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00");	//Меня послал Лефти. Я принес воды.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		b_printtrademsg1("Отдана бутылка воды.");
		AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//Спасибо, приятель. Меня мучит жажда.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00");	//Вода! Эй, парень! Да у тебя же совсем ничего не осталось! Только не говори мне, что ты напоил всех, кроме меня!
	};
};


instance DIA_Rufus_Hello(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Hello_Condition;
	information = DIA_Rufus_Hello_Info;
	permanent = 0;
	description = "Привет!";
};


func int DIA_Rufus_Hello_Condition()
{
	return 1;
};

func void DIA_Rufus_Hello_Info()
{
	if(Kapitel == 1)
	{
		AI_Output(other,self,"DIA_Rufus_Hello_15_00");	//Привет! Я здесь новенький. Вот, хотел узнать, как тут дела?
	}
	else
	{
		AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//Привет! Как дела?
	};
	AI_Output(self,other,"DIA_Rufus_Hello_02_01");	//Спроси кого-нибудь еще, а? Я просто работаю в поле и ничего не знаю.
	AI_Output(self,other,"DIA_Rufus_Hello_02_02");	//Эх, парень, я бы с удовольствием предложил нашему Лорду самому заниматься этой чертовой работой!
};


instance DIA_Rufus_Why(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Why_Condition;
	information = DIA_Rufus_Why_Info;
	permanent = 0;
	description = "Если тебе не нравится такая работа, тогда почему ты здесь?";
};


func int DIA_Rufus_Why_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Why_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Rufus_Why_15_00");	//Если тебе не нравится такая работа, тогда почему согласился работать здесь?
	AI_Output(self,other,"DIA_Rufus_Why_02_01");	//Это случилось в первый же день, после того как я попал сюда. Лефти, один из головорезов Лорда, пришел ко мне и предложил поработать на полях.
	AI_Output(self,other,"DIA_Rufus_Why_02_02");	//Конечно, я согласился. Я был новичком и хотел стать хоть в чем-то полезным.
	AI_Output(self,other,"DIA_Rufus_Why_02_03");	//На следующий день, когда я остановился немного передохнуть, этот тип появился снова.
	AI_Output(self,other,"DIA_Rufus_Why_02_04");	//'Ты же не хочешь, чтобы твои товарищи делали всю работу за тебя, так?' - спросил он.
	AI_Output(self,other,"DIA_Rufus_Why_02_05");	//Я сказал ему, что окончательно вымотался в первый же день, что мне нужен отдых и все такое... Но он даже не слушал.
	AI_Output(self,other,"DIA_Rufus_Why_02_06");	//Просто ухватил меня за воротник и потащил обратно в поле.
	AI_Output(self,other,"DIA_Rufus_Why_02_07");	//С того случая он каждый день поджидал меня возле двери. До тех пор, пока я сам не стал ходить на работу. Не хочу ссориться с этими типами.
	AI_Output(self,other,"DIA_Rufus_Why_02_08");	//Это настоящие головорезы, и лучше держаться от них подальше.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance DIA_Rufus_Ricelord(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 2;
	condition = DIA_Rufus_Ricelord_Condition;
	information = DIA_Rufus_Ricelord_Info;
	permanent = 1;
	description = "Кто он такой, этот Лорд?";
};


func int DIA_Rufus_Ricelord_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Ricelord_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00");	//Кто он такой, этот Лорд?
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01");	//Он появился здесь одним из первых, помог основать лагерь и засеять рисовые поля.
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02");	//Сейчас сидит без дела у себя в амбаре. Старый толстяк, отъелся, как свинья.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_RUFUS_WASSER_NOLEFTY(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 800;
	condition = info_rufus_wasser_nolefty_condition;
	information = info_rufus_wasser_nolefty_info;
	permanent = 1;
	description = "Я принес тебе воды.";
};


func int info_rufus_wasser_nolefty_condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(Npc_HasItems(other,ItFo_Potion_Water_01) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_rufus_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//Я принес тебе воды.
	b_printtrademsg1("Отдана бутылка воды.");
	AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//Спасибо, приятель. Меня мучит жажда.
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,ItFo_Potion_Water_01);
};


instance DIA_RUFUS_HELLO2(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = dia_rufus_hello2_condition;
	information = dia_rufus_hello2_info;
	permanent = 0;
	important = 1;
};


func int dia_rufus_hello2_condition()
{
	var C_Npc Lefty;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(Lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		return 1;
	};
};

func void dia_rufus_hello2_info()
{
	AI_Output(self,other,"SVM_2_HeDeservedIt");	//Он получил по заслугам.
	AI_StopProcessInfos(self);
};

