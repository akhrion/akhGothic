
instance VLK_585_Aleph_Exit(C_Info)
{
	npc = VLK_585_Aleph;
	nr = 999;
	condition = VLK_585_Aleph_Exit_Condition;
	information = VLK_585_Aleph_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

func void VLK_585_Aleph_Exit_Info()
{
	if(!Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH))
	{
		AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01");	//Желаю удачи!
		AI_Output(self,other,"VLK_585_Aleph_Exit_Info_05_02");	//Ты знаешь, где меня найти.
	};
	AI_StopProcessInfos(self);
};


instance VLK_585_Aleph_CLEVER(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_CLEVER_Condition;
	information = VLK_585_Aleph_CLEVER_Info;
	important = 1;
	permanent = 0;
};


func int VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void VLK_585_Aleph_CLEVER_Info()
{
	AI_Output(self,other,"VLK_585_Aleph_CLEVER_Info_05_01");	//Хе-хе-хе, стражники никогда не поймают меня!
};


instance VLK_585_Aleph_GUARDS(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_GUARDS_Condition;
	information = VLK_585_Aleph_GUARDS_Info;
	important = 0;
	permanent = 0;
	description = "О чем ты говоришь?";
};


func int VLK_585_Aleph_GUARDS_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_CLEVER))
	{
		return 1;
	};
};

func void VLK_585_Aleph_GUARDS_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_01");	//О чем ты говоришь?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_02");	//Я работаю только тогда, когда они подходят слишком близко. Все остальное время я занимаюсь своими делами.
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_03");	//Думаю, они все равно тебя подозревают. Зачем это тебе?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_04");	//Конечно, ты прав, я получаю так же мало руды, как все здесь. Ее всегда не хватает, так что приходится меняться.
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_05");	//Я всегда в курсе последних событий. Могу рассказать много интересного. У тебя с собой, случайно, есть руда? Ну, скажем, 10 кусков.
};


instance VLK_585_Aleph_INFO(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_INFO_Condition;
	information = VLK_585_Aleph_INFO_Info;
	important = 0;
	permanent = 0;
	description = "(дать 10 кусков руды)";
};


func int VLK_585_Aleph_INFO_Condition()
{
	if((Npc_HasItems(hero,ItMiNugget) >= 10) && Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void VLK_585_Aleph_INFO_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_INFO_Info_15_01");	//Хорошо, возьми десять кусков.
	b_printtrademsg1("Отдано руды: 10");
	B_GiveInvItems(other,self,ItMiNugget,10);
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_02");	//Спасибо. Если ты вернешься в главный ствол шахты и спустишься вниз, ты увидишь две пещеры.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_03");	//В одной из них будет стоять стражник. Там же стоит старый пресс.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_04");	//Если тебе повезет, ты найдешь зелье лечения, но будь осторожен, там повсюду ползуны.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_05");	//Если захочешь узнать что-нибудь еще, приходи ко мне, уж я смогу тебе помочь...
};


instance VLK_585_Aleph_ANGRY(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_ANGRY_Condition;
	information = VLK_585_Aleph_ANGRY_Info;
	important = 1;
	permanent = 0;
};


func int VLK_585_Aleph_ANGRY_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH))
	{
		return 1;
	};
};

func void VLK_585_Aleph_ANGRY_Info()
{
	AI_Output(self,other,"VLK_585_Aleph_ANGRY_Info_05_01");	//Ты рассказал все Брендику! Сгинь, предатель!
	AI_StopProcessInfos(self);
	Npc_SetTempAttitude(self,ATT_ANGRY);
};


instance VLK_585_Aleph_KEY(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_KEY_Condition;
	information = VLK_585_Aleph_KEY_Info;
	important = 0;
	permanent = 0;
	description = "Есть какие-нибудь новости? Расскажешь?";
};


func int VLK_585_Aleph_KEY_Condition()
{
	if(!Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH) && Npc_KnowsInfo(hero,VLK_585_Aleph_INFO))
	{
		return 1;
	};
};

func void VLK_585_Aleph_KEY_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_KEY_Info_15_01");	//Есть какие-нибудь новости? Расскажешь?
	AI_Output(self,other,"VLK_585_Aleph_KEY_Info_05_02");	//А у тебя еще есть руда?
};


instance VLK_585_Aleph_GLEN(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_GLEN_Condition;
	information = VLK_585_Aleph_GLEN_Info;
	important = 0;
	permanent = 0;
	description = "(дать 10 кусков руды)";
};


func int VLK_585_Aleph_GLEN_Condition()
{
	if((Npc_HasItems(hero,ItMiNugget) >= 10) && Npc_KnowsInfo(hero,VLK_585_Aleph_KEY))
	{
		return 1;
	};
};

func void VLK_585_Aleph_GLEN_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_GLEN_Info_15_01");	//Надеюсь, за эти десять кусков ты расскажешь мне что-нибудь стоящее.
	b_printtrademsg1("Отдано руды: 10");
	B_GiveInvItems(other,self,ItMiNugget,10);
	AI_Output(self,other,"VLK_585_Aleph_GLEN_Info_05_02");	//Здесь очень много запертых сундуков. Отмычки можно купить у рудокопа по имени Глен. Ты найдешь его наверху.
	Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
	B_LogEntry(GE_TRADEROM,"За небольшую плату Алеф рассказал мне, что рудокоп по имени Глен продает отмычки.");
};

