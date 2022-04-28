
instance DIA_Nyras_Exit(C_Info)
{
	npc = Nov_1303_Nyras;
	nr = 999;
	condition = DIA_Nyras_Exit_Condition;
	information = DIA_Nyras_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Nyras_Exit_Condition()
{
	return 1;
};

func void DIA_Nyras_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Nyras_Hallo(C_Info)
{
	npc = Nov_1303_Nyras;
	nr = 1;
	condition = DIA_Nyras_Hallo_Condition;
	information = DIA_Nyras_Hallo_Info;
	permanent = 0;
	description = "Привет! Я попал сюда недавно.";
};


func int DIA_Nyras_Hallo_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Nyras_Hallo_Info()
{
	AI_Output(other,self,"DIA_Nyras_Hallo_15_00");	//Привет! Я попал сюда недавно.
	AI_Output(self,other,"DIA_Nyras_Hallo_03_01");	//Да пребудет с тобой Спящий, брат!
};


instance DIA_Nyras_Ort(C_Info)
{
	npc = Nov_1303_Nyras;
	nr = 1;
	condition = DIA_Nyras_Ort_Condition;
	information = DIA_Nyras_Ort_Info;
	permanent = 0;
	description = "Что ты можешь рассказать мне об этом месте?";
};


func int DIA_Nyras_Ort_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Nyras_Hallo) && (Kapitel <= 1))
	{
		return 1;
	};
};

func void DIA_Nyras_Ort_Info()
{
	AI_Output(other,self,"DIA_Nyras_Ort_15_00");	//Что ты можешь рассказать мне об этом месте?
	AI_Output(self,other,"DIA_Nyras_Ort_03_01");	//Ну, в нашем Братстве все дела ведут Гуру. Они несут в мир учение Спящего и рассказывают послушникам о видениях нашего Учителя.
	AI_Output(self,other,"DIA_Nyras_Ort_03_02");	//Конечно, сам Учитель слишком занят, чтобы говорить с каждым послушником лично.
	AI_Output(self,other,"DIA_Nyras_Ort_03_03");	//Но иногда он выходит к нам на площадь перед Храмом и раскрывает нам волю Спящего.
	Info_ClearChoices(DIA_Nyras_Ort);
	Info_AddChoice(DIA_Nyras_Ort,"Расскажи мне о священных словах великого Спящего.",DIA_Nyras_Ort_Holy);
	Info_AddChoice(DIA_Nyras_Ort,"И что говорит вам Спящий?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output(other,self,"DIA_Nyras_Ort_Casual_15_00");	//И что говорит вам Спящий?
	AI_Output(self,other,"DIA_Nyras_Ort_Casual_03_01");	//Спящий являет свою волю в видениях, но неверный никогда не сможет этого понять!
	Info_ClearChoices(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	bDIA_Nyras_Ort_Holy = true;
	AI_Output(other,self,"DIA_Nyras_Ort_Holy_15_00");	//Расскажи мне о священных словах великого Спящего.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_01");	//Он сам указывает нам, что делать, чтобы обрести свободу.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_02");	//Юберион говорит, что Спящий сможет открыться и нам, когда мы будем к этому готовы.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_03");	//Скоро он проведет великую Церемонию, дабы Спящий явился нам. В ней примут участие наши Гуру и лучшие послушники.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_04");	//Гуру Кор Галом помогает ему. Он алхимик и занимается приготовлением снадобья, с помощью которого мы войдем в транс.
	AI_Output(self,other,"DIA_Nyras_Ort_Holy_03_05");	//Только в этом состоянии или во сне мы сможем понять волю Спящего.
	Info_ClearChoices(DIA_Nyras_Ort);
};


instance Nov_1303_Nyras_GREET(C_Info)
{
	npc = Nov_1303_Nyras;
	condition = Nov_1303_Nyras_GREET_Condition;
	information = Nov_1303_Nyras_GREET_Info;
	important = 1;
	permanent = 0;
};


func int Nov_1303_Nyras_GREET_Condition()
{
	if(YBerion_BringFocus == LOG_RUNNING)
	{
		return 1;
	};
};

func void Nov_1303_Nyras_GREET_Info()
{
	AI_Output(self,other,"Nov_1303_Nyras_GREET_Info_03_00");	//Исчезни! Здесь тебе не место!
};


instance Nov_1303_Nyras_LEAVE(C_Info)
{
	npc = Nov_1303_Nyras;
	condition = Nov_1303_Nyras_LEAVE_Condition;
	information = Nov_1303_Nyras_LEAVE_Info;
	important = 0;
	permanent = 0;
	description = "Я ищу камень-юнитор.";
};


func int Nov_1303_Nyras_LEAVE_Condition()
{
	if(Npc_KnowsInfo(hero,Nov_1303_Nyras_GREET) && (YBerion_BringFocus == LOG_RUNNING))
	{
		return 1;
	};
};

func void Nov_1303_Nyras_LEAVE_Info()
{
	AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_15_01");	//Я ищу камень-юнитор.
	if(Npc_HasItems(self,Focus_1))
	{
		AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_02");	//Ты пришел слишком поздно. Я уже сам нашел его!
		AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_03");	//И я решил оставить его себе!
	};
	AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_04");	//Ночью я слышал слова Спящего. Он сказал, что теперь я его единственный последователь!
	if(bDIA_Nyras_Ort_Holy)
	{
		AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_NULL_051"); //Что Нирас, но почему?
		AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_05");	//Теперь только я буду служить Спящему. Он больше не нуждается в Гуру и Стражах!
		AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_NULL_052"); //Нирас, одумайся! Тыже сам говорил - этот юнитор очень важен для нашей церемонии! И снадобье для связи со Спящим необходимо также. Это не мог быть Спящий!
		AI_Output(other,self,"Nov_1303_Nyras_LEAVE_Info_NULL_053"); //Разьве это слова нашего бога?
		AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_NULL_054"); //Что? О.. Ты прав.. Что-то..
		AI_StopProcessInfos(self);
		AI_StartState(self,ZS_MagicSleep,1,"");
//		Mdl_ApplyOverlayMDSTimed(self,"HUMANS_SLEEP.MDS",25);
//		AI_StartState(self,ZS_Unconscious,0,"");
	}
	else
	{
		AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_06");	//Только я один!
		AI_Output(self,other,"Nov_1303_Nyras_LEAVE_Info_03_07");	//Умри!
		B_LogEntry(CH2_Focus,"Нирас сошел с ума. Он захотел оставить юнитор себе и напал на меня.");
		Npc_SetPermAttitude(self,ATT_HOSTILE);
	};
	AI_StopProcessInfos(self);
};

