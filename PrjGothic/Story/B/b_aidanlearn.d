
func void b_aidanlearn()
{
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice(Org_859_Aidan_Creatures,DIALOG_BACK,Org_859_Aidan_Creatures_BACK);
		if(Knows_GetTeeth == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(Org_859_Aidan_Creatures,"Добыча клыков (2 очка обучения, 50 руды)",Org_859_Aidan_Creatures_Zahn);
			}
			else
			{
				Info_AddChoice(Org_859_Aidan_Creatures,"Добыча клыков (1 очко обучения, 50 руды)",Org_859_Aidan_Creatures_Zahn);
			};
		};
		if(Knows_GetFur == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(Org_859_Aidan_Creatures,"Добыча шкур (2 очка обучения, 100 руды)",Org_859_Aidan_Creatures_Fell);
			}
			else
			{
				Info_AddChoice(Org_859_Aidan_Creatures,"Добыча шкур (1 очко обучения, 100 руды)",Org_859_Aidan_Creatures_Fell);
			};
		};
		if(Knows_GetClaws == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(Org_859_Aidan_Creatures,"Добыча когтей (2 очка обучения, 50 руды)",Org_859_Aidan_Creatures_Kralle);
			}
			else
			{
				Info_AddChoice(Org_859_Aidan_Creatures,"Добыча когтей (1 очко обучения, 50 руды)",Org_859_Aidan_Creatures_Kralle);
			};
		};
		if(Knows_GetHide == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(Org_859_Aidan_Creatures,"Добыча шкур рептилий (2 очка обучения, 100 руды)",Org_859_Aidan_Creatures_Haut);
			}
			else
			{
				Info_AddChoice(Org_859_Aidan_Creatures,"Добыча шкур рептилий (1 очко обучения, 100 руды)",Org_859_Aidan_Creatures_Haut);
			};
		};
	}
	else
	{
		AI_Output(self,other,"SVM_13_NoLearnOverMax");	//Ты уже освоил эту науку. Тебе стоит научиться чему-нибудь еще.
		AIDAN_CAN_LEARN = FALSE;
	};
};


instance DIA_Aidan_Exit(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 999;
	condition = DIA_Aidan_Exit_Condition;
	information = DIA_Aidan_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Aidan_Exit_Condition()
{
	return 1;
};

func void DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Aidan_Hello(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = DIA_Aidan_Hello_Condition;
	information = DIA_Aidan_Hello_Info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int DIA_Aidan_Hello_Condition()
{
	return 1;
};

func void DIA_Aidan_Hello_Info()
{
	AI_Output(other,self,"DIA_Aidan_Hello_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Aidan_Hello_13_01");	//Я охотник. Добываю шкуры и клыки, тем и живу.
	AI_Output(other,self,"DIA_Aidan_Hello_15_02");	//За них хорошо платят?
	AI_Output(self,other,"DIA_Aidan_Hello_13_03");	//Да, можно неплохо зарабатывать, если знать, как разделывать добычу.
	AIDAN_CAN_LEARN = TRUE;
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
		B_LogEntry(GE_TeacherOW,"Эйдан, охотник, живущий между Старым и Новым лагерями, может научить меня разделывать добычу.");
	};
};


instance Org_859_Aidan_Creatures(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 990;
	condition = Org_859_Aidan_Creatures_Condition;
	information = Org_859_Aidan_Creatures_Info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int Org_859_Aidan_Creatures_Condition()
{
	if(AIDAN_CAN_LEARN == TRUE)
	{
		return 1;
	};
};

func void Org_859_Aidan_Creatures_Info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//Я хочу научиться правильно разделывать добычу.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01");	//А чему ты хочешь научиться?
	};
	b_aidanlearn();
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00");	//Как добывать клыки?
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
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01");	//Ты должен следить за тем, чтобы клыки не сломались. Чтобы этого избежать, используй очень острый нож.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02");	//Лучше всего продаются клыки волков, глорхов и мракорисов.
			b_learn_trophies_teeth();
		}
		else
		{
			AI_Output(self,other,"SVM_13_NoLearnNoPoints");	//Я не могу обучить тебя. У тебя недостаточно опыта.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"SVM_13_ShitNoOre");	//Да у тебя же совсем нет руды!
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Я научил тебя всему, что знал сам.
		Info_ClearChoices(Org_859_Aidan_Creatures);
		AIDAN_CAN_LEARN = FALSE;
	}
	else
	{
		b_aidanlearn();
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00");	//Как снимать шкуры?
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
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01");	//Важно знать, что начинать разделывать тушу следует с головы. Шкуры здесь высоко ценятся, поэтому главное не повредить их при снятии.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02");	//Из шкур волков и мракорисов шьют хорошую одежду. С практикой к тебе придет умение распознавать, годится та или иная шкура на одежду или нет.
			b_learn_trophies_fur();
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//Сначала заплати мне. Как говорится, всему своя цена.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Я научил тебя всему, что знал сам.
		Info_ClearChoices(Org_859_Aidan_Creatures);
		AIDAN_CAN_LEARN = FALSE;
	}
	else
	{
		b_aidanlearn();
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00");	//Научи меня добывать когти.
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
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01");	//Это проще, чем кажется на первый взгляд. Нужно отогнуть коготь вперед, но при этом не пытаться его выдернуть и не отгибать назад.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02");	//Конечно, пригодные когти можно добыть не у всякого зверя. Обычно в дело идут когти ящериц.
			b_learn_trophies_claws();
		}
		else
		{
			AI_Output(self,other,"SVM_13_NoLearnNoPoints");	//Я не могу обучить тебя. У тебя недостаточно опыта.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"SVM_13_ShitNoOre");	//Да у тебя же совсем нет руды!
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Я научил тебя всему, что знал сам.
		Info_ClearChoices(Org_859_Aidan_Creatures);
		AIDAN_CAN_LEARN = FALSE;
	}
	else
	{
		b_aidanlearn();
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00");	//Что мне нужно знать, чтобы добывать шкуры рептилий?
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
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01");	//Для этого подходят не всякие рептилии, а лишь шныги и болотожоры.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02");	//Если ты подрежешь шкуру по краям, то ты сможешь легко ее снять. Теперь ты сможешь легко справляться с этой задачей.
			b_learn_trophies_reptilefur();
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//Сначала заплати мне. Как говорится, всему своя цена.
	};
	if((Knows_GetTeeth == TRUE) && (Knows_GetFur == TRUE) && (Knows_GetClaws == TRUE) && (Knows_GetHide == TRUE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Я научил тебя всему, что знал сам.
		Info_ClearChoices(Org_859_Aidan_Creatures);
		AIDAN_CAN_LEARN = FALSE;
	}
	else
	{
		b_aidanlearn();
	};
};

