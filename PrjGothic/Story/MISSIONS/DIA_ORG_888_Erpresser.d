
instance Info_Erpresser(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_Erpresser_Condition;
	information = Info_Erpresser_Info;
	permanent = 1;
	important = 1;
};


func int Info_Erpresser_Condition()
{
	var C_Npc Mordrag;
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
	if(
		(Npc_GetAttitude(self,other) != ATT_FRIENDLY) &&
		(self.aivar[AIV_HAS_ERPRESSED] == FALSE) &&
		(self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) &&
		(Mordrag.aivar[AIV_PARTYMEMBER] == FALSE) &&
		(GOPSTOPPED_BRIDGE == FALSE)
	)
	{
		return 1;
	};
};

func void Info_Erpresser_Info()
{
	var C_Item eqarmor2;
	eqarmor2 = Npc_GetEquippedArmor(hero);
	if(Hlp_IsItem(eqarmor2,org2n) || Hlp_IsItem(eqarmor2,org2l))
	{
		AI_Output(self,other,"SVM_13_GetOutOfHere");	//Сгинь! Здесь тебе не место!
		self.aivar[AIV_HAS_ERPRESSED] = 2;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Erpresser_Info_13_01");	//Если ты хочешь пройти, тебе придется заплатить 10 кусков руды, иначе ничего не выйдет, понял?
		Info_ClearChoices(Info_Erpresser);
		Info_AddChoice(Info_Erpresser,"Кажется, настало время проучить тебя!",Info_Erpresser_Choice_AufsMaul);
		if(Npc_HasItems(other,ItMiNugget) >= 10)
		{
			Info_AddChoice(Info_Erpresser,"Вот десять кусков.",Info_Erpresser_Choice_Zahlen);
		}
		else
		{
			Info_AddChoice(Info_Erpresser,"Э... у меня сейчас нет десяти кусков...",info_erpresser_choice_noore);
		};
	};
};

func void Info_Erpresser_Choice_AufsMaul()
{
	var C_Npc coerpresser;
	coerpresser = Hlp_GetNpc(ORG_889_CoErpresser);
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01");	//Кажется, настало время проучить тебя!
	AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02");	//Вот не везет.
	GOPSTOPPED_BRIDGE = TRUE;
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(coerpresser,hero);
	AI_StartState(coerpresser,ZS_Attack,1,"");
	Npc_SetPermAttitude(coerpresser,ATT_HOSTILE);
	Npc_SetTempAttitude(coerpresser,ATT_HOSTILE);
	AI_StopProcessInfos(coerpresser);
};

func void Info_Erpresser_Choice_Zahlen()
{
	var C_Npc coerpresser;
	coerpresser = Hlp_GetNpc(ORG_889_CoErpresser);
	AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01");	//Вот десять кусков.
	b_printtrademsg1("Отдано руды: 10");
	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02");	//Спасибо. Ты меня выручил.
	self.aivar[AIV_HAS_ERPRESSED] = 1;
	B_GiveInvItems(other,self,ItMiNugget,10);
	AI_StopProcessInfos(self);
};

func void info_erpresser_choice_noore()
{
	var C_Npc coerpresser;
	coerpresser = Hlp_GetNpc(ORG_889_CoErpresser);
	AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03");	//Э... у меня сейчас нет десяти кусков...
	AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04");	//Какая жалость...
	GOPSTOPPED_BRIDGE = TRUE;
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(coerpresser,hero);
	AI_StartState(coerpresser,ZS_Attack,1,"");
	Npc_SetPermAttitude(coerpresser,ATT_HOSTILE);
	Npc_SetTempAttitude(coerpresser,ATT_HOSTILE);
	AI_StopProcessInfos(coerpresser);
	AI_StopProcessInfos(self);
};


instance Info_BereitsErpresst(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_BereitsErpresst_Condition;
	information = Info_BereitsErpresst_Info;
	permanent = 1;
	important = 1;
};


func int Info_BereitsErpresst_Condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 1) && Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void Info_BereitsErpresst_Info()
{
	AI_Output(self,other,"Info_BereitsErpresst_Info_13_02");	//Ты заплатил. Проходи, пока я не передумал.
	AI_StopProcessInfos(self);
};


instance Info_BereitsAufsMaul(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_BereitsAufsMaul_Condition;
	information = Info_BereitsAufsMaul_Info;
	permanent = 1;
	important = 1;
};


func int Info_BereitsAufsMaul_Condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 2) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void Info_BereitsAufsMaul_Info()
{
	AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02");	//Пошел отсюда, пока я не рассердился!
	AI_StopProcessInfos(self);
};


instance Info_Exit(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 999;
	condition = Info_Exit_Condition;
	information = Info_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Exit_Condition()
{
	return 1;
};

func void Info_Exit_Info()
{
	AI_StopProcessInfos(self);
};

