
var int bartholo_key_removed;

instance DIA_Bartholo_Exit(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 999;
	condition = DIA_Bartholo_Exit_Condition;
	information = DIA_Bartholo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

func void DIA_Bartholo_Exit_Info()
{
	if(!Npc_HasItems(self,ItKe_Storage_01) && (BARTHOLO_KEY_REMOVED == 1))
	{
		CreateInvItem(self,ItKe_Storage_01);
		BARTHOLO_KEY_REMOVED = 0;
	};
	AI_StopProcessInfos(self);
};


instance Info_Bartholo_HAllo(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_HAllo_Condition;
	information = Info_Bartholo_HAllo_Info;
	permanent = 0;
	description = "��� ��?";
};


func int Info_Bartholo_HAllo_Condition()
{
	return 1;
};

func void Info_Bartholo_HAllo_Info()
{
	AI_Output(other,self,"Info_Bartholo_HAllo_15_00");	//��� ��?
	AI_Output(self,other,"Info_Bartholo_HAllo_12_01");	//� �������. �����, ����� ������ �������� ������� �������.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_02");	//���, ��������, �������������� ��� ������...
	AI_Output(self,other,"Info_Bartholo_HAllo_12_03");	//����� ���������� ������� �� ����� �������� ��������.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_04");	//����� �� ����� �����������. ��������� ���� ������� �� ������� ������ ������.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"� ������� ����� ������ ���, �������� � ������ �������. � ���� ����� ��� � ����� �������.");
};


instance Info_Bartholo_PERM(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_PERM_Condition;
	information = Info_Bartholo_PERM_Info;
	permanent = 1;
	description = "� ���� ����������� � �����.";
	trade = 1;
};


func int Info_Bartholo_PERM_Condition()
{
	if((Kapitel <= 3) && Npc_KnowsInfo(hero,Info_Bartholo_HAllo))
	{
		return 1;
	};
};

func void Info_Bartholo_PERM_Info()
{
	AI_Output(other,self,"Info_Bartholo_PERM_15_00");	//� ���� ����������� � �����.
	AI_Output(self,other,"Info_Bartholo_PERM_12_01");	//� ���� ����� ���� ���� ��� ���, � ���� ���� ����, �������.
	if(Npc_HasItems(self,ItKe_Storage_01))
	{
		Npc_RemoveInvItems(self,ItKe_Storage_01,1);
		BARTHOLO_KEY_REMOVED = 1;
	};
	if(Npc_HasItems(self,ItMiLute))
	{
		Npc_RemoveInvItems(self,ItMiLute,Npc_HasItems(self,ItMiLute));
	};
};


instance Info_Bartholo_Krautbote(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_Krautbote_Condition;
	information = Info_Bartholo_Krautbote_Info;
	permanent = 1;
	description = "� ���� �������� ��� ������. ��� ������ ��� �����.";
};


func int Info_Bartholo_Krautbote_Condition()
{
	if((Kalom_Krautbote == LOG_RUNNING) && (Kalom_DeliveredWeed == FALSE))
	{
		return 1;
	};
};

func void Info_Bartholo_Krautbote_Info()
{
	AI_Output(other,self,"Info_Bartholo_Krautbote_15_00");	//� ���� �������� ��� ������. ��� ������ ��� �����.
	AI_Output(self,other,"Info_Bartholo_Krautbote_12_01");	//������!
	if(Npc_HasItems(other,ItMiJoint_3) >= 30)
	{
		b_printtrademsg1("����� �������� (30).");
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_02");	//�-���������...
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_03");	//��� ������. � �� ����� ��� ����� ������ ��������. ��� ������ �����, ��� �� ��������� �������.
		AI_Output(other,self,"Info_Bartholo_Krautbote_15_04");	//��� ������ �����?
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_05");	//�� ��� ������... ���, �����. ��� �������������� - ���� �����.
		b_printtrademsg2("�������� ����: 500");
		B_GiveInvItems(other,self,ItMiJoint_3,30);
		CreateInvItems(self,ItMiNugget,500);
		B_GiveInvItems(self,other,ItMiNugget,500);
		Kalom_DeliveredWeed = TRUE;
		B_LogEntry(CH1_KrautBote,"������� ��� ��� 500 ������ ���� �� ��������, ������� � ������ ��� ������.");
		B_GiveXP(XP_WeedShipmentDelivered);
	}
	else
	{
		AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//��...
		AI_Output(self,other,"Info_Bartholo_Krautbote_NoKraut_12_00");	//� ���� ������� ���� ���������! �������, �� �� ������ ��� �� �������. ����� ���������� �����, ����� � �������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_EBR_106_Bartholo_Wait4SC(C_Info)
{
	npc = ebr_598_bartholo;
	condition = DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information = DIA_EBR_106_Bartholo_Wait4SC_Info;
	important = 1;
	permanent = 0;
};


func int DIA_EBR_106_Bartholo_Wait4SC_Condition()
{
	if(ExploreSunkenTower && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400) && Npc_HasItems(hero,itarrune_1_3_teleport1))
	{
		return TRUE;
	};
};

func void DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	var C_Npc Grd_220;
	var C_Npc Grd_221;
	AI_SetWalkMode(self,NPC_WALK);
	AI_UnreadySpell(hero);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bartholo_12_01");	//� ����, ��� ���-������ ���������� ��������� �� ��� ����� �����������!
	AI_Output(self,other,"Info_Bartholo_12_02");	//�� � ������� �� ����� ��������� ������� ������, �� ��� ������ �� �����!
	AI_Output(other,self,"Info_Bartholo_15_03");	//��� �����?
	AI_Output(self,other,"Info_Bartholo_12_04");	//�� ��������! � �� ����� ������ ��������� �� �������� ����.
	AI_Output(self,other,"Info_Bartholo_12_05");	//����� ���, �����! �������� �� �����!
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
	B_SetPermAttitude(self,ATT_HOSTILE);
	Grd_220 = Hlp_GetNpc(GRD_220_Gardist);
	Grd_221 = Hlp_GetNpc(GRD_221_Gardist);
	Grd_220.guild = GIL_GRD;
	Npc_SetTrueGuild(Grd_220,GIL_GRD);
	Grd_221.guild = GIL_GRD;
	Npc_SetTrueGuild(Grd_221,GIL_GRD);
	B_SetPermAttitude(Grd_220,ATT_HOSTILE);
	B_SetPermAttitude(Grd_221,ATT_HOSTILE);
};


instance DIA_EBR_106_BARTHOLO_WAIT4SC2(C_Info)
{
	npc = ebr_598_bartholo;
	condition = dia_ebr_106_bartholo_wait4sc2_condition;
	information = dia_ebr_106_bartholo_wait4sc2_info;
	important = 1;
	permanent = 0;
};


func int dia_ebr_106_bartholo_wait4sc2_condition()
{
	if((Kapitel > 3) && !Npc_HasItems(hero,itarrune_1_3_teleport1) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void dia_ebr_106_bartholo_wait4sc2_info()
{
	var C_Npc Grd_220;
	var C_Npc Grd_221;
	AI_SetWalkMode(self,NPC_WALK);
	AI_UnreadySpell(hero);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"SVM_12_YouViolatedForbiddenTerritory");	//��� ��� �� ����� �������?
	AI_Output(self,other,"Info_Bartholo_12_05");	//����� ���, �����! �������� �� �����!
	if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,Info_Fletcher_DIE) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	};
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
	if(C_NpcBelongsToOldCamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_None);
		hero.guild = GIL_None;
	};
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
	B_SetPermAttitude(self,ATT_HOSTILE);
	Grd_220 = Hlp_GetNpc(GRD_220_Gardist);
	Grd_221 = Hlp_GetNpc(GRD_221_Gardist);
	Grd_220.guild = GIL_GRD;
	Npc_SetTrueGuild(Grd_220,GIL_GRD);
	Grd_221.guild = GIL_GRD;
	Npc_SetTrueGuild(Grd_221,GIL_GRD);
	B_SetPermAttitude(Grd_220,ATT_HOSTILE);
	B_SetPermAttitude(Grd_221,ATT_HOSTILE);
};

