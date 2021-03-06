
instance Info_Nefarius_EXIT(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 999;
	condition = Info_Nefarius_EXIT_Condition;
	information = Info_Nefarius_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Nefarius_EXIT_Condition()
{
	return 1;
};

func void Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nefarius_Hallo(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_Hallo_Condition;
	information = Info_Nefarius_Hallo_Info;
	permanent = 0;
	description = "Кто ты?";
};


func int Info_Nefarius_Hallo_Condition()
{
	return 1;
};

func void Info_Nefarius_Hallo_Info()
{
	AI_Output(other,self,"Info_Nefarius_Hallo_15_00");	//Кто ты?
	AI_Output(self,other,"Info_Nefarius_Hallo_04_01");	//Я Нефариус, маг Круга Воды.
};


instance Info_Nefarius_WoSaturas(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 2;
	condition = Info_Nefarius_WoSaturas_Condition;
	information = Info_Nefarius_WoSaturas_Info;
	permanent = 0;
	description = "Где найти Сатураса?";
};


func int Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

func void Info_Nefarius_WoSaturas_Info()
{
	AI_Output(other,self,"Info_Nefarius_WoSaturas_15_00");	//Где найти Сатураса?
	AI_Output(self,other,"Info_Nefarius_WoSaturas_04_01");	//Пройди за большие круглые ворота. Там ты сможешь его найти.
};


instance Info_Nefarius_WannaMage(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_WannaMage_Condition;
	information = Info_Nefarius_WannaMage_Info;
	permanent = 0;
	description = "Я хочу стать магом Круга Воды!";
};


func int Info_Nefarius_WannaMage_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

func void Info_Nefarius_WannaMage_Info()
{
	AI_Output(other,self,"Info_Nefarius_WannaMage_15_00");	//Я хочу стать магом Круга Воды!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_01");	//Не спеши, это не делается так быстро!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_02");	//Прежде чем взять в свой круг нового человека, мы должны убедиться, что он этого достоин.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_03");	//Он должен послужить нам какое-то время.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_04");	//Если твое намерение серьезно, то сходи к нашим наемникам и постарайся стать одним из них. Это и будет твоя служба.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_05");	//И, может быть, однажды у тебя появится шанс проявить себя.
};


instance Info_Nefarius_NowReady(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_NowReady_Condition;
	information = Info_Nefarius_NowReady_Info;
	permanent = 1;
	description = "Я могу стать одним из магов Круга Воды?";
};


func int Info_Nefarius_NowReady_Condition()
{
	if(!FMTaken && Npc_KnowsInfo(hero,Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero) != GIL_KDW))
	{
		return 1;
	};
};

func void Info_Nefarius_NowReady_Info()
{
	AI_Output(other,self,"Info_Nefarius_NowReady_15_00");	//Я могу стать одним из магов Круга Воды?
	if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_01");	//Сначала стань одним их наших наемников, а там посмотрим...
	}
	else
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_02");	//Вижу, тебя приняли в наемники. Хорошо, очень хорошо...
		AI_Output(self,other,"Info_Nefarius_NowReady_04_03");	//Все остальное решится со временем...
	};
};


instance Info_Nefarius_OCNews(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_OCNews_Condition;
	information = Info_Nefarius_OCNews_Info;
	permanent = 0;
	important = 1;
};


func int Info_Nefarius_OCNews_Condition()
{
	if(FMTaken && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Nefarius_OCNews_Info()
{
	AI_Output(self,other,"Info_Nefarius_OCNews_04_00");	//Ты можешь рассказать что-нибудь о наших друзьях из Старого лагеря?
	AI_Output(other,self,"Info_Nefarius_OCNews_15_01");	//Гомез уничтожил всех магов Огня!
	AI_Output(self,other,"Info_Nefarius_OCNews_04_02");	//Нет! Как он посмел?! Я же предупреждал Корристо, что ему нельзя доверять! Ты должен рассказать об этом Сатурасу!
	AI_StopProcessInfos(self);
};


instance INFO_NEFARIUS_OCNEWS2(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = info_nefarius_ocnews2_condition;
	information = info_nefarius_ocnews2_info;
	permanent = 0;
	important = 1;
};


func int info_nefarius_ocnews2_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_SLD) && (FMTaken == TRUE))
	{
		return TRUE;
	};
};

func void info_nefarius_ocnews2_info()
{
	AI_Output(self,other,"Info_Nefarius_OCNews_04_03");	//Постой!
	AI_Output(self,other,"Info_Nefarius_OCNews_04_04");	//Ты подвергал себя большой опасности, чтобы помочь нам.
	AI_Output(self,other,"Info_Nefarius_OCNews_04_05");	//Думаю, теперь ты достоин носить одеяние магов Воды.
	AI_Output(self,other,"Info_Nefarius_OCNews_04_06");	//Но теперь иди и поговори с Сатурасом! Быстрее!
	AI_StopProcessInfos(self);
};

