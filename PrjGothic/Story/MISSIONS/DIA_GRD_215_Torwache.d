
instance DIA_Grd_215_Torwache_Exit(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 999;
	condition = DIA_Grd_215_Torwache_Exit_Condition;
	information = DIA_Grd_215_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};
func int DIA_Grd_215_Torwache_Exit_Condition()
{
	return 1;
};
func void DIA_Grd_215_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};

func int Weapon_BelongsTo_Whistler(var C_Item itm_)
{
	if(Hlp_GetInstanceID(itm_) == Hlp_GetInstanceID(Whistlers_Schwert)){return true;};
	return false;
};

instance DIA_Grd_215_Torwache_First(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 2;
	condition = DIA_Grd_215_Torwache_First_Condition;
	information = DIA_Grd_215_Torwache_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grd_215_Torwache_First_Condition()
{
	if(
		!C_Npc_IsBelongToCamp(other,OLDCAMP) &&
		!Npc_KnowsInfo(other,DIA_Grd_216_First) && (Kapitel < 2) &&
		Npc_GetDistToWP(self,"OCR_MAINGATE_OUTSIDE") < 400
	)
	{
		return 1;
	};
};

func void DIA_Grd_215_Torwache_First_Info()
{
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_00");	//И куда это мы идем?
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_15_01");	//В лагерь.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_02");	//От тебя ведь не будет неприятностей, а? Парень?
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Ну, я тут, знаешь ли, хотел весь лагерь взорвать...",DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Да просто хотел посмотреть, что здесь есть.",DIA_Grd_215_Torwache_First_JustLooking);
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Диего сказал, что я должен встретиться с ним в лагере.",DIA_Grd_215_Torwache_First_Diego);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Trouble_15_00");	//Ну, я тут, знаешь ли, хотел весь лагерь взорвать...
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Trouble_06_01");	//А ты шутник... Не люблю шутов.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_JustLooking_15_00");	//Да просто хотел посмотреть, что здесь есть.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_JustLooking_06_01");	//За это с тебя десять кусков руды.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"А, забудь об этом.",DIA_Grd_215_Torwache_First_NoPay);
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Ладно, вот твои десять кусков.",DIA_Grd_215_Torwache_First_Pay);
	}
	else
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Но у меня не так много руды.",dia_grd_215_torwache_first_nomoney);
	};
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Diego_15_00");	//Диего сказал, что я должен встретиться с ним в лагере.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Diego_06_01");	//Ладно, раз так - проходи.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void dia_grd_215_torwache_first_nomoney()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//Но у меня не так много руды.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01");	//Хорошо, сделаю исключение для тебя, как для новенького. Но только один раз.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_NoPay_15_00");	//А, забудь об этом.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_NoPay_06_01");	//Тогда убирайся.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_15_00");	//Ладно, вот твои десять кусков.
	b_printtrademsg1("Отдано руды: 10");
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_06_01");	//Другой разговор, заходи.
	B_GiveInvItems(other,self,ItMiNugget,10);
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};


instance DIA_Grd_215_Torwache_PERM(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = DIA_Grd_215_Torwache_PERM_Condition;
	information = DIA_Grd_215_Torwache_PERM_Info;
	permanent = 1;
	description = "Есть что-нибудь новенькое?";
};
func int DIA_Grd_215_Torwache_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grd_215_Torwache_First))
	{
		return true;
	};
	return false;
};
func void DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_PERM_15_00");	//Есть что-нибудь новенькое?
	AI_Output(self,other,"DIA_Grd_215_Torwache_PERM_06_01");	//Нет. Все по-прежнему.
};

instance DIA_Grd_215_Torwache_WeaponPickUp(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = DIA_Grd_215_Torwache_WeaponPickUp_Condition;
	information = DIA_Grd_215_Torwache_WeaponPickUp_Info;
	permanent = true;
	important = true;
};
func int DIA_Grd_215_Torwache_WeaponPickUp_Condition()
{
	if(
		!SC_HasRightKeepWeapon()
	&&	Npc_KnowsInfo(hero,DIA_Grd_215_Torwache_First)
	&&	Npc_HasEquippedSword(other)
	)
	{
		return true;
	};
	return false;
};
var int DIA_Grd_215_Torwache_WeaponPickUp_OneWeaponAlreadyPickedUp;
func void DIA_Grd_215_Torwache_WeaponPickUp_Info()
{
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_NULL_00");	//А это что это у тебя?
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_NULL_01");	//Нука дай его сюда.
	VAR C_ITEM itm;itm = Npc_GetEquippedMeleeWeapon(other);
	Npc_RemoveInvItem_(other,itm);
//	if(Npc_HasItems(other,ItMwPickaxe)){EquipItem(other,ItMwPickaxe);};
	if(Weapon_BelongsTo_Whistler(itm))
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_WeaponPickUp_NULL_04");	//Это меч Уистлера. У нас с ним уговор - я покупаю его у Фиска, а он замолвит за меня словечко перед Торусом.
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_NULL_05"); //У Фиска? Не припомню когда в последний раз он уходил из лагеря.
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_NULL_06"); //Не волнуйся я найду этому мечу достойное применение.
		
		B_LogEntry(CH1_JoinOC,"Чудесно! И что мне теперь сказать Уистлеру?!");
	}
	else if(!DIA_Grd_215_Torwache_WeaponPickUp_OneWeaponAlreadyPickedUp)
	{
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_NULL_02");	//Рудокопам полагается кирка, а не меч.. пускай даже и такой.. мм...
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_NULL_03");	//По наследству от дедушки достался? (ха-ха)
		DIA_Grd_215_Torwache_WeaponPickUp_OneWeaponAlreadyPickedUp = true;
		Log_CreateTopic(CH1_OldCampRules,LOG_NOTE);
		B_LogEntry(CH1_OldCampRules,"Этот тип, на входе в Старый лагерь, отобрал мое оружие. Сказав, что рудокопам не положено его иметь! И даже имя Диего не помогло..");
	};
};

