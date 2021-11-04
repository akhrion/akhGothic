
instance DIA_Gilbert_EXIT(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 999;
	condition = DIA_Gilbert_EXIT_Condition;
	information = DIA_Gilbert_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

func void DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gilbert_First(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_First_Condition;
	information = DIA_Gilbert_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Gilbert_First_Condition()
{
	return 1;
};

func void DIA_Gilbert_First_Info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//Что ты здесь делаешь? Редко кто заходит ко мне сюда, хе-хе!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//Тебе удалось найти мое убежище, что не многим под силу.
	Npc_ExchangeRoutine(self,"start2");
	B_GiveXP(XP_GilbertFound);
};


instance DIA_Gilbert_Hallo(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_Hallo_Condition;
	information = DIA_Gilbert_Hallo_Info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

func void DIA_Gilbert_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//Старый лагерь мне давно надоел. У нас давние разногласия с людьми Гомеза. Как давно это все началось...
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_02");	//Теперь обо мне, наверное, никто и не помнит. Но я все равно останусь здесь. В Старом лагере стало слишком много солдатни.
};


instance DIA_GILBERT_HALLO2(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_hallo2_condition;
	information = dia_gilbert_hallo2_info;
	permanent = 0;
	description = "(потребовать дубликат ключа)";
};


func int dia_gilbert_hallo2_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gilbert_Hallo) && Npc_KnowsInfo(hero,quentin_dia33) && !Npc_HasItems(hero,itke_gilbert))
	{
		return TRUE;
	};
};

func void dia_gilbert_hallo2_info()
{
	if(hero.level < 6)
	{
		AI_Output(self,other,"SVM_4_GetOutOfHere");	//Убирайся отсюда!
		AI_StopProcessInfos(self);
		B_SetAttackReason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,hero);
		AI_StartState(self,ZS_Attack,1,"");
		B_LogEntry(QUENTIN_GANG,"Гилберт яростно набросился на меня. Интересно, зачем этот дубликат так нужен Квентину?");
	}
	else
	{
		AI_Output(self,other,"SVM_4_LookAway");	//Не вижу, не слышу и никому ничего не скажу...
		b_printtrademsg1("Получен дубликат ключа.");
		B_GiveXP(100);
		B_GiveInvItems(self,hero,itke_gilbert,1);
		AI_StopProcessInfos(self);
		AI_StartState(self,ZS_Flee,1,"");
		B_LogEntry(QUENTIN_GANG,"Гилберт вернул мне копию ключа и бросился бежать. Интересно, зачем она так нужна Квентину?");
	};
	Npc_ExchangeRoutine(self,"hide");
};

