
instance Info_GorHanis_Exit(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GorHanis_What(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//�? � �������� �� ����� �������!
};


instance Info_GorHanis_Arena(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	permanent = 0;
	description = "�� ���������� �� �����?";
};


func int Info_GorHanis_Arena_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Arena_Info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//�� ���������� �� �����?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//��� ������� �� �������� �������� ���� ���� ��������� �� ����� �������.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//� ���������� ���� �����, ����� �������� ��������, ����� ����� ���� ������� ������!
};


instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "��� ��, ���� ������?";
};


func int Info_GorHanis_Sleeper_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Sleeper_Info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//��� ��, ���� ������?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//� ����� ������ �� ������� ������, ������� ������ ���������� ���� ������, ��� �.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//���� ������� ���� ������, ��� ������ ������ ����� ����������. �� ������ ��� ���� � �� �� ������� ��� ������.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//�� ������ �������, ��� ���� ��� ��������� ��� ������?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//��! � ����� ���� �������� ����������. ��� ���� ������������� � ������� ���������.
};


instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "�� ������ ���������� � ���������?";
};


func int Info_GorHanis_Summoning_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func void Info_GorHanis_Summoning_Info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//�� ������ ���������� � ���������?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//���� ������� �������, ��� �� ������� ��������� �� ������ ��������� �������, � �� ��� ���� ���� � �������!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//���� �� ������ ������ ������, ��� � ��� ������.
};


instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 0;
	description = "��� � ����� ������ � ������ ������?";
};


func int Info_GorHanis_WayToST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning))
	{
		return 1;
	};
};

func void Info_GorHanis_WayToST_Info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//��� � ����� ������ � ������ ������?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//� ������ ������ ������ ����� ����� ��������� ����� �����������, ������� ��������� �������������� � ��� ������. ����� ����-������ �� ���!
};


instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "� ���� ��������� � ����� �� �����!";
};


func int Info_GorHanis_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func void Info_GorHanis_Charge_Info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//� ���� ��������� � ����� �� �����!
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//�������� ����� �������� ����� ������ �������� �� �������� ����� �������.
		AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//� ����� ��������� � ����� ������ �����, ����� �� ������ ��������� �����������.
		AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//�� � ������, ��� ����� �� ������� ��� ������ ������� �� ��������� �� ������ �����������. ��� �� ���������� �������� ���������� ����������.
	}
	else if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_8_NotNow");	//������ �� �����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"SVM_8_NoLearnYoureBetter");	//������ �� �����!
		AI_StopProcessInfos(self);
		HANIS_CHARGED = TRUE;
		self.attribute[ATR_HITPOINTS] = 280;
		self.attribute[ATR_HITPOINTS_MAX] = 280;
		Npc_ExchangeRoutine(self,"GUIDE");
		B_FullStop(GRD_251_Kirgo);
		B_FullStop(Sld_729_Kharim);
		B_ExchangeRoutine(GRD_251_Kirgo,"nopractice");
		B_ExchangeRoutine(Sld_729_Kharim,"nopractice");
	};
};


instance Info_GorHanis_ChargeGood(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	permanent = 1;
	description = "� ������ ���� ���� ����������, ����� ��������� � �����?";
};


func int Info_GorHanis_ChargeGood_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Charge) && (!Npc_IsDead(Sld_729_Kharim) && !Npc_IsDead(GRD_251_Kirgo)) && (HANIS_CHARGED != TRUE))
	{
		return 1;
	};
};

func void Info_GorHanis_ChargeGood_Info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//� ������ ���� ���� ����������, ����� ��������� � �����?
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_8_NotNow");	//������ �� �����.
		AI_StopProcessInfos(self);
	}
	else if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//���! �� ��� ������������ �����. �� �� ������ ���� ���� �����������!
	}
	else
	{
		AI_Output(self,other,"SVM_8_NoLearnYoureBetter");	//������ �� �����!
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			CreateInvItem(self,ItFo_Potion_Health_03);
			AI_UseItem(self,ItFo_Potion_Health_03);
		};
		AI_StopProcessInfos(self);
		HANIS_CHARGED = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		B_FullStop(GRD_251_Kirgo);
		B_FullStop(Sld_729_Kharim);
		B_ExchangeRoutine(GRD_251_Kirgo,"nopractice");
		B_ExchangeRoutine(Sld_729_Kharim,"nopractice");
	};
};


instance INFO_GORHANIS_INARENA(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = info_gorhanis_inarena_condition;
	information = info_gorhanis_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_gorhanis_inarena_condition()
{
	if((HANIS_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 600))
	{
		return 1;
	};
};

func void info_gorhanis_inarena_info()
{
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,ItFo_Potion_Health_03);
		AI_UseItem(self,ItFo_Potion_Health_03);
	};
	if(!Npc_HasItems(self,itmw_gorhanis) && !Npc_HasItems(self,ItMw_1H_Sword_01))
	{
		CreateInvItem(self,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_05");	//����������� � ������� � ����������!
	B_ClearImmortal(self);
	Wld_SendUntrigger("OC_ARENA_GATE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_ExchangeRoutine(GRD_251_Kirgo,"START");
	B_ExchangeRoutine(Sld_729_Kharim,"START");
	B_ExchangeRoutine(grd_998_gardist,"wait");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	HANIS_CHARGED_END = TRUE;
	PLAYERINARENA = TRUE;
};

