
instance Grd_277_Gardist_SITTINGORK(C_Info)
{
	npc = GRD_277_Gardist;
	condition = Grd_277_Gardist_SITTINGORK_Condition;
	information = Grd_277_Gardist_SITTINGORK_Info;
	important = 0;
	permanent = 0;
	description = "Что это за орк?";
};


func int Grd_277_Gardist_SITTINGORK_Condition()
{
	if(Ian_gearwheel != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void Grd_277_Gardist_SITTINGORK_Info()
{
	AI_Output(other,self,"Grd_277_Gardist_SITTINGORK_Info_15_01");	//Что это за орк?
	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_02");	//Он наш пленник. Счастливчик! У нас сломалась шестеренка, и этот мерзавец может спокойно валять дурака.
	AI_Output(self,other,"Grd_277_Gardist_SITTINGORK_Info_06_03");	//Как только пресс будет отремонтирован, он сразу же приступит к работе. Бездельничать не будет.
};


instance Grd_277_Gardist_WORKINGORK(C_Info)
{
	npc = GRD_277_Gardist;
	condition = Grd_277_Gardist_WORKINGORK_Condition;
	information = Grd_277_Gardist_WORKINGORK_Info;
	important = 0;
	permanent = 0;
	description = "Как я вижу, пресс уже в порядке.";
};


func int Grd_277_Gardist_WORKINGORK_Condition()
{
	if((Ian_gearwheel == LOG_SUCCESS) && Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW))
	{
		return TRUE;
	};
};

func void Grd_277_Gardist_WORKINGORK_Info()
{
	AI_Output(other,self,"Grd_277_Gardist_WORKINGORK_Info_15_01");	//Как я вижу, пресс уже в порядке.
	AI_Output(self,other,"Grd_277_Gardist_WORKINGORK_Info_06_02");	//Отлично. Заставить работать - это мы умеем.
};

