
instance Tpl_1433_GorNaVid_Exit(C_Info)
{
	npc = TPL_1433_GorNaVid;
	nr = 999;
	condition = Tpl_1433_GorNaVid_Exit_Condition;
	information = Tpl_1433_GorNaVid_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Tpl_1433_GorNaVid_Exit_Condition()
{
	return 1;
};

func void Tpl_1433_GorNaVid_Exit_Info()
{
	AI_Output(self,other,"Tpl_1433_GorNaVid_Exit_Info_13_02");	//Да пробудится Спящий!
	AI_StopProcessInfos(self);
};


instance Tpl_1433_GorNaVid_HEALTH(C_Info)
{
	npc = TPL_1433_GorNaVid;
	condition = Tpl_1433_GorNaVid_HEALTH_Condition;
	information = Tpl_1433_GorNaVid_HEALTH_Info;
	important = 0;
	permanent = 0;
	description = "Ты можешь мне помочь?";
};


func int Tpl_1433_GorNaVid_HEALTH_Condition()
{
	if(Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN) && !Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW))
	{
		return TRUE;
	};
};

func void Tpl_1433_GorNaVid_HEALTH_Info()
{
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01");	//Ты можешь мне помочь?
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02");	//Мне нужно добыть слюну ползунов для Кор Галома. Я знаю, где находится логово этих тварей.
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03");	//Сможешь ли ты прикрыть меня, когда я открою ворота?
	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04");	//Охота на ползунов без крови не обходится. Если бы у меня был целебный эликсир, я не задумываясь бы помог тебе.
	B_LogEntry(CH2_MCEggs,"Я должен отдать Гор На Виду лечебное зелье, прежде чем он сможет помочь Асгхану защищать ворота от ползунов.");
};


instance Tpl_1433_GorNaVid_IAN(C_Info)
{
	npc = TPL_1433_GorNaVid;
	condition = Tpl_1433_GorNaVid_IAN_Condition;
	information = Tpl_1433_GorNaVid_IAN_Info;
	important = 0;
	permanent = 0;
	description = "Я ищу логово ползунов. Не знаешь, где оно?";
};


func int Tpl_1433_GorNaVid_IAN_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_RUNNING) && !Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	{
		return 1;
	};
};

func void Tpl_1433_GorNaVid_IAN_Info()
{
	AI_Output(other,self,"Tpl_1433_GorNaVid_IAN_Info_15_01");	//Я ищу логово ползунов. Не знаешь, где оно?
	AI_Output(self,other,"Tpl_1433_GorNaVid_IAN_Info_13_02");	//Возле главной шахты много пещер, но логова там нет.
};


instance Tpl_1433_GorNaVid_HEALTH_SUC(C_Info)
{
	npc = TPL_1433_GorNaVid;
	condition = Tpl_1433_GorNaVid_HEALTH_SUC_Condition;
	information = Tpl_1433_GorNaVid_HEALTH_SUC_Info;
	important = 0;
	permanent = 0;
	description = "(отдать лечебное зелье)";
};


func int Tpl_1433_GorNaVid_HEALTH_SUC_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1433_GorNaVid_HEALTH) && (Npc_HasItems(hero,ItFo_Potion_Health_01) || Npc_HasItems(hero,ItFo_Potion_Health_02) || Npc_HasItems(hero,ItFo_Potion_Health_03)))
	{
		return 1;
	};
};

func void Tpl_1433_GorNaVid_HEALTH_SUC_Info()
{
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01");	//Вот, может быть, это поможет тебе.
	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02");	//Благодарю. Можешь на меня положиться. Я и Асгхан будем ждать тебя внизу.
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03");	//Я подойду к вам.
	if(Npc_HasItems(hero,ItFo_Potion_Health_01))
	{
		b_printtrademsg1("Отдана эссенция исцеления.");
		B_GiveInvItems(hero,self,ItFo_Potion_Health_01,1);
	}
	else if(Npc_HasItems(hero,ItFo_Potion_Health_02))
	{
		b_printtrademsg1("Отдан экстракт исцеления.");
		B_GiveInvItems(hero,self,ItFo_Potion_Health_02,1);
	}
	else if(Npc_HasItems(hero,ItFo_Potion_Health_03))
	{
		b_printtrademsg1("Отдано зелье исцеления.");
		B_GiveInvItems(hero,self,ItFo_Potion_Health_03,1);
	}
	else
	{
		PrintDebugNpc(PD_MISSION,"У меня нет зелья.");
	};
	Npc_ExchangeRoutine(self,"GATE");
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	B_LogEntry(CH2_MCEggs,"Я отдал Гор На Виду лечебное зелье и теперь он поможет мне.");
	B_GiveXP(XP_HireGorNaVid);
	AI_StopProcessInfos(self);
};


instance Tpl_1433_GorNavid_VICTORY(C_Info)
{
	npc = TPL_1433_GorNaVid;
	condition = Tpl_1433_GorNavid_VICTORY_Condition;
	information = Tpl_1433_GorNavid_VICTORY_Info;
	important = 0;
	permanent = 0;
	description = "Я нашел логово королевы ползунов!";
};


func int Tpl_1433_GorNavid_VICTORY_Condition()
{
	if(Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1)
	{
		return TRUE;
	};
};

func void Tpl_1433_GorNavid_VICTORY_Info()
{
	AI_Output(other,self,"Tpl_1433_GorNavid_VICTORY_Info_15_01");	//Я нашел логово королевы ползунов!
	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_02");	//От всего Братства благодарен тебе!
	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_03");	//И пусть Спящий хранит тебя!
};

