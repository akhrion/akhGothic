
func void b_wedgelearn()
{
	Info_ClearChoices(DIA_Wedge_Lehrer);
	Info_AddChoice(DIA_Wedge_Lehrer,DIALOG_BACK,DIA_Wedge_Lehrer_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,10,0),DIA_Wedge_Lehrer_Pickpocket2);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,200),DIA_Wedge_Lehrer_Pickpocket2);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,5,0),DIA_Wedge_Lehrer_Pickpocket);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,100),DIA_Wedge_Lehrer_Pickpocket);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,10,0),DIA_Wedge_Lehrer_Lockpick2);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,200),DIA_Wedge_Lehrer_Lockpick2);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,5,0),DIA_Wedge_Lehrer_Lockpick);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,100),DIA_Wedge_Lehrer_Lockpick);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak,5,0),DIA_Wedge_Lehrer_Schleichen);
		}
		else
		{
			Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,100),DIA_Wedge_Lehrer_Schleichen);
		};
	};
};


instance DIA_Wedge_Exit(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 999;
	condition = DIA_Wedge_Exit_Condition;
	information = DIA_Wedge_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

func void DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wedge_Psst(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 1;
	condition = DIA_Wedge_Psst_Condition;
	information = DIA_Wedge_Psst_Info;
	important = 1;
	permanent = 0;
};


func int DIA_Wedge_Psst_Condition()
{
	if((Npc_GetDistToNpc(hero,self) < 900) && Wld_IsTime(8,0,23,30))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Psst_Info()
{
	AI_Output(self,other,"DIA_Wedge_Psst_05_00");	//Эй, ты!
	AI_Output(other,self,"DIA_Wedge_Psst_15_01");	//Кто?.. Я?
	AI_Output(self,other,"DIA_Wedge_Psst_05_02");	//Да, да, ты... Подойди-ка сюда!
	AI_StopProcessInfos(self);
};


instance DIA_Wedge_Hello(C_Info)
{
	npc = ORG_850_Wedge;
	condition = DIA_Wedge_Hello_Condition;
	information = DIA_Wedge_Hello_Info;
	important = 0;
	permanent = 0;
	description = "Что тебе от меня нужно?";
};


func int DIA_Wedge_Hello_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Hello_Info()
{
	AI_Output(other,self,"DIA_Wedge_Hello_15_00");	//Что тебе от меня нужно?
	AI_Output(self,other,"DIA_Wedge_Hello_05_01");	//Ты ведь не так давно здесь, да? Я сразу это заметил.
	AI_Output(self,other,"DIA_Wedge_Hello_05_02");	//Тебе нужно многое знать и уметь, чтобы выжить здесь. Я могу поучить тебя, если хочешь.
	AI_Output(self,other,"DIA_Wedge_Hello_05_03");	//Прежде всего следи за тем, с кем ты разговариваешь. Например, Бутч - вон тот вор у костра, очень опасный тип. Держись от него подальше!
};


instance DIA_Wedge_WarnsOfButch(C_Info)
{
	npc = ORG_850_Wedge;
	condition = DIA_Wedge_WarnsOfButch_Condition;
	information = DIA_Wedge_WarnsOfButch_Info;
	important = 0;
	permanent = 0;
	description = "Почему?";
};


func int DIA_Wedge_WarnsOfButch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};
};

func void DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00");	//Почему?
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01");	//Есть у него одна нехорошая привычка - бить всех новичков. Так что постарайся не попадаться ему на глаза.
};


instance DIA_Wedge_Lehrer(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 700;
	condition = DIA_Wedge_Lehrer_Condition;
	information = DIA_Wedge_Lehrer_Info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Wedge_Lehrer_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Lehrer_Info()
{
	if(log_wedgelearn == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Вор Ведж может научить меня подкрадываться, воровать и вскрывать замки.");
		log_wedgelearn = TRUE;
	};
	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00");	//Ты можешь научить меня чему-нибудь?
	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) < 2) || (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0) || (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_05_01");	//Зависит от того, что ты хочешь узнать!
		b_wedgelearn();
	}
	else
	{
		AI_Output(self,other,"SVM_5_NoLearnOverMax");	//Ты выучил все, что нужно. Тебе стоит поучиться чему-нибудь еще.
	};
};

