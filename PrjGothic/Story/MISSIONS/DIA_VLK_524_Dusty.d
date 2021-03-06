
instance DIA_Dusty_Exit(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 999;
	condition = DIA_Dusty_Exit_Condition;
	information = DIA_Dusty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Dusty_Exit_Condition()
{
	return 1;
};

func void DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dusty_Hello(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_Hello_Condition;
	information = DIA_Dusty_Hello_Info;
	permanent = 0;
	description = "Привет! Как дела?";
};


func int DIA_Dusty_Hello_Condition()
{
	if(Kapitel < 4)
	{
		return 1;
	};
};

func void DIA_Dusty_Hello_Info()
{
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//Привет! Как дела?
	AI_Output(self,other,"DIA_Dusty_Hello_03_01");	//Ах, и не спрашивай! Две недели я гнул спину в шахте. И что я получил?
	AI_Output(self,other,"DIA_Dusty_Hello_03_02");	//Несколько жалких кусков руды, на которые даже нормальную еду не купишь!
	AI_Output(self,other,"DIA_Dusty_Hello_03_03");	//Я разговаривал с Идолом Парвезом внизу. Он рассказал мне кое-что интересное о Лагере сектантов.
	AI_Output(self,other,"DIA_Dusty_Hello_03_04");	//Думаю, лучше уж присоединиться к ним, чем до конца жизни быть рабом Гомеза.
};


instance DIA_Dusty_WhyNotLeave(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_WhyNotLeave_Condition;
	information = DIA_Dusty_WhyNotLeave_Info;
	permanent = 0;
	description = "Если тебе здесь не нравится, почему ты не уйдешь?";
};


func int DIA_Dusty_WhyNotLeave_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_Hello) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output(other,self,"DIA_Dusty_WhyNotLeave_15_00");	//Если тебе здесь не нравится, почему ты не уйдешь?
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_01");	//Я не уверен, что мне там действительно будет лучше. У меня был здесь друг. Его звали Мелвин. Неделю назад он ушел в Лагерь сектантов.
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_02");	//Но с тех пор я ничего о нем не слышал. Если так и дальше будет продолжаться, я лучше останусь здесь.
	GETNEWGUY_STARTED = TRUE;
	Log_CreateTopic(CH1_RecruitDusty,LOG_MISSION);
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_RUNNING);
	B_LogEntry(CH1_RecruitDusty,"Дасти, рудокоп из Старого лагеря, недоволен своей жизнью. Он раздумывает над тем, не присоединиться ли ему к лагерю Братства.");
	if(!Npc_KnowsInfo(hero,DIA_Melvin_Hello))
	{
		B_LogEntry(CH1_RecruitDusty,"Мне следует поискать друга Дасти, Мелвина. Он ушел в лагерь на болоте неделю назад.");
	};
};


instance DIA_Dusty_MetMelvin(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_MetMelvin_Condition;
	information = DIA_Dusty_MetMelvin_Info;
	permanent = 0;
	description = "Я был в лагере Сектантов и встретил там Мелвина.";
};


func int DIA_Dusty_MetMelvin_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_WhyNotLeave) && Npc_KnowsInfo(hero,DIA_Melvin_Hello) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_MetMelvin_Info()
{
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_00");	//Я был в Лагере сектантов и встретил там Мелвина.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_01");	//Правда? Он передал мне что-нибудь?
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_02");	//Говорит, что там гораздо лучше, никто не пинает, не кричит.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_03");	//Эй! И он там отдыхает без меня? Я тоже хочу туда пойти. Но меня из этого лагеря никто не выпустит.
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_04");	//Вот как? Почему?
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_05");	//Стражники быстро узнали, что я собираюсь уйти отсюда. Мне не стоило так много болтать об этом.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_06");	//Чтобы они меня пропустили, нужно заплатить им не меньше 100 кусков руды.
};


instance DIA_Dusty_Offer100Ore(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_Offer100Ore_Condition;
	information = DIA_Dusty_Offer100Ore_Info;
	permanent = 0;
	description = "А если я дам тебе сто кусков, ты сможешь уйти из этого лагеря?";
};


