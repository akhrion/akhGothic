
instance DIA_MinecrawlerQueen_EXIT(C_Info)
{
	npc = MinecrawlerQueen;
	nr = 999;
	condition = DIA_MinecrawlerQueen_EXIT_Condition;
	information = DIA_MinecrawlerQueen_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_MinecrawlerQueen_EXIT_Condition()
{
	return 1;
};

func void DIA_MinecrawlerQueen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_MinecrawlerQueen_HELLO(C_Info)
{
	npc = MinecrawlerQueen;
	nr = 1;
	condition = DIA_MinecrawlerQueen_HELLO_Condition;
	information = DIA_MinecrawlerQueen_HELLO_Info;
	permanent = 0;
	important = 1;
	description = "Здравствуй. Кто ты?";
};

func int DIA_MinecrawlerQueen_HELLO_Condition()
{
	return 1;
};

func void DIA_MinecrawlerQueen_HELLO_Info()
{
	AI_Output(other,self,"DIA_MinecrawlerQueen_Hello_NULL_01");//Здравствуй. Кто ты?
	AI_Output(self,other,"DIA_MinecrawlerQueen_Hello_NULL_02");//Я та, чьих детей ты видел ранее.
	AI_Output(self,other,"DIA_MinecrawlerQueen_Hello_NULL_03");//Я та, чьих детей ты не убил. Скажи.. почему?
};
