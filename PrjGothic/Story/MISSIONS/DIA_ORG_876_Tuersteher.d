
instance DIA_Org_876_EXIT(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 999;
	condition = DIA_Org_876_EXIT_Condition;
	information = DIA_Org_876_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Org_876_EXIT_Condition()
{
	return 1;
};

func void DIA_Org_876_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Org_876_AmSfb(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_AmSfb_Condition;
	information = DIA_Org_876_AmSfb_Info;
	permanent = 1;
	description = "Я рудокоп! И сейчас я хочу выпить чего-нибудь покрепче!";
};


func int DIA_Org_876_AmSfb_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY))
	{
		return TRUE;
	};
};

func void DIA_Org_876_AmSfb_Info()
{
	var C_Item myarmor;
	AI_Output(other,self,"DIA_Org_876_AmSfb_15_00");	//Я рудокоп! И сейчас я хочу выпить чего-нибудь покрепче!
	myarmor = Npc_GetEquippedArmor(hero);
	if(Hlp_IsItem(myarmor,sfb_armor_l))
	{
		AI_Output(self,other,"DIA_Org_876_AmSfb_06_01");	//Да, ты похож на этих грязных оборванцев. Можешь пройти!
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(Hlp_IsItem(myarmor,vlk_armor_l) || Hlp_IsItem(myarmor,vlk_armor_m))
	{
		AI_Output(self,other,"SVM_6_WhatsThisSupposedToBe");	//Что тебе здесь нужно? Что ты замышляешь?
		AI_Output(self,other,"Info_Org_804_FirstWarn_Info_06_00");	//Прислужникам Гомеза вход воспрещен! Уходи!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_AmSfb_NOSFB_06_00");	//Что-то ты не похож на рудокопа. Тебе сюда нельзя!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Org_876_Bribe(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_Bribe_Condition;
	information = DIA_Org_876_Bribe_Info;
	permanent = 1;
	description = "А если я дам тебе немного руды?";
};


func int DIA_Org_876_Bribe_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_Org_876_Bribe_Info()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_15_00");	//А если я дам тебе немного руды?
	AI_Output(self,other,"DIA_Org_876_Bribe_06_01");	//А 'немного' - это сколько?
	Info_ClearChoices(DIA_Org_876_Bribe);
	Info_AddChoice(DIA_Org_876_Bribe,"Сотни кусков тебе хватит?",DIA_Org_876_Bribe_100Erz);
	Info_AddChoice(DIA_Org_876_Bribe,"Пятьдесят кусков. Ты согласен?",DIA_Org_876_Bribe_50Erz);
	Info_AddChoice(DIA_Org_876_Bribe,"Ну, 10 кусков.",DIA_Org_876_Bribe_10Erz);
};

func void DIA_Org_876_Bribe_10Erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_10Erz_15_00");	//Ну, 10 кусков.
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_01");	//Десять кусков? За это я разрешу тебе сделать вторую попытку.
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_02");	//Да? И где эти десять кусков?
	};
	AI_StopProcessInfos(self);
};

func void DIA_Org_876_Bribe_50Erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_50Erz_15_00");	//Пятьдесят кусков. Ты согласен?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_01");	//Ну, это всего лишь половина того, что я называю 'немного руды'.
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_02");	//Да? Что-то я не вижу пятидесяти кусков.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Org_876_Bribe_100Erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_100Erz_15_00");	//Сотни кусков тебе хватит?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		b_printtrademsg1("Отдано руды: 100");
		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_01");	//Вполне хватит. Проходи.
		self.aivar[AIV_PASSGATE] = TRUE;
		B_GiveInvItems(other,self,ItMiNugget,100);
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_02");	//Конечно. Только у тебя их нет.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Org_876_PERM(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_PERM_Condition;
	information = DIA_Org_876_PERM_Info;
	permanent = 1;
	description = "Как идут дела со шнапсом?";
};


