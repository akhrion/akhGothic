
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
	Npc_KnowsInfo_HunoMakeSwordForWhistler = true;
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

func void DIA_WhistlerSword_AskHunoMakeSwordForWhistler()
{
	Npc_Hero_bAskHunoMakeSwordForWhistler = true;
	AI_Output(hero,self,"AskHunoMakeSwordForWhistler_NULL_01"); //Не совсем. Уистлеру снова нужен меч.
	AI_Output(hero,self,"AskHunoMakeSwordForWhistler_NULL_02"); //Тот меч, что ты ковал, каким-то образо оказался у Фиска и он не хочет его отдават обратно Уистлеру.
	AI_Output(hero,self,"AskHunoMakeSwordForWhistler_NULL_03"); //Продать тоже отказывается. Что-то они с Уистлером не поделили.
	AI_Output(self,hero,"AskHunoMakeSwordForWhistler_NULL_04"); //Понятно. А тебе вообще какое до этого дело?
	AI_Output(hero,self,"AskHunoMakeSwordForWhistler_NULL_05"); //Я здесь недавно - ищу друзей.
	AI_Output(self,hero,"AskHunoMakeSwordForWhistler_NULL_06"); //Да, я так и подумал (удрученно смотрит в сторону)
	AI_Output(self,hero,"AskHunoMakeSwordForWhistler_NULL_07"); //Только вот, ты помнишь что я говорил? Уистлер не простой меч заказал. Делать его долго, да и дорого. Боюсь у тебя не хватит руды.
	Info_ClearChoices(DIA_Huno_HowsYourBusiness);
	Info_AddChoice(DIA_Huno_HowsYourBusiness,DIALOG_ENDE,DIA_Huno_Exit_Info);
	if(Npc_HasItems(hero,ItMiNugget) > 149)
	{
		Info_AddChoice(DIA_Huno_HowsYourBusiness,"У меня есть руда",DIA_WhistlerSword_IHaveOre);
	};
	Info_AddChoice(DIA_Huno_HowsYourBusiness,"Я найду руду, сделай меч!",DIA_WhistlerSword_IFindOre);
};
func void AskHunoAboutSwordForWhistler()
{
	AI_Output(hero,self,"AskHunoAboutSwordForWhistler_NULL_01"); //Ты говорил, что делал для Уистлера меч..
	AI_Output(self,hero,"AskHunoAboutSwordForWhistler_NULL_02"); //Ну да, и?
	AI_Output(self,hero,"AskHunoAboutSwordForWhistler_NULL_03"); //Хочешь себе такой-же?
	Info_ClearChoices(DIA_Huno_HowsYourBusiness);
	Info_AddChoice(DIA_Huno_HowsYourBusiness,DIALOG_ENDE,DIA_Huno_Exit_Info);
	Info_AddChoice(DIA_Huno_HowsYourBusiness,"Не совсем. Уистлеру снова нужен меч.",DIA_WhistlerSword_AskHunoMakeSwordForWhistler);
	Info_AddChoice(DIA_Huno_HowsYourBusiness,"Эмм.. дааа что-то типа того. Ты можешь сделать точно такой-же меч?",DIA_WhistlerSword_AskHunoMakeSwordForWhistler);
	Info_AddChoice(DIA_Huno_HowsYourBusiness,"Да-да! Именно. Хочу себе такой-же меч!",DIA_WhistlerSword_AskHunoMakeSwordForWhistler);
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
	else if(
		Npc_KnowsInfo_HunoMakeSwordForWhistler
	&&	!Npc_Huno_bMakeSwordForWhistler
	)
	{
		Info_ClearChoices(DIA_Huno_HowsYourBusiness);
		Info_AddChoice(DIA_Huno_HowsYourBusiness,DIALOG_ENDE,DIA_Huno_Exit_Info);
		Info_AddChoice(DIA_Huno_HowsYourBusiness,"Ты говорил, что делал для Уистлера меч..",AskHunoAboutSwordForWhistler);
	}
	else
	{
		AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//Я еще не решил.
		AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//Приходи ко мне, когда тебе действительно что-нибудь понадобится, и не тревожь меня по пустякам.
	};
};

instance DIA_Huno_WhistlerSword_SoExpensive(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_WhistlerSword_SoExpensive_Condition;
	information = DIA_Huno_WhistlerSword_SoExpensive_Info;
	permanent = 1;
	important = 1;
};
func int DIA_Huno_WhistlerSword_SoExpensive_Condition()
{
	if(
		Npc_Hero_bAskHunoMakeSwordForWhistler
	&&	!Npc_Huno_bMakeSwordForWhistler
	)
	{
		Npc_Huno_bMakeSwordForWhistler = true;
		return true;
	};
	return false;
};
func void DIA_Huno_WhistlerSword_SoExpensive_Info()
{
	AI_Output(self,hero,"DIA_Huno_WhistlerSword_SoExpensive_NULL_01"); //Ладно стой.
	AI_Output(self,hero,"DIA_Huno_WhistlerSword_SoExpensive_NULL_02"); //Я кузнец, я люблю работать молотком. Но мне нужно железо.
	AI_Output(self,hero,"DIA_Huno_WhistlerSword_SoExpensive_NULL_03"); //Без железа нет смысла бить по этой наковальне, понимаешь?
	AI_Output(self,hero,"DIA_Huno_WhistlerSword_SoExpensive_NULL_04"); //Звук есть - да, но это плохой звук.. пустой.. одинокий.
	AI_Output(self,hero,"DIA_Huno_WhistlerSword_SoExpensive_NULL_05"); //Мне нужно железо, добудь мне железо и будет тебе меч.
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

func void DIA_WhistlerSword_IHaveOre()
{
	Npc_Huno_bMakeSwordForWhistler = true;
	AI_Output(hero,self,"DIA_WhistlerSword_IHaveOre_NULL_01"); //У меня есть руда.
	AI_Output(hero,self,"DIA_WhistlerSword_IHaveOre_NULL_02"); //Фиск просил за него 150 кусков. Думаю - если торговцу этой цены достаточно, то и кузнец не станет отказываться.
	AI_Output(self,hero,"DIA_WhistlerSword_IHaveOre_NULL_03"); //Хм.. кузнец - не торговец. Эти пройдохи откуда только товар не берут и часто этот товар вовсе им не пренадлежит.
	AI_Output(self,hero,"DIA_WhistlerSword_IHaveOre_NULL_04"); //А я кузнец - да. Работаю честно и потому 50и кусков будет достаточно. Ц..
	AI_Output(self,hero,"DIA_WhistlerSword_IHaveOre_NULL_05"); //(бормочет себе под нос) ээх тунеядцы да пройдохи кругом..
	AI_StopProcessInfos(self);
};
func void DIA_WhistlerSword_IFindOre()
{
	Npc_Huno_bMakeSwordForWhistler = true;
	AI_Output(hero,self,"DIA_WhistlerSword_IFindOre_NULL_01"); //Я найду руду - сделай меч.
	AI_Output(self,hero,"DIA_WhistlerSword_IFindOre_NULL_02"); //Ну дни сейчас свободные, а я без дела сидеть не привык. Хорошо, сделаю меч.
	AI_Output(self,hero,"DIA_WhistlerSword_IFindOre_NULL_03"); //Но даже не думай, что я отдам его тебе просто так. Не будет руды - меч останется у кузнеца. У меня.
	AI_StopProcessInfos(self);
};
