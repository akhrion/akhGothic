
instance Info_Vlk_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_3_EXIT_Condition;
	information = Info_Vlk_3_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_3_EinerVonEuchWerden_Condition;
	information = Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Что надо, чтобы присоединиться к этому лагерю?";
};


func int Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00");	//Что надо, чтобы присоединиться к этому лагерю?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01");	//Я простой рудокоп и не так уж много могу рассказать тебе. Поговори лучше с Призраками или стражниками.
};


instance Info_Vlk_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_3_WichtigePersonen_Condition;
	information = Info_Vlk_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int Info_Vlk_3_WichtigePersonen_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01");	//Гомез. Он живет в замке. Но мы видим только его стражников, которые выполняют его приказы.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02");	//Лучше всего, если они тебя вообще не будут замечать. Если ты встанешь у них на пути, у тебя будут проблемы.
};


instance Info_Vlk_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_3_DasLager_Condition;
	information = Info_Vlk_3_DasLager_Info;
	permanent = 1;
	description = "Что интересного есть в этом лагере?";
};


func int Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00");	//Что интересного есть в этом лагере?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01");	//Если тебя привлекают азартные игры, приходи вечером к арене. А если хочешь купить что-нибудь, то сходи на рынок.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02");	//У местных торговцев есть почти все. Разве только карт нет. Но их ты можешь найти у Грехема. Он живет в доме напротив ворот замка.
};


instance Info_Vlk_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_3_DieLage_Condition;
	information = Info_Vlk_3_DieLage_Info;
	permanent = 1;
	description = "Как здесь живется?";
};


func int Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01");	//Очень скоро ты ознакомишься со здешними порядками. Будь всегда начеку. Особенно по ночам.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02");	//Солдаты заставляют нас работать в две смены. Мне уже так долго не удается выспаться как следует.
};

func void B_AssignAmbientInfos_Vlk_3(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

