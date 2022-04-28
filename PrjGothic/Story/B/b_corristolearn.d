
func void b_corristolearn()
{
	if(DIFF_HARD == TRUE)
	{
		Info_ClearChoices(KDF_402_Corristo_MANA);
		Info_AddChoice(KDF_402_Corristo_MANA,DIALOG_BACK,KDF_402_Corristo_MANA_BACK);
		Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,(5 * LPCOST_ATTRIBUTE_MANA),OTHERCAMPLEARNPAY * 5),KDF_402_Corristo_MANA_MAN_5);
		Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),KDF_402_Corristo_MANA_MAN_1);
	}
	else
	{
		Info_ClearChoices(KDF_402_Corristo_MANA);
		Info_AddChoice(KDF_402_Corristo_MANA,DIALOG_BACK,KDF_402_Corristo_MANA_BACK);
		Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_5);
		Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_1);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0)
	{
		Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0),KDF_402_Corristo_KREIS1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0),KDF_402_Corristo_KREIS2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0),KDF_402_Corristo_KREIS3);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0),KDF_402_Corristo_KREIS4);
	};
};


instance KDF_402_Corristo_Exit(C_Info)
{
	npc = Kdf_402_Corristo;
	nr = 999;
	condition = KDF_402_Corristo_Exit_Condition;
	information = KDF_402_Corristo_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int KDF_402_Corristo_Exit_Condition()
{
	return TRUE;
};

func void KDF_402_Corristo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Corristo_Intruder(C_Info)
{
	npc = Kdf_402_Corristo;
	nr = 1;
	condition = Info_Corristo_Intruder_Condition;
	information = Info_Corristo_Intruder_Info;
	permanent = 1;
	important = 1;
};


func int Info_Corristo_Intruder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !(Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) || Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo) || (CorKalom_BringMCQBalls == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void Info_Corristo_Intruder_Info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//Что ты здесь делаешь? Тебе сюда нельзя! Уходи!
	AI_StopProcessInfos(self);
};


instance KDF_402_Corristo_EXPLAINMAGE(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_EXPLAINMAGE_Condition;
	information = KDF_402_Corristo_EXPLAINMAGE_Info;
	important = 0;
	permanent = 0;
	description = "Расскажи мне, что значит быть магом.";
};


func int KDF_402_Corristo_EXPLAINMAGE_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_EXPLAINMAGE_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01");	//Расскажи мне, что значит быть магом.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02");	//Мы, маги Огня, служим Инносу, верховному богу.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03");	//Мы избраны быть его жрецами, учителями и судьями. Наша способность колдовать - его бесценный дар.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04");	//Дар, который определяет цель нашей жизни и налагает на нас большую ответственность.
};


instance KDF_402_Corristo_WANNBEKDF(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_WANNBEKDF_Condition;
	information = KDF_402_Corristo_WANNBEKDF_Info;
	important = 0;
	permanent = 1;
	description = "Я хочу стать магом, одним из вас.";
};


func int KDF_402_Corristo_WANNBEKDF_Condition()
{
	if(((CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) && !Npc_KnowsInfo(hero,KDF_402_Corristo_KDFTEST) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_WANNBEKDF_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_WANNBEKDF_Info_15_01");	//Я хочу стать магом, одним из вас.
	AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_02");	//Ты хочешь стать магом Круга Огня? Хм...
	if(hero.level < 10)
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04");	//Ты знаешь еще слишком мало. Приходи ко мне, когда будешь знать больше.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_03");	//Многие приходили ко мне, чтобы стать магами, но только один из них стал моим учеником. Все остальные ушли ни с чем.
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_05");	//Твой дух уже может принять наше учение. Если хочешь стать магом, ты должен пройти испытание. Скажи мне, когда будешь готов.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices(KDF_402_Corristo_WANNBEKDF);
		Log_CreateTopic(GE_BecomeFiremage,LOG_NOTE);
		B_LogEntry(GE_BecomeFiremage,"Корристо сказал мне, что я могу быть принят в Круг магов Огня. Но для этого я должен пройти испытание.");
	};
};


instance KDF_402_Corristo_KDFTEST(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_KDFTEST_Condition;
	information = KDF_402_Corristo_KDFTEST_Info;
	important = 0;
	permanent = 0;
	description = "Я готов к испытанию.";
};


