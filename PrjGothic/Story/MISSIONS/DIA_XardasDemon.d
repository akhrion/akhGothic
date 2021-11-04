
instance Info_XardasDemon_EXIT(C_Info)
{
	npc = XardasDemon;
	nr = 999;
	condition = Info_XardasDemon_EXIT_Condition;
	information = Info_XardasDemon_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_XardasDemon_EXIT_Condition()
{
	return 1;
};

func void Info_XardasDemon_EXIT_Info()
{
	AI_Output(self,other,"DEM_AMBIENT02");	//
	AI_Output(hero,self,"Info_Saturas_EXIT_15_01");	//... Я?.. Смертный?.. Я уже ухожу!
	AI_StopProcessInfos(self);
};


instance Info_XardasDemon_INTRO(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_INTRO_Condition;
	information = Info_XardasDemon_INTRO_Info;
	permanent = 0;
	important = 1;
};


func int Info_XardasDemon_INTRO_Condition()
{
	if(FindXardas)
	{
		return TRUE;
	};
};

func void Info_XardasDemon_INTRO_Info()
{
	Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL",self,self,3,0,DAM_FIRE,TRUE);
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	AI_PlayAni(self,"T_SPAWN");
	AI_TurnAway(hero,self);
	AI_PlayAni(hero,"T_SEARCH");
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_01");	//Так... Кто... Кто это говорит?
	AI_WhirlAround(hero,self);
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_02");	//Так это ты со мной говоришь? А как... а почему твой голос звучит только в моей голове?
	AI_Output(self,other,"DEM_AMBIENT02");	//
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_03");	//Кто ты?.. простой слуга своего хозяина?
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_04");	//Мне кажется, ты - одно из порождений бога Тьмы!
	AI_Output(self,other,"DEM_AMBIENT03");	//
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_05");	//Мне замолчать?
};


instance Info_XardasDemon_MASTERWHO(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_MASTERWHO_Condition;
	information = Info_XardasDemon_MASTERWHO_Info;
	permanent = 0;
	important = 0;
	description = "А твой хозяин, случайно, не Ксардас?";
};


func int Info_XardasDemon_MASTERWHO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_INTRO))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_MASTERWHO_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_01");	//А твой хозяин, случайно, не Ксардас?
	AI_Output(self,other,"DEM_AMBIENT04");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_02");	//Ах, так... имена не имеют значения... ладно.
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_03");	//Просто мне сказали, что где-то здесь должна быть башня Ксардаса. По-моему, это она и есть.
};


instance Info_XardasDemon_MASTERHOW(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_MASTERHOW_Condition;
	information = Info_XardasDemon_MASTERHOW_Info;
	permanent = 0;
	important = 0;
	description = "Я хочу поговорить с твоим хозяином!";
};


func int Info_XardasDemon_MASTERHOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERWHO))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_MASTERHOW_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_01");	//Я хочу поговорить с твоим хозяином!
	AI_Output(self,other,"DEM_AMBIENT03");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_02");	//Я?.. Недостоин?.. А что за испытание?..
	AI_Output(self,other,"DEM_AMBIENT01");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_03");	//... А-а... Понимаю... если кто-то хочет поговорить с твоим хозяином, он должен доказать, что он этого достоин!
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_04");	//... Подожди, как ты сказал?.. Доказательство?.. Какая-то победа?.. Над стихиями?
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_05");	//... Камень?.. Лед?.. Огонь?
	FindGolemHearts = 1;
	B_LogEntry(CH4_FindXardas,"В башне Ксардаса меня встретил демон, который говорил со мной, передавая мне свои мысли. Он хочет получить три доказательства победы над стихиями огня, льда и камня, перед тем как я смогу попасть к его хозяину.");
};


instance Info_XardasDemon_NOHEART(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_NOHEART_Condition;
	information = Info_XardasDemon_NOHEART_Info;
	permanent = 1;
	important = 0;
	description = "Я не понимаю! Загадки какие-то.";
};