instance DIA_Grd_215_Torwache_WeaponPickUp_01(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = DIA_Grd_215_Torwache_WeaponPickUp_01_Condition;
	information = DIA_Grd_215_Torwache_WeaponPickUp_01_Info;
	description = "Я не рудокоп!";
};
func int DIA_Grd_215_Torwache_WeaponPickUp_01_Condition()
{
	if(DIA_Grd_215_Torwache_WeaponPickUp_OneWeaponAlreadyPickedUp)
	{
		return true;
	};
	return false;
};
func void akh_Grd_215_Torwache_WeaponPickUp_EscortStart()
{
};
func void DIA_Grd_215_Torwache_WeaponPickUp_01_Info()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_00");	//Я не рудокоп!
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_01");	//Полегче парень.
	if(Npc_HasEquippedPickAxe(other))
	{
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_021"); //А за спиной это у тебя что болтается?
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_022"); //Кажется ты именно что есть - рудокоп. Рудокоп который утомился на шахтах и забыл кто он есть..
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_023"); //Отбился от конвоя, бродишь тут один.. с этой железякой, а окрестности здесь довольно не безопасные.
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_024"); //Что мы скажем Гомезу, когда по твоей вине недосчитаемся нескольких ящиков руды?
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_025"); //Дуй живо в лагерь, абормот.
		return;
	};
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_02");	//Кирки у тебя за спиной я действительно не вижу.
	if(Npc_HasItems(other,ItMwPickaxe))
	{
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_03"); //Однако вот из штанов бездонных что-то выпирает (смотрит в камеру "четвертая стена")
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_04"); //Да и выглядишь ты как хилый, тощий и голодный рудокоп. Наведайся к Снафу.
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_05"); //Возможно он решит одну твою проблему.
	}
	else
	{
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_031");	//Да и в штанах бездонных она не запрятана тоже (смотрит в камеру "четвертая стена")
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_041");	//Но ты выглядишь как рудокоп - хилый, тощий, голодный.
	};
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_06");	//Меч будет тебе только помехой - порежешься.. сам или кто-то посильнее глаз положит на эту железяку.
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_07");	//Одно дело дубинки, которые вы вечно таскаете с собой и другое дело меч.
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_08");	//Иди спокойно оглядись, внутри тебе ничто не угрожает именно потому, что мечи есть только у нас..
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_09");	//А нам.. до вас.. особо нет дела.
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponPickUp_01_NULL_10");	//Давай, живо внутрь - не задерживай конвой!
	akh_Grd_215_Torwache_WeaponPickUp_EscortStart();
};
instance DIA_Grd_215_Torwache_WeaponMayKeep(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 10;
	condition = DIA_Grd_215_Torwache_WeaponMayKeep_Condition;
	information = DIA_Grd_215_Torwache_WeaponMayKeep_Info;
	description = "Прости, что-то случилось? Ты не отобрал мое оружие.";
};
func int DIA_Grd_215_Torwache_WeaponMayKeep_Condition()
{
	if(
		SC_HasRightKeepWeapon()
	&&	(
			hero.guild == GIL_None
		||	hero.guild == GIL_VLK
		||	hero.guild == GIL_BAU
		||	hero.guild == GIL_SFB
		)
	)
	{
		return true;
	};
	return false;
};
func void DIA_Grd_215_Torwache_WeaponMayKeep_Info()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_WeaponMayKeep_NULL_00"); //Прости, что-то случилось? Ты не отобрал мое оружие.
	AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponMayKeep_NULL_01"); //Я не глухой парень и не всегда стою здесь на посту.
	if(SC_IsWorkOnThorus())
	{
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponMayKeep_NULL_02"); //Я слышал, что ты помогаешь Торусу. Так-что иди помогай дальше.
	}
	else if(Diego_BringList == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponMayKeep_NULL_03"); //Прогулка по этому лесу для новичка - это смело. Нам нужны такие люди.
	}
	else
	{
		AI_Output(self,other,"DIA_Grd_215_Torwache_WeaponMayKeep_NULL_04"); //Мясо все любят! У тебя не найдется чего с собой?
	};
};
