
instance Org_873_Cipher_Exit(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 999;
	condition = Org_873_Cipher_Exit_Condition;
	information = Org_873_Cipher_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

func void Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_873_Cipher_Hello(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Hello_Condition;
	information = Org_873_Cipher_Hello_Info;
	permanent = 0;
	description = "Как дела?";
};


func int Org_873_Cipher_Hello_Condition()
{
	return 1;
};

func void Org_873_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Cipher_Hello_12_01");	//Как всегда! Мешаем Гомезу жить.
	AI_Output(self,other,"DIA_Cipher_Hello_12_02");	//Три убитых стражника и несколько ценных вещей. За это стоит выпить!
	AI_Output(other,self,"DIA_Cipher_Hello_15_03");	//Так ты один из тех, кто постоянно совершает налеты на Старый лагерь?
	AI_Output(self,other,"DIA_Cipher_Hello_12_04");	//Нет. Только когда может подвернуться стоящее дело.
};


instance Org_873_Cipher_Fisk(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Fisk_Condition;
	information = Org_873_Cipher_Fisk_Info;
	permanent = 0;
	description = "Фиск из Старого лагеря ищет того, кто мог бы ему помогать.";
};


func int Org_873_Cipher_Fisk_Condition()
{
	if((Fisk_GetNewHehler == LOG_RUNNING) && !Npc_KnowsInfo(hero,Org_843_Sharky_Fisk))
	{
		return 1;
	};
};

func void Org_873_Cipher_Fisk_Info()
{
	AI_Output(other,self,"DIA_Cipher_Fisk_15_00");	//Фиск из Старого лагеря ищет того, кто мог бы ему помогать.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_01");	//А мне это неинтересно.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_02");	//А вот Шарки эта идея, скорее всего, понравится.
};


var int Cipher_Trade;

instance Org_873_Cipher_FromBalor(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_FromBalor_Condition;
	information = Org_873_Cipher_FromBalor_Info;
	permanent = 1;
	description = "Что ты можешь мне предложить?";
};


func int Org_873_Cipher_FromBalor_Condition()
{
	if(Npc_KnowsInfo(hero,Org_873_Cipher_Hello) && (Cipher_Trade == FALSE))
	{
		return 1;
	};
};

func void Org_873_Cipher_FromBalor_Info()
{
	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00");	//Что ты можешь мне предложить?
	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01");	//Может, лучше спросить так: что ты можешь предложить? Меня интересуют только крупные дела.
	if(Balor_TellsNCDealer == TRUE)
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02");	//Бэлор сказал мне, что тебя интересует болотник.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03");	//Хм. Так ты хочешь его продать, да?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04");	//Пока нет. Я не могу.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05");	//Так возвращайся, когда сможешь.
	};
};


instance Org_873_Cipher_TRADE(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_TRADE_Condition;
	information = Org_873_Cipher_TRADE_Info;
	permanent = 1;
	description = "Предлагаю сделку.";
};


func int Org_873_Cipher_TRADE_Condition()
{
	if((Cipher_Trade == TRUE) && (BALOR_CAN_GIVE == FALSE))
	{
		return 1;
	};
};

func void Org_873_Cipher_TRADE_Info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Предлагаю сделку.
	AI_Output(self,other,"SVM_12_WhatDoYouWant");	//Чем могу помочь?
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//У меня есть болотник. Хочешь?
	if(Npc_HasItems(other,weedpack) >= 1)
	{
		b_printtrademsg1("Отдан пакет с травой.");
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//Договорились!
		b_printtrademsg2("Получено руды: 250");
		Npc_RemoveInvItems(hero,weedpack,1);
		CreateInvItems(hero,ItMiNugget,250);
		BALOR_CAN_GIVE = TRUE;
		BALOR_TRADE_COUNT = BALOR_TRADE_COUNT + 1;
		if(BALOR_TRADE_COUNT >= 5)
		{
			Npc_ExchangeRoutine(NOV_1304_Balor,"remove");
			Wld_InsertNpc(tpl_1480_templer,"PSI_PLACE");
		};
	}
	else
	{
		AI_Output(self,other,"SVM_12_YouWannaFoolMe");	//Обмануть меня захотел? Только попробуй!
	};
};


instance ORG_873_CIPHER_TRADE2(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = org_873_cipher_trade2_condition;
	information = org_873_cipher_trade2_info;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int org_873_cipher_trade2_condition()
{
	if(Cipher_Trade == TRUE)
	{
		return 1;
	};
};

func void org_873_cipher_trade2_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//Покажи мне свои товары.
};

