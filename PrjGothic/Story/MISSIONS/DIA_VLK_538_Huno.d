
instance DIA_Huno_Exit(C_Info)
{
	npc = VLK_538_Huno;
	nr = 999;
	condition = DIA_Huno_Exit_Condition;
	information = DIA_Huno_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Huno_Exit_Condition()
{
	return 1;
};

func void DIA_Huno_Exit_Info()
{
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordrawhot,Npc_HasItems(self,ItMiSwordrawhot));
	};
	if(Npc_HasItems(self,ItMiSwordblade) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
	};
	if(Npc_HasItems(self,goldensword))
	{
		Npc_RemoveInvItem(self,goldensword);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Huno_YouKnowYourJob(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_YouKnowYourJob_Condition;
	information = DIA_Huno_YouKnowYourJob_Info;
	permanent = 0;
	important = 0;
	description = "А у тебя неплохо получается, как я вижу.";
};


func int DIA_Huno_YouKnowYourJob_Condition()
{
	return TRUE;
};

func void DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//А у тебя неплохо получается, как я вижу.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//Да уж, недовольных я еще не встречал.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//Но если таковые и найдутся, им же хуже. Здесь никто не хочет оставаться без оружия, а ковать хорошие мечи умею только я.
};


instance DIA_Huno_HowLong(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowLong_Condition;
	information = DIA_Huno_HowLong_Info;
	permanent = 0;
	important = 0;
	description = "Много времени уходит на один меч?";
};


func int DIA_Huno_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowLong_Info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//Много времени уходит на один меч?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//Все зависит от меча. Обычный меч я могу выковать очень быстро. Ты и глазом моргнуть не успеешь.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//Если, конечно, моя работа будет достойно оплачена.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//А вот таким, как Уистлер, приходится ждать дольше всех.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//Почему? Платит слишком мало?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//Да нет, как раз наоборот. За последний меч он заплатил мне 150 кусков руды.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//Ему подавай не простой меч, а с завитушками и прочими бабьими штучками, а это стоит недешево.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//Эй, мне кажется, ты меня не слушаешь!
};


instance DIA_Huno_HowsYourBusiness(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowsYourBusiness_Condition;
	information = DIA_Huno_HowsYourBusiness_Info;
	permanent = 1;
	important = 0;
	description = "Ну, кузнец, как дела?";
};


func int DIA_Huno_HowsYourBusiness_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob) && (HUNO_GOLDENSWORD == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//Ну, кузнец, как дела?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//А зачем ты хочешь это знать?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//Может быть, я закажу тебе что-нибудь.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03");	//Правда? И что же это?
	if(Npc_HasItems(hero,goldensword))
	{
		AI_UnequipWeapons(other);
		AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01");	//Я нашел один очень странный меч.
		b_printtrademsg1("Отдан золотой меч.");
		CreateInvItem(self,goldensword);
		AI_EquipBestMeleeWeapon(self);
		AI_ReadyMeleeWeapon(self);
		AI_PlayAni(self,"T_URISELINSPECT");
		AI_RemoveWeapon(self);
		AI_UnequipWeapons(self);
		AI_Output(self,other,"Info_Wolf_MCPLATESENOUGH_09_04");	//Не знаю. Я же никогда еще не обрабатывал такой материал.
		AI_Output(self,other,"SVM_9_NotNow");	//Нет, не сейчас.
		b_printtrademsg2("Получен золотой меч.");
		HUNO_GOLDENSWORD = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//Я еще не решил.
		AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//Приходи ко мне, когда тебе действительно что-нибудь понадобится, и не тревожь меня по пустякам.
	};
};


var int Huno_LearnSmith;

instance DIA_Huno_LEARNSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_LEARNSMITH_Condition;
	information = DIA_Huno_LEARNSMITH_Info;
	permanent = 0;
	important = 0;
	description = "Я хотел бы попробовать поработать у тебя в кузнице.";
};


func int DIA_Huno_LEARNSMITH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_LEARNSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//Я хотел бы попробовать поработать у тебя в кузнице.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//Так, так... только с первого раза у тебя все равно не получится выковать хороший клинок!
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Что мне нужно делать?
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Что ж, возьми заготовку и подержи ее над огнем.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Раскаленную докрасна заготовку положи на наковальню и сформируй меч.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Когда он будет готов, его нужно закалить, опустив в ведро с водой.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Потом охлажденный клинок нужно будет заточить на точильном камне.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07");	//Я все понял.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08");	//Но без материалов у тебя ничего не выйдет. Если хочешь, можешь купить их у меня.
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordrawhot,Npc_HasItems(self,ItMiSwordrawhot));
	};
	if(Npc_HasItems(self,ItMiSwordblade) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
	};
	if(Npc_HasItems(self,goldensword))
	{
		Npc_RemoveInvItem(self,goldensword);
	};
	Huno_LearnSmith = TRUE;
};


instance DIA_Huno_BUYSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_BUYSMITH_Condition;
	information = DIA_Huno_BUYSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Я хочу купить у тебя заготовки.";
	trade = 1;
};


func int DIA_Huno_BUYSMITH_Condition()
{
	if((Huno_LearnSmith == TRUE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Huno_BUYSMITH_Info()
{
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordrawhot,Npc_HasItems(self,ItMiSwordrawhot));
	};
	if(Npc_HasItems(self,ItMiSwordblade) >= 1)
	{
		Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
	};
	if(Npc_HasItems(self,goldensword))
	{
		Npc_RemoveInvItem(self,goldensword);
	};
	if(!Npc_HasItems(self,ItMw_1H_Sledgehammer_01) && !Npc_HasItems(other,ItMw_1H_Sledgehammer_01))
	{
		CreateInvItem(self,ItMw_1H_Sledgehammer_01);
	};
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//Я хочу купить у тебя заготовки.
};

