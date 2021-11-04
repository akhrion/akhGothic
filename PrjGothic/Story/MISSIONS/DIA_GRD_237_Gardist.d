
const string Grd_237_CHECKPOINT = "OW_PATH_272";

instance Info_Grd_237_FirstWarn(C_Info)
{
	npc = GRD_237_Gardist;
	nr = 1;
	condition = Info_Grd_237_FirstWarn_Condition;
	information = Info_Grd_237_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_237_FirstWarn_Condition()
{
	var C_Item eqarmor1;
	eqarmor1 = Npc_GetEquippedArmor(hero);
	if(!Hlp_IsItem(eqarmor1,grd_armor_h) && !Hlp_IsItem(eqarmor1,kdf_armor_h) && !Hlp_IsItem(eqarmor1,kdf_armor_l) && (Kapitel < 4) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Grd_237_FirstWarn_Info()
{
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_01");	//���� ����� ����� �� ����������. �� ���� ����������� ���������� ����� �����.
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_02");	//��� ����� ������?
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_03");	//������ ���: ���� ��� ����� �� ������� ���� � �����, ��� ��� ���� ����� ����� �������� ��� ���� ���� � ����.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_237_CHECKPOINT);
	Info_ClearChoices(Info_Grd_237_FirstWarn);
	Info_AddChoice(Info_Grd_237_FirstWarn,"�� �����, ��� �� �������� �� ���� ���� ���-������.",Info_Grd_237_FirstWarn_Info_NO);
	if(Npc_HasItems(other,ItMiNugget) > 0)
	{
		Info_AddChoice(Info_Grd_237_FirstWarn,"�����, ��� ���� ����!",Info_Grd_237_FirstWarn_Info_YES);
	}
	else
	{
		Info_AddChoice(Info_Grd_237_FirstWarn,"�� � ���� �� ��� ����� ����.",info_grd_237_firstwarn_info_noore);
	};
	Info_AddChoice(Info_Grd_237_FirstWarn,"�����, � ����� ����� �������.",Info_Grd_237_FirstWarn_Info_RETREAT);
};

func void Info_Grd_237_FirstWarn_Info_RETREAT()
{
	Info_ClearChoices(Info_Grd_237_FirstWarn);
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_04");	//�����, � ����� ����� �������.
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_05");	//����, � ��� ��������, ��� �� � �������� ���� ����.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};

func void Info_Grd_237_FirstWarn_Info_YES()
{
	var int ore;
	Info_ClearChoices(Info_Grd_237_FirstWarn);
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_06");	//�����, ��� ���� ����!
	b_printtrademsg1("������ ��� ����.");
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_07");	//�, ��� ����� � ����� �������!
	ore = Npc_HasItems(hero,ItMiNugget);
	B_GiveInvItems(hero,self,ItMiNugget,ore);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void info_grd_237_firstwarn_info_noore()
{
	AI_Output(hero,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//�� � ���� �� ��� ����� ����.
	AI_Output(self,hero,"SVM_7_ShitNoOre");	//���, ��� ����? �� �� ���� �������� �����!
	AI_Output(self,hero,"SVM_7_OutOfMyWay");	//���� � ������!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};

func void Info_Grd_237_FirstWarn_Info_NO()
{
	Info_ClearChoices(Info_Grd_237_FirstWarn);
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_08");	//�� �����, ��� �� �������� �� ���� ���� ���-������.
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_09");	//����� �������������� � �����.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_237_LastWarn(C_Info)
{
	npc = GRD_237_Gardist;
	nr = 2;
	condition = Info_Grd_237_LastWarn_Condition;
	information = Info_Grd_237_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_237_LastWarn_Condition()
{
	var C_Item eqarmor1;
	eqarmor1 = Npc_GetEquippedArmor(hero);
	if(!Hlp_IsItem(eqarmor1,grd_armor_h) && !Hlp_IsItem(eqarmor1,kdf_armor_h) && !Hlp_IsItem(eqarmor1,kdf_armor_l) && (Kapitel < 4) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,Grd_237_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Grd_237_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Grd_237_LastWarn_07_01");	//�� �����, �? ��� ���, � �� ������� ������ ��� ������!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_237_Attack(C_Info)
{
	npc = GRD_237_Gardist;
	nr = 1;
	condition = Info_Grd_237_Attack_Condition;
	information = Info_Grd_237_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_237_Attack_Condition()
{
	var C_Item eqarmor1;
	eqarmor1 = Npc_GetEquippedArmor(hero);
	if(!Hlp_IsItem(eqarmor1,grd_armor_h) && !Hlp_IsItem(eqarmor1,kdf_armor_h) && !Hlp_IsItem(eqarmor1,kdf_armor_l) && (Kapitel < 4) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,Grd_237_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Grd_237_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