func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00");	//Я хочу научиться подкрадываться.
	if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,5))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//Все решает твое умение сохранять равновесие. Так же немаловажно контролировать свое дыхание.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//Существует особый способ движения, при котором никто не сможет услышать твоих шагов.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 100)
	{
		if(hero.lp >= LPCOST_TALENT_SNEAK)
		{
			b_printtrademsg1("Отдано руды: 100");
			B_GiveInvItems(other,self,ItMiNugget,100);
		};
		if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//Все решает твое умение сохранять равновесие. Так же немаловажно контролировать свое дыхание.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//Существует особый способ движения, при котором никто не сможет услышать твоих шагов.
		};
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00");	//Я хочу научиться виртуозно вскрывать замки.
	if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//Ты ведь хотел бы это узнать, да? Научиться этому не очень сложно.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//Очень важно следить за тем, чтобы у тебя не сломалась отмычка.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//Если ты будешь действовать очень осторожно, ты заметишь, что во многих случаях тебе не понадобится больше одной отмычки.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 100)
	{
		if(hero.lp >= LPCOST_TALENT_PICKLOCK_1)
		{
			b_printtrademsg1("Отдано руды: 100");
			B_GiveInvItems(other,self,ItMiNugget,100);
		};
		if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//Ты ведь хотел бы это узнать, да? Научиться этому не очень сложно.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//Очень важно следить за тем, чтобы у тебя не сломалась отмычка.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//Если ты будешь действовать очень осторожно, ты заметишь, что во многих случаях тебе не понадобится больше одной отмычки.
		};
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00");	//Я хочу стать мастером взлома замков.
	if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//Стоит немного потренироваться, и ты уже с легкостью будешь распознавать момент, когда отмычка готова вот-вот сломаться. При этом ты услышишь особый звук.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//С опытом к тебе придет умение различать щелчки в замке при повороте отмычки. При этом ты будешь ломать их гораздо реже.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//Настоящему профессионалу часто удается открыть замок, не сломав ни одной отмычки.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 200)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
		{
			if(hero.lp >= LPCOST_TALENT_PICKLOCK_2)
			{
				b_printtrademsg1("Отдано руды: 200");
				B_GiveInvItems(other,self,ItMiNugget,200);
			};
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//Стоит немного потренироваться, и ты уже с легкостью будешь распознавать момент, когда отмычка готова вот-вот сломаться. При этом ты услышишь особый звук.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//С опытом к тебе придет умение различать щелчки в замке при повороте отмычки. При этом ты будешь ломать их гораздо реже.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//Настоящему профессионалу часто удается открыть замок, не сломав ни одной отмычки.
		};
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00");	//Я хочу стать опытным карманником.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
			{
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//Так ты хочешь облегчать кошельки местных богачей, да? Что ж.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//Я научу тебя этому, но у вора всегда есть небольшой шанс быть застигнутым на месте преступления.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//Риск будет оправдан только в том случае, если ты остаешься один на один со своей жертвой.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//Но только профессиональный вор может совершенно незаметно вытащить что-нибудь ценное из кармана зазевавшегося прохожего!
			};
		}
		else if(Npc_HasItems(hero,ItMiNugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_PICKPOCKET_1)
			{
				b_printtrademsg1("Отдано руды: 100");
				B_GiveInvItems(other,self,ItMiNugget,100);
			};
			if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
			{
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//Так ты хочешь облегчать кошельки местных богачей, да? Что ж.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//Я научу тебя этому, но у вора всегда есть небольшой шанс быть застигнутым на месте преступления.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//Риск будет оправдан только в том случае, если ты остаешься один на один со своей жертвой.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//Но только профессиональный вор может совершенно незаметно вытащить что-нибудь ценное из кармана зазевавшегося прохожего!
			};
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
			AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05");	//Даже не думай об этом! Тот, кто не умеет подкрадываться, никогда не станет вором.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00");	//Я хочу стать мастером-карманником.
	if(hero.guild == GIL_ORG)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//Думаю, ты уже готов к тому, чтобы я посвятил тебя в секреты настоящего мастерства.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//Но знай, что даже самого лучше вора могут застать на месте преступления.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//Будь осторожен.
		};
	}
	else if(Npc_HasItems(hero,ItMiNugget) >= 200)
	{
		if(hero.lp >= LPCOST_TALENT_PICKPOCKET_2)
		{
			b_printtrademsg1("Отдано руды: 200");
			B_GiveInvItems(other,self,ItMiNugget,200);
		};
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//Думаю, ты уже готов к тому, чтобы я посвятил тебя в секреты настоящего мастерства.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//Но знай, что даже самого лучше вора могут застать на месте преступления.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//Будь осторожен.
		};
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
	};
	b_wedgelearn();
};

func void DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Wedge_Lehrer);
};

