
func void b_gornatothlearn()
{
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,(5 * LPCOST_ATTRIBUTE_STRENGTH),OTHERCAMPLEARNPAY * 5),TPL_1402_GorNaToth_Teach_STR_5);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),TPL_1402_GorNaToth_Teach_STR_1);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,(5 * LPCOST_ATTRIBUTE_DEXTERITY),OTHERCAMPLEARNPAY * 5),TPL_1402_GorNaToth_Teach_DEX_5);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),TPL_1402_GorNaToth_Teach_DEX_1);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,(5 * LPCOST_ATTRIBUTE_MANA),OTHERCAMPLEARNPAY * 5),TPL_1402_GorNaToth_Teach_MAN_5);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),TPL_1402_GorNaToth_Teach_MAN_1);
	}
	else
	{
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 1)
	{
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0),tpl_1402_gornatoth_teach_1h_1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1)
	{
		Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,0),tpl_1402_gornatoth_teach_1h_2);
	};
};


instance DIA_TPL_1402_GorNaToth_Exit(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 999;
	condition = DIA_TPL_1402_GorNaToth_Exit_Condition;
	information = DIA_TPL_1402_GorNaToth_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_TPL_1402_GorNaToth_Exit_Condition()
{
	return TRUE;
};

func void DIA_TPL_1402_GorNaToth_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GorNaToth_Abweisend(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = DIA_GorNaToth_Abweisend_Condition;
	information = DIA_GorNaToth_Abweisend_Info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_GorNaToth_Abweisend_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked) && !C_NpcBelongsToPsiCamp(hero))
	{
		return 1;
	};
};

func void DIA_GorNaToth_Abweisend_Info()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01");	//Уйди от меня, неверный! Я тренирую только Стражей Спящего!
	AI_StopProcessInfos(self);
};


instance DIA_GorNaToth_AngarTalked(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = DIA_GorNaToth_AngarTalked_Condition;
	information = DIA_GorNaToth_AngarTalked_Info;
	permanent = 0;
	important = 1;
};


func int DIA_GorNaToth_AngarTalked_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Kapitel < 2))
	{
		return 1;
	};
};

func void DIA_GorNaToth_AngarTalked_Info()
{
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00");	//Кор Ангар говорил с тобой? Что он тебе сказал?
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Твой учитель сказал, что ты недостоин носить доспех Стража.",DIA_GorNaToth_AngarTalked_Unworthy);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Он сказал, что ему не нравятся болотожоры.",DIA_GorNaToth_AngarTalked_Shark);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Он сказал, что я должен прийти к нему, когда стану стражем.",DIA_GorNaToth_AngarTalked_Normal);
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00");	//Он сказал, что я должен прийти к нему, когда стану стражем.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01");	//Наверное, ты ему понравился. Он почти никогда ни с кем не разговаривает.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02");	//Он оказал тебе большую честь, заговорив с тобой. Со мной он в последний раз говорил два месяца назад.
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00");	//Он сказал, что ему не нравятся болотожоры.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01");	//Он так сказал?.. Мне предстоит исполнить священную миссию!
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02");	//Желание моего Учителя для меня закон.
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00");	//Твой учитель сказал, что ты недостоин носить доспехи Стража.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01");	//Нет! Он никогда не сказал бы этого! Только не обо мне!
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance TPL_1402_GorNaToth_GETSTUFF(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_GETSTUFF_Condition;
	information = TPL_1402_GorNaToth_GETSTUFF_Info;
	important = 0;
	permanent = 0;
	description = "Я пришел, чтобы взять доспех Стража.";
};


func int TPL_1402_GorNaToth_GETSTUFF_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_GETSTUFF_Info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01");	//Я пришел, чтобы взять доспехи Стража.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02");	//Я очень рад, что могу передать тебе один из наших доспехов. Ты заслужил их, ведь это ты обнаружил яйца ползунов.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03");	//Пусть этот доспех хранит тебя, как Спящий хранит наше Братство!
	b_printtrademsg1("Получен легкий доспех Стража.");
	B_LogEntry(GE_BecomeTemplar,"Гор На Тоф вручил мне мой первый доспех Стража. Теперь я стал частью этого общества воинов!");
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"У Гор На Тофа есть хорошие доспехи Стражей, но получить их может только тот, кто внес значительное пожертвование на нужды Братства. Я могу найти его на тренировочной площадке лагеря Братства.");
	CreateInvItem(self,tpl_armor_l);
	B_GiveInvItems(self,hero,tpl_armor_l,1);
};


