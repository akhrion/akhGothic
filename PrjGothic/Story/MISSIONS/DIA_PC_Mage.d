
instance DIA_Milten_EXIT(C_Info)
{
	npc = PC_Mage;
	nr = 999;
	condition = DIA_Milten_EXIT_Condition;
	information = DIA_Milten_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Milten_EXIT_Condition()
{
	return 1;
};

func void DIA_Milten_EXIT_Info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"DIA_Milten_EXIT_02_00");	//Идем.
	}
	else
	{
		AI_Output(self,hero,"DIA_Milten_EXIT_02_01");	//Увидимся.
	};
	if(Npc_HasItems(hero,demourizel))
	{
		Npc_RemoveInvItem(hero,demourizel);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Milten_First(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_First_Condition;
	information = DIA_Milten_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Milten_First_Condition()
{
	if((CorKalom_BringMCQBalls != LOG_SUCCESS) && !Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Milten_First_Info()
{
	AI_Output(self,other,"DIA_Milten_First_02_00");	//Ты не должен переступать этот порог до тех пор, пока не получишь разрешение от господина Корристо.
};


instance DIA_Milten_Hello(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_Hello_Condition;
	information = DIA_Milten_Hello_Info;
	permanent = 0;
	description = "Я ищу Верховного Мага Круга Огня.";
};


func int DIA_Milten_Hello_Condition()
{
	if((Saturas_BringFoci == FALSE) && !Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func void DIA_Milten_Hello_Info()
{
	AI_Output(other,self,"DIA_Milten_Hello_15_00");	//Я ищу Верховного Мага Круга Огня.
	AI_Output(self,other,"DIA_Milten_Hello_02_01");	//Это Корристо. Зачем он тебе нужен?
};


instance DIA_Milten_GotoCorristo(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_GotoCorristo_Condition;
	information = DIA_Milten_GotoCorristo_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Milten_GotoCorristo_Condition()
{
	if(((CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return 1;
	};
};

func void DIA_Milten_GotoCorristo_Info()
{
	var C_Npc Corristo;
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_01");	//Мы слышали о твоих подвигах в Старой шахте. Без ползунов добыча руды идет гораздо спокойнее.
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_02");	//Корристо тоже слышал о тебе. Он хочет поговорить с тобой. Иди к нему.
	if((Npc_HasItems(other,ItWr_Fire_Letter_01) >= 1) || (Npc_HasItems(other,ItWr_Fire_Letter_02) >= 1))
	{
		AI_Output(other,self,"DIA_Milten_Letter_15_00");	//У меня есть письмо для Верховного Мага Круга Огня.
		AI_Output(self,other,"DIA_Milten_Letter_02_03");	//Покажи мне это письмо.
		AI_Output(other,self,"DIA_Milten_Letter_Give_15_00");	//Вот оно.
		if(Npc_HasItems(other,ItWr_Fire_Letter_01))
		{
			b_printtrademsg1("Отдано запечатанное письмо.");
			B_GiveXP(XP_XardasLetter);
			Npc_RemoveInvItem(other,ItWr_Fire_Letter_01);
		}
		else if(Npc_HasItems(other,ItWr_Fire_Letter_02))
		{
			b_printtrademsg1("Отдано вскрытое письмо.");
			B_GiveXP(XP_XardasLetterOPEN);
			Npc_RemoveInvItem(other,ItWr_Fire_Letter_02);
		};
		B_UseFakeScroll();
		Corristo = Hlp_GetNpc(Kdf_402_Corristo);
		CreateInvItem(Corristo,ItWr_Fire_Letter_02);
		AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//А я не заслужил награды?
		AI_Output(self,hero,"Info_Milten_SHSEAL_02_05");	//В этом больше нет необходимости.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			B_LogEntry(KDFLETTER,"Я доставил письмо магам. Принеси я его пораньше, то получил бы награду, жаль.");
			Log_SetTopicStatus(KDFLETTER,LOG_SUCCESS);
			PYROCAR_MESSENGER = LOG_SUCCESS;
		};
	};
};


var int milten_HasLetter;

instance DIA_Milten_Letter(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_Letter_Condition;
	information = DIA_Milten_Letter_Info;
	permanent = 0;
	description = "У меня есть письмо для Верховного Мага Круга Огня.";
};


func int DIA_Milten_Letter_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_Hello) && ((Npc_HasItems(other,ItWr_Fire_Letter_01) >= 1) || (Npc_HasItems(other,ItWr_Fire_Letter_02) >= 1)) && (Kapitel < 4) && (Saturas_BringFoci == FALSE))
	{
		return 1;
	};
};

func void DIA_Milten_Letter_Info()
{
	AI_Output(other,self,"DIA_Milten_Letter_15_00");	//У меня есть письмо для Верховного Мага Круга Огня.
	AI_Output(self,other,"DIA_Milten_Letter_02_01");	//Ты гонец из Внешнего Мира?
	AI_Output(other,self,"DIA_Milten_Letter_15_02");	//Да, один маг передал мне письмо, перед тем как меня забросили в колонию.
	AI_Output(self,other,"DIA_Milten_Letter_02_03");	//Покажи мне это письмо.
	Info_ClearChoices(DIA_Milten_Letter);
	Info_AddChoice(DIA_Milten_Letter,"Сначала я хочу получить награду.",DIA_Milten_Letter_NO);
	Info_AddChoice(DIA_Milten_Letter,"Вот оно.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	var C_Npc Corristo;
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_00");	//Вот оно.
	if(Npc_HasItems(other,ItWr_Fire_Letter_01))
	{
		b_printtrademsg1("Отдано запечатанное письмо.");
		B_GiveXP(XP_XardasLetter);
		Npc_RemoveInvItem(other,ItWr_Fire_Letter_01);
	}
	else if(Npc_HasItems(other,ItWr_Fire_Letter_02))
	{
		b_printtrademsg1("Отдано вскрытое письмо.");
		B_GiveXP(XP_XardasLetterOPEN);
		Npc_RemoveInvItem(other,ItWr_Fire_Letter_02);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_03");	//Это письмо адресовано Ксардасу!
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_04");	//И что в этом необычного?
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_05");	//Ксардас оставил служение Инносу много лет назад. Он ушел отсюда и посвятил свою жизнь черной магии.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_06");	//Он живет в башне в центре земель орков и занимается только своими исследованиями.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_07");	//Он сказал, что выяснит сам, что пошло не так при возведении Барьера.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_08");	//Жди здесь. Я скоро вернусь.
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP(self,"OCC_CHAPEL_ENTRANCE");
	Corristo = Hlp_GetNpc(Kdf_402_Corristo);
	CreateInvItem(Corristo,ItWr_Fire_Letter_02);
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output(other,self,"DIA_Milten_Letter_NO_15_00");	//Сначала я хочу получить награду.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_01");	//Корристо прикажет Торрезу выдать ее тебе, как только получит письмо.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_02");	//Я служитель Инноса, и никогда не лгу. Теперь ты можешь отдать мне письмо.
	Info_ClearChoices(DIA_Milten_Letter);
	Info_AddChoice(DIA_Milten_Letter,"Нет, я бы сам хотел отдать это письмо Торрезу.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice(DIA_Milten_Letter,"Вот оно.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_00");	//Нет, я бы сам хотел отдать это письмо Торрезу.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_01");	//Смогу ли я тебя переубедить?
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_02");	//Нет. Сначала я хочу получить награду.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_03");	//Хорошо. Если ты этого хочешь. Жди здесь.
	Info_ClearChoices(DIA_Milten_Letter);
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP(self,"OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};


instance DIA_Milten_ComesBack(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_ComesBack_Condition;
	information = DIA_Milten_ComesBack_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Milten_ComesBack_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_Letter) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3))
	{
		return true;
	};
	return false;
};

func void DIA_Milten_ComesBack_Info()
{
	if(milten_HasLetter == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_ComesBack_02_00");	//Корристо огорчило известие о том, что ты не доверяешь служителям Инноса.
		AI_Output(self,other,"DIA_Milten_ComesBack_02_01");	//Но он позволил тебе встретиться с Торрезом и получить обычную награду.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			B_LogEntry(KDFLETTER,"Мильтен направил меня к Торрезу. Я не отдам такое ценное послание просто так, сначала мне нужна награда!");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_ComesBack_02_02");	//Корристо был в полном восторге. Он сказал, что ты можешь встретиться с Торрезом и выбрать себе награду.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			B_LogEntry(KDFLETTER,"Мильтен отнес письмо верховному магу, Корристо. Мне полагается награда за доставку, теперь нужно поговорить с Торрезом.");
		};
	};
};


instance DIA_Milten_WoTorrez(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_WoTorrez_Condition;
	information = DIA_Milten_WoTorrez_Info;
	permanent = 0;
	description = "Где найти Торреза?";
};


func int DIA_Milten_WoTorrez_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE))
	{
		return 1;
	};
};

