
instance Info_ORG_830_EXIT(C_Info)
{
	npc = Org_830_Organisator;
	nr = 999;
	condition = Info_ORG_830_EXIT_Condition;
	information = Info_ORG_830_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_ORG_830_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_830_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_ORG_830_Hello(C_Info)
{
	npc = Org_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_Hello_Condition;
	information = Info_ORG_830_Hello_Info;
	permanent = 0;
	description = "Привет! Я здесь недавно.";
};


func int Info_ORG_830_Hello_Condition()
{
	return 1;
};

func void Info_ORG_830_Hello_Info()
{
	AI_Output(other,self,"Info_ORG_830_Hello_15_00");	//Привет! Я здесь недавно.
	AI_Output(self,other,"Info_ORG_830_Hello_13_01");	//Ну и что?
};


instance Info_ORG_830_What(C_Info)
{
	npc = Org_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_What_Condition;
	information = Info_ORG_830_What_Info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int Info_ORG_830_What_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_What_Info()
{
	AI_Output(other,self,"Info_ORG_830_What_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"Info_ORG_830_What_13_01");	//Только не думай, что я дам тебе затянуться... ничего не выйдет!	
};


instance Info_ORG_830_Aufhalten(C_Info)
{
	npc = Org_830_Organisator;
	nr = 2;
	condition = Info_ORG_830_Aufhalten_Condition;
	information = Info_ORG_830_Aufhalten_Info;
	permanent = 0;
	description = "И ты даже не попытаешься остановить меня?..";
};


func int Info_ORG_830_Aufhalten_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_Aufhalten_Info()
{
	AI_Output(other,self,"Info_ORG_830_Aufhalten_15_00");	//И ты даже не попытаешься остановить меня? Ну, или спросить о чем-нибудь?
	AI_Output(self,other,"Info_ORG_830_Aufhalten_13_01");	//Нет. Делать мне больше нечего. И потом, такие как ты обычно не доставляют нам неприятностей.
};


instance Info_ORG_830_Perm(C_Info)
{
	npc = Org_830_Organisator;
	nr = 3;
	condition = Info_ORG_830_Perm_Condition;
	information = Info_ORG_830_Perm_Info;
	permanent = 1;
	description = "Как там дела в шахте?";
};


func int Info_ORG_830_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_Perm_Info()
{
	AI_Output(other,self,"Info_ORG_830_Perm_15_00");	//Как там дела в шахте?
	AI_Output(self,other,"Info_ORG_830_Perm_13_01");	//Как обычно - тихо, разве что было несколько драк.
};

