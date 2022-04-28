
instance DIA_Minecrawler_EXIT(C_Info)
{
	npc = MineCrawler;
	nr = 999;
	condition = DIA_Minecrawler_EXIT_Condition;
	information = DIA_Minecrawler_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Minecrawler_EXIT_Condition()
{
	return 1;
};

func void DIA_Minecrawler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Minecrawler_HELLO(C_Info)
{
	npc = MineCrawler;
	nr = 1;
	condition = DIA_Minecrawler_HELLO_Condition;
	information = DIA_Minecrawler_HELLO_Info;
	permanent = 1;
	important = 0;
	description = "Как дела?";
};

func int DIA_Minecrawler_HELLO_Condition()
{
	return 1;
};

func void DIA_Minecrawler_HELLO_Info()
{
	AI_Output(other,self,"DIA_MinecrawlerQueen_Hello_NULL_04");//Как дела?
	AI_Output(self,other,"DIA_MinecrawlerQueen_Hello_NULL_05");//Пока не родила!
	AI_Output(self,other,"DIA_MinecrawlerQueen_Hello_NULL_06");//А рожу - не сообщу!
};