func int Info_XardasDemon_NOHEART_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW) && !Npc_HasItems(hero,ItAt_StoneGolem_01) && !Npc_HasItems(hero,ItAt_IceGolem_01) && !Npc_HasItems(hero,ItAt_FireGolem_01) && (FindGolemHearts < 4))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_NOHEART_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_01");	//Я не понимаю! Загадки какие-то.
	AI_Output(self,other,"DEM_AMBIENT04");	//
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_02");	//... Это я уже слышал, зачем ты это повторяешь?..
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_03");	//... А, так тебе нужны доказательства победы над стихиями Огня, Льда и Камня!
};

func void B_XardasDemon_GiveHeart()
{
	if(FindGolemHearts == 1)
	{
		AI_Output(self,other,"DEM_AMBIENT02");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_01");	//... Что? А-а!.. Убедительное доказательство!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_02");	//...Отсутствуют? Двух еще нет?
		FindGolemHearts = 2;
	}
	else if(FindGolemHearts == 2)
	{
		AI_Output(self,other,"DEM_AMBIENT01");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_03");	//... Второе доказательство?.. Теперь у тебя их два?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_04");	//... Не хватает еще одного?
		FindGolemHearts = 3;
	}
	else if(FindGolemHearts == 3)
	{
		AI_Output(self,other,"DEM_WARN01");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_05");	//... Совершенство?.. Я достоин?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_06");	//Если это так, то я хочу поговорить с твоим хозяином!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_07");	//... Опровержение?.. Опровержение чего?.. Руна?.. Ты дашь мне руну?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_08");	//Тогда я возьму эту руну телепортации в знак того, что я прошел испытание!
		b_printtrademsg1("Получена руна телепортации к некроманту.");
		B_Story_AccessToXardas();
	};
};


instance Info_XardasDemon_STONEHEART(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_STONEHEART_Condition;
	information = Info_XardasDemon_STONEHEART_Info;
	permanent = 0;
	important = 0;
	description = "У меня есть сердце каменного голема!";
};


func int Info_XardasDemon_STONEHEART_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW) && Npc_HasItems(hero,ItAt_StoneGolem_01))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_STONEHEART_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_STONEHEART_15_01");	//У меня есть сердце каменного голема!
	b_printtrademsg1("Отдано сердце каменного голема.");
	B_GiveInvItems(hero,self,ItAt_StoneGolem_01,1);
	Npc_RemoveInvItem(self,ItAt_StoneGolem_01);
	B_XardasDemon_GiveHeart();
};


instance Info_XardasDemon_ICEHEART(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_ICEHEART_Condition;
	information = Info_XardasDemon_ICEHEART_Info;
	permanent = 0;
	important = 0;
	description = "Вот второе доказательство - сердце ледяного голема!";
};


func int Info_XardasDemon_ICEHEART_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW) && Npc_HasItems(hero,ItAt_IceGolem_01))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_ICEHEART_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_ICEHEART_15_01");	//Вот второе доказательство - сердце ледяного голема!
	b_printtrademsg1("Отдано сердце ледяного голема.");
	B_GiveInvItems(hero,self,ItAt_IceGolem_01,1);
	B_XardasDemon_GiveHeart();
};


instance Info_XardasDemon_FIREHEART(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_FIREHEART_Condition;
	information = Info_XardasDemon_FIREHEART_Info;
	permanent = 0;
	important = 0;
	description = "Сердце огненного голема - убедительное доказательство?";
};


func int Info_XardasDemon_FIREHEART_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW) && Npc_HasItems(hero,ItAt_FireGolem_01))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_FIREHEART_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_FIREHEART_15_01");	//Сердце огненного голема - убедительное доказательство?
	b_printtrademsg1("Отдано сердце огненного голема.");
	B_GiveInvItems(hero,self,ItAt_FireGolem_01,1);
	B_XardasDemon_GiveHeart();
};

