
func void b_busterlearn()
{
	Info_ClearChoices(dia_org_833_buster4);
	Info_AddChoice(dia_org_833_buster4,DIALOG_BACK,DIA_ORG_833_Buster_Back);
	if(DIFF_HARD == TRUE)
	{
		if(hero.attribute[ATR_DEXTERITY] >= 20)
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (10 очков обучения, 100 руды)",DIA_ORG_833_Buster_Train1);
		}
		else
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (20 ловкости, 10 очков обучения, 100 руды)",DIA_ORG_833_Buster_Train1);
		};
	}
	else if(FREELEARN_NC == FALSE)
	{
		if(hero.attribute[ATR_DEXTERITY] >= 20)
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (10 очков обучения, 100 руды)",DIA_ORG_833_Buster_Train1);
		}
		else
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (20 ловкости, 10 очков обучения, 100 руды)",DIA_ORG_833_Buster_Train1);
		};
	}
	else if(hero.guild == GIL_ORG)
	{
		if(hero.attribute[ATR_DEXTERITY] >= 20)
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (5 очков обучения)",DIA_ORG_833_Buster_Train1);
		}
		else
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (20 ловкости, 5 очков обучения)",DIA_ORG_833_Buster_Train1);
		};
	}
	else if(hero.attribute[ATR_DEXTERITY] >= 20)
	{
		Info_AddChoice(dia_org_833_buster4,"Акробатика (10 очков обучения)",DIA_ORG_833_Buster_Train1);
	}
	else
	{
		Info_AddChoice(dia_org_833_buster4,"Акробатика (20 ловкости, 10 очков обучения)",DIA_ORG_833_Buster_Train1);
	};
};


instance DIA_ORG_833_Buster(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster_Condition;
	information = DIA_ORG_833_Buster_Info;
	important = 1;
	permanent = 0;
};


func int DIA_ORG_833_Buster_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01");	//Похоже, ты не слишком проворен. Я могу помочь тебе.
};


instance DIA_ORG_833_Buster_Exit(C_Info)
{
	npc = ORG_833_Buster;
	nr = 999;
	condition = DIA_ORG_833_Buster_Exit_Condition;
	information = DIA_ORG_833_Buster_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORG_833_Buster3(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster3_Condition;
	information = DIA_ORG_833_Buster3_Info;
	important = 0;
	permanent = 0;
	description = "А чем ты сможешь мне помочь?";
};


func int DIA_ORG_833_Buster3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_ORG_833_Buster))
	{
		return 1;
	};
};

func void DIA_ORG_833_Buster3_Info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01");	//А чем ты сможешь мне помочь?
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Я могу обучить тебя контролю над телом. Это искусство называется акробатика.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Вор Бастер может научить меня акробатике.");
};


instance DIA_ORG_833_BUSTER4(C_Info)
{
	npc = ORG_833_Buster;
	condition = dia_org_833_buster4_condition;
	information = dia_org_833_buster4_info;
	important = 0;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int dia_org_833_buster4_condition()
{
	if(Npc_KnowsInfo(hero,DIA_ORG_833_Buster3) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0))
	{
		return 1;
	};
};

func void dia_org_833_buster4_info()
{
	b_busterlearn();
};

func void DIA_ORG_833_Buster_Train1()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//Начнем прямо сейчас.
	if(hero.attribute[ATR_DEXTERITY] < 20)
	{
		PrintScreen("Условие: 20 ловкости.",-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",_TIME_MESSAGE_Joincamp);
		AI_Output(self,other,"SVM_2_NoLearnNoPoints");	//Я не смогу стать твоим учителем. У тебя недостаточно практических навыков.
		b_busterlearn();
	}
	else if(DIFF_HARD == TRUE)
	{
		if(Npc_HasItems(hero,ItMiNugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_ACROBAT)
			{
				b_printtrademsg1("Отдано руды: 100");
				B_GiveInvItems(other,self,ItMiNugget,100);
			};
			if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
			{
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
				Info_ClearChoices(dia_org_833_buster4);
			}
			else
			{
				b_busterlearn();
			};
		}
		else
		{
			AI_Output(self,other,"SVM_2_ShitNoOre");	//Что, преследуют неудачи, приятель? Совсем нет руды?
			b_busterlearn();
		};
	}
	else if(FREELEARN_NC == FALSE)
	{
		if(Npc_HasItems(hero,ItMiNugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_ACROBAT)
			{
				b_printtrademsg1("Отдано руды: 100");
				B_GiveInvItems(other,self,ItMiNugget,100);
			};
			if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
			{
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
				Info_ClearChoices(dia_org_833_buster4);
			}
			else
			{
				b_busterlearn();
			};
		}
		else
		{
			AI_Output(self,other,"SVM_2_ShitNoOre");	//Что, преследуют неудачи, приятель? Совсем нет руды?
			b_busterlearn();
		};
	}
	else if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,5))
		{
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
			Info_ClearChoices(dia_org_833_buster4);
		}
		else
		{
			b_busterlearn();
		};
	}
	else if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
	{
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
		Info_ClearChoices(dia_org_833_buster4);
	}
	else
	{
		b_busterlearn();
	};
};

func void DIA_ORG_833_Buster_Back()
{
	Info_ClearChoices(dia_org_833_buster4);
};

