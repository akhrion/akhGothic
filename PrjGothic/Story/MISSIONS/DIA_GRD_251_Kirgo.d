
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
	description = "������! � ���������.";
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
	AI_Output(other,self,"Info_Kirgo_What_15_00");	//������! � ���������.
	AI_Output(self,other,"Info_Kirgo_What_05_01");	//�������! �������� ��� ���-������ � ������� ����. � ��� ����� ����� �� ������� ������ ������� ��������.
	AI_Output(self,other,"Info_Kirgo_What_05_02");	//� �����. � �������� � ���� �� �����.
};


instance Info_Kirgo_Good(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Good_Condition;
	information = Info_Kirgo_Good_Info;
	permanent = 0;
	description = "� ��� �������� ���� ���?";
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
	AI_Output(other,self,"Info_Kirgo_Good_15_00");	//� ��� �������� ���� ���?
	AI_Output(self,other,"Info_Kirgo_Good_05_01");	//��� �� �����? � ������ ������� ����� ���� ����������, �� �� ���� ��� ���� ���� ������!
};


instance Info_Kirgo_Charge(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Charge_Condition;
	information = Info_Kirgo_Charge_Info;
	permanent = 0;
	description = "� ������� ���� �� ���! ������, �������� �� �����!";
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
	AI_Output(other,self,"Info_Kirgo_Charge_15_00");	//� ������� ���� �� ���! �������� �� �����!
	AI_Output(self,other,"Info_Kirgo_Charge_05_01");	//���? �� ������ ��� �� ������� �������. ������ ����� ������ ����, � �� ���������� ���, ��� �������� � �������.
	Info_ClearChoices(Info_Kirgo_Charge);
	Info_AddChoice(Info_Kirgo_Charge,"���! � ���� �������. ������!",Info_Kirgo_Charge_NOW);
	Info_AddChoice(Info_Kirgo_Charge,"�����, ����� ������ ����! ",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00");	//���! � ���� �������. ������!
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01");	//��� ���������... � �����, �����, ����� ��������.
	Info_ClearChoices(Info_Kirgo_Charge);
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00");	//�����, ����� ������ ����!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01");	//��� ����!
	b_printtrademsg1("�������� ����.");
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02");	//�������! �����, � �� ������� ����� ����� ���������� � ������� ����. ���� ��� ������ ������� � ���, ����� ��� ��� ��������� ����.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03");	//����... ��, ��� �... ��� ��������, ������� ��� ������ ������� � ���, �� ��������� ����� �������.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04");	//���������� �������� ����� � � ����������.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05");	//����� ���� ������� � ����� �� ���?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06");	//� ����, ����� ��� ��� ������ � ������.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07");	//�� ������, ��������? ��, �� ���� �� ����� ����������� ����� �������� ������...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08");	//�� ���� �� ������������� ������ ���������� ��� ����������, �� ������ �������� ������. ����� ������, ���� � ��� �� ����������!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09");	//���� �� ��� ��� ������ ��������� �� ����, ����� ���. �� ��� �� ����� ������� �������� ����.
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
	description = "�� ����� ���������, �� �����?";
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
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00");	//�� ����� ���������, �� �����?
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_5_NotNow");	//� ���� ��� �������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01");	//������ �� ����!
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
	AI_Output(self,other,"Info_Kirgo_InArena_05_00");	//����, ������. ����� ������� ����������!
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