func void DIA_Milten_WoTorrez_Info()
{
	AI_Output(other,self,"DIA_Milten_WoTorrez_15_00");	//Где найти Торреза?
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_01");	//Весь день он стоит перед храмом.
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_02");	//Ночи же он проводит в своей келье. Поскольку лишь маги могут войти в храм, тебе придется поговорить с ним днем.
};


instance DIA_Milten_NochEinBrief(C_Info)
{
	npc = PC_Mage;
	nr = 2;
	condition = DIA_Milten_NochEinBrief_Condition;
	information = DIA_Milten_NochEinBrief_Info;
	permanent = 0;
	description = "У меня есть письмо от магов Воды.";
};


func int DIA_Milten_NochEinBrief_Condition()
{
	if((Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) && (Npc_HasItems(hero,Cronos_Brief) >= 1))
	{
		return 1;
	};
};

func void DIA_Milten_NochEinBrief_Info()
{
	var C_Npc Corristo;
	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00");	//У меня есть письмо от магов Воды.
	b_printtrademsg1("Отдано письмо Кроноса.");
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_01");	//А! Очень хорошо! Я передам его Корристо.
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_02");	//Когда вернешься в Новый лагерь, маги Воды вознаградят тебя за труды.
	B_LogEntry(KDWLETTER,"Мильтен получил письмо магов Воды, нужно сообщить об успехе Кроносу.");
	Npc_RemoveInvItem(other,Cronos_Brief);
	Corristo = Hlp_GetNpc(Kdf_402_Corristo);
	CreateInvItem(Corristo,Cronos_Brief);
};


instance DIA_Milten_PERM(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = DIA_Milten_PERM_Condition;
	information = DIA_Milten_PERM_Info;
	permanent = 0;
	description = "Расскажи мне что-нибудь о магах Огня.";
};


func int DIA_Milten_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void DIA_Milten_PERM_Info()
{
	AI_Output(other,self,"DIA_Milten_PERM_15_00");	//Расскажи мне что-нибудь о магах Огня.
	AI_Output(self,other,"DIA_Milten_PERM_02_01");	//Круг Огня обретает свою силу с благословения Инноса. Бог света и истины благоволит нам.
	AI_Output(self,other,"DIA_Milten_PERM_02_02");	//Маги считают себя избранными, ну и ко всем остальным относятся соответственно.
	AI_Output(self,other,"DIA_Milten_PERM_02_03");	//Мне повезло, что меня приняли. Корристо сделал меня своим учеником. По-моему, он просто хотел немного развлечься.
	AI_Output(self,other,"DIA_Milten_PERM_02_04");	//С тех пор я ежедневно совершенствую свои магические навыки, чтобы быть допущенным в следующий Круг.
};


instance DIA_Milten_WannaMage(C_Info)
{
	npc = PC_Mage;
	nr = 2;
	condition = DIA_Milten_WannaMage_Condition;
	information = DIA_Milten_WannaMage_Info;
	permanent = 1;
	description = "Я тоже хочу стать учеником мага. Таким, как ты.";
};


