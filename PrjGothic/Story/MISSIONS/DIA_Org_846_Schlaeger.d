
instance DIA_846_Exit(C_Info)
{
	npc = Org_846_Schlaeger;
	nr = 999;
	condition = DIA_846_Exit_Condition;
	information = DIA_846_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_846_Exit_Condition()
{
	return 1;
};

func void DIA_846_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_846_Hello(C_Info)
{
	npc = Org_846_Schlaeger;
	nr = 1;
	condition = DIA_846_Hello_Condition;
	information = DIA_846_Hello_Info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int DIA_846_Hello_Condition()
{
	return 1;
};

func void DIA_846_Hello_Info()
{
	var C_Npc Lefty;
	AI_Output(other,self,"DIA_846_Hello_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_846_Hello_07_01");	//Я работаю на Лорда.
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	if(!Npc_IsDead(Lefty))
	{
		AI_Output(self,other,"DIA_846_Hello_07_02");	//Если тебе нужна работа, поговори с Лефти.
	};
};