func int KDF_402_Corristo_KDFTEST_Condition()
{
	if((Corristo_KDFAufnahme == 1) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_KDFTEST_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_Info_15_01");	//Я готов к испытанию.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_Info_14_02");	//Хорошо. Ты помогал братьям из Болотного лагеря, да?
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Да, это так.",KDF_402_Corristo_KDFTEST_JA);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Нет.",KDF_402_Corristo_KDFTEST_NO);
};

func void KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01");	//Да, это так.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03");	//Назови мне имя верховного бога.
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Аданос.",KDF_402_Corristo_KDFTEST_ADANOS);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Спящий.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Иннос.",KDF_402_Corristo_KDFTEST_INNOS);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Гомез.",KDF_402_Corristo_KDFTEST_GOMEZ);
};

func void KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01");	//Нет.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03");	//Мы не можем принять в свой круг человека, который отрекается от своих поступков.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04");	//Путь мага для тебя закрыт. Ты можешь пойти к стражникам или рудокопам.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01");	//Аданос.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03");	//Это неверный ответ. Быть может, твои таланты больше пригодятся стражникам.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01");	//Спящий.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03");	//Ты слишком много времени провел в лагере на болотах. Может быть, тебе стоит вернуться к ним.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01");	//Иннос.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03");	//Назови мне высшую добродетель.
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Честь воина.",KDF_402_Corristo_KDFTEST_FIGHT);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Смирение перед силой магии.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Контроль над телом и духом.",KDF_402_Corristo_KDFTEST_DISZIPLIN);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Благоговение перед богами.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};

func void KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01");	//Гомез.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02");	//Хмм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03");	//Я думаю, тебе стоит обратиться к Торусу. Твоя судьба - стать воином.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_FIGHT()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01");	//Честь воина.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03");	//Я думаю, тебе стоит обратиться к Торусу. Твоя судьба - стать воином.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01");	//Смирение перед силой магии.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03");	//Твои ответы меня порадовали. Ты достоин стать моим учеником.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04");	//Пойдем в Зал Магии. Там ты принесешь древнюю клятву магов.
	AI_StopProcessInfos(self);
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};

func void KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01");	//Контроль над телом и духом.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03");	//Твои ответы меня порадовали. Ты достоин стать моим учеником.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04");	//Пойдем в Зал Магии. Там ты принесешь древнюю клятву магов.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos(self);
	B_Story_Feueraufnahme();
};

func void KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01");	//Благоговение перед богами.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02");	//Хм...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03");	//Твои ответы меня порадовали. Ты достоин стать моим учеником.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04");	//Пойдем в Зал Магии. Там ты принесешь древнюю клятву магов.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos(self);
	B_Story_Feueraufnahme();
};


instance KDF_402_Corristo_AUFNAHME(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_AUFNAHME_Condition;
	information = KDF_402_Corristo_AUFNAHME_Info;
	important = 1;
	permanent = 0;
};


