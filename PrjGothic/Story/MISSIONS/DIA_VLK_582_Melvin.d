
instance DIA_Melvin_Exit(C_Info)
{
	npc = VLK_582_Melvin;
	nr = 999;
	condition = DIA_Melvin_Exit_Condition;
	information = DIA_Melvin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Melvin_Exit_Condition()
{
	return 1;
};

func void DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Melvin_Hello(C_Info)
{
	npc = VLK_582_Melvin;
	nr = 1;
	condition = DIA_Melvin_Hello_Condition;
	information = DIA_Melvin_Hello_Info;
	permanent = 0;
	description = "Привет! Ты не похож на послушника. Ты из этого лагеря?";
};


func int DIA_Melvin_Hello_Condition()
{
	if(Kapitel < 4)
	{
		return 1;
	};
};

func void DIA_Melvin_Hello_Info()
{
	AI_Output(other,self,"DIA_Melvin_Hello_15_00");	//Привет! Ты не похож на послушника. Ты из этого лагеря?
	AI_Output(self,other,"DIA_Melvin_Hello_03_01");	//Да! Неделя прошла с тех пор, как я покинул Старый лагерь. Я предлагал моему другу Дасти пойти со мной, он засомневался и сказал, что подождет еще немного.
	GETNEWGUY_STARTED = TRUE;
	Log_CreateTopic(CH1_RecruitDusty,LOG_MISSION);
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_RUNNING);
	B_LogEntry(CH1_RecruitDusty,"Рудокоп Мелвин присоединился к Братству. Его друг Дасти остался в Старом лагере. Но он постоянно думает о том, чтобы тоже уйти в Болотный лагерь.");
};


instance DIA_Melvin_MetDusty(C_Info)
{
	npc = VLK_582_Melvin;
	nr = 1;
	condition = DIA_Melvin_MetDusty_Condition;
	information = DIA_Melvin_MetDusty_Info;
	permanent = 0;
	description = "Я знаю Дасти. Разговаривал с ним совсем недавно.";
};


func int DIA_Melvin_MetDusty_Condition()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	if(Npc_KnowsInfo(hero,DIA_Melvin_Hello) && (Npc_GetDistToWP(Dusty,"PSI_12_HUT_EX_TEACH2") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE) && Npc_KnowsInfo(hero,DIA_Dusty_Hello))
	{
		return 1;
	};
};

func void DIA_Melvin_MetDusty_Info()
{
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_00");	//Я знаю Дасти. Разговаривал с ним совсем недавно.
	AI_Output(self,other,"DIA_Melvin_MetDusty_03_01");	//Если ты увидишь его, передай, что он зря остался там. Здесь же гораздо лучше, чем в Старом лагере, где стражники издеваются над бедными рудокопами. Надеюсь, ему тоже здесь понравится.
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_02");	//Ну, если увижу, передам, конечно.
};


instance DIA_MELVIN_METDUSTY2(C_Info)
{
	npc = VLK_582_Melvin;
	nr = 1;
	condition = dia_melvin_metdusty2_condition;
	information = dia_melvin_metdusty2_info;
	permanent = 0;
	description = "Cо мной пришел человек...";
};


func int dia_melvin_metdusty2_condition()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	if(!Npc_KnowsInfo(hero,DIA_BaalTondral_Loyality) && (Npc_GetDistToWP(Dusty,"PSI_12_HUT_EX_TEACH2") < 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE) && Npc_KnowsInfo(hero,DIA_Melvin_Hello))
	{
		return 1;
	};
};

func void dia_melvin_metdusty2_info()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	Dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	Dusty.flags = 0;
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_03");	//Cо мной пришел человек...
	AI_Output(self,other,"SVM_3_YeahWellDone");	//Да! Отлично!
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		C_StopLookAt(self);
	};
	AI_TurnToNPC(self,Dusty);
	AI_PlayAni(self,"T_COMEOVERHERE");
	AI_Output(self,NULL,"SVM_3_SectGreetings");	//Пробудись!
	B_LogEntry(CH1_RecruitDusty,"Дасти присоединился к Болотному лагерю. Я выполнил свое задание.");
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_SUCCESS);
	B_GiveXP(XP_DeliveredDusty);
	GETNEWGUY_DUSTY_JOINED = TRUE;
	GETNEWGUY_STARTED = LOG_SUCCESS;
	Dusty.guild = GIL_NOV;
	Npc_SetTrueGuild(Dusty,GIL_NOV);
	AI_StopProcessInfos(self);
};

