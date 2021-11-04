
instance Info_FreemineOrc_EXIT(C_Info)
{
	npc = FreemineOrc;
	nr = 999;
	condition = Info_FreemineOrc_EXIT_Condition;
	information = Info_FreemineOrc_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

func void Info_FreemineOrc_EXIT_Info()
{
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01");	//Я должен уходить!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02");	//Чужак идти еще!
	}
	else
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Спасибо. А теперь мне нужно уходить.
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04");	//Хорошая дорога чужак!
	};
	if(Npc_HasItems(self,UluMulu))
	{
		Npc_RemoveInvItem(self,UluMulu);
	};
	if(Npc_HasItems(self,OrcMedicine)){
		Npc_RemoveInvItem(self,OrcMedicine);
		Mdl_SetModelScale(self,1.3,1.15,1.1);
		Mdl_SetModelFatness(self,1.5);
	};
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_INTRO(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_INTRO_Condition;
	information = Info_FreemineOrc_INTRO_Info;
	important = 1;
	permanent = 0;
};


func int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01");	//Таррок нужный помочь! Таррок ранить!
};


instance Info_FreemineOrc_WASPASSIERT(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASPASSIERT_Condition;
	information = Info_FreemineOrc_WASPASSIERT_Info;
	important = 0;
	permanent = 0;
	description = "Что случилось?";
};


func int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01");	//Что случилось?
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02");	//Таррок закрытый здесь синий солдаты. Потом везде идти красный солдаты.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03");	//Красный солдаты всех убить.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04");	//Таррок убежать сюда. Красный солдаты не ходить сюда. Они бояться ГАХ ЛУГ.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05");	//Помощь, помочь, Таррок ранить.
};


instance Info_FreemineOrc_WASTUN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASTUN_Condition;
	information = Info_FreemineOrc_WASTUN_Info;
	important = 0;
	permanent = 0;
	description = "Чем я могу помочь тебе?";
};


func int Info_FreemineOrc_WASTUN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASTUN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01");	//Чем я могу помочь тебе?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02");	//Таррок нужный сильный зелье. А то Таррок умереть.
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03");	//Какое тебе нужно зелье?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04");	//ГАХ ЛУГ травить Таррок. Таррок нужный зелье.
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05");	//Таррок был зелье, но потом теряй. Таррок не найти!
};


instance Info_FreemineOrc_OFFER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_OFFER_Condition;
	information = Info_FreemineOrc_OFFER_Info;
	important = 0;
	permanent = 0;
	description = "Я постараюсь найти его тебе!";
};


func int Info_FreemineOrc_OFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_OFFER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//Я постараюсь найти его тебе!
	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02");	//Таррок слабый очень. Чужак быстрый, а то Таррок умереть.
	AI_StopProcessInfos(self);
	B_Story_FoundOrcSlave();
};


instance Info_FreemineOrc_CRAWLER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_CRAWLER_Condition;
	information = Info_FreemineOrc_CRAWLER_Info;
	important = 0;
	permanent = 0;
	description = "Что такое Гах Луг?";
};


func int Info_FreemineOrc_CRAWLER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01");	//Что такое Гах Луг?
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02");	//Там много больший зверь, много ног.
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03");	//ГАХ ЛУГ опасный! Хотеть есть люди и орки.
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04");	//Так ты говоришь о ползунах, я правильно понял?
};


instance Info_FreemineOrc_TONGUE(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TONGUE_Condition;
	information = Info_FreemineOrc_TONGUE_Info;
	important = 0;
	permanent = 0;
	description = "Ты можешь говорить на нашем языке?";
};


func int Info_FreemineOrc_TONGUE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TONGUE_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01");	//Ты можешь говорить на нашем языке?
	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02");	//Таррок раб солдаты много дни. Таррок слушать люди.
};


instance Info_FreemineOrc_SEARCHPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SEARCHPOTION_Condition;
	information = Info_FreemineOrc_SEARCHPOTION_Info;
	important = 0;
	permanent = 1;
	description = "Я не могу найти твое зелье!";
};


