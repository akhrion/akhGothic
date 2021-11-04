
instance Info_Mine_Org_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_6_EXIT_Condition;
	information = Info_Mine_Org_6_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Mine_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Org_6_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_Mine_Condition;
	information = Info_Mine_Org_6_Mine_Info;
	permanent = 1;
	description = "Как там дела на шахте?";
};


func int Info_Mine_Org_6_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00");	//Как там дела на шахте?
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01");	//В шахте? Сейчас к нам не присылают новых людей. Все, кто там есть, не могут ни выйти, ни зайти.
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02");	//Радуйся, что ты здесь не работаешь.
};


instance Info_Mine_Org_6_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_WichtigePersonen_Condition;
	information = Info_Mine_Org_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Кому ты подчиняешься?";
};


func int Info_Mine_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00");	//Кому ты подчиняешься?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01");	//Я не подчиняюсь никому. Но как я это устроил, не скажу.
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01");	//Как же ты попал на это место?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02");	//Я же сказал, это секрет. А вообще-то это не слишком сложно, если ты вор.
};


instance Info_Mine_Org_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_DieLage_Condition;
	information = Info_Mine_Org_6_DieLage_Info;
	permanent = 1;
	description = "Вижу, ты не перерабатываешь.";
};


func int Info_Mine_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00");	//Вижу, ты не перерабатываешь.
	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01");	//Чтобы я? Работал? Если бы я работал как все, меня бы сюда не посадили, если ты понимаешь, о чем я говорю.
};

func void B_AssignAmbientInfos_Mine_Org_6(var C_Npc slf)
{
	Info_Mine_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);
};

