
instance DIA_Jeremiah_EXIT(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 999;
	condition = DIA_Jeremiah_EXIT_Condition;
	information = DIA_Jeremiah_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

func void DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jeremiah_Hallo(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_Hallo_Condition;
	information = DIA_Jeremiah_Hallo_Info;
	permanent = 0;
	description = "Что ты делаешь?";
};


func int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

func void DIA_Jeremiah_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00");	//Что ты делаешь?
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//Я готовлю шнапс из риса.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//Вот, возьми бутылку. Только не говори об этом Силасу.
	b_printtrademsg1("Получен шнапс.");
	CreateInvItems(self,ItFoBooze,1);
	B_GiveInvItems(self,other,ItFoBooze,1);
};


var int Jeremiah_Bauer;

instance DIA_Jeremiah_PERM(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_PERM_Condition;
	information = DIA_Jeremiah_PERM_Info;
	permanent = 1;
	description = "И как идет приготовление?";
};


func int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

func void DIA_Jeremiah_PERM_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00");	//И как идет приготовление?
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//Я не успеваю готовить столько шнапса, сколько пьют все эти типы. А пьют они очень много, поверь мне.
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//Но и это хорошо. Пока я здесь работаю, прислужники Лорда мне не мешают.
	Jeremiah_Bauer = TRUE;
};


instance DIA_Jeremiah_Horatio(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = DIA_Jeremiah_Horatio_Condition;
	information = DIA_Jeremiah_Horatio_Info;
	permanent = 0;
	description = "Что ты знаешь о Лорде?";
};


func int DIA_Jeremiah_Horatio_Condition()
{
	if(Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

func void DIA_Jeremiah_Horatio_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//Что ты знаешь о Лорде?
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//Он самый гнусный тип из всех, кого я знаю. Его приспешники выискивают самых слабых и заставляют их работать на рисовых полях.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//Единственный, кто мог бы справиться с ним, это Горацио. Но он давно отказался от насилия.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//Я слышал, как он говорил, что мог бы с удовольствием избавиться от Лорда. Но он этого никогда не сделает.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//Это против его убеждений.
};

