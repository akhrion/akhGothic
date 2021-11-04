
instance GRD_271_ULBERT_Exit(C_Info)
{
	npc = GRD_271_Ulbert;
	nr = 999;
	condition = GRD_271_ULBERT_Exit_Condition;
	information = GRD_271_ULBERT_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int GRD_271_ULBERT_Exit_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_KEY(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_KEY_Condition;
	information = GRD_271_ULBERT_KEY_Info;
	important = 0;
	permanent = 0;
	description = "Что хранится на складе?";
};


func int GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_KEY_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_KEY_Info_15_01");	//Что хранится на складе?
	AI_Output(self,other,"GRD_271_ULBERT_KEY_Info_07_02");	//Это тебя не касается.
};


instance GRD_271_ULBERT_TRICK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_TRICK_Condition;
	information = GRD_271_ULBERT_TRICK_Info;
	important = 0;
	permanent = 0;
	description = "А ты здесь давно стоишь. Хочешь пить?";
};


func int GRD_271_ULBERT_TRICK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_key))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_TRICK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_TRICK_Info_15_01");	//А ты здесь давно стоишь. Хочешь пить?
	AI_Output(self,other,"GRD_271_ULBERT_TRICK_Info_07_02");	//Ты прав! Да, с удовольствием бы что-нибудь выпил. А у тебя есть с собой что-нибудь?
	Log_CreateTopic(CH2_StorageShed,LOG_MISSION);
	Log_SetTopicStatus(CH2_StorageShed,LOG_RUNNING);
	B_LogEntry(CH2_StorageShed,"Стражник Ульберт сторожит ящики на складе в Старой шахте. Я должен найти ему какую-нибудь выпивку!");
};


instance GRD_271_ULBERT_DRINK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_DRINK_Condition;
	information = GRD_271_ULBERT_DRINK_Info;
	important = 0;
	permanent = 0;
	description = "(угостить)";
};


func int GRD_271_ULBERT_DRINK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && (Npc_HasItems(hero,ItFoBeer) || Npc_HasItems(hero,ItFoWine) || Npc_HasItems(hero,ItFoBooze)))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_DRINK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRINK_Info_15_01");	//Вот, выпей это за мое здоровье!
	AI_Output(self,other,"GRD_271_ULBERT_DRINK_Info_07_02");	//Спасибо.
	if(Npc_HasItems(hero,ItFoBeer))
	{
		b_printtrademsg1("Отдано пиво.");
		B_GiveInvItems(hero,self,ItFoBeer,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBeer);
	}
	else if(Npc_HasItems(hero,ItFoWine))
	{
		b_printtrademsg1("Отдано вино.");
		B_GiveInvItems(hero,self,ItFoWine,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoWine);
	}
	else if(Npc_HasItems(hero,ItFoBooze))
	{
		b_printtrademsg1("Отдан шнапс.");
		B_GiveInvItems(hero,self,ItFoBooze,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBooze);
	};
};


instance GRD_271_ULBERT_DRUNK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_DRUNK_Condition;
	information = GRD_271_ULBERT_DRUNK_Info;
	important = 0;
	permanent = 0;
	description = "Так ты можешь сказать, что хранится на складе?";
};


func int GRD_271_ULBERT_DRUNK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drink))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_DRUNK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_01");	//Так ты можешь сказать, что хранится на складе?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_02");	//Ну, несколько сундуков с припасами. Только вот ключ от них все равно потерялся.
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_03");	//Потерялся?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_04");	//Да. Думаю, без Алефа здесь не обошлось. Ему вообще не стоит доверять.
	B_LogEntry(CH2_StorageShed,"Когда я принес Ульберту выпивку, он рассказал мне, что потерял ключ от ящиков. Может быть, Алеф, рудокоп, что-то знает об этом?");
};


instance GRD_271_ULBERT_LOCK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_LOCK_Condition;
	information = GRD_271_ULBERT_LOCK_Info;
	important = 0;
	permanent = 0;
	description = "(отвлечь Ульберта)";
};


func int GRD_271_ULBERT_LOCK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_LOCK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_LOCK_Info_15_01");	//Слушай, Ян и стражники сидят внизу и едят жареное мясо.
	AI_Output(self,other,"GRD_271_ULBERT_LOCK_Info_07_02");	//Что? Без меня? Ну, так я пойду и заберу свою долю.
	self.aivar[AIV_ITEMSCHWEIN] = FALSE;
	B_LogEntry(CH2_StorageShed,"Я смог легко отвлечь Ульберта. Он ушел со склада!");
	Npc_ExchangeRoutine(self,"away");
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_ANGRY(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_ANGRY_Condition;
	information = GRD_271_ULBERT_ANGRY_Info;
	important = 1;
	permanent = 0;
};


func int GRD_271_ULBERT_ANGRY_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_lock) && (Npc_GetDistToWP(hero,"OM_CAVE1_49") < 600))
	{
		return TRUE;
	};
};

func void GRD_271_ULBERT_ANGRY_Info()
{
	AI_Output(self,other,"GRD_271_ULBERT_ANGRY_Info_07_01");	//Эй, ты, не было там никакого мяса!
	AI_Output(other,self,"GRD_271_ULBERT_ANGRY_Info_15_02");	//А... э... Наверное, я ошибся! Желаю хорошего дня!
	self.aivar[AIV_ITEMSCHWEIN] = TRUE;
	B_GiveXP(XP_LureUlbertAway);
	B_LogEntry(CH2_StorageShed,"Я снова встретил Ульберта. Он до сих пор не понял, что я обманул его. Какой наивный солдат!");
	Log_SetTopicStatus(CH2_StorageShed,LOG_SUCCESS);
	Npc_ExchangeRoutine(self,"start");
	AI_StopProcessInfos(self);
};

