
func void b_draxlearn()
{
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		Info_ClearChoices(org_819_drax_learn);
		Info_AddChoice(org_819_drax_learn,DIALOG_BACK,org_819_drax_learn_back);
		if(Knows_GetTeeth == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"Добыча клыков (2 очка обучения, 50 руды)",Org_819_Drax_Creatures_Zahn);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"Добыча клыков (1 очко обучения, 50 руды)",Org_819_Drax_Creatures_Zahn);
			};
		};
		if(Knows_GetFur == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"Добыча шкур (2 очка обучения, 100 руды)",Org_819_Drax_Creatures_Fell);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"Добыча шкур (1 очко обучения, 100 руды)",Org_819_Drax_Creatures_Fell);
			};
		};
		if(Knows_GetClaws == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"Добыча когтей (2 очка обучения, 50 руды)",Org_819_Drax_Creatures_Kralle);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"Добыча когтей (1 очко обучения, 50 руды)",Org_819_Drax_Creatures_Kralle);
			};
		};
		if(Knows_GetHide == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"Добыча шкур рептилий (2 очка обучения, 100 руды)",Org_819_Drax_Creatures_Haut);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"Добыча шкур рептилий (1 очко обучения, 100 руды)",Org_819_Drax_Creatures_Haut);
			};
		};
	}
	else
	{
		AI_Output(self,other,"SVM_6_NoLearnOverMax");	//Ты выучил все, что нужно. Тебе стоит поучиться чему-нибудь еще.
		DRAX_CAN_LEARN = FALSE;
	};
};


instance Org_819_Drax_Exit(C_Info)
{
	npc = ORG_819_Drax;
	nr = 999;
	condition = Org_819_Drax_Exit_Condition;
	information = Org_819_Drax_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_819_Drax_Exit_Condition()
{
	return 1;
};

func void Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_819_Drax_HuntHere(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_HuntHere_Condition;
	information = Org_819_Drax_HuntHere_Info;
	permanent = 0;
	description = "Ты охотник, да?";
};


func int Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

func void Org_819_Drax_HuntHere_Info()
{
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_00");	//Ты охотник, да?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_01");	//Кажется, да... а что тебе нужно?
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_02");	//Ты можешь подсказать мне, как лучше охотиться?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_03");	//Я могу обучить тебя, но все имеет свою цену.
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_04");	//И какова эта цена?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_05");	//Для начала бутылка пива, а там посмотрим.
	if(!Npc_HasItems(other,ItFoBeer))
	{
		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00");	//У меня нет пива.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01");	//Так купи его. Это мой последний бесплатный совет на сегодня. А когда вернешься с пивом, прихвати немного руды.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02");	//Я могу многому тебя научить, но не задаром же!
	};
};


var int drax_Lehrer_frei;

instance Org_819_Drax_Scavenger(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_Scavenger_Condition;
	information = Org_819_Drax_Scavenger_Info;
	permanent = 0;
	description = "Вот твое пиво. Так ты расскажешь мне об охоте?";
};


func int Org_819_Drax_Scavenger_Condition()
{
	if(Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (Npc_HasItems(other,ItFoBeer) > 0))
	{
		return 1;
	};
};

func void Org_819_Drax_Scavenger_Info()
{
	B_GiveInvItems(other,self,ItFoBeer,1);
	b_printtrademsg1("Отдано пиво.");
	AI_Output(other,self,"Org_819_Drax_Scavenger_15_00");	//Вот твое пиво. Так ты расскажешь мне об охоте?
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,ItFoBeer);
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_01");	//Эти места населены крупными птицами. Мы называем их падальщиками. Атаковать их нужно поодиночке. Выманить падальщика из стаи проще простого.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_02");	//Когда ты подойдешь ближе, птица забеспокоится, а потом стремительно бросится на тебя. Держи оружие наготове.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_03");	//Нанеси удар первым. Падальщик остановится, и у тебя будет тактическое преимущество. Тогда ты с легкостью его одолеешь.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_04");	//Ну, а если он ударит тебя первым, тогда... но этого лучше не допускать.
	drax_Lehrer_frei = TRUE;
};


instance Org_819_Drax_Creatures(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_Creatures_Condition;
	information = Org_819_Drax_Creatures_Info;
	permanent = 0;
	description = "Ты можешь научить меня правильно разделывать добычу?";
};


func int Org_819_Drax_Creatures_Condition()
{
	if(drax_Lehrer_frei == TRUE)
	{
		return 1;
	};
};