func int DIA_Milten_WannaMage_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_KDF))
	{
		return 1;
	};
};

func void DIA_Milten_WannaMage_Info()
{
	AI_Output(other,self,"DIA_Milten_WannaMage_15_00");	//Я тоже хочу стать учеником мага. Таким, как ты.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_01");	//Корристо выбрал меня, потому что я помогал Баронам.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_02");	//До тех пор, пока ты не сделаешь что-нибудь исключительное, он и разговаривать не захочет о твоем обучении.
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		AI_Output(self,other,"DIA_Milten_WannaMage_02_03");	//Помимо этого, ты должен принадлежать к Старому лагерю. Сомневаюсь, что Корристо возьмет себе в ученики человека из другой части колонии.
	};
};


instance Info_Milten_SHWAIT(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHWAIT_Condition;
	information = Info_Milten_SHWAIT_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_SHWAIT_Condition()
{
	if((Npc_GetDistToWP(hero,"OW_PATH_274") < 1000) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return 1;
	};
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_01");	//Приветствую! Мой друг Лестер из Болотного лагеря рассказал мне о тебе.
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_02");	//Я поражен. Ты стал очень сильным.
	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03");	//Так, стараюсь...
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_04");	//Ах, да. Как всегда скромен, да?
};


instance Info_Milten_SHGORN(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHGORN_Condition;
	information = Info_Milten_SHGORN_Info;
	important = 0;
	permanent = 0;
	description = "Я видел Горна.";
};


func int Info_Milten_SHGORN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHWAIT) && Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output(hero,self,"Info_Milten_SHGORN_15_01");	//Я видел Горна.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_02");	//В самом деле? И где?
	AI_Output(hero,self,"Info_Milten_SHGORN_15_03");	//В руинах монастыря у моря. Мы искали там сокровища.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_04");	//Уверен, что он расскажет мне обо всем, когда мы встретимся вновь.
};


instance Info_Milten_SHLESTER(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHLESTER_Condition;
	information = Info_Milten_SHLESTER_Info;
	important = 0;
	permanent = 0;
	description = "Мы с Лестером осматривали форт в горах.";
};


func int Info_Milten_SHLESTER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHWAIT) && Npc_KnowsInfo(hero,PC_Psionic_FINISH))
	{
		return TRUE;
	};
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_01");	//Мы с Лестером осматривали форт в горах.
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_02");	//Он говорил мне об этом. Думаю, тебе можно доверять.
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_03");	//Так где же вы встречались до этого?
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_04");	//О, здесь и там - в самых разных местах.
};


instance Info_Milten_SHYOU(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHYOU_Condition;
	information = Info_Milten_SHYOU_Info;
	important = 0;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int Info_Milten_SHYOU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHWAIT))
	{
		return 1;
	};
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output(hero,self,"Info_Milten_SHYOU_15_01");	//Что ты здесь делаешь?
	AI_Output(self,hero,"Info_Milten_SHYOU_02_02");	//Неподалеку отсюда находится древнее каменное кольцо, в центре которого есть вход в подземелье.
	AI_Output(hero,self,"Info_Milten_SHYOU_15_03");	//Что-то вроде склепа?
	AI_Output(self,hero,"Info_Milten_SHYOU_02_04");	//Да, что-то вроде.
	AI_Output(self,hero,"Info_Milten_SHYOU_02_05");	//Мне нужно кое-что добыть из этого склепа.
};


instance Info_Milten_SHME(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHME_Condition;
	information = Info_Milten_SHME_Info;
	important = 0;
	permanent = 0;
	description = "Я ищу юнитор. Он должен быть где-то здесь.";
};


func int Info_Milten_SHME_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHWAIT) && !Npc_KnowsInfo(hero,Info_Milten_SHACCEPT))
	{
		return 1;
	};
};

func void Info_Milten_SHME_Info()
{
	AI_Output(hero,self,"Info_Milten_SHME_15_01");	//Я ищу юнитор. Он должен быть где-то здесь.
	AI_Output(self,hero,"Info_Milten_SHME_02_02");	//Похоже, нам обоим нужно попасть в одно и то же место.
};


instance Info_Milten_SHPROBLEM(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHPROBLEM_Condition;
	information = Info_Milten_SHPROBLEM_Info;
	important = 0;
	permanent = 0;
	description = "Почему ты сам не можешь пойти в склеп и взять то, что тебе нужно?";
};


func int Info_Milten_SHPROBLEM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHYOU))
	{
		return TRUE;
	};
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_01");	//А почему ты сам не можешь пойти в склеп и взять там то, что тебе нужно?
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_02");	//А, долгая история. Слишком многое придется рассказывать, чтобы объяснить.
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_03");	//Расскажи, я не тороплюсь!
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_04");	//Хорошо! После сотворения магического Барьера, поработившего всех нас...
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_05");	//...один из магов укрыл там магический артефакт.
};


instance Info_Milten_SHFOCUS(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHFOCUS_Condition;
	information = Info_Milten_SHFOCUS_Info;
	important = 0;
	permanent = 0;
	description = "Ты говоришь об одном из камней-юниторов?";
};


func int Info_Milten_SHFOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_01");	//Ты говоришь об одном из камней-юниторов?
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_02");	//Точно! Так ты уже знаешь историю об этих пяти камнях?
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_03");	//Скажи, а ты сюда, случайно, не за юнитором пришел?
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_04");	//Нет, юнитор мне не нужен, но зато я ищу талисман орков.
};


instance Info_Milten_SHSEAL(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSEAL_Condition;
	information = Info_Milten_SHSEAL_Info;
	important = 0;
	permanent = 0;
	description = "И этот артефакт находится в склепе?";
};


