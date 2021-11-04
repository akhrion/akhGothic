
instance Info_Mine_Vlk_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Vlk_4_EXIT_Condition;
	information = Info_Mine_Vlk_4_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Mine_Vlk_4_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Vlk_4_Mine(C_Info)
{
	nr = 4;
	condition = Info_Mine_Vlk_4_Mine_Condition;
	information = Info_Mine_Vlk_4_Mine_Info;
	permanent = 1;
	description = "Расскажи мне о жизни в шахте.";
};


func int Info_Mine_Vlk_4_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_4_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00");	//Расскажи мне о жизни в шахте.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01");	//Рудокопы здесь работают как проклятые. Вот и весь рассказ. А ты пришел и скоро уйдешь, не зная, что это такое.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02");	//...А когда ты будешь разгуливать по лагерю, я здесь все равно буду махать киркой, добывая руду. Такая уж у меня работа. И жизнь такая.
};


instance Info_Mine_Vlk_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Vlk_4_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_4_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int Info_Mine_Vlk_4_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01");	//Сантино и Альберто, можно сказать. Они меняют руду, которую мы добываем, на товары. Они же раздают нам дневной паек.
};


instance Info_Mine_Vlk_4_Minecrawler(C_Info)
{
	nr = 2;
	condition = Info_Mine_Vlk_4_Minecrawler_Condition;
	information = Info_Mine_Vlk_4_Minecrawler_Info;
	permanent = 1;
	description = "Что ты знаешь о ползунах?";
};


func int Info_Mine_Vlk_4_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_4_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00");	//Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01");	//Если ты встретишь одного из них, врежь ему как следует киркой по голове. Но если не попадешь с первого раза, второго шанса он тебе не даст.
};


instance Info_Mine_Vlk_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Vlk_4_DieLage_Condition;
	information = Info_Mine_Vlk_4_DieLage_Info;
	permanent = 1;
	description = "Как дела?";
};


func int Info_Mine_Vlk_4_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01");	//Бывало и лучше.
};

func void B_AssignAmbientInfos_Mine_Vlk_4(var C_Npc slf)
{
	Info_Mine_Vlk_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_DieLage.npc = Hlp_GetInstanceID(slf);
};

