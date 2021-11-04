
instance Info_ORG_829_EXIT(C_Info)
{
	npc = Org_829_Organisator;
	nr = 999;
	condition = Info_ORG_829_EXIT_Condition;
	information = Info_ORG_829_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_ORG_829_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_829_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_ORG_829_Hello(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_Hello_Condition;
	information = Info_ORG_829_Hello_Info;
	permanent = 0;
	description = "Как дела?";
};


func int Info_ORG_829_Hello_Condition()
{
	if(FMTaken == FALSE)
	{
		return 1;
	};
};

func void Info_ORG_829_Hello_Info()
{
	AI_Output(other,self,"Info_ORG_829_Hello_15_00");	//Как дела?
	AI_Output(self,other,"Info_ORG_829_Hello_06_01");	//Так себе. У меня закончилось курево.
};


var int Org_829_GotJoint;

instance Info_ORG_829_OfferJoint(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_OfferJoint_Condition;
	information = Info_ORG_829_OfferJoint_Info;
	permanent = 1;
	description = "У меня есть болотник. Будешь?";
};


func int Info_ORG_829_OfferJoint_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_829_Hello) && (Org_829_GotJoint == FALSE))
	{
		return 1;
	};
};

func void Info_ORG_829_OfferJoint_Info()
{
	AI_Output(other,self,"Info_ORG_829_OfferJoint_15_00");	//У меня есть болотник. Будешь?
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
		AI_Output(self,other,"Info_ORG_829_OfferJoint_06_01");	//Еще бы! Ты ведь из Лагеря сектантов, да?
		if((other.guild == GIL_NOV) || (other.guild == GIL_TPL))
		{
			AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//Да.
		}
		else
		{
			AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05");	//Нет...
		};
		if((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
		{
			NC_Joints_verteilt = NC_Joints_verteilt + 1;
			b_printtrademsg2("Получено руды: 10");
			CreateInvItems(self,ItMiNugget,10);
			B_GiveInvItems(self,other,ItMiNugget,10);
		};
		Org_829_GotJoint = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_ORG_829_OfferJoint_No_Joint_06_00");	//Эй! Ты обмануть меня захотел, да? Мне это не нравится!
	};
};


instance Info_ORG_829_SpecialInfo(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_SpecialInfo_Condition;
	information = Info_ORG_829_SpecialInfo_Info;
	permanent = 0;
	description = "Я здесь недавно. Можешь мне что-нибудь посоветовать?";
};


func int Info_ORG_829_SpecialInfo_Condition()
{
	if((Org_829_GotJoint == TRUE) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_ORG_829_SpecialInfo_Info()
{
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_00");	//Я здесь недавно. Можешь мне что-нибудь посоветовать?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_01");	//Конечно! Когда придешь в лагерь, поговори с Горном. Он один из наемников, охраняет магов, но с ним можно иметь дело. Он был один из нас.
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_02");	//Один из вас?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_03");	//Ну, из воров, знаешь? Таких, которым даже Бароны нипочем. Вот так.
};


instance Info_ORG_829_PERM(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_PERM_Condition;
	information = Info_ORG_829_PERM_Info;
	permanent = 0;
	description = "А ты можешь рассказать мне, что это за лагерь?";
};


func int Info_ORG_829_PERM_Condition()
{
	if((Org_829_GotJoint == TRUE) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_ORG_829_PERM_Info()
{
	AI_Output(other,self,"Info_ORG_829_PERM_15_00");	//А ты можешь рассказать мне, что это за лагерь?
	AI_Output(self,other,"Info_ORG_829_PERM_06_01");	//Просто пойди туда, и сам все увидишь.
};