var int gornatoth_armor_m_was_bought;
var int gornatoth_armor_h_was_bought;

instance TPL_1402_GorNaToth_ARMOR(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_ARMOR_Condition;
	information = TPL_1402_GorNaToth_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Мне нужны более прочные доспехи.";
};


func int TPL_1402_GorNaToth_ARMOR_Condition()
{
	if(((hero.guild == GIL_NOV) || Npc_KnowsInfo(hero,TPL_1402_GorNaToth_GETSTUFF)) && ((GORNATOTH_ARMOR_M_WAS_BOUGHT != 1) || (GORNATOTH_ARMOR_H_WAS_BOUGHT != 1)))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_ARMOR_Info()
{
	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01");	//Мне нужны более прочные доспехи.
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02");	//Сейчас ты не сможешь носить его. Сначала тебе придется доказать свою верность Братству и стать Стражем. Только после этого у тебя будет право на такой доспех.
	}
	else
	{
		AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02");	//Я могу дать тебе доспех получше, но за это ты внесешь пожертвование на нужды нашего Братства.
		Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
		Info_AddChoice(TPL_1402_GorNaToth_ARMOR,DIALOG_BACK,TPL_1402_GorNaToth_ARMOR_BACK);
		if(GORNATOTH_ARMOR_H_WAS_BOUGHT != 1)
		{
			Info_AddChoice(TPL_1402_GorNaToth_ARMOR,B_BuildBuyArmorString("Тяжелый доспех стража, защита: 70/10/35/0",VALUE_TPL_ARMOR_H),TPL_1402_GorNaToth_ARMOR_H);
		};
		if(GORNATOTH_ARMOR_M_WAS_BOUGHT != 1)
		{
			Info_AddChoice(TPL_1402_GorNaToth_ARMOR,B_BuildBuyArmorString("Средний доспех стража, защита: 55/10/25/0",VALUE_TPL_ARMOR_M),TPL_1402_GorNaToth_ARMOR_M);
		};
	};
};

func void TPL_1402_GorNaToth_ARMOR_M()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01");	//Мне нужны средние доспехи Стража.
	if(Kapitel < 3)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02");	//Ты для этого недостаточно опытен. Докажи, что ты верен нашему Братству, и только после этого ты будешь достоин носить столь совершенный доспех.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_TPL_ARMOR_M)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03");	//Как только ты сможешь внести пожертвование на нужды Братства, ты получишь доспех получше.
	}
	else
	{
		b_printtrademsg1("Отдано руды: 1650");
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04");	//Ты можешь внести пожертвование, поэтому я дам тебе такой доспех. Он станет твоей надежной защитой.
		b_printtrademsg2("Получен средний доспех Стража.");
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_TPL_ARMOR_M);
		CreateInvItem(self,tpl_armor_m);
		B_GiveInvItems(self,hero,tpl_armor_m,1);
		GORNATOTH_ARMOR_M_WAS_BOUGHT = 1;
	};
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_H()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01");	//Я хочу взять тяжелые доспехи Стража.
	if(Kapitel < 4)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02");	//Ты для этого недостаточно опытен. Докажи, что ты верен нашему Братству, и только после этого ты будешь достоин носить столь совершенный доспех.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_TPL_ARMOR_H)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03");	//Ты заслужил право носить такой доспех, но сейчас у тебя нет возможности внести достойное пожертвование на нужды Братства!
	}
	else
	{
		b_printtrademsg1("Отдано руды: 2100");
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04");	//Носи этот доспех в знак высочайшей чести, оказанной тебе Братством.
		b_printtrademsg2("Получен тяжелый доспех Стража.");
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_TPL_ARMOR_H);
		CreateInvItem(hero,tpl_armor_h);
		GORNATOTH_ARMOR_H_WAS_BOUGHT = 1;
	};
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01");	//Я передумал!
	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02");	//Как хочешь. Ты знаешь, где меня можно найти.
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};