func int DIA_Org_876_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) || (Npc_GetAttitude(self,hero) == ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_Org_876_PERM_Info()
{
	AI_Output(other,self,"DIA_Org_876_PERM_15_00");	//Как идут дела со шнапсом?
	AI_Output(self,other,"DIA_Org_876_PERM_06_01");	//Зайди и спроси Силаса. Нам не на что жаловаться.
};


instance DIA_Org_876_ScSld(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_ScSld_Condition;
	information = DIA_Org_876_ScSld_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Org_876_ScSld_Condition()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_DMB) || (other.guild == GIL_GUR))
	{
		return 1;
	};
};

func void DIA_Org_876_ScSld_Info()
{
	AI_Output(self,other,"DIA_Org_876_ScSld_06_00");	//Стой! Ты же знаешь правила. Сюда могут пройти только воры или рудокопы.
	AI_Output(other,self,"DIA_Org_876_ScSld_15_01");	//А ты хочешь меня остановить?
	AI_Output(self,other,"DIA_Org_876_ScSld_06_02");	//Нет... ладно, проходи...
	AI_StopProcessInfos(self);
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Org_876_ScSekte(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_ScSekte_Condition;
	information = DIA_Org_876_ScSekte_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Org_876_ScSekte_Condition()
{
	if((other.guild == GIL_NOV) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		return 1;
	};
};

func void DIA_Org_876_ScSekte_Info()
{
	AI_Output(self,other,"DIA_Org_876_ScSekte_06_00");	//Обычно сюда могут пройти только свои, ну, сектантов мы тоже пускаем.
	AI_Output(self,other,"DIA_Org_876_ScSekte_06_01");	//Особенно если у них есть с собой болотник.
	self.aivar[AIV_PASSGATE] = TRUE;
};


var int Org_876_GotJoint;

instance DIA_Org_876_GibKraut(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_GibKraut_Condition;
	information = DIA_Org_876_GibKraut_Info;
	permanent = 1;
	description = "А у меня как раз есть болотник. Угощайся!";
};


func int DIA_Org_876_GibKraut_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Org_876_ScSekte))
	{
		return 1;
	};
};

func void DIA_Org_876_GibKraut_Info()
{
	AI_Output(other,self,"DIA_Org_876_GibKraut_15_00");	//А у меня как раз есть болотник. Угощайся!
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
			b_printtrademsg1("Отдан 'Новичок'.");
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
			b_printtrademsg1("Отдан 'Северный темный'.");
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
			b_printtrademsg1("Отдан 'Зов мечты'.");
		};
		AI_Output(self,other,"DIA_Org_876_GibKraut_06_01");	//Всегда рады видеть тебя здесь.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PASSGATE] = TRUE;
		Org_876_GotJoint = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Org_876_GibKraut_KEIN_15_00");	//Э... Подожди, по-моему, он закончился.
		AI_Output(self,other,"DIA_Org_876_GibKraut_KEIN_06_00");	//Это плохо. Не забудь принести сюда немного в следующий раз.
		self.aivar[AIV_PASSGATE] = TRUE;
	};
};


const string Org_876_CHECKPOINT = "NC_TAVERN_BAR";

instance Info_Org_876_FirstWarn(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 2;
	condition = Info_Org_876_FirstWarn_Condition;
	information = Info_Org_876_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_876_FirstWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Org_876_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	if(Npc_GetAttitude(self,hero) != ATT_FRIENDLY)
	{
		AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_00");	//Куда это ты собрался?
		AI_Output(hero,self,"Info_Org_876_FirstWarn_Info_15_01");	//Туда.
		AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_02");	//А для тебя вход закрыт. Сюда могут приходить только воры или рудокопы.
		hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Org_876_CHECKPOINT);
		hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	}
	else
	{
		AI_Output(self,other,"SVM_6_FriendlyGreetings");	//Привет, дружище!
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance Info_Org_876_LastWarn(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = Info_Org_876_LastWarn_Condition;
	information = Info_Org_876_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_876_LastWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Org_876_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Org_876_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00");	//У тебя проблемы со слухом?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Org_876_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Org_876_Attack(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = Info_Org_876_Attack_Condition;
	information = Info_Org_876_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_876_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,Org_876_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Org_876_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