func int Info_Milten_SHSEAL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_01");	//И этот артефакт находится в склепе?
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_02");	//Да. Его защищает могущественная магия. Первый из воров, кто попытается стянуть юнитор...
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_03");	//...будет проклят и обречен в облике нежити охранять гробницу от других воров... Вечно.
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_04");	//А мы можем обойти это заклятье?
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_05");	//В этом больше нет необходимости.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_06");	//Несколько лет назад один из Баронов, развлекавшийся охотой на орков, решил заглянуть в гробницу.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_07");	//И теперь он стережет там сокровища.
};


instance Info_Milten_SHTALISMAN(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHTALISMAN_Condition;
	information = Info_Milten_SHTALISMAN_Info;
	important = 0;
	permanent = 0;
	description = "А что это за талисман?";
};


func int Info_Milten_SHTALISMAN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHFOCUS))
	{
		return TRUE;
	};
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output(hero,self,"Info_Milten_SHTALISMAN_15_01");	//А что это за талисман?
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_02");	//Я думаю, последний владелец использовал его для защиты от злобных орков.
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_03");	//Если я прав, этот талисман может оказаться очень полезным.
};


instance Info_Milten_SHOFFER(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHOFFER_Condition;
	information = Info_Milten_SHOFFER_Info;
	important = 0;
	permanent = 0;
	description = "Нам нужно осмотреть гробницу. Ты найдешь талисман, а я - юнитор.";
};


func int Info_Milten_SHOFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHSEAL) && Npc_KnowsInfo(hero,Info_Milten_SHTALISMAN))
	{
		return TRUE;
	};
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_01");	//Нам нужно вместе осмотреть эту гробницу. Ты найдешь талисман, а я - юнитор.
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_02");	//Все это хорошо, но есть одна проблема...
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_03");	//Проблема?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_04");	//Да. Тот, кто охраняет эту гробницу.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_05");	//А разве его нельзя просто порубить на куски?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_06");	//Это не так-то просто. Кажется, он не вполне поддается обычному оружию.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_07");	//Мне кажется, что ты уже что-то придумал. У тебя есть план?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_08");	//Хм... ну... план-то есть, но одному мне не справиться.
};


instance Info_Milten_SHOFFER2(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHOFFER2_Condition;
	information = Info_Milten_SHOFFER2_Info;
	important = 0;
	permanent = 0;
	description = "Ну, и какой у тебя план?";
};


func int Info_Milten_SHOFFER2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHOFFER))
	{
		return TRUE;
	};
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_01");	//Ну, и какой у тебя план?
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_02");	//У меня есть свиток с очень мощным заклинанием.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_03");	//Оно способно уничтожить любую нежить.
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_04");	//Но тогда осмотреть гробницу будет проще простого!
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_05");	//Ну... Не совсем. С некоторых пор там обитает не только страж.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_06");	//Все те грабители, что были после него, оказались столь же невезучими.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_07");	//Я уже один раз спускался туда и едва не погиб. Одному там не справиться.
};


instance Info_Milten_SHACCEPT(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHACCEPT_Condition;
	information = Info_Milten_SHACCEPT_Info;
	important = 0;
	permanent = 0;
	description = "Дай мне этот свиток, и мы пойдем туда вместе!";
};


func int Info_Milten_SHACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHOFFER2))
	{
		return TRUE;
	};
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_01");	//Дай мне этот свиток, и мы пойдем туда вместе!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_02");	//Хорошо! Я надеялся, что ты это скажешь!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_03");	//Но у нас всего один свиток. Необходимо приберечь его для стража.
	b_printtrademsg1("Получен свиток уничтожения нежити.");
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_04");	//С остальной нежитью придется сражаться обычным оружием.
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_05");	//Понятно. Как пройти к кругу камней?
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06");	//Иди за мной.
	Log_CreateTopic(CH3_Stonehenge,LOG_MISSION);
	Log_SetTopicStatus(CH3_Stonehenge,LOG_RUNNING);
	B_LogEntry(CH3_Stonehenge,"Недалеко от круга камней я встретил мага Огня Мильтена. Он сказал мне, что юнитор, который я ищу, находится в склепе под этим сооружением.");
	B_LogEntry(CH3_Stonehenge,"Мильтен дал мне свиток, с помощью которого можно победить стража склепа. Мы решили вместе осмотреть это помещение.");
	CreateInvItem(self,ItArScrollDestroyUndead);
	B_GiveInvItems(self,hero,ItArScrollDestroyUndead,1);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHGuide");
	AI_StopProcessInfos(self);
};


instance Info_Milten_SHARRIVED(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHARRIVED_Condition;
	information = Info_Milten_SHARRIVED_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_SHARRIVED_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") < 500) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHARRIVED_02_01");	//Вот мы и пришли. Этот туннель ведет прямо в гробницу.
	AI_Output(hero,self,"Info_Milten_SHARRIVED_15_02");	//Тогда пойдем, навестим этого стража!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};


instance Info_Milten_SHHEAL(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHHEAL_Condition;
	information = Info_Milten_SHHEAL_Info;
	important = 0;
	permanent = 1;
	description = "Я ранен. Помоги мне!";
};


func int Info_Milten_SHHEAL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) && (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (MILTEN_HEAL < 4))
	{
		return TRUE;
	};
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output(hero,self,"Info_Milten_SHHEAL_15_01");	//Я ранен. Помоги мне!
	if(MILTEN_HEAL == 0)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//Возьми целебный эликсир.
		b_printtrademsg1("Получен экстракт исцеления.");
		B_GiveInvItems(self,hero,ItFo_Potion_Health_02,1);
		MILTEN_HEAL = 1;
	}
	else if(MILTEN_HEAL == 1)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//Возьми целебный эликсир.
		b_printtrademsg1("Получен экстракт исцеления.");
		B_GiveInvItems(self,hero,ItFo_Potion_Health_02,1);
		MILTEN_HEAL = 2;
	}
	else if(MILTEN_HEAL == 2)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//Возьми целебный эликсир.
		b_printtrademsg1("Получен экстракт исцеления.");
		B_GiveInvItems(self,hero,ItFo_Potion_Health_02,1);
		MILTEN_HEAL = 3;
	}
	else
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_03");	//У меня больше нет целебных эликсиров.
		MILTEN_HEAL = 4;
	};
	AI_StopProcessInfos(self);
};


