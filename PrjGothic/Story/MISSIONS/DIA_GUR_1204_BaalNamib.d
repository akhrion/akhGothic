
instance DIA_BaalNamib_EXIT(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 999;
	condition = DIA_BaalNamib_EXIT_Condition;
	information = DIA_BaalNamib_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalNamib_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalNamib_NoTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_NoTalk_Condition;
	information = DIA_BaalNamib_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalNamib_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalNamib_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalNamib_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalNamib_NoTalk);
	Info_AddChoice(DIA_BaalNamib_NoTalk,DIALOG_ENDE,DIA_BaalNamib_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"С тобой все нормально, приятель?",DIA_BaalNamib_NoTalk_Imp);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Да пребудет с тобой Спящий!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Привет! Я здесь новенький!",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Привет! Я здесь новенький!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//С тобой все нормально, приятель?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalNamib_FirstTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_FirstTalk_Condition;
	information = DIA_BaalNamib_FirstTalk_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalNamib_FirstTalk_Condition()
{
	if((BaalNamib_Ansprechbar == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void DIA_BaalNamib_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01");	//Спящий избрал тебя. Ты и в самом деле хочешь присоединиться к нам?
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"(промолчать)",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Да, я хочу вступить на путь, указанный Спящим.",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01");	//Ну?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00");	//Да, я хочу вступить на путь, указанный Спящим.
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01");	//Иди к Кор Галому. Скажи ему, что я считаю тебя истинно верующим!
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	B_LogEntry(CH1_JoinPsi,"Задумка Лестера удалась. Идол Намиб заговорил со мной. Теперь он думает, что я стал убежденным верующим. Мне нужно увидеть Гуру Кор Галома в лаборатории!");
	B_GiveXP(XP_ImpressBaalNamib);
};


var int baalnamib_armor_h_was_bought;

instance GUR_1204_BaalNamib_ARMOR(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = GUR_1204_BaalNamib_ARMOR_Condition;
	information = GUR_1204_BaalNamib_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Мне нужны хорошие доспехи.";
};


func int GUR_1204_BaalNamib_ARMOR_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) && (BAALNAMIB_ARMOR_H_WAS_BOUGHT != 1))
	{
		return TRUE;
	};
};

func void GUR_1204_BaalNamib_ARMOR_Info()
{
	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");	//Мне нужны хорошие доспехи.
	AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Эти доспехи защитят тело твое, так же как Спящий защищает твою душу!
	Info_ClearChoices(GUR_1204_BaalNamib_ARMOR);
	Info_AddChoice(GUR_1204_BaalNamib_ARMOR,DIALOG_BACK,gur_1204_baalnamib_armor_back);
	Info_AddChoice(GUR_1204_BaalNamib_ARMOR,B_BuildBuyArmorString("Доспех послушника, защита: 40/5/20/0",VALUE_NOV_ARMOR_H),gur_1204_baalnamib_armor_buy);
};

func void gur_1204_baalnamib_armor_back()
{
	Info_ClearChoices(GUR_1204_BaalNamib_ARMOR);
};

func void gur_1204_baalnamib_armor_buy()
{
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_NOV_ARMOR_H)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Возвращайся, когда соберешь достаточно руды.
		Info_ClearChoices(GUR_1204_BaalNamib_ARMOR);
	}
	else
	{
		AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//Хорошо, я покупаю его.
		b_printtrademsg1("Отдано руды: 1200");
		AI_Output(self,other,"SVM_2_OkayKeepIt");	//Хорошо. Это твое.
		b_printtrademsg2("Получен доспех послушника.");
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NOV_ARMOR_H);
		CreateInvItem(self,nov_armor_h);
		B_GiveInvItems(self,hero,nov_armor_h,1);
		BAALNAMIB_ARMOR_H_WAS_BOUGHT = 1;
		Info_ClearChoices(GUR_1204_BaalNamib_ARMOR);
	};
};