func void Org_819_Drax_Creatures_Info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_15_00");	//Ты можешь научить меня правильно разделывать добычу?
	AI_Output(self,other,"Org_819_Drax_Creatures_06_01");	//Конечно, могу, но на этот раз ты пивом не отделаешься.
	AI_Output(self,other,"Org_819_Drax_Creatures_06_02");	//В здешних краях можно добывать шкуры, клыки и когти, если знать, как это делается. Но за это знание придется заплатить.
	AI_Output(self,other,"Org_819_Drax_Creatures_06_03");	//Охотничьи трофеи обычно высоко ценятся.
	DRAX_CAN_LEARN = TRUE;
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
		B_LogEntry(GE_TeacherOW,"Вор Дракс предложил мне научиться разделывать добычу, если мне это будет по карману. Обычно он охотится между Старым лагерем и местом обмена.");
	};
};


instance ORG_819_DRAX_TOOMUCH(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = org_819_drax_toomuch_condition;
	information = org_819_drax_toomuch_info;
	permanent = 0;
	description = "Ты просишь слишком много.";
};


func int org_819_drax_toomuch_condition()
{
	if(DRAX_CAN_LEARN == TRUE)
	{
		return 1;
	};
};

func void org_819_drax_toomuch_info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00");	//Ты просишь слишком много.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01");	//Конечно, ведь охота - хороший способ заработать руду.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02");	//Если ты не знаешь, как правильно разделывать добычу, то все убитые тобой звери просто сгниют без пользы.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03");	//А ты упустишь возможность заработать немного, продав их шкуры.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04");	//На твоем месте я постарался бы научиться охотиться как можно быстрее.
};


instance ORG_819_DRAX_LEARN(C_Info)
{
	npc = ORG_819_Drax;
	nr = 990;
	condition = org_819_drax_learn_condition;
	information = org_819_drax_learn_info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int org_819_drax_learn_condition()
{
	if(DRAX_CAN_LEARN == TRUE)
	{
		return 1;
	};
};

func void org_819_drax_learn_info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//Я хочу научиться правильно разделывать добычу.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"SVM_6_WhatDoYouWant");	//Я могу помочь тебе?
	};
	b_draxlearn();
};

func void org_819_drax_learn_back()
{
	Info_ClearChoices(org_819_drax_learn);
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00");	//Как добывать клыки?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("Отдано руды: 50");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			B_GiveInvItems(other,self,ItMiNugget,50);
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01");	//Ты должен следить за тем, чтобы клыки не сломались. Чтобы этого избежать, используй очень острый нож, как рычаг.
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02");	//Клыки волков, глорхов и мракорисов ценятся выше всего.
			b_learn_trophies_teeth();
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_00");	//Ты должен набраться опыта, иначе ты ничему не сможешь научиться.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00");	//У тебя нет руды. Как я уже сказал, здесь все имеет свою цену.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//Ну, вот, теперь я научил тебя всему, что знаю сам.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00");	//Как снимать шкуры?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("Отдано руды: 100");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			B_GiveInvItems(other,self,ItMiNugget,100);
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_01");	//Важно знать, что начинать разделывать тушу следует с головы. Шкуры здесь высоко ценятся, поэтому главное не повредить их при снятии.
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_02");	//Из шкур волков и мракорисов шьют хорошую одежду. С практикой к тебе придет умение распознавать, годится та или иная шкура на одежду или нет.
			b_learn_trophies_fur();
		}
		else
		{
			AI_Output(self,other,"SVM_6_NoLearnNoPoints");	//Я ничему не смогу научить тебя, тебе не хватает опыта.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01");	//У тебя нет руды. Как я уже сказал, здесь все имеет свою цену.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//Ну, вот, теперь я научил тебя всему, что знаю сам.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00");	//Научи меня добывать когти.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("Отдано руды: 50");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			B_GiveInvItems(other,self,ItMiNugget,50);
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_01");	//Это проще, чем кажется на первый взгляд. Нужно отогнуть коготь вперед, но при этом не пытаться его выдернуть и не отгибать назад.
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_02");	//Конечно, пригодные когти можно добыть не у всякого зверя. Обычно в дело идут когти ящериц.
			b_learn_trophies_claws();
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_02");	//Твоего опыта недостаточно, чтобы воспользоваться моим советом.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03");	//Сначала заплати мне. Как говорится - всему своя цена.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//Ну, вот, теперь я научил тебя всему, что знаю сам.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00");	//Что нужно делать, чтобы снимать шкуры с рептилий?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("Отдано руды: 100");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			B_GiveInvItems(other,self,ItMiNugget,100);
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_01");	//Для этого подходят не все рептилии, а лишь шныги и болотожоры.
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_02");	//Если ты подрежешь шкуру по краям, то ты сможешь легко ее снять. Теперь ты сможешь легко справляться с этой задачей.
			b_learn_trophies_reptilefur();
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_03");	//Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03");	//Сначала заплати мне. Как говорится - всему своя цена.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//Ну, вот, теперь я научил тебя всему, что знаю сам.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