func int KDF_402_Corristo_AUFNAHME_Condition()
{
	if((Npc_GetDistToWP(hero,"OCC_CHAPEL_UPSTAIRS") < 400) && (Corristo_KDFAufnahme == 4) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_AUFNAHME_Info()
{
	Corristo_KDFAufnahme = 5;
	B_Story_Feueraufnahme();
	AI_UnequipWeapons(hero);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_01");	//Мы собрались здесь, чтобы принять клятву нового служителя Огня.
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_02");	//Принеси же клятву Огня.
	Snd_Play("howling_01");
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_03");	//Я клянусь божественной властью...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_04");	//Я клянусь божественной властью...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_05");	//...и силой священного неугасимого Огня...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_06");	//...и силой священного неугасимого Огня...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_07");	//... что с этого дня мои знания и дела будут навеки едины с пламенем...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_08");	//... что с этого дня мои знания и дела будут навеки едины с пламенем...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_09");	//...пока мое тело не вернется в царство Белиара и не угаснет огонь моей жизни.
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_10");	//...пока мое тело не вернется в царство Белиара и не угаснет огонь моей жизни.
	AI_StopProcessInfos(self);
};


instance KDF_402_Corristo_ROBE(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_ROBE_Condition;
	information = KDF_402_Corristo_ROBE_Info;
	important = 1;
	permanent = 0;
};


func int KDF_402_Corristo_ROBE_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_AUFNAHME) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_ROBE_Info()
{
	Snd_Play("MFX_Heal_Cast");
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_01");	//Этой клятвой ты связал свою жизнь с неугасимым Огнем.
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_02");	//Возьми это одеяние и носи его в знак вечного союза.
	b_printtrademsg1("Получена мантия мага Огня.");
	AI_StopProcessInfos(self);
	CreateInvItem(self,kdf_armor_l);
	B_GiveInvItems(self,hero,kdf_armor_l,1);
	Npc_SetTrueGuild(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_LogEntry(GE_BecomeFiremage,"Я прошел испытание и принес клятву Огня. Теперь я могу носить одеяние магов Огня!");
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Корристо может посвятить меня в тайны Кругов магии и помочь мне повысить мою магическую силу. Я смогу найти его в доме магов Огня.");
	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01");	//Да хранит тебя неугасимый Огонь!
	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01");	//Если ты будешь ранен, я помогу тебе вылечить раны.
};


instance KDF_401_Damarok_HEALINFO(C_Info)
{
	npc = Kdf_402_Corristo;
	nr = 100;
	condition = KDF_401_Damarok_HEALINFO_Condition;
	information = KDF_401_Damarok_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Я ранен. Ты можешь помочь мне?";
};


func int KDF_401_Damarok_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEALINFO_Info()
{
	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01");	//Я ранен. Ты можешь помочь мне?
	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02");	//Излечивая тело, я очищаю дух.
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
};


instance KDF_402_Corristo_MANA(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_MANA_Condition;
	information = KDF_402_Corristo_MANA_Info;
	important = 0;
	permanent = 1;
	description = "Я хочу увеличить свою магическую силу.";
};


func int KDF_402_Corristo_MANA_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_MANA_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_MANA_Info_15_01");	//Я хочу увеличить свою магическую силу.
	AI_Output(self,other,"KDF_402_Corristo_MANA_Info_14_02");	//Я могу помочь тебе в этом. Как ты будешь использовать ее, зависит только от тебя.
	b_corristolearn();
};

func void KDF_402_Corristo_MANA_BACK()
{
	Info_ClearChoices(KDF_402_Corristo_MANA);
};

func void KDF_402_Corristo_MANA_MAN_1()
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
		AI_Output(self,other,"SVM_14_HeyHeyHey");	//Хм.
	};
	b_corristolearn();
};

func void KDF_402_Corristo_MANA_MAN_5()
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
		AI_Output(self,other,"SVM_14_HeyHeyHey");	//Хм.
	};
	b_corristolearn();
};

func void KDF_402_Corristo_KREIS1()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS1_Info_15_01");	//Я готов приобщиться к Первому Кругу магии.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_02");	//Вступление в Первый Круг магии даст тебе умение использовать магические руны.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_03");	//Каждая руна содержит в себе одно магическое заклинание.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_04");	//Используя свою магическую силу, ты сможешь прочитать это заклинание.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_05");	//Но в отличие от магических свитков, которые теряют свою силу после первого прочтения, заклинание руны можно читать снова и снова, и оно не иссякнет.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_06");	//Каждая руна является источником магической силы, которая может быть задействована в любое время.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_07");	//Как я уже сказал, при прочтении заклинания руны или свитка будет расходоваться твоя магическая сила.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_08");	//Каждый новый Круг, который ты изучишь, будет давать тебе возможность читать заклинания более сложных рун.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_09");	//Используй силу рун, чтобы познать самого себя.
	};
	b_corristolearn();
};

func void KDF_402_Corristo_KREIS2()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS2_Info_15_01");	//Я готов обрести знания Второго Круга.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_02");	//Ты уже научился читать заклинания рун. Пришло время углубить твои знания.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_03");	//Второй Круг магии даст тебе возможность читать сильные боевые заклинания, но самое главное, ты сможешь исцелять болезни.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_04");	//Но тебе предстоит еще многому научиться, чтобы познать истинные тайны магии.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_05");	//Ты уже знаешь, что можешь использовать любую руну, пока на это хватит твоей личной силы.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_06");	//Но это крайний случай, и он не всегда оправдан. Тебе дана сила, которая может приносить смерть и разрушение.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_07");	//Истинный маг использует ее лишь тогда, когда это действительно необходимо.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_08");	//Внимательно следи за тем, что происходит вокруг, и ты сможешь познать силу рун.
	};
	b_corristolearn();
};

