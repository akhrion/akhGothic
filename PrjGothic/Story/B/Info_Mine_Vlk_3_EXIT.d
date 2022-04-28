
instance Info_Mine_Vlk_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Vlk_3_EXIT_Condition;
	information = Info_Mine_Vlk_3_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Mine_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Vlk_3_Mine(C_Info)
{
	nr = 4;
	condition = Info_Mine_Vlk_3_Mine_Condition;
	information = Info_Mine_Vlk_3_Mine_Info;
	permanent = 1;
	description = "Расскажи мне о шахте.";
};


func int Info_Mine_Vlk_3_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00");	//Расскажи мне о шахте.
	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01");	//Все мы должны работать. Без отдыха, без солнца. У нас нет шансов выбраться отсюда. Только смерть прекратит наши мучения.
};


instance Info_Mine_Vlk_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Vlk_3_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int Info_Mine_Vlk_3_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01");	//В шахте всем заправляет Ян. Во главе стражи стоит Асгхан.
};


instance Info_Mine_Vlk_3_Minecrawler(C_Info)
{
	nr = 2;
	condition = Info_Mine_Vlk_3_Minecrawler_Condition;
	information = Info_Mine_Vlk_3_Minecrawler_Info;
	permanent = 1;
	description = "Что ты знаешь о ползунах?";
};


func int Info_Mine_Vlk_3_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00");	//Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01");	//Как вести себя при встрече с ползунами? Бежать. Бежать изо всех сил. И тогда быть может, ты сможешь уцелеть.
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02");	//Но если потеряешься, никто не придет к тебе на помощь, никто и не заметит твоего исчезновения.
};


instance Info_Mine_Vlk_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Vlk_3_DieLage_Condition;
	information = Info_Mine_Vlk_3_DieLage_Info;
	permanent = 1;
	description = "Как жизнь?";
};


func int Info_Mine_Vlk_3_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01");	//Что ж, у меня болит спина, руки отваливаются, меня мучает жажда и вообще, я смертельно устал.
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02");	//И еще эта монотонная работа, которая скоро сведет меня с ума.
};

func void B_AssignAmbientInfos_Mine_Vlk_3(var C_Npc slf)
{
	Info_Mine_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