instance Info_Milten_SHRUNNING(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHRUNNING_Condition;
	information = Info_Milten_SHRUNNING_Info;
	important = 0;
	permanent = 1;
	description = "Страж все еще жив!";
};


func int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self,ZombieTheKeeper,NOFUNC,-1);
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && (keeperFound && !Npc_IsDead(other)))
	{
		return TRUE;
	};
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output(hero,self,"Info_Milten_SHRUNNING_15_01");	//Страж все еще жив!
	AI_Output(self,hero,"Info_Milten_SHRUNNING_02_02");	//Так уничтожь его, прочитав свиток с заклинанием!
};


instance Info_Milten_SHSCROLL(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSCROLL_Condition;
	information = Info_Milten_SHSCROLL_Info;
	important = 0;
	permanent = 0;
	description = "Я использовал свиток... но я не убил стража!";
};


func int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self,ZombieTheKeeper,NOFUNC,-1);
	if(keeperFound && !Npc_IsDead(other) && Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && (Npc_HasItems(hero,ItArScrollDestroyUndead) == 0) && (Npc_HasItems(hero,itarrune_6_1_destroyundead) == 0))
	{
		return TRUE;
	};
};

func void Info_Milten_SHSCROLL_Info()
{
	var C_Npc npc;
	AI_Output(hero,self,"Info_Milten_SHSCROLL_15_01");	//Я использовал свиток... но я не убил стража!
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_02");	//Только не это! Придумай, как еще можно победить его!
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_03");	//Может быть, мы сможем купить еще один свиток или какую-нибудь руну в одном из лагерей?
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_04");	//Я буду ждать тебя там, где мы встретились в прошлый раз.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHWait");
	if(C_NpcBelongsToOldCamp(hero))
	{
		npc = Hlp_GetNpc(KDF_405_Torrez);
		CreateInvItem(npc,ItArScrollDestroyUndead);
	}
	else if(C_NpcBelongsToNewCamp(hero))
	{
		npc = Hlp_GetNpc(KDW_604_Cronos);
		CreateInvItem(npc,ItArScrollDestroyUndead);
	}
	else
	{
		npc = Hlp_GetNpc(GUR_1208_BaalCadar);
		CreateInvItem(npc,ItArScrollDestroyUndead);
	};
};


instance Info_Milten_SHNEWSCROLL(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHNEWSCROLL_Condition;
	information = Info_Milten_SHNEWSCROLL_Info;
	important = 0;
	permanent = 0;
	description = "У меня теперь есть заклинание 'Уничтожить Нежить'!";
};


func int Info_Milten_SHNEWSCROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHSCROLL) && !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) && ((Npc_HasItems(hero,ItArScrollDestroyUndead) > 0) || (Npc_HasItems(hero,itarrune_6_1_destroyundead) > 0)))
	{
		return TRUE;
	};
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output(hero,self,"Info_Milten_SHNEWSCROLL_15_01");	//У меня теперь есть заклинание 'Уничтожить Нежить'!
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_02");	//Хорошо. Значит, мы можем еще раз наведаться в гости к стражу.
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_03");	//Иди вперед, я пойду за тобой.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHFollow");
};


instance Info_Milten_SHLEAVE(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHLEAVE_Condition;
	information = Info_Milten_SHLEAVE_Info;
	important = 1;
	permanent = 1;
};


func int Info_Milten_SHLEAVE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") > 10000) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_01");	//Похоже, гробница тебя больше не интересует.
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_02");	//Если все-таки передумаешь, ты можешь найти меня там, где мы встретились с тобой в прошлый раз.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"SHWait");
	AI_StopProcessInfos(self);
};


instance Info_Milten_SHCONTINUE(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHCONTINUE_Condition;
	information = Info_Milten_SHCONTINUE_Info;
	important = 0;
	permanent = 1;
	description = "Пройдем еще раз мимо стража?";
};


func int Info_Milten_SHCONTINUE_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && !Npc_KnowsInfo(hero,Info_Milten_SHSUCCESS) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") < 9000) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(hero,self,"Info_Milten_SHCONTINUE_15_01");	//Пройдем еще раз мимо стража?
	AI_Output(self,hero,"Info_Milten_SHCONTINUE_02_02");	//Я готов. Иди вперед, я пойду следом.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};


var int orctalismanisfound;

instance Info_Milten_SHSUCCESS(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_SHSUCCESS_Condition;
	information = Info_Milten_SHSUCCESS_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_SHSUCCESS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_SHACCEPT) && Npc_HasItems(hero,ItMi_OrcTalisman) && (C_BodyStateContains(hero,BS_RUN) || C_BodyStateContains(hero,BS_WALK) || C_BodyStateContains(hero,BS_JUMP) || (ORCTALISMANISFOUND == 1) || Npc_HasReadiedWeapon(hero)) && (Npc_GetDistToPlayer(self) < 1000))
	{
		ORCTALISMANISFOUND = 1;
		return TRUE;
	};
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_UnreadySpell(hero);
	AI_RemoveWeapon(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_01");	//Хорошо. Теперь у тебя есть талисман.
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//Вот, возьми его. Как ты и просил.
	b_printtrademsg1("Отдан талисман орков.");
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_03");	//Спасибо, друг. Я никогда не забываю тех, кто помог мне.
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_04");	//Я возвращаюсь в Старый лагерь. Может быть, мы там еще встретимся.
	B_GiveInvItems(hero,self,ItMi_OrcTalisman,1);
	B_LogEntry(CH3_Stonehenge,"Вместе мы смогли победить стража склепа. Мильтен нашел то, что искал, и решил вернуться в Старый лагерь.");
	B_LogEntry(CH3_Stonehenge,"Сатурас обрадуется, когда я принесу ему юнитор, который здесь нашел!");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"ReturnToOC");
	AI_StopProcessInfos(self);
};