func void KDF_402_Corristo_KREIS3()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS3_Info_15_01");	//Ты можешь передать мне знания Третьего Круга магии?
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_02");	//Третий Круг - очень важная часть пути, который проходит каждый маг. Его постижением завершается твой поиск.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_03");	//Ты уже на середине пути познания магии. Ты уже умеешь читать заклинания рун.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_04");	//Это знание станет основой для дальнейшего совершенствования. Подумай, прежде чем использовать ту или иную руну.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_05");	//Ты можешь читать ее или не читать, но твой выбор должен быть осознан.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_06");	//Если ты сделал выбор, ты должен следовать ему не раздумывая.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_07");	//Познай свой путь, и ты познаешь силу своих решений.
	};
	b_corristolearn();
};

func void KDF_402_Corristo_KREIS4()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS4_Info_15_01");	//Я готов вступить в Четвертый Круг.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_02");	//Тебе уже открыты знания трех Кругов магии. Пришло время познать ее тайны.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_03");	//Магия руны сокрыта в камне. Камень этот получают при шлифовке магической руды.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_04");	//Такой руды, которую добывают в здешних шахтах. Камень наделяется магической энергией в особых храмах. Так он становится орудием нашей силы.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_05");	//Все руны, которые ты можешь использовать, открывают тебе доступ к знаниям и могуществу наших храмов.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_06");	//Теперь ты выучил все, что знаю я сам.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_07");	//Познай магию, и ты познаешь тайну своей силы.
	};
	b_corristolearn();
};


instance KDF_402_Corristo_EXPLAINCIRCLES(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_EXPLAINCIRCLES_Condition;
	information = KDF_402_Corristo_EXPLAINCIRCLES_Info;
	important = 0;
	permanent = 0;
	description = "Объясни мне, в чем смысл магических Кругов?";
};


func int KDF_402_Corristo_EXPLAINCIRCLES_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_EXPLAINCIRCLES_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01");	//Объясни мне, в чем смысл магических Кругов?
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02");	//Как пожелаешь. Круги символизируют глубину твоих магических знаний.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03");	//Они влияют на твою способность изучать и использовать новые заклинания.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04");	//Прежде чем изучать следующий Круг, ты должен полностью освоить знания предыдущего.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05");	//Чтобы изучить высшие Круги, тебе потребуется много времени и опыта.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06");	//Но твое усердие в их изучении будет вознаграждено новыми, все более могущественными заклинаниями. Но суть Кругов магии не только в этом.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07");	//Они являются частью жизни любого мага. Они навсегда останутся с тобой. Прими их словно часть самого себя.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08");	//Если ты поймешь, в чем заключается их сила, ты поймешь, какая сила скрывается в тебе самом.
};


var int kdf_armor_h_was_bought;

instance KDF_402_Corristo_HEAVYARMOR(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_HEAVYARMOR_Condition;
	information = KDF_402_Corristo_HEAVYARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString("Одеяние верховного мага, защита: 50/5/0/10",VALUE_KDF_ARMOR_H);
};


func int KDF_402_Corristo_HEAVYARMOR_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDF) && (KDF_ARMOR_H_WAS_BOUGHT != 1))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_HEAVYARMOR_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01");	//Учитель, я хочу носить одеяние верховных магов Круга Огня.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02");	//Ты еще не можешь носить такое облачение. Время еще не пришло.
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 3)
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04");	//Ты знаешь еще слишком мало. Приходи ко мне, когда будешь знать больше.
		PrintScreen("Условие: 3 Круг магии.",-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",_TIME_MESSAGE_Joincamp);
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_KDF_ARMOR_H)
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//Тебе не хватает руды.
	}
	else
	{
		b_printtrademsg1("Отдано руды: 1500");
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04");	//Я вижу, что ты уже достоин носить облачение верховного мага Круга Огня.
		b_printtrademsg2("Получена великая мантия мага Огня.");
		Npc_RemoveInvItems(hero,ItMiNugget,VALUE_KDF_ARMOR_H);
		CreateInvItem(hero,kdf_armor_h);
		AI_EquipArmor(hero,kdf_armor_h);
		KDF_ARMOR_H_WAS_BOUGHT = 1;
	};
};

//Здравствуй.
//Здравствуйте магистр.
//Вчера я видел, как ты пробовал одно заклинание..
//Это заклинание еще слишком рано.. оно слишком..
//Твоих духовных сил и познаний, не достаточно, чтобы практиковать подобную магию.
//В нашем мире есть куда более могущественные заклинания, чем то, что ты пытался применить..
//Ты еще юн, но ты ни какой-то обычный воин или оборванец с улицы. Ты маг.
//От твоих решений может зависеть не только судьба этой колонии (смотрит наверх)
//Но и судьба мира.
//Тебе не следует быть таким беспечным (удаляется после паузы)
