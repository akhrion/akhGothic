
instance Info_Kharim_Exit(C_Info)
{
	npc = Sld_729_Kharim;
	nr = 999;
	condition = Info_Kharim_Exit_Condition;
	information = Info_Kharim_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Kharim_Exit_Condition()
{
	return 1;
};

func void Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Kharim_What(C_Info)
{
	npc = Sld_729_Kharim;
	nr = 1;
	condition = Info_Kharim_What_Condition;
	information = Info_Kharim_What_Info;
	permanent = 0;
	description = "� ����� �������. �����, ��� ��?";
};


func int Info_Kharim_What_Condition()
{
	return 1;
};

func void Info_Kharim_What_Info()
{
	AI_Output(other,self,"Info_Kharim_What_15_00");	//� ����� �������. �����, ��� ��?
	AI_Output(self,other,"Info_Kharim_What_09_01");	//� �����. ��������, �� ������ ���� �������, ����� �� �� ��� ���� ����.
	AI_Output(self,other,"Info_Kharim_What_09_02");	//� ������ ���� �� ����, ���� ����������� � ���� ������.
};


var C_Npc ARENA_FIGHTER_2;
instance Info_Kharim_Charge(C_Info)
{
	npc = Sld_729_Kharim;
	nr = 2;
	condition = Info_Kharim_Charge_Condition;
	information = Info_Kharim_Charge_Info;
	permanent = 1;
	description = "� ������� ���� �� ���! ������, �������� �� �����!";
};


func int Info_Kharim_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && (!Npc_IsDead(Tpl_1422_GorHanis) && !Npc_IsDead(GRD_251_Kirgo)) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Npc_GetTrueGuild(hero) == GIL_None) && ((Kirgo_Charged != TRUE) || (KIRGO_CHARGED_END == TRUE)))
	{
		return 1;
	};
};

func void Info_Kharim_Charge_Info()
{
	AI_Output(other,self,"Info_Kharim_Charge_15_00");	//� ������� ���� �� ���! ������, �������� �� �����!
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_9_NotNow");	//���, �� ������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Kharim_Charge_09_01");	//��?! �� � �� ���� ������� ����� �� �������!
		AI_Output(self,other,"Info_Kharim_Charge_09_02");	//����� ������ �� ���� � �����, ���� � �� ���������!
		Info_ClearChoices(Info_Kharim_Charge);
		Info_AddChoice(Info_Kharim_Charge,"������, ������, � ��� ����� ��� �����.",Info_Kharim_Charge_BACK);
		Info_AddChoice(Info_Kharim_Charge,"��� �� �� ���������� �����, ����?!",Info_Kharim_Charge_Insult);
	};
};

func void Info_Kharim_Charge_BACK()
{
	AI_Output(other,self,"Info_Kharim_Charge_BACK_15_00");	//������, ������, � ��� ����� ��� �����.
	AI_StopProcessInfos(self);
};

func void Info_Kharim_Charge_Insult()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_15_00");	//��� �� �� ���������� �����, ����?!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_09_01");	//�������� ���-������ �������!
	Info_ClearChoices(Info_Kharim_Charge);
	Info_AddChoice(Info_Kharim_Charge,"�� ������ �������� ���� ����������� ����� �������!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice(Info_Kharim_Charge,"����� ��� ��� ���� �������: ���� ���� ���� ������ �� ����...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice(Info_Kharim_Charge,"� �� ���� ��������� ������, ��� ���� �� �������� ������ ������.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice(Info_Kharim_Charge,"���� ����� ����� �� ���� �� � ����� ��������� � ����� �����.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice(Info_Kharim_Charge,"������, ������, � ��� ����� ��� �����.",Info_Kharim_Charge_BACK);
};

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Goats_15_00");	//����� ��� ��� ���� �������: ���� ���� ���� ������ �� ����...
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Goats_09_01");	//�������, �� �� ������...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_GomezAss_15_00");	//�� ������ �������� ���� ����������� ����� �������!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_01");	//���?! �� ��, ������! �� �� ������ � ��� �� ������! ����� ������ �� ����������� ����� �������!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_02");	//�, ����� ����, � ����� �� ����� �������: ��� ������� �������� ���� �� ����� �������, ��� ��!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_03");	//� ������������� ����� ���� ��� ������! ����� ���� ���!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,ItFo_Potion_Health_03);
		AI_UseItem(self,ItFo_Potion_Health_03);
	};
	Kharim_Charged = TRUE;
	Info_ClearChoices(Info_Kharim_Charge);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
	B_FullStop(GRD_251_Kirgo);
	B_FullStop(Tpl_1422_GorHanis);
	B_ExchangeRoutine(GRD_251_Kirgo,"nopractice");
	B_ExchangeRoutine(Tpl_1422_GorHanis,"nopractice");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Stupid_15_00");	//�������� ������: � �� ���� ��������� ������ ������, ��� ���� �� �������� ������ ������.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Stupid_09_01");	//����� ����, ���� ����� ����������� ��� ���?
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Face_15_00");	//��, ������� � ����� �������� �������� �������� �� ���� ����� �����, �� ����� � ������ ���� ������� ����.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Face_09_01");	//�����, � ��� ���� ��� ���� ���� �������� ������ ��� ����� �������!
};


instance Info_Kharim_InArena(C_Info)
{
	npc = Sld_729_Kharim;
	nr = 1;
	condition = Info_Kharim_InArena_Condition;
	information = Info_Kharim_InArena_Info;
	permanent = 0;
	important = 1;
};


func int Info_Kharim_InArena_Condition()
{
	if((Kharim_Charged == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 600))
	{
		return 1;
	};
};

func void Info_Kharim_InArena_Info()
{
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,ItFo_Potion_Health_03);
		AI_UseItem(self,ItFo_Potion_Health_03);
	};
	if(!Npc_HasItems(self,itmw_kharim) && !Npc_HasItems(self,ItMw_1H_Sword_01))
	{
		CreateInvItem(self,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Output(self,other,"Info_Kharim_InArena_09_00");	//���� - ��� ��������� ���� ����!
	B_ClearImmortal(self);
	Wld_SendUntrigger("OC_ARENA_GATE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
	B_ExchangeRoutine(GRD_251_Kirgo,"START");
	B_ExchangeRoutine(grd_998_gardist,"wait");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	KHARIM_CHARGED_END = TRUE;
	PLAYERINARENA = TRUE;
};

