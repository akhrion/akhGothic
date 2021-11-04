
instance Info_Mine_Grd_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Grd_13_EXIT_Condition;
	information = Info_Mine_Grd_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Mine_Grd_13_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Grd_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Grd_13_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_13_Mine_Condition;
	information = Info_Mine_Grd_13_Mine_Info;
	permanent = 1;
	description = "Что происходит на шахте?";
};


func int Info_Mine_Grd_13_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_Mine_15_00");	//Что происходит на шахте?
	AI_Output(self,other,"Info_Mine_Grd_13_Mine_13_01");	//Шахта - сердце Старого лагеря. Без нее у нас не будет руды, а без руды не будет и товаров. Понятно?
};


instance Info_Mine_Grd_13_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_13_WichtigePersonen_Condition;
	information = Info_Mine_Grd_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int Info_Mine_Grd_13_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Mine_Grd_13_WichtigePersonen_13_01");	//Главный здесь Асгхан. Но к нему лучше не подходить. Тебе стоит сначала поговорить с Яном.
};


instance Info_Mine_Grd_13_DasLager(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_13_DasLager_Condition;
	information = Info_Mine_Grd_13_DasLager_Info;
	permanent = 1;
	description = "Расскажи мне о ползунах.";
};


func int Info_Mine_Grd_13_DasLager_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DasLager_15_00");	//Расскажи мне о ползунах.
	AI_Output(self,other,"Info_Mine_Grd_13_DasLager_13_01");	//Здесь на ползунов охотятся члены Братства. За это они отдают Старому лагерю часть своего урожая болотника.
};


instance Info_Mine_Grd_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_13_DieLage_Condition;
	information = Info_Mine_Grd_13_DieLage_Info;
	permanent = 1;
	description = "Как дела?";
};


func int Info_Mine_Grd_13_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Mine_Grd_13_DieLage_13_01");	//Я так давно не участвовал ни в одной битве!
};

func void B_AssignAmbientInfos_Mine_grd_13(var C_Npc slf)
{
	Info_Mine_Grd_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