func void B_Aleph_StorageShedKey()
{
	B_LogEntry(CH2_StorageShed,"Алеф продал мне ключ от ящиков на складе!");
};


instance VLK_585_Aleph_SCHUPPEN(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_SCHUPPEN_Condition;
	information = VLK_585_Aleph_SCHUPPEN_Info;
	important = 0;
	permanent = 1;
	description = "Ты знаешь что-нибудь о ключе к ящикам на складе?";
};


func int VLK_585_Aleph_SCHUPPEN_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk) && !Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH) && (ALEPH_KEY == FALSE) && Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01");	//Ты знаешь что-нибудь о ключе к ящикам на складе?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02");	//Ну, все зависит от...
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03");	//От того, сколько я заплачу?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04");	//Вот, ты быстро учишься.
	Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,DIALOG_BACK,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Заплатить 50 кусков.",VLK_585_Aleph_SCHUPPEN_50);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Заплатить 30 кусков.",VLK_585_Aleph_SCHUPPEN_30);
	Info_AddChoice(VLK_585_Aleph_SCHUPPEN,"Заплатить 15 кусков.",VLK_585_Aleph_SCHUPPEN_15);
};

func void VLK_585_Aleph_SCHUPPEN_50()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01");	//50 кусков тебе хватит?
		b_printtrademsg1("Отдано руды: 50");
		B_GiveInvItems(other,self,ItMiNugget,50);
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02");	//Твоя щедрость безгранична! Возьми ключ. А еще возьми это кольцо. Оно было моим талисманом на счастье.
		b_printtrademsg2("Получен ключ от склада и кольцо силы.");
		CreateInvItems(other,ItKe_OM_03,1);
		CreateInvItems(other,Staerkering,1);
		Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
		ALEPH_KEY = TRUE;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03");	//У тебя же нет руды!
	};
};

func void VLK_585_Aleph_SCHUPPEN_30()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 30)
	{
		Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01");	//Предлагаю 30 кусков.
		b_printtrademsg1("Отдано руды: 30");
		B_GiveInvItems(other,self,ItMiNugget,30);
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02");	//Хорошо. У меня как раз есть ключ. Совершенно случайно, кстати.
		b_printtrademsg2("Получен ключ от склада.");
		CreateInvItem(self,ItKe_OM_03);
		B_GiveInvItems(self,other,ItKe_OM_03,1);
		ALEPH_KEY = TRUE;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03");	//Ты обещаешь то, чего нет!
	};
};

func void VLK_585_Aleph_SCHUPPEN_15()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01");	//Тебя устроит 15 кусков?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02");	//15 кусков? Никогда не видел никакого ключа!
};

func void VLK_585_Aleph_SCHUPPEN_Back()
{
	Info_ClearChoices(VLK_585_Aleph_SCHUPPEN);
};


instance VLK_585_Aleph_DIRTY(C_Info)
{
	npc = VLK_585_Aleph;
	condition = VLK_585_Aleph_DIRTY_Condition;
	information = VLK_585_Aleph_DIRTY_Info;
	important = 0;
	permanent = 1;
	description = "Ты знаешь что-нибудь о ключе к ящикам на складе?";
};


func int VLK_585_Aleph_DIRTY_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk) && Npc_KnowsInfo(hero,GRD_261_Brandick_ALEPH) && (ALEPH_KEY == FALSE) && Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void VLK_585_Aleph_DIRTY_Info()
{
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_01");	//Ты знаешь что-нибудь о ключе к ящикам на складе?
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_02");	//Ну, ты же знаешь, все зависит...
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_03");	//От того, сколько я заплачу?
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_04");	//Ты быстро все понимаешь. Мне нужно 100 кусков.
	Info_ClearChoices(VLK_585_Aleph_DIRTY);
	Info_AddChoice(VLK_585_Aleph_DIRTY,"(заплатить 100 кусков руды)",VLK_585_Aleph_DIRTY_100);
	Info_AddChoice(VLK_585_Aleph_DIRTY,"(не платить)",VLK_585_Aleph_DIRTY_NO);
};

func void VLK_585_Aleph_DIRTY_100()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 100)
	{
		b_printtrademsg1("Отдано руды: 100");
		B_GiveInvItems(hero,self,ItMiNugget,100);
		AI_Output(other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01");	//Ты меня совсем разоришь. Держи уж свои 100 кусков.
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02");	//Хорошее предложение! Не могу отказать. Держи свой ключ.
		b_printtrademsg2("Получен ключ от склада.");
		CreateInvItem(self,ItKe_OM_03);
		B_GiveInvItems(self,other,ItKe_OM_03,1);
		Info_ClearChoices(VLK_585_Aleph_DIRTY);
		ALEPH_KEY = TRUE;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03");	//Ты за кого меня принимаешь? 100 кусков и ни одним меньше!
	};
};

func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01");	//Сто кусков - да это же целое состояние. И не мечтай!
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02");	//Ну, я никогда не начинал первым. Это ты ко мне все время обращался!..
	Info_ClearChoices(VLK_585_Aleph_DIRTY);
};