func int DIA_Dusty_Offer100Ore_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_Offer100Ore_Info()
{
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_00");	//А если я дам тебе сто кусков, ты сможешь уйти из этого лагеря?
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_01");	//И ты сделаешь это? Почему?
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_02");	//Ну, скажем так, не ты один хотел бы видеть себя одним из братьев в Лагере сектантов.
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_03");	//Ты хочешь сказать, что ты пойдешь вместе со мной?
};


instance DIA_Dusty_IWouldGo(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_IWouldGo_Condition;
	information = DIA_Dusty_IWouldGo_Info;
	permanent = 0;
	description = "Я не просто хочу, а пойду вместе с тобой.";
};


func int DIA_Dusty_IWouldGo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_Offer100Ore) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_IWouldGo_Info()
{
	AI_Output(other,self,"DIA_Dusty_IWouldGo_15_00");	//Я не просто хочу, а пойду вместе с тобой.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_01");	//Ты меня обрадовал. Мы пойдем, как только ты будешь готов.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_02");	//Не забудь только, что нужно приготовить 100 кусков руды для стражников.
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_Loyality))
	{
		B_LogEntry(CH1_RecruitDusty,"Я смог уговорить рудокопа Дасти пойти со мной в Болотный лагерь. Мне придется подкупить стражников, чтобы они нас пропустили. Лучше всего отвести его прямо к Идолу Тондралу.");
	}
	else
	{
		B_LogEntry(CH1_RecruitDusty,"Я смог уговорить рудокопа Дасти пойти со мной в Болотный лагерь. Мне придется подкупить стражников, чтобы они нас пропустили. Лучше всего отвести его прямо к Мелвину.");
	};
	B_GiveXP(XP_DustyJoined);
};


var int Dusty_LetsGo;

instance DIA_Dusty_LetsGo(C_Info)
{
	npc = VLK_524_Dusty;
	nr = 1;
	condition = DIA_Dusty_LetsGo_Condition;
	information = DIA_Dusty_LetsGo_Info;
	permanent = 1;
	description = "Я готов. Пойдем!";
};


func int DIA_Dusty_LetsGo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dusty_IWouldGo) && (GETNEWGUY_DUSTY_MOVING == FALSE) && (Kapitel < 4))
	{
		return 1;
	};
};

func void DIA_Dusty_LetsGo_Info()
{
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_00");	//Я готов. Пойдем!
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_01");	//Хорошо, мы пойдем через южные ворота. Через северные нам не пройти, там стражники не берут взяток.
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_02");	//И лучше всего, если руду предложишь им ты - у меня нет опыта в подобных делах.
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03");	//Ладно. Пойдем.
	GETNEWGUY_DUSTY_MOVING = TRUE;
	if(GETNEWGUY_DUSTY_STOPPED == FALSE)
	{
		B_LogEntry(CH1_RecruitDusty,"Дасти посоветовал мне не ходить к северным воротам. Стражники у южных ворот гораздо лучше относятся к людям с рудой.");
	};
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
	AI_StopProcessInfos(self);
};


instance DIA_DUSTY_BYE(C_Info)
{
	npc = VLK_524_Dusty;
	condition = dia_dusty_bye_condition;
	information = dia_dusty_bye_info;
	permanent = 0;
	important = 1;
};


func int dia_dusty_bye_condition()
{
	if(Npc_GetTrueGuild(self) == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_dusty_bye_info()
{
	AI_Output(self,other,"DIA_Dusty_Hello_03_04");	//Думаю, лучше уж присоединиться к ним, чем до конца жизни быть рабом Гомеза.
	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01");	//Желаю удачи!
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_DustySuccess))
	{
		Npc_ExchangeRoutine(self,"PREPARERITUAL");
	}
	else
	{
		Npc_ExchangeRoutine(self,"PREPARERITUAL2");
	};
	AI_StopProcessInfos(self);
};