instance Info_Milten_OCWARN(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCWARN_Condition;
	information = Info_Milten_OCWARN_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_OCWARN_Condition()
{
	if((Kapitel == 4) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_OCWARN_02_01");	//Они... Они все мертвы... Все мертвы. Я не мог им помочь... Я был... Меня там не было... Я...
	if(Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		AI_Output(hero,self,"Info_Milten_OCWARN_15_02");	//Не волнуйся, Мильтен, я только что говорил с Диего. Он прятался на другой стороне лагеря.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_03");	//Тогда ты должен знать... Что сказал Диего?
		AI_Output(hero,self,"Info_Milten_OCWARN_15_04");	//Если я встречу Горна и Лестера, я скажу им, что он хочет видеть их на вашем обычном месте.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_05");	//Удачи! Будь осторожен!
		B_LogEntry(CH4_Firemages,"Мильтен прячется недалеко от Старого лагеря, как и Диего. Он предупреждает об опасности всех, кто решился зайти в лагерь.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(hero,self,"Info_Milten_OCWARN_15_06");	//Успокойся, Мильтен, что случилось?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_07");	//Все маги Огня мертвы! Все, кроме меня, и я тоже был на волосок от смерти.
		AI_Output(hero,self,"Info_Milten_OCWARN_15_08");	//Лучше расскажи мне все по порядку.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_09");	//Ладно. Спокойно, Мильтен, спокойно...
		AI_Output(self,hero,"Info_Milten_OCWARN_02_10");	//Все началось с того, что обрушилась Старая шахта...
		AI_Output(hero,self,"Info_Milten_OCWARN_15_11");	//Старая шахта обрушилась?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_12");	//Да. Все произошло очень быстро. Никто не уцелел.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_13");	//Вход в шахту блокировали стражники.
		b_failch4quests();
	};
};


instance Info_Milten_OCMINE(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCMINE_Condition;
	information = Info_Milten_OCMINE_Info;
	important = 0;
	permanent = 0;
	description = "Как же она могла обрушиться?";
};


func int Info_Milten_OCMINE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return TRUE;
	};
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output(hero,self,"Info_Milten_OCMINE_15_01");	//Как же она могла обрушиться?
	AI_Output(self,hero,"Info_Milten_OCMINE_02_02");	//Понятия не имею. Те из рудокопов, кто был в тот момент у входа, потом говорили, что началось что-то вроде землетрясения, а потом из туннеля вырвалось огромное облако пыли.
	AI_Output(hero,self,"Info_Milten_OCMINE_15_03");	//Ты был там?
	AI_Output(self,hero,"Info_Milten_OCMINE_02_04");	//Да. Там я и узнал, что шахта обрушилась.
};


instance Info_Milten_OCKDW(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCKDW_Condition;
	information = Info_Milten_OCKDW_Info;
	important = 0;
	permanent = 0;
	description = "Ты говорил что-то о магах Огня.";
};


func int Info_Milten_OCKDW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return TRUE;
	};
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output(hero,self,"Info_Milten_OCKDW_15_01");	//Ты говорил что-то о магах Огня.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_02");	//Я знаю только то, что вскоре после того, как шахта обрушилась, их всех убили Бароны.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_03");	//Когда я вернулся от гробницы, стражники у ворот внезапно напали на меня.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_04");	//Они называли меня предателем. Мне едва удалось уйти.
};


instance Info_Milten_OCWHY(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCWHY_Condition;
	information = Info_Milten_OCWHY_Info;
	important = 0;
	permanent = 0;
	description = "Зачем Баронам нужно было убить магов? Это же глупо...";
};


func int Info_Milten_OCWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCKDW))
	{
		return TRUE;
	};
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output(hero,self,"Info_Milten_OCWHY_15_01");	//Зачем Баронам нужно было убивать магов? Это же глупо!
	AI_Output(self,hero,"Info_Milten_OCWHY_02_02");	//Ты прав. Но у меня не было шанса спросить об этом у стражников. Они сразу же взялись за мечи.
	AI_Output(self,hero,"Info_Milten_OCWHY_02_03");	//Возможно, Диего что-то знает. Как раз в то время он был в лагере.
};


instance Info_Milten_OCYOU(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCYOU_Condition;
	information = Info_Milten_OCYOU_Info;
	important = 0;
	permanent = 0;
	description = "Ты должен спрятаться там, где они не смогут тебя найти.";
};


func int Info_Milten_OCYOU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCKDW))
	{
		return TRUE;
	};
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output(hero,self,"Info_Milten_OCYOU_15_01");	//Ты должен спрятаться там, где они не смогут тебя найти.
	AI_Output(self,hero,"Info_Milten_OCYOU_02_02");	//Нет. Мы с Диего договорились приглядывать за воротами и предупреждать наших друзей из других лагерей. Они ведь ничего не подозревают!
	if(!Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		AI_Output(self,hero,"Info_Milten_OCYOU_02_03");	//Пожалуйста, поговори с ним!
	}
	else
	{
		B_LogEntry(CH4_Firemages,"После того, как Диего рассказал мне о событиях в Старом лагере, я встретил Мильтена. Надеюсь, люди Гомеза не смогут их найти.");
	};
};


instance Info_Milten_OCDIEGO(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_OCDIEGO_Condition;
	information = Info_Milten_OCDIEGO_Info;
	important = 0;
	permanent = 0;
	description = "Где я могу найти Диего?";
};


func int Info_Milten_OCDIEGO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_OCWHY) && Npc_KnowsInfo(hero,Info_Milten_OCYOU) && !Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return TRUE;
	};
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output(hero,self,"Info_Milten_OCDIEGO_15_01");	//Где я могу найти Диего?
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_02");	//Он скрывается у вторых ворот, на другом конце лагеря.
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_03");	//Пожалуйста, поговори с ним!
	B_LogEntry(CH4_Firemages,"Недалеко от Старого лагеря меня встретил Мильтен. Он рассказал об обвале на Старой шахте и убийстве магов Огня.");
	B_LogEntry(CH4_Firemages,"Диего прячется на другой стороне лагеря, недалеко от ворот. Мне срочно нужно с ним поговорить. Он знает о случившемся намного лучше.");
};


