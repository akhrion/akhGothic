
instance DIA_Herek_Exit(C_Info)
{
	npc = VLK_511_Herek;
	nr = 999;
	condition = DIA_Herek_Exit_Condition;
	information = DIA_Herek_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Herek_Exit_Condition()
{
	return 1;
};

func void DIA_Herek_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Herek_Bully(C_Info)
{
	npc = VLK_511_Herek;
	nr = 2;
	condition = DIA_Herek_Bully_Condition;
	information = DIA_Herek_Bully_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Herek_Bully_Condition()
{
	if(Herek_ProtectionBully == TRUE)
	{
		return 1;
	};
};

func void DIA_Herek_Bully_Info()
{
	AI_Output(self,other,"DIA_Herek_Bully_01_00");	//Эй, подожди! Я слышал, что ты разговаривал с Бладвином.
	AI_Output(other,self,"DIA_Herek_Bully_15_01");	//Ну и что?
	AI_Output(self,other,"DIA_Herek_Bully_01_02");	//И как только у тебя смелости хватило отказаться платить ему деньги за защиту!
	AI_Output(self,other,"DIA_Herek_Bully_01_03");	//Обычно за таких, как ты, должны расплачиваться простые рудокопы.
	AI_Output(self,other,"DIA_Herek_Bully_01_04");	//Я постараюсь напомнить тебе об этом, когда ты встретишь его в следующий раз.
	if(self.aivar[AIV_WASDEFEATEDBYSC] == FALSE)
	{
		Npc_SetPermAttitude(self,ATT_ANGRY);
		self.guild = GIL_None;
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_Herek_Motz(C_Info)
{
	npc = VLK_511_Herek;
	nr = 2;
	condition = DIA_Herek_Motz_Condition;
	information = DIA_Herek_Motz_Info;
	permanent = 0;
	description = "Как у тебя дела?";
};


func int DIA_Herek_Motz_Condition()
{
	if(Herek_ProtectionBully == FALSE)
	{
		return 1;
	};
};

func void DIA_Herek_Motz_Info()
{
	AI_Output(other,self,"DIA_Herek_Motz_15_00");	//Как у тебя дела?
	AI_Output(self,other,"DIA_Herek_Motz_01_01");	//В этом лагере может остаться только один из нас!
	AI_Output(other,self,"DIA_Herek_Motz_15_02");	//Прости, я не понял.
	AI_Output(self,other,"DIA_Herek_Motz_01_03");	//Если бы это зависело от меня, ты бы здесь долго не задержался!
	AI_Output(self,other,"DIA_Herek_Motz_01_04");	//Ты знаешь, почему я здесь? Как-то за одну ночь я убил сразу дюжину человек. Вот так.
	AI_StopProcessInfos(self);
};


instance DIA_Herek_Anlegen(C_Info)
{
	npc = VLK_511_Herek;
	nr = 2;
	condition = DIA_Herek_Anlegen_Condition;
	information = DIA_Herek_Anlegen_Info;
	permanent = 0;
	description = "Так ты считаешь себя сильнее всех? Может, сравним наши силы?";
};


func int DIA_Herek_Anlegen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Herek_Motz) || Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

func void DIA_Herek_Anlegen_Info()
{
	AI_Output(other,self,"DIA_Herek_Anlegen_15_00");	//Так ты считаешь себя сильнее всех? Может, сравним наши силы?
	if(self.aivar[AIV_WASDEFEATEDBYSC] == FALSE)
	{
		AI_Output(self,other,"DIA_Herek_Anlegen_01_01");	//Хочешь покормить червей? Сейчас устрою!
		Npc_SetPermAttitude(self,ATT_ANGRY);
		self.guild = GIL_None;
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_1_LetsForgetOurLittleFight");	//Давай забудем об этой ссоре, ладно?
		AI_StopProcessInfos(self);
	};
};

