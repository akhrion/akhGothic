
instance Info_Kirgo_Exit(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 999;
	condition = Info_Kirgo_Exit_Condition;
	information = Info_Kirgo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Kirgo_Exit_Condition()
{
	return 1;
};

func void Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Kirgo_What(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_What_Condition;
	information = Info_Kirgo_What_Info;
	permanent = 0;
	description = "Привет! Я новенький.";
};


func int Info_Kirgo_What_Condition()
{
	if(Kapitel <= 2)
	{
		return 1;
	};
};

func void Info_Kirgo_What_Info()
{
	AI_Output(other,self,"Info_Kirgo_What_15_00");	//Привет! Я новенький.
	AI_Output(self,other,"Info_Kirgo_What_05_01");	//Новичок! Расскажи мне что-нибудь о внешнем мире. Я уже целый месяц не получал оттуда никаких новостей.
	AI_Output(self,other,"Info_Kirgo_What_05_02");	//Я Кирго. Я участвую в боях на арене.
};


instance Info_Kirgo_Good(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Good_Condition;
	information = Info_Kirgo_Good_Info;
	permanent = 0;
	description = "И как проходят твои бои?";
};


func int Info_Kirgo_Good_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func void Info_Kirgo_Good_Info()
{
	AI_Output(other,self,"Info_Kirgo_Good_15_00");	//И как проходят твои бои?
	AI_Output(self,other,"Info_Kirgo_Good_05_01");	//Бои на арене? Я совсем недавно начал этим заниматься, но за мной уже есть одна победа!
};


instance Info_Kirgo_Charge(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Charge_Condition;
	information = Info_Kirgo_Charge_Info;
	permanent = 0;
	description = "Я вызываю тебя на бой! Пойдем, сразимся на арене!";
};


func int Info_Kirgo_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kirgo_What) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Kirgo_Charge_Info()
{
	AI_Output(other,self,"Info_Kirgo_Charge_15_00");	//Я вызываю тебя на бой! Сразимся на арене!
	AI_Output(self,other,"Info_Kirgo_Charge_05_01");	//Что? Но сейчас мне не хочется драться. Пойдем лучше выпьем пива, а ты расскажешь мне, что делается в Миртане.
	Info_ClearChoices(Info_Kirgo_Charge);
	Info_AddChoice(Info_Kirgo_Charge,"Нет! Я хочу драться. Сейчас!",Info_Kirgo_Charge_NOW);
	Info_AddChoice(Info_Kirgo_Charge,"Ладно, давай выпьем пиво! ",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00");	//Нет! Я хочу драться. Сейчас!
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01");	//Как пожелаешь... я готов, скажи, когда начинать.
	Info_ClearChoices(Info_Kirgo_Charge);
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00");	//Ладно, давай выпьем пиво!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01");	//Это тебе!
	b_printtrademsg1("Получено пиво.");
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02");	//Спасибо! Боюсь, я не слишком много смогу рассказать о внешнем мире. Меня два месяца держали в яме, перед тем как забросить сюда.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03");	//Жаль... Ну, что ж... для человека, который два месяца отсидел в яме, ты выглядишь очень неплохо.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04");	//Постараюсь остаться таким и в дальнейшем.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05");	//Зачем тебе драться с одним из нас?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06");	//Я хочу, чтобы обо мне узнали в лагере.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07");	//От Скатти, наверное? Хм, он один из самых влиятельных людей Внешнего Кольца...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08");	//Но если ты действительно хочешь заручиться его поддержкой, ты должен победить Карима. Боюсь только, тебе с ним не справиться!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09");	//Если ты все еще хочешь сразиться со мной, скажи мне. Но мне не очень хочется избивать тебя.
	CreateInvItem(self,ItFoBeer);
	B_GiveInvItems(self,other,ItFoBeer,1);
	self.npcType = npctype_friend;
	Info_ClearChoices(Info_Kirgo_Charge);
};


var C_Npc ARENA_FIGHTER_1;
instance Info_Kirgo_ChargeREAL(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_ChargeREAL_Condition;
	information = Info_Kirgo_ChargeREAL_Info;
	permanent = 1;
	description = "Мы будем сражаться, ты готов?";
};


func int Info_Kirgo_ChargeREAL_Condition()
{
	if((Kirgo_Charged == FALSE) && Npc_KnowsInfo(hero,Info_Kirgo_Charge) && (!Npc_IsDead(Sld_729_Kharim) && !Npc_IsDead(Tpl_1422_GorHanis)) && (Npc_GetTrueGuild(hero) == GIL_None) && ((Kharim_Charged != TRUE) || (KHARIM_CHARGED_END == TRUE)))
	{
		return 1;
	};
};

func void Info_Kirgo_ChargeREAL_Info()
{
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00");	//Мы будем сражаться, ты готов?
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01");	//Следуй за мной!
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			CreateInvItem(self,ItFo_Potion_Health_03);
			AI_UseItem(self,ItFo_Potion_Health_03);
		};
		AI_StopProcessInfos(self);
		Kirgo_Charged = TRUE;
		self.attribute[ATR_HITPOINTS] = 160;
		self.attribute[ATR_HITPOINTS_MAX] = 160;
		Npc_ExchangeRoutine(self,"GUIDE");
		B_FullStop(Tpl_1422_GorHanis);
		B_FullStop(Sld_729_Kharim);
		B_ExchangeRoutine(Tpl_1422_GorHanis,"nopractice");
		B_ExchangeRoutine(Sld_729_Kharim,"nopractice");
	};
};


instance Info_Kirgo_InArena(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_InArena_Condition;
	information = Info_Kirgo_InArena_Info;
	permanent = 0;
	important = 1;
};


func int Info_Kirgo_InArena_Condition()
{
	if((Kirgo_Charged == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 600))
	{
		return 1;
	};
};

func void Info_Kirgo_InArena_Info()
{
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,ItFo_Potion_Health_03);
		AI_UseItem(self,ItFo_Potion_Health_03);
	};
	if(!Npc_HasItems(self,itmw_kirgo) && !Npc_HasItems(self,ItMw_1H_Sword_01))
	{
		CreateInvItem(self,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Output(self,other,"Info_Kirgo_InArena_05_00");	//Итак, начнем. Пусть победит сильнейший!
	B_ClearImmortal(self);
	Wld_SendUntrigger("OC_ARENA_GATE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
	B_ExchangeRoutine(Sld_729_Kharim,"START");
	B_ExchangeRoutine(grd_998_gardist,"wait");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	KIRGO_CHARGED_END = TRUE;
	PLAYERINARENA = TRUE;
};

