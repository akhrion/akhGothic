
instance Info_GornFM_EXIT(C_Info)
{
	npc = PC_FighterFM;
	nr = 999;
	condition = Info_GornFM_EXIT_Condition;
	information = Info_GornFM_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GornFM_EXIT_Condition()
{
	return 1;
};

func void Info_GornFM_EXIT_Info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,other,"Info_GornFM_EXIT_09_01");	//Оружие к бою!
	}
	else
	{
		AI_Output(self,other,"Info_GornFM_EXIT_09_02");	//До встречи.
	};
	AI_StopProcessInfos(self);
};


instance Info_GornFM_WAIT(C_Info)
{
	npc = PC_FighterFM;
	condition = Info_GornFM_WAIT_Condition;
	information = Info_GornFM_WAIT_Info;
	important = 0;
	permanent = 1;
	description = "Постой здесь, а я посмотрю, что там происходит!";
};


func int Info_GornFM_WAIT_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void Info_GornFM_WAIT_Info()
{
	AI_Output(hero,self,"Info_GornFM_WAIT_15_01");	//Постой здесь, а я посмотрю, что там происходит!
	AI_Output(self,hero,"Info_GornFM_WAIT_09_02");	//Хорошо. Я буду ждать тебя у входа в шахту и прослежу за тем, чтобы на тебя не напали сзади!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"wait");
};


instance Info_GornFM_FOLLOW(C_Info)
{
	npc = PC_FighterFM;
	condition = Info_GornFM_FOLLOW_Condition;
	information = Info_GornFM_FOLLOW_Info;
	important = 0;
	permanent = 1;
	description = "Пойдем со мной, мне нужна твоя помощь.";
};


func int Info_GornFM_FOLLOW_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void Info_GornFM_FOLLOW_Info()
{
	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01");	//Пойдем со мной, мне нужна твоя помощь.
	AI_Output(self,hero,"Info_GornFM_FOLLOW_09_02");	//Наконец-то! Иди вперед, а я пойду следом.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"follow");
};