instance Info_Milten_LOADSWORD(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD_Condition;
	information = Info_Milten_LOADSWORD_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_LOADSWORD_Condition()
{
	if(LoadSword)
	{
		return TRUE;
	};
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_LOADSWORD_02_01");	//Приветствую тебя, мой друг. Много воды утекло с тех пор, как мы виделись последний раз.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_02");	//Привет, Мильтен. С тех пор очень многое изменилось.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_03");	//Я бы с удовольствием рассказал бы тебе обо всем, но сейчас на это нет времени. Я очень спешу.
};


instance Info_Milten_LOADSWORD1(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD1_Condition;
	information = Info_Milten_LOADSWORD1_Info;
	important = 0;
	permanent = 0;
	description = "Мильтен, мне нужна твоя помощь!";
};


func int Info_Milten_LOADSWORD1_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LOADSWORD))
	{
		return 1;
	};
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_01");	//Мильтен, мне нужна твоя помощь!
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_02");	//Что случилось? Чем я могу тебе помочь?
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_03");	//Я расскажу тебе об этом там, где нас никто не услышит.
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_04");	//Хорошо. Иди за мной.
	Npc_ExchangeRoutine(self,"LSAway");
	AI_StopProcessInfos(self);
};


instance Info_Milten_LSAWAY(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSAWAY_Condition;
	information = Info_Milten_LSAWAY_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_LSAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LOADSWORD1) && (Npc_GetDistToWP(hero,"NC_KDW04_IN") < 500))
	{
		return TRUE;
	};
};

func void Info_Milten_LSAWAY_Info()
{
	if((hero.attribute[ATR_STRENGTH] < 30) || (Npc_HasItems(hero,ItMw_2H_Sword_Heavy_03) || Npc_HasItems(hero,Innos_Zorn) || Npc_HasItems(hero,Gorns_Rache) || Npc_HasItems(hero,Roter_Wind) || Npc_HasItems(hero,Lees_Axt) || Npc_HasItems(hero,Thorus_Schwert) || Npc_HasItems(hero,ItMw_2H_Sword_Heavy_04) || Npc_HasItems(hero,ItMw_2H_Axe_Heavy_01) || Npc_HasItems(hero,Oriks_Axt) || Npc_HasItems(hero,ItMw_2H_Axe_Heavy_02) || Npc_HasItems(hero,ItMw_2H_Axe_Heavy_04) || Npc_HasItems(hero,Torlofs_Axt) || Npc_HasItems(hero,ItMw_2H_Axe_Heavy_03)))
	{
		CreateInvItem(hero,demourizel);
	};
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_01");	//Теперь рассказывай, что стряслось?
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_02");	//Мне нужна энергия рудной горы, и я думаю, что маги Воды не согласятся помочь мне получить ее.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_03");	//Ты шутишь?
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_04");	//Сейчас не время шутить. Я серьезен, как никогда.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_05");	//Я видел Ксардаса, некроманта.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_06");	//Он сказал мне, что нужно делать.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_07");	//Ксардас? Ты меня пугаешь!
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_08");	//Никто не разговаривал с ним с тех самых пор, как он покинул Старый лагерь.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_09");	//Я говорил с ним.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_10");	//Зачем тебе понадобилась сила железной горы?
	if(Npc_HasItems(hero,Mythrilklinge01))
	{
		AI_Output(hero,self,"Info_Milten_LSAWAY_15_11");	//Я хочу передать ее этому мечу.
		AI_EquipBestMeleeWeapon(hero);
		AI_ReadyMeleeWeapon(hero);
		AI_Output(self,hero,"Info_Milten_LSAWAY_02_12");	//Ух, ты! Вот это клинок!
		AI_Output(hero,self,"Info_Milten_LSAWAY_15_13");	//Его имя УРИЗЕЛЬ!
		AI_RemoveWeapon(hero);
	};
};


instance Info_Milten_LOADSWORD4(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LOADSWORD4_Condition;
	information = Info_Milten_LOADSWORD4_Info;
	important = 0;
	permanent = 0;
	description = "Ксардас дал мне заклинание, которое передаст мечу силу руды.";
};


func int Info_Milten_LOADSWORD4_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSAWAY))
	{
		return 1;
	};
};

func void Info_Milten_LOADSWORD4_Info()
{
	if(Npc_HasItems(hero,demourizel))
	{
		Npc_RemoveInvItem(hero,demourizel);
		AI_EquipBestMeleeWeapon(hero);
	};
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_01");	//Ксардас дал мне заклинание, которое передаст мечу силу руды.
	if(Npc_HasItems(hero,Scroll4Milten))
	{
		b_printtrademsg1("Отдано заклинание переноса энергии.");
	};
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_02");	//Тебе нужно будет прочитать его, когда я поднесу меч к горе.
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_03");	//Ну, хм, если мне нужно только прочесть заклинание...
	if(Npc_HasItems(hero,Scroll4Milten))
	{
		B_UseFakeScroll();
	};
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_04");	//Но у нас возникнут проблемы с Сатурасом и другими магами!
	if(Npc_HasItems(hero,Scroll4Milten))
	{
		b_printtrademsg2("Получено заклинание переноса энергии.");
	};
};


instance Info_Milten_LSRISK(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSRISK_Condition;
	information = Info_Milten_LSRISK_Info;
	important = 0;
	permanent = 0;
	description = "Мы должны рискнуть!";
};