instance TPL_1402_GORNATOTH_TEACH_PRE(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 10;
	condition = tpl_1402_gornatoth_teach_pre_condition;
	information = tpl_1402_gornatoth_teach_pre_info;
	permanent = 0;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int tpl_1402_gornatoth_teach_pre_condition()
{
	if(C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_teach_pre_info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01");	//Настоящему воину необходима не только сила духа, но также сила мышц и ловкость движений.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Страж Гор На Тоф может помочь мне повысить силу, ловкость и магическую силу, а также улучшить мое владение одноручным оружием.");
};


instance TPL_1402_GorNaToth_Teach(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 10;
	condition = TPL_1402_GorNaToth_Teach_Condition;
	information = TPL_1402_GorNaToth_Teach_Info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int TPL_1402_GorNaToth_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,tpl_1402_gornatoth_teach_pre))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Я хочу улучшить свои навыки.
	b_gornatothlearn();
};

func void TPL_1402_GorNaToth_Teach_BACK()
{
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
};

func void TPL_1402_GorNaToth_Teach_STR_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_STRENGTH] < 100))
		{
			b_printtrademsg1("Отдано руды: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_gornatothlearn();
};

func void TPL_1402_GorNaToth_Teach_STR_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_STRENGTH] < 96))
		{
			b_printtrademsg1("Отдано руды: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_gornatothlearn();
};

func void TPL_1402_GorNaToth_Teach_DEX_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_DEXTERITY] < 100))
		{
			b_printtrademsg1("Отдано руды: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_gornatothlearn();
};

func void TPL_1402_GorNaToth_Teach_DEX_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_DEXTERITY] < 96))
		{
			b_printtrademsg1("Отдано руды: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_gornatothlearn();
};

func void TPL_1402_GorNaToth_Teach_MAN_1()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= OTHERCAMPLEARNPAY)
	{
		if((hero.lp >= 1) && (hero.attribute[ATR_MANA_MAX] < 100))
		{
			b_printtrademsg1("Отдано руды: 10");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY);
		};
		B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_gornatothlearn();
};

func void TPL_1402_GorNaToth_Teach_MAN_5()
{
	if(DIFF_HARD == FALSE)
	{
		B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= (OTHERCAMPLEARNPAY * 5))
	{
		if((hero.lp >= 5) && (hero.attribute[ATR_MANA_MAX] < 96))
		{
			b_printtrademsg1("Отдано руды: 50");
			B_GiveInvItems(other,self,ItMiNugget,OTHERCAMPLEARNPAY * 5);
		};
		B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//Не шути со мной!
	};
	b_gornatothlearn();
};

func void tpl_1402_gornatoth_teach_1h_1()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00");	//Я хочу улучшить технику ведения боя с одноручным мечом.
	if(B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01");	//Это хорошее решение! Чтобы улучшить технику ведения боя, ты должен научиться правильно держать оружие.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02");	//Начиная тренироваться, многие неопытные воины стараются держать рукоять меча двумя руками. Это ненужная привычка, которая может помешать тебе в дальнейшем.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03");	//Держи меч одной рукой. Клинок направь вверх и не держи его неподвижно.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04");	//Ты должен научиться видеть меч как часть самого себя, и тогда его движения будут согласованы с движениями твоего тела. Это увеличит скорость атаки.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05");	//Если ты будешь следовать моим советам, ты сможешь вести бой красиво. Но самое главное, твои движения станут быстрее.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06");	//Да, есть еще кое-что: некоторые удары наносят большее повреждение противнику. Ты еще новичок, поэтому у тебя не так много шансов на критический удар.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07");	//Но частые тренировки помогут тебе совершенствоваться и наносить все больше таких ударов.
	};
	b_gornatothlearn();
};

func void tpl_1402_gornatoth_teach_1h_2()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01");	//Научи меня еще лучше владеть одноручным мечом.
	if(B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02");	//Ты уже получил начальное представление о владении этим оружием. Если ты будешь держать меч клинком вниз, ты сможешь вложить большую силу в свой первый удар.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03");	//Помнишь, что я говорил о хорошем размахе? Следующий шаг на пути к мастерству - умение использовать движения собственного тела. Если ты успел нанести два удара, сделай разворот. Это отвлечет противника и даст тебе возможность выбрать более удачную позицию.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04");	//Затем размахнись и нанеси удар справа налево.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05");	//Вернись в исходную стойку. Как ты знаешь, мастерство приходит с опытом. А теперь иди и не забывай о тренировках.
	};
	b_gornatothlearn();
};