func int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SEARCHPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01");	//Я не могу найти твое зелье!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02");	//Чужак искать еще! Зелье быть здесь.
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03");	//Таррок бежать от ГАХ ЛУГ! Таррок спрятаться потом!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04");	//Чужак искать и ниша!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_SUCHEULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SUCHEULUMULU_Condition;
	information = Info_FreemineOrc_SUCHEULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Ты, случайно, не друг шамана Ур-Шака?";
};


func int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01");	//Ты, случайно, не друг шамана Ур-Шака?
	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02");	//Ур-Шак раб как Таррок. Ур-Шак бежать! Бежать много зима назад!
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03");	//Твой друг сказал мне, что ты можешь сделать для меня Улу-Мулу.
	if(FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04");	//Чужак помогать Таррок, Таррок помогать чужак!
	}
	else
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05");	//Таррок очень слабый. Нет зелье... Таррок умереть.
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06");	//Чужак принести зелье, а Таррок помогать.
	};
};


instance Info_FreemineOrc_GIVEPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_GIVEPOTION_Condition;
	information = Info_FreemineOrc_GIVEPOTION_Info;
	important = 0;
	permanent = 0;
	description = "Вот, я нашел тебе зелье!";
};


func int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01");	//Вот, я нашел тебе зелье!
	b_printtrademsg1("Отдано зелье орка.");
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02");	//Чужак не плохой, как другой солдат! Чужак хороший!
	B_GiveInvItems(hero,self,OrcMedicine,1);
	EquipItem(self,OrcMedicine);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
	};
	AI_PlayAniBS(self,"T_POTIONFAST_S0_2_STAND",BS_ITEMINTERACT);
	AI_UseItem(self,OrcMedicine);
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03");	//Таррок сказать спасибо!
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04");	//А ты можешь дать мне Улу-Мулу?
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05");	//Чужак помогать Таррок, Таррок помогать чужак!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06");	//Чужак надо КРОТАК, ХАЗ-ТАК, ДВАХКАРР и ОРФ-АНТАК.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07");	//Чужак принести это и Таррок делать Улу-Мулу.
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER))
	{
		B_Story_FoundOrcSlave();
	};
	B_Story_CuredOrc();
};


instance Info_FreemineOrc_FIREWARAN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN_Condition;
	information = Info_FreemineOrc_FIREWARAN_Info;
	important = 0;
	permanent = 0;
	description = "Что такое Кротак?";
};


func int Info_FreemineOrc_FIREWARAN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01");	//Что такое Кротак?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02");	//Язык огня! Быть язык ящерица огня!
};


instance Info_FreemineOrc_FIREWARAN2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN2_Condition;
	information = Info_FreemineOrc_FIREWARAN2_Info;
	important = 0;
	permanent = 0;
	description = "А где живут эти ящерицы огня?";
};


func int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN) && !Npc_HasItems(hero,ItAt_Waran_01) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01");	//А где живут эти ящерицы огня?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02");	//Ящерица огня жить дома. Дома Таррок. Чужак хорошо искать!
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03");	//Еще есть ящерица огня возле большая вода.
	B_LogEntry(CH4_UluMulu,"Чтобы сделать Улу-Мулу, Тарроку нужен язык огненной ящерицы. Такие ящерицы живут в землях орков и на песчаных берегах водоемов. Быть может, я даже видел одно такое место...");
};


instance Info_FreemineOrc_SHADOWBEAST(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST_Condition;
	information = Info_FreemineOrc_SHADOWBEAST_Info;
	important = 0;
	permanent = 0;
	description = "Что значит Хаз-Так?";
};


func int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01");	//Что значит Хаз-Так?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02");	//Рог мракорис. Острый как нож, твердый как камень.
};


instance Info_FreemineOrc_SHADOWBEAST2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST2_Condition;
	information = Info_FreemineOrc_SHADOWBEAST2_Info;
	important = 0;
	permanent = 0;
	description = "Где я смогу найти мракорисов?";
};


func int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST) && !Npc_HasItems(hero,ItAt_Shadow_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01");	//Где я смогу найти мракорисов?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02");	//Жить в лес или пещера. Не любить свет.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03");	//Очень опасный. Чужак быть осторожный!
	B_LogEntry(CH4_UluMulu,"Я должен принести Тарроку рог мракориса. Они живут в темных пещерах и лесах. Насколько я знаю, между Старым и Болотным лагерями есть очень темный густой лес.");
};


