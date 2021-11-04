
instance Org_865_Raeuber(Npc_Default)
{
	name[0] = NAME_Raeuber;
	npcType = npctype_main;
	guild = GIL_None;
	level = 12;
	voice = 10;
	id = 865;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",34,2,org2l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItFoLoaf);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_865;
};


func void Rtn_start_865()
{
	TA_Smalltalk(8,0,23,0,"LOCATION_11_07");
	TA_Guard(23,0,8,0,"LOCATION_11_07");
};


instance INFO_RAEUBER5_EXIT(C_Info)
{
	npc = Org_865_Raeuber;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance ORG_865_RAEUBER_ALERT(C_Info)
{
	npc = Org_865_Raeuber;
	nr = 1;
	condition = org_865_raeuber_alert_condition;
	information = org_865_raeuber_alert_info;
	permanent = 0;
	important = 1;
};


func int org_865_raeuber_alert_condition()
{
	if(!Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void org_865_raeuber_alert_info()
{
	AI_Output(self,hero,"SVM_10_YouViolatedForbiddenTerritory");	//��! � �� ������ ����� ������?
	AI_Output(self,hero,"SVM_10_IntruderAlert");	//�������! �����!
	b_setorg2hostile();
	AI_StopProcessInfos(self);
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		B_LogEntry(QUENTIN_GANG,"� ����� ������ ���������� ��������, ������� ���������� � �����. ��� ����� �� ������ ���, ��� � ����������: ��� ����� ����������� �� ����.");
	};
};


instance ORG2_AMULET_CHEER(C_Info)
{
	npc = Org_865_Raeuber;
	nr = 1;
	condition = org2_amulet_cheer_condition;
	information = org2_amulet_cheer_info;
	permanent = 0;
	important = 1;
};


func int org2_amulet_cheer_condition()
{
	if(Npc_KnowsInfo(hero,quentin_dia3))
	{
		return 1;
	};
};

func void org2_amulet_cheer_info()
{
	AI_Output(self,hero,"SVM_10_StoleFromMage");	//��� �� ����� � ����� ���-�� ������, ��?
	AI_Output(self,hero,"DIA_Roscoe_BringList_10_01");	//�������. ��� �� ��� ������?
	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03");	//���, ��������...
	AI_Output(self,hero,"GUR_1201_CorKalom_JoinPSI_10_11");	//����� ����������!
	AI_StopProcessInfos(self);
};