func int Info_Milten_LSRISK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LOADSWORD4))
	{
		return TRUE;
	};
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output(hero,self,"Info_Milten_LSRISK_15_01");	//Мы должны рискнуть!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_02");	//Это очень важно!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_03");	//Важно для всех жителей колонии!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_04");	//Я не понимаю...
	AI_Output(hero,self,"Info_Milten_LSRISK_15_05");	//Это поможет нам выбраться отсюда. Поверь мне!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_06");	//Ну, хорошо. После всего того, что ты для нас сделал, я не могу относиться к тебе иначе как с полным доверием.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_07");	//Помимо этого, похоже, и Ксардас тебе доверяет.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_08");	//Встретимся возле железной горы, и... Никому не говори об этом!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_09");	//Хорошо. Встретимся у рудной горы.
	B_LogEntry(CH5_Uriziel,"Я смог убедить моего друга Мильтена помочь мне перенести энергию магической руды в меч. Мы договорились встретиться у подножия рудной горы.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LSOreHeap");
};


instance INFO_MILTEN_OREGUARD(C_Info)
{
	npc = PC_Mage;
	condition = info_milten_oreguard_condition;
	information = info_milten_oreguard_info;
	important = 1;
	permanent = 0;
};


func int info_milten_oreguard_condition()
{
	if(Npc_KnowsInfo(hero,info_oreguard))
	{
		return TRUE;
	};
};

func void info_milten_oreguard_info()
{
	AI_Output(hero,self,"DIA_Huno_YouKnowYourJob_15_00");	//А у тебя неплохо получается, как я вижу.
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06");	//Иди за мной.
	Npc_ExchangeRoutine(self,"LSOreHeap2");
	AI_StopProcessInfos(self);
};


instance Info_Milten_LSOREHEAP(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSOREHEAP_Condition;
	information = Info_Milten_LSOREHEAP_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_LSOREHEAP_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSRISK) && (Npc_GetDistToWP(hero,"NC_PATH41") < 500))
	{
		return TRUE;
	};
};

func void Info_Milten_LSOREHEAP_Info()
{
	AI_Output(self,hero,"Info_Milten_LSOREHEAP_02_01");	//Ты принес меч и заклинание?
};


instance Info_Milten_LSNOW(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSNOW_Condition;
	information = Info_Milten_LSNOW_Info;
	important = 0;
	permanent = 0;
	description = "Вот заклинание!";
};


func int Info_Milten_LSNOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSOREHEAP) && Npc_HasItems(hero,Mythrilklinge01) && Npc_HasItems(hero,Scroll4Milten) && (Npc_GetDistToWP(hero,"NC_PATH41") < 1000))
	{
		return TRUE;
	};
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output(hero,self,"Info_Milten_LSNOW_15_01");	//Вот заклинание!
	b_printtrademsg1("Отдано заклинание переноса энергии.");
	AI_Output(hero,self,"Info_Milten_LSNOW_15_02");	//Ты готов?
	AI_Output(self,hero,"Info_Milten_LSNOW_02_03");	//Если только кто-нибудь может быть готов к этому...
	AI_Output(hero,self,"Info_Milten_LSNOW_15_04");	//Тогда давай начнем!
	B_GiveInvItems(hero,self,Scroll4Milten,1);
	StartChaptersSix = TRUE;
	AI_StopProcessInfos(self);
};


instance Info_Milten_CHAPTERSIX(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_CHAPTERSIX_Condition;
	information = Info_Milten_CHAPTERSIX_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_CHAPTERSIX_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Milten_LSNOW) && StartChaptersSix)
	{
		return TRUE;
	};
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"NC_PIT_CENTER");
	B_Kapitelwechsel(6);
};


instance Info_Milten_LSDONE(C_Info)
{
	npc = PC_Mage;
	condition = Info_Milten_LSDONE_Condition;
	information = Info_Milten_LSDONE_Info;
	important = 1;
	permanent = 0;
};


func int Info_Milten_LSDONE_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void Info_Milten_LSDONE_Info()
{
	AI_Output(self,hero,"Info_Milten_LSDONE_02_01");	//Готово!
	if(hero.attribute[ATR_STRENGTH] >= 30)
	{
		AI_EquipBestMeleeWeapon(hero);
		AI_ReadyMeleeWeapon(hero);
		AI_PlayAni(hero,"T_URISELINSPECT");
		AI_RemoveWeapon(hero);
		AI_Output(hero,self,"Info_Milten_LSDONE_15_02");	//Невероятно! Этот камень был серым, а теперь он излучает синий свет!
	};
	AI_Output(self,hero,"Info_Milten_LSDONE_02_03");	//Похоже, у нас получилось! Магическая сила всей этой руды теперь заключена в одном старом мече.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_04");	//Но, кажется, мы привлекли к себе слишком много внимания.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_05");	//Тебе придется воспользоваться заклинанием Портал, для того чтобы выбраться отсюда!
	if(!Npc_HasItems(hero,itarrune_1_6_teleport3) && !Npc_HasItems(hero,itarrune_1_5_teleport5))
	{
		b_printtrademsg1("Получен свиток телепортации.");
		CreateInvItem(hero,ItArScrollTeleport5);
	};
	AI_Output(hero,self,"Info_Milten_LSDONE_15_06");	//А что будет с тобой?
	AI_Output(self,hero,"Info_Milten_LSDONE_02_07");	//Обо мне не волнуйся, я что-нибудь придумаю. Уходи!
	if((hero.attribute[ATR_MANA] < 5) && !Npc_HasItems(hero,ItFo_Potion_Mana_01) && !Npc_HasItems(hero,ItFo_Potion_Mana_02) && !Npc_HasItems(hero,ItFo_Potion_Mana_03))
	{
		b_printtrademsg2("Получена эссенция магической энергии.");
		CreateInvItem(hero,ItFo_Potion_Mana_01);
	};
	B_Story_UrizielLoaded();
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(PC_Thief,"Reunion");
	if(Npc_KnowsInfo(hero,Info_Gorn_DIEGOMILTEN))
	{
		B_ExchangeRoutine(PC_Fighter,"Reunion");
	};
	if(Npc_KnowsInfo(hero,Info_Lester_DIEGOMILTEN))
	{
		B_ExchangeRoutine(PC_Psionic,"Reunion");
	};
	AI_StartState(self,zs_miltensescape,1,"");
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};