instance Info_FreemineOrc_SWAMPSHARK(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK_Condition;
	information = Info_FreemineOrc_SWAMPSHARK_Info;
	important = 0;
	permanent = 0;
	description = "Двахкарр? А что это такое?";
};


func int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01");	//Двахкарр? А что это такое?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02");	//Зуб от болотожор. Когда он кусать, никто больше не убегать.
};


instance Info_FreemineOrc_SWAMPSHARK2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK2_Condition;
	information = Info_FreemineOrc_SWAMPSHARK2_Info;
	important = 0;
	permanent = 0;
	description = "Где живут болотожоры?";
};


func int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK) && !Npc_HasItems(hero,ItAt_Swampshark_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01");	//Где живут болотожоры?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02");	//Много звери где лагерь людей. Лагерь на болоте!
	B_LogEntry(CH4_UluMulu,"Я должен добыть для Таррока клыки болотожора. Эти чудовища в огромных количествах водятся в болотах возле Лагеря Братства.");
};


instance Info_FreemineOrc_TROLL(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL_Condition;
	information = Info_FreemineOrc_TROLL_Info;
	important = 0;
	permanent = 0;
	description = "Что такое Орф-Антак?";
};


func int Info_FreemineOrc_TROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01");	//Что такое Орф-Антак?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02");	//Зуб большой тролль! Далать дырка насквозь!
};


instance Info_FreemineOrc_TROLL2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL2_Condition;
	information = Info_FreemineOrc_TROLL2_Info;
	important = 0;
	permanent = 0;
	description = "А где можно найти тролля?";
};


func int Info_FreemineOrc_TROLL2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL) && !Npc_HasItems(hero,ItAt_Troll_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01");	//А где можно найти тролля?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02");	//Тролль жить где горы! Любить много места!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03");	//Чужак искать в горы на север! Только бояться кулак тролль!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04");	//Кулак бить, чужак падать вниз!
	B_LogEntry(CH4_UluMulu,"Для Улу-Мулу Тарроку нужно принести клык тролля. Эти огромные твари живут в горах колонии. Мне стоит поискать их именно там.");
};


instance Info_FreemineOrc_LOOKINGULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information = Info_FreemineOrc_LOOKINGULUMULU_Info;
	important = 0;
	permanent = 1;
	description = "Я еще не все собрал.";
};


func int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if((FreemineOrc_LookingUlumulu == LOG_RUNNING) && (!Npc_HasItems(hero,ItAt_Waran_01) || !Npc_HasItems(hero,ItAt_Shadow_02) || !Npc_HasItems(hero,ItAt_Swampshark_02) || !Npc_HasItems(hero,ItAt_Troll_02)) && Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2) && Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01");	//Я еще не все собрал.
	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02");	//Чужак искать. Таррок ждать здесь!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_EveryUlumulu(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_EVERYULUMULU_Condition;
	information = Info_FreemineOrc_EVERYULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Теперь у меня есть все, что нужно для Улу-Мулу!";
};


func int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if((FreemineOrc_LookingUlumulu == LOG_RUNNING) && Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01");	//Теперь у меня есть все, что нужно для Улу-Мулу!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02");	//Чужак сильный солдат! Дать мне вещи! Таррок делать Улу-Мулу!
	b_printtrademsg1("Отдано 4 трофея.");
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
	};
	AI_TurnAway(self,hero);
	AI_PlayAni(self,"T_DIALOGGESTURE_05");
	CreateInvItem(self,UluMulu);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_DIALOGGESTURE_07");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_WhirlAround(self,hero);
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03");	//Вот! Чужак нести Улу-Мулу и быть гордый! Таррок теперь спать!
	b_printtrademsg2("Получено Улу-Мулу.");
	Npc_RemoveInvItem(hero,ItAt_Shadow_02);
	Npc_RemoveInvItem(hero,ItAt_Swampshark_02);
	Npc_RemoveInvItem(hero,ItAt_Troll_02);
	Npc_RemoveInvItem(hero,ItAt_Waran_01);
	B_Story_GotUluMulu();
	AI_StopProcessInfos(self);
};

