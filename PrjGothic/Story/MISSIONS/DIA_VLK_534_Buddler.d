
instance DIA_Vlk_534_Exit(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 999;
	condition = DIA_Vlk_534_Exit_Condition;
	information = DIA_Vlk_534_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

func void DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Vlk_534_LeaveMe(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = DIA_Vlk_534_LeaveMe_Condition;
	information = DIA_Vlk_534_LeaveMe_Info;
	permanent = 1;
	description = "Почему ты не в лагере?";
};


func int DIA_Vlk_534_LeaveMe_Condition()
{
	if(Kapitel < 4)
	{
		return 1;
	};
};

func void DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00");	//Почему ты не в лагере?
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01");	//Я жду одного друга из шахты. Он задолжал мне руду.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02");	//А без руды мне нельзя появляться в лагере, потому что я не смогу заплатить стражникам за защиту, и тогда у меня начнутся большие неприятности.
	if(!Npc_KnowsInfo(hero,DIA_Vlk_534_LeaveMe_HowMuchOre_Pay))
	{
		Info_ClearChoices(DIA_Vlk_534_LeaveMe);
		Info_AddChoice(DIA_Vlk_534_LeaveMe,DIALOG_ENDE,DIA_Vlk_534_Exit_Info);
		Info_AddChoice(DIA_Vlk_534_LeaveMe,"Сколько руды тебе надо",DIA_Vlk_534_LeaveMe_HowMuchOre);
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

func void DIA_Vlk_534_LeaveMe_HowMuchOre()
{
	Npc_KnowsInfo_HowMuchOre534 = true;
	AI_Output(hero,self,"DIA_Vlk_534_LeaveMe_HowMuchOre_NULL_01"); //Сколько руды тебе надо?
	AI_Output(self,hero,"DIA_Vlk_534_LeaveMe_HowMuchOre_NULL_02"); //Мм? 10 кусков.
	if(Npc_HasItems(hero,ItMiNugget) > 9)
	{
		Info_ClearChoices(DIA_Vlk_534_LeaveMe);
		Info_AddChoice(DIA_Vlk_534_LeaveMe,DIALOG_ENDE,DIA_Vlk_534_Exit_Info);
		Info_AddChoice(DIA_Vlk_534_LeaveMe,"А у меня есть 10 кусков руды для тебя!",DIA_Vlk_534_LeaveMe_HowMuchOre_Pay_Info);
	};
};

instance DIA_Vlk_534_LeaveMe_HowMuchOre_Pay(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 10;
	condition = DIA_Vlk_534_LeaveMe_HowMuchOre_Pay_Condition;
	information = DIA_Vlk_534_LeaveMe_HowMuchOre_Pay_Info;
	permanent = 0;
	description = "У меня есть 10 кусков руды для тебя!";
};


func int DIA_Vlk_534_LeaveMe_HowMuchOre_Pay_Condition()
{
	if(
		Kapitel < 4
//	&&	Npc_KnowsInfo(hero,DIA_Vlk_534_LeaveMe_HowMuchOre)
	&&	Npc_KnowsInfo_534_HowMuchOre_Pay == false
	&&	Npc_KnowsInfo_HowMuchOre534
	&&	Npc_HasItems(hero,ItMiNugget) > 9
	)
	{
		return 1;
	};
};

func void DIA_Vlk_534_LeaveMe_HowMuchOre_Pay_Info()
{
	Npc_KnowsInfo_534_HowMuchOre_Pay = true;
	AI_Output(hero,self,"DIA_Vlk_534_LeaveMe_HowMuchOre_Pay_NULL_01"); //У меня есть 10 кусков руды для тебя!
	Npc_RemoveInvItems(hero,ItMiNugget,10);
};
