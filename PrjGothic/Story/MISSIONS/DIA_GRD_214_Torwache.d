
instance DIA_Grd_214_Torwache_Exit(C_Info)
{
	npc = GRD_214_Torwache;
	nr = 999;
	condition = DIA_Grd_214_Torwache_Exit_Condition;
	information = DIA_Grd_214_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grd_214_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_214_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grd_214_Torwache_job(C_Info)
{
	npc = GRD_214_Torwache;
	nr = 2;
	condition = DIA_Grd_214_Torwache_job_Condition;
	information = DIA_Grd_214_Torwache_job_Info;
	permanent = 1;
	description = "Что ты здесь делаешь?";
};


func int DIA_Grd_214_Torwache_job_Condition()
{
	return 1;
};

func void DIA_Grd_214_Torwache_job_Info()
{
	AI_Output(other,self,"DIA_Grd_214_Torwache_job_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Grd_214_Torwache_job_07_01");	//Охраняю замок от всяких незваных гостей, которые могут помешать Гомезу.
	AI_Output(self,other,"DIA_Grd_214_Torwache_job_07_02");	//Так что тебе лучше не делать глупостей, когда окажешься внутри, иначе тебя больше никто туда не пропустит.
};


instance Grd_214_Torwache_SEETHORUS(C_Info)
{
	npc = GRD_214_Torwache;
	condition = Grd_214_Torwache_SEETHORUS_Condition;
	information = Grd_214_Torwache_SEETHORUS_Info;
	important = 1;
	permanent = 0;
};


func int Grd_214_Torwache_SEETHORUS_Condition()
{
	if((Kapitel < 4) && !Npc_KnowsInfo(hero,GRD_216_Torwache_SEETHORUS) && ((CorKalom_BringMCQBalls == LOG_SUCCESS) || (Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3)) && !Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void Grd_214_Torwache_SEETHORUS_Info()
{
	AI_Output(self,other,"Grd_214_Torwache_SEETHORUS_Info_07_01");	//Эй, хорошо, что ты пришел. Торус хочет поговорить с тобой!
	AI_Output(other,self,"Grd_214_Torwache_SEETHORUS_Info_15_02");	//И что ему нужно?
	AI_Output(self,other,"Grd_214_Torwache_SEETHORUS_Info_07_03");	//Он сам расскажет тебе об этом.
};


instance Grd_214_Torwache_NODUSTY(C_Info)
{
	npc = GRD_214_Torwache;
	condition = Grd_214_Torwache_NODUSTY_Condition;
	information = Grd_214_Torwache_NODUSTY_Info;
	important = 1;
	permanent = 1;
};


func int Grd_214_Torwache_NODUSTY_Condition()
{
	var C_Npc Dusty;
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	if((Dusty.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(Dusty,"OCR_MAINGATE_OUTSIDE") < 2000))
	{
		return TRUE;
	};
};

func void Grd_214_Torwache_NODUSTY_Info()
{
	var C_Npc Dusty;
	AI_Output(self,other,"Grd_214_Torwache_NODUSTY_Info_07_01");	//Эй, ты! Надеюсь, ты не собираешься вывести Дасти из лагеря?
	AI_Output(other,self,"Grd_214_Torwache_NODUSTY_Info_15_02");	//Мы просто хотели...
	AI_Output(self,other,"Grd_214_Torwache_NODUSTY_Info_07_03");	//Очень скоро ты уже ничего хотеть не будешь!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	B_ExchangeRoutine(VLK_524_Dusty,"start");
	Dusty = Hlp_GetNpc(VLK_524_Dusty);
	Dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	Dusty.flags = 0;
	GETNEWGUY_DUSTY_STOPPED = TRUE;
	GETNEWGUY_DUSTY_MOVING = FALSE;
};

